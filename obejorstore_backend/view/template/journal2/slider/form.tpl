<div class="sticky">
    <div class="module-header">
        <div class='module-name'>Revolution Slider <span data-ng-show="module_id == null">New Module</span><span data-ng-show="module_id != null">Edit Module</span></div>
        <div class="module-buttons">
            <a href="<?php echo $base_href;?>#/module/{{module_type}}/all/{{module_id}}" data-ng-show="module_id != null" class="btn blue">Add to Layout</a>
            <a data-ng-click="save($event)" class="btn green">Save</a>
            <a href="<?php echo $base_href;?>#/module/{{module_type}}/all" data-ng-show="module_id == null" class="btn red">Cancel</a>
            <a data-ng-click="delete($event)" data-ng-show="module_id != null" class="btn red">Delete</a>
        </div>
    </div>
</div>
<div class="module-body module-form">
    <div class="accordion-bar bar-level-0 bar-expand" >
        <a data-ng-click="toggleAccordion(module_data.slides, true)" class="hint--top" data-hint="Expand All"><i class="expand-icon"></i></a>  <a data-ng-click="toggleAccordion(module_data.slides, false)" class="hint--top" data-hint="Collapse All"><i class="collapse-icon"></i></a>
        <label class="close-others hint--top" data-hint="Close Others"><input type="checkbox" data-ng-model="module_data.close_others" /></label>
    </div>
    <accordion close-others="module_data.close_others">
        <accordion-group is-open="module_data.general_is_open">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">General Options</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Module Name</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input" data-ng-model="module_data.module_name" />
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Slider Height</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-number-field" data-ng-model="module_data.height" placeholder="Height" />
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Slide Duration</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input journal-number-field" data-ng-model="module_data.js_options.delay" />
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Pause on Hover</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.js_options.onHoverStop">
                            <switch-option key="on">ON</switch-option>
                            <switch-option key="off">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Enable on Phone</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.enable_on_phone">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Enable on Tablet</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.enable_on_tablet">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Enable on Desktop</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.enable_on_desktop">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="module_data.enable_on_phone == '1'">
                    <span class="module-create-title">Hide Captions on Mobile</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.hidecaptionsonmobile">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Timer</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.timer">
                            <switch-option key="none">None</switch-option>
                            <switch-option key="top">Top</switch-option>
                            <switch-option key="bottom">Bottom</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Preload Images</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.preload_images">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Spinner</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.spinner">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
            </ul>
        </accordion-group>

        <accordion-group is-open="module_data.navigation_is_open">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Navigation Options</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Navigation Type</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.js_options.navigationType">
                            <switch-option key="none">None</switch-option>
                            <switch-option key="bullet">Bullet</switch-option>
                            <switch-option key="thumb">Image</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Show on hover</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.js_options.hideThumbs">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Navigation Arrows</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.js_options.navigationArrows">
                            <switch-option key="solo">Solo</switch-option>
                            <switch-option key="nexttobullets">Bullets</switch-option>
                            <switch-option key="none">None</switch-option>
                        </switch>
                    </span>
                </li>

                <li>
                    <span class="module-create-title">Bullets Horizontal Align</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.js_options.navigationHAlign">
                            <switch-option key="left">Left</switch-option>
                            <switch-option key="center">Center</switch-option>
                            <switch-option key="right">Right</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Bullets Vertical Align</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.js_options.navigationVAlign">
                            <switch-option key="top">Top</switch-option>
                            <switch-option key="center">Center</switch-option>
                            <switch-option key="bottom">Bottom</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Navigation HOffset</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-number-field" data-ng-model="module_data.js_options.navigationHOffset" />
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Navigation VOffset</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-number-field" data-ng-model="module_data.js_options.navigationVOffset" />
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Thumb Dimensions</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-number-field" data-ng-model="module_data.js_options.thumbWidth" placeholder="Width" /> x <input type="text" class="journal-number-field" data-ng-model="module_data.js_options.thumbHeight" placeholder="Height" />
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Thumb Amount</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-number-field" data-ng-model="module_data.js_options.thumbAmount" />
                    </span>
                </li>
            </ul>
        </accordion-group>

        <accordion-group is-open="module_data.top_bottom_is_open">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Top or Bottom Position Settings</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Background</span>
                        <span class="module-create-option">
                            <j-opt-background data-ng-model="module_data.background" data-bgcolor="true"></j-opt-background>
                        </span>
                </li>
<!--                <li>-->
<!--                    <span class="module-create-title">Video Background</span>-->
<!--                    <span class="module-create-option">-->
<!--                        <j-opt-text data-ng-model="module_data.video_background"></j-opt-text>-->
<!--                    </span>-->
<!--                </li>-->
                <li>
                    <span class="module-create-title">Fullwidth</span>
                        <span class="module-create-option">
                            <switch data-ng-model="module_data.fullwidth">
                                <switch-option key="1">ON</switch-option>
                                <switch-option key="0">OFF</switch-option>
                            </switch>
                        </span>
                </li>
                <li>
                    <span class="module-create-title">Margin<small>Top/Bottom</small></span>
                    <span class="module-create-option">
                        <input type="text" class="journal-number-field" data-ng-model="module_data.margin_top" /> x <input type="text" class="journal-number-field" data-ng-model="module_data.margin_bottom" />
                    </span>
                </li>
            </ul>
        </accordion-group>

        <accordion-group data-ng-repeat="slide in module_data.slides" is-open="slide.is_open" ng-init="$parentIndex = $index">
            <accordion-heading>
                <div class="accordion-bar bar-level-1">{{slide.slide_name || ('Slide ' + ($index + 1))}} <a class="accordion-remove slide-remove" data-ng-click="removeSlide($index)"><b ></b>Remove</a> <a class="accordion-remove slide-remove" data-ng-click="duplicateSlide($index); $event.stopPropagation()"><b ></b>Duplicate</a></div>
            </accordion-heading>
            <div class="accordion-content content-level-1">
                <ul class="module-create-options">
                    <li>
                        <span class="module-create-title">Slide Name</span>
                        <span class="module-create-option">
                            <input type="text" class="journal-input" data-ng-model="slide.slide_name" />
                        </span>
                    </li>
                    <li>
                        <span class="module-create-title">Status</span>
                        <span class="module-create-option">
                            <switch data-ng-model="slide.status">
                                <switch-option key="1">ON</switch-option>
                                <switch-option key="0">OFF</switch-option>
                            </switch>
                        </span>
                    </li>
                    <li>
                        <span class="module-create-title">Slide Image</span>
                        <span class="module-create-option">
                            <image-select-lang image="slide.image"></image-select-lang>
                        </span>
                    </li>
                    <li>
                        <span class="module-create-title">Slide Thumb</span>
                        <span class="module-create-option">
                            <image-select-lang image="slide.thumb"></image-select-lang>
                        </span>
                    </li>
                    <li>
                        <span class="module-create-title">Slide Transition</span>
                        <span class="module-create-option">
                            <select ui-select2="" data-ng-model="slide.transition">
                                <optgroup data-ng-repeat="transition_group in transitions" label="{{transition_group.type}}">
                                    <option data-ng-repeat="tr in transition_group.transitions" value="{{tr.id}}">{{tr.name}}</option>
                                </optgroup>
                            </select>
                        </span>
                    </li>
                    <li>
                        <span class="module-create-title">Easing</span>
                        <span class="module-create-option">
                            <select ui-select2="" data-ng-model="slide.easing">
                                <option data-ng-repeat="easing in easings" value="{{easing}}">{{easing}}</option>
                            </select>
                        </span>
                    </li>
                    <li>
                        <span class="module-create-title">Slot Amount</span>
                        <span class="module-create-option">
                            <input type="text" class="journal-input journal-number-field" data-ng-model="slide.slotamount" />
                        </span>
                    </li>
                    <li>
                        <span class="module-create-title">Transition Speed</span>
                        <span class="module-create-option">
                            <input type="text" class="journal-input journal-number-field" data-ng-model="slide.masterspeed" />
                        </span>
                    </li>
                    <li>
                        <span class="module-create-title">Transition Delay</span>
                        <span class="module-create-option">
                            <input type="text" class="journal-input journal-number-field" data-ng-model="slide.delay" />
                        </span>
                    </li>
                    <li>
                        <span class="module-create-title">Link</span>
                        <span class="module-create-option">
                            <menu-item data-ng-model="slide.link"></menu-item>
                        </span>
                    </li>
                    <li>
                        <span class="module-create-title">Open in New Tab</span>
                        <span class="module-create-option">
                            <switch data-ng-model="slide.link_new_window">
                                <switch-option key="1">ON</switch-option>
                                <switch-option key="0">OFF</switch-option>
                            </switch>
                        </span>
                    </li>
                    <li>
                        <span class="module-create-title">Sort Order</span>
                        <span class="module-create-option">
                            <input type="text" class="journal-input journal-sort" data-ng-model="slide.sort_order" />
                        </span>
                    </li>
                    <li>
                      <span class="module-create-title">Slide CSS Class</span>
                      <span class="module-create-option">
                        <input type="text" class="journal-input" data-ng-model="slide.classname" />
                      </span>
                    </li>
                </ul>
            </div>
            <div class="accordion-bar bar-level-0 bar-expand" >
                <a data-ng-click="toggleAccordion2(slide, true)" class="hint--top hint-fix" data-hint="Expand All"><i class="expand-icon"></i></a>  <a data-ng-click="toggleAccordion2(slide, false)" class="hint--top hint-fix" data-hint="Collapse All"><i class="collapse-icon"></i></a>
                <label class="close-others hint--top" data-hint="Close Others"><input type="checkbox" data-ng-model="slide.close_others" /></label>
            </div>
            <accordion close-others="slide.close_others">
                <accordion-group data-ng-repeat="caption in slide.captions" is-open="caption.is_open">
                    <accordion-heading>
                        <div class="accordion-bar bar-level-2">{{caption.caption_name || ('Caption ' + ($index + 1))}} <a class="accordion-remove slide-remove" data-ng-click="removeCaption(slide, $index)"><b ></b>Remove</a> <a class="accordion-remove slide-remove" data-ng-click="duplicateCaption($parentIndex, $index)"><b ></b>Duplicate</a></div>
                    </accordion-heading>
                    <div class="accordion-content content-level-2">
                        <ul class="module-create-options">
                            <li>
                                <span class="module-create-title">Caption Title</span>
                                <span class="module-create-option">
                                    <input type="text" class="journal-input" data-ng-model="caption.caption_name" />
                                </span>
                            </li>
                            <li>
                                <span class="module-create-title">Status</span>
                                <span class="module-create-option">
                                    <switch data-ng-model="caption.status">
                                        <switch-option key="1">ON</switch-option>
                                        <switch-option key="0">OFF</switch-option>
                                    </switch>
                                </span>
                            </li>
                            <li>
                                <span class="module-create-title">Caption Type</span>
                                <span class="module-create-option">
                                    <switch data-ng-model="caption.type">
                                        <switch-option key="image">Image</switch-option>
                                        <switch-option key="text">Text</switch-option>
                                        <switch-option key="video">Video</switch-option>
                                    </switch>
                                </span>
                            </li>
                            <li data-ng-show="caption.type == 'image'">
                                <span class="module-create-title">Image</span>
                                <span class="module-create-option">
                                    <image-select-lang image="caption.image"></image-select-lang>
                                </span>
                            </li>
                            <li data-ng-show="caption.type == 'image'">
                                <span class="module-create-title">Image Dimensions</span>
                                <span class="module-create-option">
                                    <input type="text" class="journal-number-field" data-ng-model="caption.image_width" /> x
                                    <input type="text" class="journal-number-field" data-ng-model="caption.image_height" />
                                </span>
                            </li>
                            <li data-ng-show="caption.type == 'text'">
                                <span class="module-create-title">Text Line Type</span>
                                <span class="module-create-option">
                                    <switch data-ng-model="caption.text_line">
                                        <switch-option key="single">Single</switch-option>
                                        <switch-option key="multi">Multi</switch-option>
                                    </switch>
                                </span>
                            </li>
                            <li data-ng-show="caption.type == 'text'">
                                <span class="module-create-title">Text</span>
                                <span class="module-create-option revo-text">
                                    <j-opt-textarea-lang data-ng-model="caption.text"></j-opt-textarea-lang>
                                </span>
                            </li>
                            <li data-ng-show="caption.type == 'text'">
                                <span class="module-create-title">Text Line Height</span>
                                <span class="module-create-option">
                                    <input type="text" class="journal-input journal-number-field" data-ng-model="caption.text_line_height" />
                                </span>
                            </li>

                            <li data-ng-show="caption.type == 'text'">
                                <span class="module-create-title">Text Padding <small>Top - Right - Bottom - Left</small></span>
                                <span class="module-create-option">
                                    <input type="text" class="journal-input journal-sort" data-ng-model="caption.text_padding_top" /> -
                                    <input type="text" class="journal-input journal-sort" data-ng-model="caption.text_padding_right" /> -
                                    <input type="text" class="journal-input journal-sort" data-ng-model="caption.text_padding_bottom" /> -
                                    <input type="text" class="journal-input journal-sort" data-ng-model="caption.text_padding_left" />
                                </span>
                            </li>
                            <li data-ng-show="caption.type == 'text'">
                                <span class="module-create-title">Text Box Max Width</span>
                                <span class="module-create-option">
                                    <input type="text" class="journal-input journal-number-field" data-ng-model="caption.text_max_width" />
                                </span>
                            </li>
                            <li data-ng-show="caption.type == 'text'">
                                <span class="module-create-title">Text Align</span>
                                <span class="module-create-option">
                                    <switch data-ng-model="caption.text_align">
                                        <switch-option key="left">Left</switch-option>
                                        <switch-option key="center">Center</switch-option>
                                        <switch-option key="right">Right</switch-option>
                                    </switch>
                                </span>
                            </li>
                            <li data-ng-show="caption.type == 'video'">
                                <span class="module-create-title">Video</span>
                                <span class="module-create-option">
                                    <switch data-ng-model="caption.video_type">
                                        <switch-option key="youtube">Youtube</switch-option>
                                        <switch-option key="vimeo">Vimeo</switch-option>
                                        <switch-option key="local">Local</switch-option>
                                    </switch>
                                </span>
                            </li>
                            <li data-ng-show="caption.type == 'video' && caption.video_type == 'youtube'">
                                <span class="module-create-title">Youtube Video ID</span>
                                <span class="module-create-option">
                                    <input type="text" class="journal-input" data-ng-model="caption.video_yt_id" />
                                </span>
                            </li>
                            <li data-ng-show="caption.type == 'video' && caption.video_type == 'vimeo'">
                                <span class="module-create-title">Vimeo Video ID</span>
                                <span class="module-create-option">
                                    <input type="text" class="journal-input" data-ng-model="caption.video_vm_id" />
                                </span>
                            </li>
                            <li data-ng-show="caption.type == 'video' && caption.video_type == 'local'">
                                <span class="module-create-title">Video Path</span>
                                <span class="module-create-option">
                                    <input type="text" class="journal-input" data-ng-model="caption.video_path" />
                                </span>
                            </li>
                            <li data-ng-show="caption.type == 'video'">
                                <span class="module-create-title">Full Size Video</span>
                                <span class="module-create-option">
                                    <switch data-ng-model="caption.video_fullwidth">
                                        <switch-option key="1">ON</switch-option>
                                        <switch-option key="0">OFF</switch-option>
                                    </switch>
                                </span>
                            </li>
                            <li data-ng-show="caption.type == 'video' && caption.video_fullwidth == '0'">
                                <span class="module-create-title">Video Dimensions</span>
                                <span class="module-create-option">
                                    <input type="text" class="journal-number-field" data-ng-model="caption.video_width" placeholder="Width" /> x <input type="text" class="journal-number-field" data-ng-model="caption.video_height" placeholder="Height" />
                                </span>
                            </li>
                            <li data-ng-show="caption.type == 'video'">
                                <span class="module-create-title">Autoplay</span>
                                <span class="module-create-option">
                                    <switch data-ng-model="caption.video_autoplay">
                                        <switch-option key="1">ON</switch-option>
                                        <switch-option key="0">OFF</switch-option>
                                    </switch>
                                </span>
                            </li>
                            <li data-ng-show="caption.type == 'video' && caption.video_autoplay == '1'">
                                <span class="module-create-title">Autoplay Only First Time</span>
                                <span class="module-create-option">
                                    <switch data-ng-model="caption.video_autoplayonlyfirsttime">
                                        <switch-option key="1">ON</switch-option>
                                        <switch-option key="0">OFF</switch-option>
                                    </switch>
                                </span>
                            </li>
                            <li data-ng-show="caption.type == 'video' && caption.video_autoplay == '1'">
                                <span class="module-create-title">Next Slide at End</span>
                                <span class="module-create-option">
                                    <switch data-ng-model="caption.video_nextslideatend">
                                        <switch-option key="1">ON</switch-option>
                                        <switch-option key="0">OFF</switch-option>
                                    </switch>
                                </span>
                            </li>
                            <li data-ng-show="caption.type == 'video'">
                                <span class="module-create-title">Mute</span>
                                <span class="module-create-option">
                                    <switch data-ng-model="caption.video_volume">
                                        <switch-option key="0">ON</switch-option>
                                        <switch-option key="1">OFF</switch-option>
                                    </switch>
                                </span>
                            </li>
                            <li data-ng-show="caption.type == 'video' && caption.video_type == 'local'">
                                <span class="module-create-title">Loop</span>
                                <span class="module-create-option">
                                    <switch data-ng-model="caption.video_loop">
                                        <switch-option key="1">ON</switch-option>
                                        <switch-option key="0">OFF</switch-option>
                                    </switch>
                                </span>
                            </li>

                            <li data-ng-show="caption.type === 'image'">
                                <span class="module-create-title">Border</span>
                                <span class="module-create-option">
                                    <j-opt-border data-ng-model="caption.border"></j-opt-border>
                                </span>
                            </li>

                            <li data-ng-show="caption.type == 'text'">
                                <span class="module-create-title">Font</span>
                                <span class="module-create-option">
                                    <j-opt-font data-ng-model="caption.text_font"></j-opt-font>
                                </span>
                            </li>

                            <li data-ng-show="caption.type == 'text'">
                                <span class="module-create-title">Hover Font Color</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="caption.text_hover_color"></j-opt-color>
                                </span>
                            </li>
                            <li data-ng-show="caption.type == 'text'">
                                <span class="module-create-title">Background Color <small>Color - Image</small></span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="caption.text_bgcolor"></j-opt-color> -
                                    <j-opt-background data-ng-model="caption.bg_image"></j-opt-background>
                                </span>
                            </li>
                            <li data-ng-show="caption.type === 'text'">
                                <span class="module-create-title">Background Hover <small>Color - Image</small></span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="caption.text_hover_bg_color"></j-opt-color> -
                                    <j-opt-background data-ng-model="caption.bg_image_hover"></j-opt-background>
                                </span>
                            </li>

                            <li data-ng-show="caption.type == 'text'">
                                <span class="module-create-title">Border Settings</span>
                                <span class="module-create-option">
                                    <j-opt-border data-ng-model="caption.text_border"></j-opt-border>
                                </span>
                            </li>
                            <li data-ng-show="caption.type == 'text'">
                                <span class="module-create-title">Hover Border Color</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="caption.text_hover_border_color"></j-opt-color>
                                </span>
                            </li>

                            <li>
                                <span class="module-create-title">Position</span>
                                <span class="module-create-option">
                                    <switch data-ng-model="caption.position">
										<switch-option key="custom">Top / Left</switch-option>
										<switch-option key="center">Center</switch-option>
                                        <switch-option key="custom2">Top / Right</switch-option>
									</switch>
                                </span>
                            </li>
							<li>
								<span class="module-create-title">Multilanguage Position</span>
                                <span class="module-create-option">
                                    <switch data-ng-model="caption.multilanguage_position">
										<switch-option key="1">ON</switch-option>
										<switch-option key="0">OFF</switch-option>
									</switch>
                                </span>
							</li>
                            <li data-ng-show="caption.multilanguage_position == '0'">
                                <span class="module-create-title">{{caption.position === 'custom' ? 'Position': 'Offset'}} X</span>
                                <span class="module-create-option">
                                    <input type="text" class="journal-input journal-number-field" data-ng-model="caption.x" />
                                </span>
                            </li>
							<li data-ng-show="caption.multilanguage_position == '0'">
                                <span class="module-create-title">{{caption.position === 'custom' ? 'Position': 'Offset'}} Y</span>
                                <span class="module-create-option">
                                    <input type="text" class="journal-input journal-number-field" data-ng-model="caption.y" />
                                </span>
                            </li>
							<li data-ng-show="caption.multilanguage_position == '1'">
								<span class="module-create-title">{{caption.position === 'custom' ? 'Position': 'Offset'}} X</span>
                                <span class="module-create-option">
                                    <j-opt-text-lang data-ng-model="caption.x_ml"></j-opt-text-lang>
                                </span>
							</li>
							<li data-ng-show="caption.multilanguage_position == '1'">
								<span class="module-create-title">{{caption.position === 'custom' ? 'Position': 'Offset'}} Y</span>
                                <span class="module-create-option">
                                    <j-opt-text-lang data-ng-model="caption.y_ml"></j-opt-text-lang>
                                </span>
							</li>
                            <li>
                                <span class="module-create-title">Mobile Margin Left</span>
                                <span class="module-create-option">
                                    <input type="text" class="journal-input journal-number-field" data-ng-model="caption.mobile_margin_left" />
                                </span>
                            </li>
                            <li data-ng-show="caption.type !== 'video'">
                                <span class="module-create-title">Link</span>
                                <span class="module-create-option">
                                    <menu-item data-ng-model="caption.link"></menu-item>
                                </span>
                            </li>
                            <li data-ng-show="caption.type !== 'video'">
                                <span class="module-create-title">Open in New Tab</span>
                                <span class="module-create-option">
                                    <switch data-ng-model="caption.link_new_window">
                                        <switch-option key="1">ON</switch-option>
                                        <switch-option key="0">OFF</switch-option>
                                    </switch>
                                </span>
                            </li>
                            <li data-ng-show="caption.type !== 'video'">
                                <span class="module-create-title">Shadow</span>
                                <span class="module-create-option">
                                    <j-opt-shadow data-ng-model="caption.shadow"></j-opt-shadow>
                                </span>
                            </li>
                            <li data-ng-show="caption.type !== 'video'">
                                <span class="module-create-title">Shadow Hover</span>
                                <span class="module-create-option">
                                    <j-opt-shadow data-ng-model="caption.shadow_hover"></j-opt-shadow>
                                </span>
                            </li>
                            <li data-ng-show="caption.type !== 'video'">
                                <span class="module-create-title">Shadow Active</span>
                                <span class="module-create-option">
                                    <j-opt-shadow data-ng-model="caption.shadow_active"></j-opt-shadow>
                                </span>
                            </li>
                            <li>
                                <span class="module-create-title">Sort Order</span>
                                <span class="module-create-option">
                                    <input type="text" class="journal-input journal-sort" data-ng-model="caption.sort_order" />
                                </span>
                            </li>
                            <li>
                              <span class="module-create-title">Caption CSS Class</span>
                              <span class="module-create-option">
                                <input type="text" class="journal-input" data-ng-model="caption.classname" />
                              </span>
                            </li>
                        </ul>
                    </div>
                    <accordion>
                        <accordion-group is-open="caption.animations_is_open">
                            <accordion-heading>
                                <div class="accordion-bar bar-level-0">Caption Animations</div>
                            </accordion-heading>
                            <ul class="module-create-options">
                                <li>
                                    <span class="module-create-title">Animation In</span>
                                <span class="module-create-option">
                                    <select ui-select2="" data-ng-model="caption.animation_in">
                                        <option data-ng-repeat="a in incoming_caption_animations" value="{{a.id}}">{{a.name}}</option>
                                    </select>
                                </span>
                                </li>
                                <li data-ng-show="caption.animation_in == 'customin'">
                                    <span class="module-create-title">Transition</span>
                                <span class="module-create-option">
                                    X: <input type="text" class="journal-input journal-number-field" data-ng-model="caption.custom_in_transition_x" />
                                    Y: <input type="text" class="journal-input journal-number-field" data-ng-model="caption.custom_in_transition_y" />
                                </span>
                                </li>
                                <li data-ng-show="caption.animation_in == 'customin'">
                                    <span class="module-create-title">Scale</span>
                                    <span class="module-create-option">
                                        X: <input type="text" class="journal-input journal-number-field" data-ng-model="caption.custom_in_scale_x" />
                                        Y: <input type="text" class="journal-input journal-number-field" data-ng-model="caption.custom_in_scale_y" />
                                    </span>
                                </li>
                                <li data-ng-show="caption.animation_in == 'customin'">
                                    <span class="module-create-title">Rotation</span>
                                <span class="module-create-option">
                                    X: <input type="text" class="journal-input journal-number-field" data-ng-model="caption.custom_in_rotation_x" />
                                    Y: <input type="text" class="journal-input journal-number-field" data-ng-model="caption.custom_in_rotation_y" />
                                    Z: <input type="text" class="journal-input journal-number-field" data-ng-model="caption.custom_in_rotation_z" />
                                </span>
                                </li>
                                <li data-ng-show="caption.animation_in == 'customin'">
                                    <span class="module-create-title">Transform Origin X</span>
                                        <span class="module-create-option">
                                            <switch data-ng-model="caption.transformOriginXin">
                                                <switch-option key="top">Top</switch-option>
                                                <switch-option key="center">Center</switch-option>
                                                <switch-option key="bottom">Bottom</switch-option>
                                            </switch>
                                        </span>
                                </li>
                                <li data-ng-show="caption.animation_in == 'customin'">
                                    <span class="module-create-title">Transform Origin Y</span>
                                        <span class="module-create-option">
                                            <switch data-ng-model="caption.transformOriginYin">
                                                <switch-option key="left">Left</switch-option>
                                                <switch-option key="center">Center</switch-option>
                                                <switch-option key="right">Right</switch-option>
                                            </switch>
                                        </span>
                                </li>
                                <li data-ng-show="caption.animation_in == 'customin'">
                                    <span class="module-create-title">Transform Perspective</span>
                                        <span class="module-create-option">
                                            <input type="text" class="journal-input journal-number-field" data-ng-model="caption.custom_in_transform_perspective" />
                                        </span>
                                </li>
                                <li data-ng-show="caption.animation_in == 'customin'">
                                    <span class="module-create-title">Fading</span>
                                        <span class="module-create-option">
                                            <switch data-ng-model="caption.custom_in_opacity">
                                                <switch-option key="1">ON</switch-option>
                                                <switch-option key="0">OFF</switch-option>
                                            </switch>
                                        </span>
                                </li>
                                <li>
                                    <span class="module-create-title">Easing In</span>
                                        <span class="module-create-option">
                                            <select ui-select2="" data-ng-model="caption.easing">
                                                <option data-ng-repeat="easing in easings" value="{{easing}}">{{easing}}</option>
                                            </select>
                                        </span>
                                </li>
                                <li>
                                    <span class="module-create-title">Speed In</span>
                                <span class="module-create-option">
                                    <input type="text" class="journal-input journal-number-field" data-ng-model="caption.speed" />
                                </span>
                                </li>
                                <li>
                                    <span class="module-create-title">Delay In</span>
                                <span class="module-create-option">
                                    <input type="text" class="journal-input journal-number-field" data-ng-model="caption.start" />
                                </span>
                                </li>
                                <li>
                                    <span class="module-create-title">Animation Out</span>
                                <span class="module-create-option">
                                    <select ui-select2="" data-ng-model="caption.animation_out">
                                        <option data-ng-repeat="a in outgoing_caption_animations" value="{{a.id}}">{{a.name}}</option>
                                    </select>
                                </span>
                                </li>
                                <li data-ng-show="caption.animation_out == 'customout'">
                                    <span class="module-create-title">Transition</span>
                                <span class="module-create-option">
                                    X: <input type="text" class="journal-input journal-number-field" data-ng-model="caption.custom_out_transition_x" />
                                    Y: <input type="text" class="journal-input journal-number-field" data-ng-model="caption.custom_out_transition_y" />
                                </span>
                                </li>
                                <li data-ng-show="caption.animation_out == 'customout'">
                                    <span class="module-create-title">Scale</span>
                                <span class="module-create-option">
                                    X: <input type="text" class="journal-input journal-number-field" data-ng-model="caption.custom_out_scale_x" />
                                    Y: <input type="text" class="journal-input journal-number-field" data-ng-model="caption.custom_out_scale_y" />
                                </span>
                                </li>
                                <li data-ng-show="caption.animation_out == 'customout'">
                                    <span class="module-create-title">Rotation</span>
                                <span class="module-create-option">
                                    X: <input type="text" class="journal-input journal-number-field" data-ng-model="caption.custom_out_rotation_x" />
                                    Y: <input type="text" class="journal-input journal-number-field" data-ng-model="caption.custom_out_rotation_y" />
                                    Z: <input type="text" class="journal-input journal-number-field" data-ng-model="caption.custom_out_rotation_z" />
                                </span>
                                </li>
                                <li data-ng-show="caption.animation_out == 'customout'">
                                    <span class="module-create-title">Transform Origin X</span>
                                        <span class="module-create-option">
                                            <switch data-ng-model="caption.transformOriginXout">
                                                <switch-option key="top">Top</switch-option>
                                                <switch-option key="center">Center</switch-option>
                                                <switch-option key="bottom">Bottom</switch-option>
                                            </switch>
                                        </span>
                                </li>
                                <li data-ng-show="caption.animation_out == 'customout'">
                                    <span class="module-create-title">Transform Origin Y</span>
                                        <span class="module-create-option">
                                            <switch data-ng-model="caption.transformOriginYout">
                                                <switch-option key="left">Left</switch-option>
                                                <switch-option key="center">Center</switch-option>
                                                <switch-option key="right">Right</switch-option>
                                            </switch>
                                        </span>
                                </li>
                                <li data-ng-show="caption.animation_out == 'customout'">
                                    <span class="module-create-title">Transform Perspective</span>
                                        <span class="module-create-option">
                                            <input type="text" class="journal-input journal-number-field" data-ng-model="caption.custom_out_transform_perspective" />
                                        </span>
                                </li>
                                <li data-ng-show="caption.animation_out == 'customout'">
                                    <span class="module-create-title">Fading</span>
                                        <span class="module-create-option">
                                            <switch data-ng-model="caption.custom_out_opacity">
                                                <switch-option key="1">ON</switch-option>
                                                <switch-option key="0">OFF</switch-option>
                                            </switch>
                                        </span>
                                </li>

                                <li>
                                    <span class="module-create-title">Easing Out</span>
                                        <span class="module-create-option">
                                            <select ui-select2="" data-ng-model="caption.endeasing">
                                                <option data-ng-repeat="easing in easings" value="{{easing}}">{{easing}}</option>
                                            </select>
                                        </span>
                                </li>
                                <li>
                                    <span class="module-create-title">Speed Out</span>
                                <span class="module-create-option">
                                    <input type="text" class="journal-input journal-number-field" data-ng-model="caption.endspeed" />
                                </span>
                                </li>
                                <li>
                                    <span class="module-create-title">Delay Out</span>
                                <span class="module-create-option">
                                    <input type="text" class="journal-input journal-number-field" data-ng-model="caption.end" />
                                </span>
                                </li>
                            </ul>
                        </accordion-group>
                    </accordion>
                </accordion-group>
            </accordion>
            <div class="add-level add-level-2" data-ng-click="addCaption(slide)">Add Caption +</div>
        </accordion-group>
    </accordion>
    <div class="add-level add-level-1" data-ng-click="addSlide()">Add Slide +</div>
</div>

