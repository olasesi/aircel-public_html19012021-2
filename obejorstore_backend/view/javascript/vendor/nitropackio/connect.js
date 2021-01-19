($ => {
    $(document).on('click', '#toggle-password', function(e) {
        let target = $(this).closest('.form-group').find('input[data-toggle-password]');

        if ($(target).attr('type') == 'password') {
            $(target).attr('type', 'text');
            $(this).find('.fa-eye').removeClass('fa-eye').addClass('fa-eye-slash');
        } else {
            $(target).attr('type', 'password');
            $(this).find('.fa-eye-slash').removeClass('fa-eye-slash').addClass('fa-eye');
        }
    });

    $(document).on('click', '[data-loading-text]', function(e) {
        $(this).addClass('disabled');
        $(this).text($(this).attr('data-loading-text'));
    });
})(jQuery);