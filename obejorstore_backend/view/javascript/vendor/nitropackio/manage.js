($ => {
    const delay = function(t, v) {
       return new Promise(function(resolve) { 
           setTimeout(resolve.bind(null, v), t)
       });
    }

    const WarmupStats = (function() {
        var estimateQueues = {};
        var statsXhr;
        var statsAutoRefresh = false;

        const renderStats = function(warmup_stats) {
            // Auto refresh is disabled, so we want to stop rendering
            if (!statsAutoRefresh) return;

            console.debug("RENDERING");

            $('*[data-warmup-button]').hide();

            $('.warmup-status').html(warmup_stats.text_warmup_status);

            if (warmup_stats.status) {
                $('input[name="warmup"]').prop('checked', warmup_stats.is_warmup_enabled);

                $('*[data-warmup-button="info"]').show();

                $('*[data-warmup-button]').attr('disabled', false);

                if (warmup_stats.is_warmup_active) {
                    $('*[data-warmup-button="pause"]').show();
                } else if (warmup_stats.pending > 0 || warmup_stats.is_warmup_enabled) {
                    $('*[data-warmup-button="start"]').show();
                }
            }

            $('#modal-warmup-stats .modal-body').empty();

            warmup_stats.details.forEach(function(detail) {
                $('#modal-warmup-stats .modal-body').append(
                    $('#template-modal-warmup-detail').html()
                        .replace(/{key}/, detail.key)
                        .replace(/{value}/, detail.value)
                );
            });
        }

        const doStats = function() {
            statsXhr = $.ajax({
                url: $('#warmup-buttons').attr('data-warmup-stats-url'),
                dataType: 'json',
                success: function(data) {
                    if (!data.status) {
                        console.error(data.message);
                    } else {
                        renderStats(data.warmup_stats);
                    }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    if (handleLoggedOut(jqXHR.responseText)) {
                        Notification.danger($('#manage-form').attr('data-text-logged-out'));
                    } else if (errorThrown != 'abort') {
                        Notification.danger(errorThrown ? errorThrown : $('#manage-form').attr('data-text-connection-lost'));
                    }

                    console.error(jqXHR, textStatus, errorThrown);
                }
            });

            return statsXhr;
        }

        const doEstimate = function(estimateKey, callback_success, callback_error) {
            var thisXhr = $.ajax({
                url: $('#warmup-buttons').attr('data-warmup-estimate-url'),
                dataType: 'json',
                type: 'post',
                data: {
                    id: estimateQueues[estimateKey].id
                },
                success: function(data) {
                    if (!data.status) {
                        estimateQueues[estimateKey].status = false;

                        if (typeof callback_error == 'function') {
                            callback_error(data.message);
                        }
                    } else {
                        estimateQueues[estimateKey].id = data.warmup_estimate.id

                        if (data.warmup_estimate.count > -1 && typeof callback_success == 'function') {
                            callback_success(data.warmup_estimate);
                        }

                        estimateQueues[estimateKey].status = data.warmup_estimate.count == -1;
                    }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    estimateQueues[estimateKey].status = false;

                    if (handleLoggedOut(jqXHR.responseText)) {
                        Notification.danger($('#manage-form').attr('data-text-logged-out'));
                    } else if (errorThrown != 'abort') {
                        Notification.danger(errorThrown ? errorThrown : $('#manage-form').attr('data-text-connection-lost'));
                    }

                    if (typeof callback_error == 'function' && errorThrown != 'abort') {
                        callback_error(errorThrown);
                    }
                }
            });

            estimateQueues[estimateKey].xhr.push(thisXhr);

            return thisXhr;
        }

        const abortEstimateRefresh = function() {
            Object.keys(estimateQueues).forEach(key => {
                let thisXhr;
                estimateQueues[key].status = false;

                while (thisXhr = estimateQueues[key].xhr.pop()) {
                    thisXhr.abort();
                }
            });
        };

        const setStatsAutoRefreshStatus = function(status) {
            if (statsXhr) {
                statsXhr.abort();
            }

            console.debug("STATUS SET TO: ", status);

            statsAutoRefresh = status;
        };

        (async function() {
            while (true) {
                await delay(3000);
                
                if (statsAutoRefresh) {
                    try {
                        await doStats();
                    } catch (e) {}
                }
            }
        })();

        return {
            renderStats: renderStats,
            setStatsAutoRefreshStatus: setStatsAutoRefreshStatus,
            abortEstimateRefresh: abortEstimateRefresh,
            getEstimate: async function(callback_success, callback_error) {
                abortEstimateRefresh();

                var estimateKey = Math.random();

                estimateQueues[estimateKey] = {
                    status : true,
                    id : null,
                    xhr : []
                };

                do {
                    if (estimateQueues[estimateKey].status) {
                        await delay(500);

                        try {
                            await doEstimate(
                                estimateKey,
                                callback_success,
                                callback_error
                            );
                        } catch (e) {}
                    }
                } while (estimateQueues[estimateKey].status);
            }
        }
    })();

    const AutoUpdater = (_ => {
        var details = null;
        var modal = null;
        var update_steps = [];
        var update_xhr;
        var original_onbeforeunload = window.onbeforeunload;

        const isScrollSnapped = _ => $("#progress-lines")[0].scrollHeight - $("#progress-lines")[0].scrollTop == $("#progress-lines")[0].clientHeight

        const calculateWidth = _ => Math.ceil(100 * (details.update_steps.length - update_steps.length) / details.update_steps.length)

        const setState = (state, data) => {
            var context = {
                progress_element : null
            };

            const appendProgress = html => {
                // Preserve is snapped value
                var snap = isScrollSnapped();

                // Append new content
                $("#progress-lines").append(html);

                // Apply scroll if needed
                if (snap) {
                    $("#progress-lines").scrollTop($("#progress-lines")[0].scrollHeight);
                }

                // Set the context progress element
                context.progress_element = $("#modal-update-steps").find('.update-progress').last()

                // Update the progress bar
                $("#modal-update-progress .progress-bar").css('width', calculateWidth() + '%');
            }

            const hideElement = selector => $(selector).removeClass("d-block").addClass("d-none");

            const showElement = (selector, visibleClass = "d-block") => $(selector).removeClass("d-none").addClass(visibleClass);

            // Reset exit blocker
            window.onbeforeunload = original_onbeforeunload;

            switch (state) {
                case "initial" :
                    showElement('#modal-update-start');
                    hideElement('#modal-update-abort');
                    hideElement("#modal-update-steps");
                    showElement("#modal-update-setup");
                    hideElement("#modal-update-progress");
                    break;
                case "in_progress_abortable" :
                    hideElement('#modal-update-start');
                    showElement('#modal-update-abort').attr('disabled', false);
                    showElement("#modal-update-steps");
                    hideElement("#modal-update-setup");
                    showElement("#modal-update-progress");

                    appendProgress(
                        $("#template-update-check-progress").html()
                            .replace(/{message}/, data.step.message)
                    );
                    break;
                case "in_progress_non_abortable" :
                    //Apply exit blocker
                    window.onbeforeunload = event => $("#manage-form").attr('data-text-onbeforeunload');

                    hideElement('#modal-update-start');
                    showElement('#modal-update-abort').attr('disabled', true);
                    showElement("#modal-update-steps");
                    hideElement("#modal-update-setup");
                    showElement("#modal-update-progress");

                    appendProgress(
                        $("#template-update-check-progress").html()
                            .replace(/{message}/, data.step.message)
                    );
                    break;
                case "error" :
                    showElement('#modal-update-start');
                    hideElement('#modal-update-abort');
                    showElement("#modal-update-steps");
                    showElement("#modal-update-setup");
                    hideElement("#modal-update-progress");

                    appendProgress(
                        data.error_message ?
                            $("#template-update-check-error").html()
                                .replace(/{message}/, data.error_message) : ""
                    );
                    break;
            }

            return context;
        }

        const nextStep = _ => {
            var step = update_steps.shift();
            var context;

            const updateContextProgressElement = new_html => {
                if (context.progress_element !== null) {
                    $(context.progress_element).html(new_html);
                }
            }

            if (typeof step.url != 'undefined') {
                update_xhr = $.ajax({
                    url: step.url,
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        zip_current: details.zip_current,
                        zip_new: details.zip_new
                    },
                    beforeSend: function() {
                        context = setState(step.abortable ? 'in_progress_abortable' : 'in_progress_non_abortable', { step: step });
                    },
                    success: function(data) {
                        if (data.status) {
                            updateContextProgressElement(data.progress_status);

                            if (data.redirect) {
                                // Reset exit blocker
                                window.onbeforeunload = original_onbeforeunload;

                                document.location = data.redirect;
                            } else {
                                nextStep();
                            }
                        } else {
                            // Unlock the modal
                            $(modal).data('in_progress', false);

                            context = setState('error', {
                                error_message: data.error_message
                            });

                            updateContextProgressElement(data.progress_status);
                        }
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.error(jqXHR, textStatus, errorThrown);

                        switch (textStatus) {
                            case "abort":
                                context = setState('error', { error_message: null });

                                updateContextProgressElement($("#template-update-check-badge-aborted").html());
                                break;
                            default:
                                context = setState('error', {
                                    error_message: "Unexpected error [" + textStatus + "]: " + errorThrown
                                });

                                updateContextProgressElement($("#template-update-check-badge-error").html());
                        }

                        // Unlock the modal
                        $(modal).data('in_progress', false);
                    }
                });
            } else {
                update_xhr = $.ajax({
                    url: step.ajax_url,
                    type: 'GET',
                    beforeSend: function() {
                        context = setState(step.abortable ? 'in_progress_abortable' : 'in_progress_non_abortable', { step: step });
                    },
                    success: function(data) {
                        updateContextProgressElement($("#template-update-check-badge-ok").html());
                        nextStep();
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.error(jqXHR, textStatus, errorThrown);

                        switch (textStatus) {
                            case "abort":
                                context = setState('error', { error_message: null });

                                updateContextProgressElement($("#template-update-check-badge-aborted").html());
                                break;
                            default:
                                context = setState('error', {
                                    error_message: "Unexpected error [" + textStatus + "]: " + errorThrown
                                });

                                updateContextProgressElement($("#template-update-check-badge-error").html());
                        }

                        // Unlock the modal
                        $(modal).data('in_progress', false);
                    }
                });
            }
        }

        const displayInfo = msg => {
            $("#nitropack-flash-container").prepend(
                $('#template-update-check-flash').html()
                    .replace(/{message}/g, msg)
            );
        }

        const makeFeaturesBody = releases => {
            var result = '';

            releases.forEach(function(element) {
                result = result.concat("<h5>" + element.version_text + "</h5>");
                result = result.concat("<ul>");

                element.changelog.forEach(function(list_element) {
                    result = result.concat("<li>" + list_element + "</li>");
                });

                result = result.concat("</ul>");
            });

            return result;
        }

        const init = _ => {
            $.ajax({
                url: $('#manage-form').attr('data-url-update-check'),
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    if (!data.status) {
                        // We do not want to display any visible errors, as they will only be for debugging purposes.
                        console.error(data);
                    } else {
                        details = data.details;

                        if (details.newest_version != null) {
                            displayInfo(data.message);
                        }
                    }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    if (handleLoggedOut(jqXHR.responseText)) {
                        Notification.danger($('#manage-form').attr('data-text-logged-out'));
                    } else {
                        Notification.danger(errorThrown ? errorThrown : $('#manage-form').attr('data-text-connection-lost'));
                    }

                    console.error(jqXHR, textStatus, errorThrown);
                }
            });
        }

        $(document).on('click', '#button-modal-update', function(e) {
            e.preventDefault();

            var initialBody =
                $('#template-modal-update').html()
                    .replace(/{title}/, details.title)
                    .replace(/{body}/, makeFeaturesBody(details.new_releases))
            
            modal = $(initialBody).modal();

            $(modal).on('shown.bs.modal', function() {
                setState("initial");
            });

            $(modal).on('hidden.bs.modal', function(e) {
                // Reset exit blocker
                window.onbeforeunload = original_onbeforeunload;
            });

            $(modal).on('hide.bs.modal', function(e) {
                if ($(modal).data('in_progress')) {
                    e.preventDefault();
                }
            });

            $(modal).on('click', "#modal-update-start", function(e) {
                e.preventDefault();

                // Initialize variables
                $("#progress-lines").empty();

                // Clone the steps array
                update_steps = details.update_steps.slice(0);

                // Lock the modal
                $(modal).data('in_progress', true);

                // Snap the scroll in place
                $("#progress-lines").data("scroll_snap", true);

                nextStep();
            });

            $(modal).on('click', "#modal-update-abort", function(e) {
                e.preventDefault();

                // Stop the XHR
                if (update_xhr) {
                    update_xhr.abort();
                }
            });
        });

        return {
            init: init
        }
    })();

    const StaleCache = (function() {
        const doCleanup = _ => {
            $.ajax({
                url: $('#manage-form').attr('data-url-cleanup-stale-cache'),
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    if (data.status) {
                        doCleanup();
                    }
                }
            });
        };

        return {
            clean: function() {
                $.ajax({
                    url: $('#manage-form').attr('data-url-has-stale-cache'),
                    type: 'GET',
                    dataType: 'json',
                    success: function(data) {
                        if (data.status) {
                            doCleanup();
                        }
                    }
                });
            }
        }
    })();

    const iFramesLoaded = _ => {
        var allLoaded = new Promise((resolve, reject) => {
            var promises = $.map($('iframe'), iframe => new Promise((innerResolve, innerReject) => {
                $(iframe).load(innerResolve);
            }));

            Promise.all(promises).then(resolve);
        });

        return allLoaded;
    }

    const loadIFrames = _ => {
        $('iframe[data-src]').each((index, iframe) => {
            $(iframe).attr('src', $(iframe).attr('data-src'));
        });
    }

    const htmlEntities = str => {
        return String(str).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
    }

    const nextCustomPage = _ => {
        var next = 0;

        $('[data-custom-page-i]').each(function(index, element) {
            var candidate = parseInt($(element).attr('data-custom-page-i'));

            if (candidate >= next) {
                next = candidate + 1;
            }
        });

        return next;
    }

    const customPageRow = page => {
        let html = $('#template-custom-page').html();

        return html
            .replace(/{i}/g, nextCustomPage())
            .replace(/{name}/g, page.name)
            .replace(/{name_escaped}/g, htmlEntities(page.name))
            .replace(/{route}/g, page.route);
    }

    const Notification = (_ => {
        var status = false;
        var timeout;

        var display = (msg, timeoutMs, type) => {
            if (!status) return;

            if ($('#nitropack-notification[data-type=' + type + ']').length) {
                var messageElement = $('#nitropack-notification[data-type=' + type + ']').find("#nitropack-notification-message");

                $(messageElement).html(
                    $(messageElement).html().concat(' ').concat(msg)
                );
            } else {
                clearTimeout(timeout);

                $('#nitropack-notification').remove();

                $('body').append(
                    $('#template-nitropack-notification-'.concat(type)).html()
                        .replace(/{message}/g, msg)
                );

                timeout = setTimeout(_ => {
                    $('#nitropack-notification').remove();
                }, timeoutMs);
            }
        }

        return {
            setStatus: newStatus => {
                status = newStatus;
            },
            success: (msg, timeout = 3000) => {
                display(msg, timeout, 'success');
            },
            danger: (msg, timeout = 3000) => {
                display(msg, timeout, 'danger');
            },
            info: (msg, timeout = 3000) => {
                display(msg, timeout, 'info');
            },
            warning: (msg, timeout = 3000) => {
                display(msg, timeout, 'warning');
            }
        }
    })();

    const setNitroPackPreset = async function(status) {
        var previous_value = parseInt($('#nitropack-local-preset').val());
        var new_value = parseInt(status);

        $('#nitropack-local-preset').val(new_value);

        return previous_value != status;
    }

    const handleLoggedOut = function(responseText) {
        if (responseText && responseText.indexOf('index.php?route=common/login') > 0) {
            // Redirect to the default NitroPack location to trigger the login
            document.location = $('#manage-form').attr('data-url-default');

            return true;
        }

        return false;
    }

    const updateConnectionDot = function() {
        $('*[data-connection]').hide();

        switch ($('#select-status:checked').length) {
            case 0 :
                $('*[data-connection="disabled"]').show();
            break;
            default :
                $('*[data-connection="connected"]').show();
            break;
        }
    }

    const saveForm = (function() {
        var execCount = 0;

        const doSave = function(callback_success) {
            return $.ajax({
                url: $('#manage-form').attr('action'),
                type: 'POST',
                data: $('#manage-form').find('input[type!="checkbox"],input[type="checkbox"]:checked,select,textarea'),
                dataType: 'json',
                beforeSend: function() {
                    Notification.info($('#manage-form').attr('data-text-loading'));
                    WarmupStats.setStatsAutoRefreshStatus(false);
                },
                success: function(data) {
                    Notification[data.type](data.message);

                    // if (data.warmup_details !== null) {
                    //     $('#warmup-details').html(data.warmup_details);
                    // }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    if (handleLoggedOut(jqXHR.responseText)) {
                        Notification.danger($('#manage-form').attr('data-text-logged-out'));
                    } else {
                        Notification.danger(errorThrown ? errorThrown : $('#manage-form').attr('data-text-connection-lost'));
                    }

                    console.error(jqXHR, textStatus, errorThrown);
                },
                complete: function() {
                    execCount--;

                    // console.log("DECREMENT", execCount);

                    // Only after the first save, we enable notifications. This is because the first save is always occurring.
                    Notification.setStatus(true);

                    if (execCount == 1) {
                        doSave(callback_success);
                    } else if (execCount == 0) {
                        if (typeof callback_success == 'function') {
                            callback_success();
                        }

                        if ($('.modal-removable').length == 0) {
                            WarmupStats.setStatsAutoRefreshStatus(true);
                        }
                    }
                }
            });
        }

        const execute = function(callback_success) {
            if (execCount < 2) {
                execCount++;

                // console.log("INCREMENT", execCount);

                if (execCount == 1) {
                    return doSave(callback_success);
                }
            }

            return Promise.resolve();
        };

        return execute;
    })();

    const executeInvalidation = function(invalidate = "") {
        return $.ajax({
            url: $('#optimizations').attr('data-url-invalidate-cache').concat(invalidate),
            type: 'GET',
            dataType: 'json',
            beforeSend: function() {
                Notification.info($('#optimizations').attr('data-text-loading-invalidate-cache'));
            },
            success: function(data) {
                Notification[data.type](data.message);
            },
            error: function(jqXHR, textStatus, errorThrown) {
                if (handleLoggedOut(jqXHR.responseText)) {
                    Notification.danger($('#manage-form').attr('data-text-logged-out'));
                } else {
                    Notification.danger(errorThrown ? errorThrown : $('#manage-form').attr('data-text-connection-lost'));
                }

                console.error(jqXHR, textStatus, errorThrown);
            }
        });
    }

    const executePurge = function(purge = "") {
        return $.ajax({
            url: $('#optimizations').attr('data-url-purge-cache').concat(purge),
            type: 'GET',
            dataType: 'json',
            beforeSend: function() {
                Notification.info($('#optimizations').attr('data-text-loading-purge-cache'));
            },
            success: function(data) {
                Notification[data.type](data.message);
            },
            error: function(jqXHR, textStatus, errorThrown) {
                if (handleLoggedOut(jqXHR.responseText)) {
                    Notification.danger($('#manage-form').attr('data-text-logged-out'));
                } else {
                    Notification.danger(errorThrown ? errorThrown : $('#manage-form').attr('data-text-connection-lost'));
                }

                console.error(jqXHR, textStatus, errorThrown);
            }
        });
    }

    $(document).on('click', '#disconnect', function(e) {
        if (!confirm($(this).attr('data-are-you-sure'))) {
            e.preventDefault();
        } else {
            $(this).button('loading');
        }
    });

    $(document).on('click', '.delete-custom-page', function(e) {
        if (!confirm($(this).attr('data-are-you-sure'))) {
            e.preventDefault();
        } else {
            let route = $(this).closest('[data-custom-page-i]').find('input[name*="[route]"]').val();

            $(this).closest('tr').remove();
            
            saveForm();
            executePurge('&purge_type=route&purge_value='.concat(route));
        }
    });

    $(document).on('click', '.checkbox-td', function(e) {
        if ($(e.target).is('input')) {
            return;
        }

        var checkbox = $(this).find('input').first();

        $(checkbox).prop('checked', !$(checkbox).prop('checked')).trigger('change');
    });

    $(document).on('change', '#manage-form', function(e) {
        updateConnectionDot();
        saveForm();
    });

    $(document).on('click', '#add-custom-page', function(e) {
        e.preventDefault();

        var modal = $($('#template-modal-custom-page').html()).modal();
    });

    $(document).on('click', '#open-cron', function(e) {
        e.preventDefault();

        var modal = $($('#template-modal-cron').html()).modal();
    });

    $(document).on('click', '#save-custom-page', function(e) {
        var page = {
            name: $('#input-custom-page-name').val(),
            route: $('#select-custom-page-route').val(),
        };

        $('#custom-pages').append(customPageRow(page));

        saveForm();

        $('.modal').modal('hide');
    });

    $(document).on('click', '#button-configure-warmup', function(e) {
        e.preventDefault();
        
        if ($('input[name="warmup"]').is(':checked')) {
            var modal = $($('#template-modal-warmup-disable-confirm').html()).modal();
        } else {
            var modal = $($('#template-modal-warmup').html()).modal();
        }
    });

    $(document).on('click', '#open-warmup-settings', function(e) {
        e.preventDefault();

        $('.modal').modal('hide');

        $('input[name="warmup"]').prop('checked', false).trigger('change');

        // Dirty hack to toggle the modals, but quickest way to solve the broken scroll problem
        setTimeout(_ => {
            var modal = $($('#template-modal-warmup').html()).modal();
        }, 500);
    });

    // $(document).on('click', '[data-warmup-button="info"]', function(e) {
    //     e.preventDefault();

    //     var modal = $($('#template-modal-warmup-stats').html()).modal();
    // });

    const warmupEstimateModalSuccess = data => {
        $('.warmup-estimate-modal-container').hide();

        if ($('#warmup-estimate-result').length) {
            $('#warmup-estimate-result-message').html(
                $('#warmup-estimate-result').attr('data-warmup-estimate-result-text').replace(/{N}/, data.count.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","))
            );
            $('#warmup-estimate-result').show();
        }
    };

    const warmupEstimateModalError = errorMessage => {
        $('.warmup-estimate-modal-container').hide();
        $('#warmup-estimate-error').show();
        $('#warmup-estimate-error-message').html(errorMessage);
    };

    $(document).on('shown.bs.modal', '#modal-warmup', function(e) {
        $.ajax({
            url: $(this).attr('data-warmup-form'),
            dataType: 'json',
            beforeSend: function() {
                $('#close-enable-warmup').attr('disabled', true);
            },
            success: function(data) {
                if (data.status) {
                    $('#modal-warmup .modal-body').html(data.html);

                    $('.warmup-estimate-modal-container').hide();
                    $('#warmup-estimate-loading').show();

                    WarmupStats.getEstimate(warmupEstimateModalSuccess, warmupEstimateModalError);
                } else {
                    console.error(data.message);

                    $('.modal').modal('hide');
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                if (handleLoggedOut(jqXHR.responseText)) {
                    Notification.danger($('#manage-form').attr('data-text-logged-out'));
                } else {
                    Notification.danger(errorThrown ? errorThrown : $('#manage-form').attr('data-text-connection-lost'));
                }

                console.error(jqXHR, textStatus, errorThrown);

                $('.modal').modal('hide');
            },
            complete: function() {
                $('#close-enable-warmup').attr('disabled', false);
            }
        });
    });

    $(document).on('change', '#modal-warmup .modal-body input', async function(e) {
        $('#warmup-data').empty();

        $('#modal-warmup .modal-body input[type="checkbox"][data-exclude-name]:not(:checked)').each(function(index, element) {
            $('#warmup-data').append(
                '<input type="hidden" name="' + $(element).attr('data-exclude-name') + '" value="' + $(element).attr('value') + '" />'
            );
        });

        $('#modal-warmup .modal-body input[type="checkbox"][data-route-name]:checked').each(function(index, element) {
            $('#warmup-data').append(
                '<input type="hidden" name="' + $(element).attr('data-route-name') + '" value="' + $(element).attr('value') + '" />'
            );
        });

        $('#modal-warmup .modal-body input[type="checkbox"][data-finetune-name]:checked').each(function(index, element) {
            $('#warmup-data').append(
                '<input type="hidden" name="' + $(element).attr('data-finetune-name') + '" value="' + $(element).attr('value') + '" />'
            );
        });

        $('.warmup-estimate-modal-container').hide();
        $('#warmup-estimate-loading').show();

        WarmupStats.abortEstimateRefresh();

        saveForm(_ => {
            WarmupStats.getEstimate(warmupEstimateModalSuccess, warmupEstimateModalError);
        });
    });

    $(document).on('click', '#close-enable-warmup', function(e) {
        $('.modal').modal('hide');

        $('input[name="warmup"]').prop('checked', true).trigger('change');
    });

    $(document).on('click', '[data-warmup-button][data-warmup-action]', function(e) {
        e.preventDefault();

        var button = this;
        $(button).attr('disabled', true);

        $.ajax({
            url: $(button).attr('data-warmup-action'),
            dataType: 'json',
            success: function(data) {
                if (!data.status) {
                    console.error(data.message);
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                if (handleLoggedOut(jqXHR.responseText)) {
                    Notification.danger($('#manage-form').attr('data-text-logged-out'));
                } else {
                    Notification.danger(errorThrown ? errorThrown : $('#manage-form').attr('data-text-connection-lost'));
                }

                console.error(jqXHR, textStatus, errorThrown);
            }
        });
    });

    $(document).on('input', '#input-custom-page-name', function(e) {
        $('#save-custom-page').attr('disabled', $(this).val() == "");
    });

    $(document).on('hidden.bs.modal', '.modal-removable', function(e) {
        $(this).remove();
        WarmupStats.setStatsAutoRefreshStatus(true);
    });

    $(document).on('shown.bs.modal', '.modal-removable', function(e) {
        WarmupStats.setStatsAutoRefreshStatus(false);
    });

    $(document).on('click', '*', function(e) {
        if ($(e.target).is('.dropdown-toggle')) {
            $('.dropdown-toggle').each((index, element) => {
                if (element == e.target && !$(e.target).closest('.dropdown').hasClass('show')) {
                    $(e.target).closest('.dropdown').addClass('show');
                    $(e.target).closest('.dropdown').find('.dropdown-menu').addClass('show');
                } else {
                    $(element).closest('.dropdown').removeClass('show');
                    $(element).closest('.dropdown').find('.dropdown-menu').removeClass('show');
                }
            });
        } else {
            $('.dropdown').removeClass('show');
            $('.dropdown').find('.dropdown-menu').removeClass('show');
        }
    });

    $(document).on('click', '.dropdown-item', function(e) {
        $(this).closest('.dropdown-menu').find('.dropdown-item').removeClass('active');
        $(this).addClass('active');
    });

    $(document).on('click', '[data-button-clear]', function(e) {
        e.preventDefault();

        if (confirm($(this).attr('data-are-you-sure'))) {
            if ($(this).attr('data-button-clear') == 'invalidate') {
                executeInvalidation($(this).attr('data-button-clear-action'));
            } else if ($(this).attr('data-button-clear') == 'purge') {
                executePurge($(this).attr('data-button-clear-action'));
            }
        }
    });

    $(document).ready(function() {
        // Perform an autosave - usually triggered after an update
        if (getURLVar("autosave") == "1") {
            saveForm();
        }

        NitroPack.QuickSetup.setChangeHandler(async function(value, success, error) {
            var presetDifferent = await setNitroPackPreset(value);

            if (presetDifferent) {
                await saveForm();

                // Only if the previous value was already set, we need to issue the tip
                if (parseInt($('#nitropack-local-preset').val()) > 0) {
                    Notification.info($('#optimizations').attr('data-text-preset-changed'), 6000);
                }
            } else {
                // Enable save notifications
                Notification.setStatus(true);
            }

            success(value);
        });

        NitroPack.Optimizations.setInvalidateCacheHandler(async function(success, error) {
            executeInvalidation().then(function() {
                success();
            });
        });

        NitroPack.Optimizations.setPurgeCacheHandler(async function(success, error) {
            executePurge().then(function() {
                success();
            });
        });

        loadIFrames();
        updateConnectionDot();
        WarmupStats.setStatsAutoRefreshStatus(true);
        AutoUpdater.init();
        StaleCache.clean();
    });
})(jQuery);
