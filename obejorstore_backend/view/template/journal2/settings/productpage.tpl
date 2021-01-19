<div class="sticky">
    <div class="module-header">
        <div class='module-name'>Settings<span>Product Page</span></div>

        <skin-manager data-url="settings/productpage"></skin-manager>

        <div class="module-buttons">
            <?php if (defined('J2ENV')): ?>
            <a class="btn blue" data-ng-show="skin_id < 100" data-ng-click="saveDefault($event)">Export</a>
            <?php endif; ?>
            <!--<a class="btn blue" data-ng-click="multiStore($event)">MultiStore</a>-->
            <a class="btn blue" data-ng-click="saveAs($event)">Save As</a>
            <a class="btn green" data-ng-click="save($event)">Save</a>
            <a class="btn red" data-ng-show="skin_id < 100" data-ng-click="reset($event)">Reset</a>
            <a class="btn red" data-ng-show="skin_id >= 100" data-ng-click="delete($event)">Delete</a>
        </div>
    </div>
</div>

<div class="module-body custom-code">
    <div class="accordion-bar bar-level-0 bar-expand" >
        <a data-ng-click="toggleAccordion(true)" class="hint--top" data-hint="Expand All"><i class="expand-icon"></i></a>  <a data-ng-click="toggleAccordion(false)" class="hint--top" data-hint="Collapse All"><i class="collapse-icon"></i></a>
        <label class="close-others hint--top" data-hint="Close Others"><input type="checkbox" data-ng-model="accordion.close_others" /></label>
    </div>
    <accordion id="main-accordion" close-others="accordion.close_others">
        <!--General-->
        <accordion-group is-open="accordion.accordions[0]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">General</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Page Split Ratio <small>Left Side / Right Side</small></span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.split_ratio">
                                <switch-option key="split-70-30">70/30</switch-option>
                                <switch-option key="split-60-40">60/40</switch-option>
                                <switch-option key="split-50-50">50/50</switch-option>
                                <switch-option key="split-40-60">40/60</switch-option>
                                <switch-option key="split-30-70">30/70</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <!--Product Page Title-->
                <accordion-group is-open="false">
                    <accordion-heading>
                        <div class="accordion-bar bar-level-1">Page Title</div>
                    </accordion-heading>
                    <ul>
                        <li>
                            <span class="module-create-title">Page Title Position</span>
                            <span class="module-create-option">
                                <switch data-ng-model="settings.product_page_title_position">
                                    <switch-option key="top">Top</switch-option>
                                    <switch-option key="right">Right</switch-option>
                                </switch>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>

                <li>
                    <span class="module-create-title">Page Title Font</span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.product_page_title_font"></j-opt-font>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Page Title Background</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.product_page_title_bg"></j-opt-color>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Border Settings</span>
                                    <span class="module-create-option">
                                        <j-opt-border data-ng-model="settings.product_page_title_border"></j-opt-border>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Title Height</span>
                                    <span class="module-create-option">
                                        <j-opt-text data-ng-model="settings.product_page_title_line_height" class="journal-number-field"></j-opt-text>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                        <li>
                            <span class="module-create-title">Title Bottom Spacing</span>
                            <span class="module-create-option">
                                        <j-opt-text data-ng-model="settings.product_page_title_bottom_spacing" class="journal-number-field"></j-opt-text>
                                    </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>

                <li>
                    <span class="module-create-title">Padding <small>Left - Right</small></span>
                            <span class="module-create-option">
                                <j-opt-text data-ng-model="settings.product_page_title_padding_left" class="journal-sort"></j-opt-text> -
                                <j-opt-text data-ng-model="settings.product_page_title_padding_right" class="journal-sort"></j-opt-text>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Title Overflow <small>Keep long names on the same line</small></span>
                            <span class="module-create-option">
                                <switch data-ng-model="settings.product_page_title_overflow">
                                    <switch-option key="on">ON</switch-option>
                                    <switch-option key="off">OFF</switch-option>
                                </switch>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Title Align</span>
                                    <span class="module-create-option">
                                        <switch data-ng-model="settings.product_page_title_align">
                                            <switch-option key="left">Left</switch-option>
                                            <switch-option key="center">Center</switch-option>
                                            <switch-option key="right">Right</switch-option>
                                        </switch>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                </ul>
                    </accordion-group>

            </ul>
        </accordion-group>

        <!--Product Image-->
        <accordion-group is-open="accordion.accordions[1]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Product Image</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Border Settings <small>Main Product Image</small></span>
                        <span class="module-create-option">
                            <j-opt-border data-ng-model="settings.product_page_image_border"></j-opt-border>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Cloud Zoom</span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.product_page_cloud_zoom">
                                <switch-option key="1">ON</switch-option>
                                <switch-option key="0">OFF</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li data-ng-show="settings.product_page_cloud_zoom == '1'">
                    <span class="module-create-title">Inner Zoom</span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.product_page_cloud_zoom_inner">
                                <switch-option key="1">ON</switch-option>
                                <switch-option key="0">OFF</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>


                <!--Additional Images-->

                    <accordion-group is-open="false">
                        <accordion-heading>
                            <div class="accordion-bar bar-level-1">Additional Images</div>
                        </accordion-heading>
                        <ul class="module-create-options">
                            <li>
                                <span class="module-create-title">Border Settings <small>Additional Images</small></span>
                                <span class="module-create-option">
                                <j-opt-border data-ng-model="settings.product_page_additional_border"></j-opt-border>
                            </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li>
                                <span class="module-create-title">Additional Image Width <small>Images Per Row</small></span>
                                <span class="module-create-option">
                                    <j-opt-slider data-ng-model="settings.product_page_additional_width" data-range="1,8" data-step="1"></j-opt-slider>
                                </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li>
                                <span class="module-create-title">Additional Images Spacing</span>
                                <span class="module-create-option">
                                    <j-opt-text data-ng-model="settings.product_page_additional_spacing" class="journal-number-field"></j-opt-text>
                                </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Carousel Mode</span>
                                <span class="module-create-option">
                        <switch data-ng-model="settings.product_page_gallery_carousel">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li data-ng-hide="settings.product_page_gallery_carousel == '0'">
                                <span class="module-create-title">Carousel Autoplay</span>
                                <span class="module-create-option">
                        <switch data-ng-model="settings.product_page_gallery_carousel_autoplay">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                            </li>
                            <li data-ng-hide="settings.product_page_gallery_carousel == '0' || settings.product_page_gallery_carousel_autoplay == '0'">
                                <span class="module-create-title">Pause on Hover</span>
                                <span class="module-create-option">
                        <switch data-ng-model="settings.product_page_gallery_carousel_pause_on_hover">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                            </li>
                            <li data-ng-show="settings.product_page_gallery_carousel == '1' && settings.product_page_gallery_carousel_autoplay == '1'">
                                <span class="module-create-title">Transition Delay</span>
                                <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.product_page_gallery_carousel_transition_delay" class="journal-number-field"></j-opt-text>
                    </span>
                            </li>
                            <li data-ng-show="settings.product_page_gallery_carousel == '1'">
                                <span class="module-create-title">Transition Speed</span>
                                <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.product_page_gallery_carousel_transition_speed" class="journal-number-field"></j-opt-text>
                    </span>
                            </li>
                            <li data-ng-hide="settings.product_page_gallery_carousel == '0'">
                                <span class="module-create-title">Touch Drag</span>
                                <span class="module-create-option">
                        <switch data-ng-model="settings.product_page_gallery_carousel_touch_drag">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                            </li>
                            <li data-ng-show="settings.product_page_gallery_carousel == '1'">
                                <span class="module-create-title">Carousel Arrows</span>
                                <span class="module-create-option">
                        <switch data-ng-model="settings.product_page_gallery_carousel_arrows">
                            <switch-option key="hover">Hover</switch-option>
                            <switch-option key="always">Always</switch-option>
                            <switch-option key="never">Never</switch-option>
                        </switch>
                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li data-ng-show="settings.product_page_gallery_carousel == '1'">
                                <span class="module-create-title">Carousel Arrow Left</span>
                                <span class="module-create-option">
                            <j-opt-icon data-ng-model="settings.product_page_gallery_carousel_icon_left"></j-opt-icon>
                        </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li data-ng-show="settings.product_page_gallery_carousel == '1'">
                                <span class="module-create-title">Carousel Arrow Right</span>
                                <span class="module-create-option">
                            <j-opt-icon data-ng-model="settings.product_page_gallery_carousel_icon_right"></j-opt-icon>
                        </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li data-ng-show="settings.product_page_gallery_carousel == '1'">
                                <span class="module-create-title">Arrows Hover</span>
                                <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.product_page_gallery_carousel_icon_hover"></j-opt-color>
                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li data-ng-show="settings.product_page_gallery_carousel == '1'">
                                <span class="module-create-title">Buttons Background</span>
                                <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.product_page_gallery_carousel_icon_bg"></j-opt-color>
                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li data-ng-show="settings.product_page_gallery_carousel == '1'">
                                <span class="module-create-title">Buttons Background Hover</span>
                                <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.product_page_gallery_carousel_icon_bg_hover"></j-opt-color>
                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li data-ng-show="settings.product_page_gallery_carousel == '1'">
                                <span class="module-create-title">Buttons Border Settings</span>
                                <span class="module-create-option">
                        <j-opt-border data-ng-model="settings.product_page_gallery_carousel_icon_border"></j-opt-border>
                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li data-ng-show="settings.product_page_gallery_carousel == '1'">
                                <span class="module-create-title">Vertical Offset</span>
                                <span class="module-create-option">
                            <j-opt-text data-ng-model="settings.product_page_gallery_carousel_icon_offset" class="journal-number-field"></j-opt-text>
                        </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li data-ng-show="settings.product_page_gallery_carousel == '1'">
                                <span class="module-create-title">Buttons Size <small>Width x Height</small></span>
                                <span class="module-create-option">
                            <j-opt-text data-ng-model="settings.product_page_gallery_carousel_icon_width" class="journal-number-field"></j-opt-text> x
                            <j-opt-text data-ng-model="settings.product_page_gallery_carousel_icon_height" class="journal-number-field"></j-opt-text>
                        </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                        </ul>
                </accordion-group>

                <!--Popup Gallery-->
                    <accordion-group is-open="false">
                        <accordion-heading>
                            <div class="accordion-bar bar-level-1">Popup Gallery</div>
                        </accordion-heading>
                        <ul class="module-create-options">
                            <li>
                                <span class="module-create-title">Status</span>
                                <span class="module-create-option">
                                <switch data-ng-model="settings.product_page_gallery">
                                    <switch-option key="1">ON</switch-option>
                                    <switch-option key="0">OFF</switch-option>
                                </switch>
                            </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>

                            <li data-ng-show="settings.product_page_gallery == '1'">
                                <span class="module-create-title">Gallery Text</span>
                                <span class="module-create-option">
                                    <j-opt-text-lang data-ng-model="settings.product_page_gallery_text"></j-opt-text-lang>

                                </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li data-ng-show="settings.product_page_gallery == '1'">
                                <span class="module-create-title">Text Font</span>
                                <span class="module-create-option">
                                    <j-opt-font data-ng-model="settings.product_page_gallery_text_font"></j-opt-font> &nbsp; &nbsp; Icon
                                    <j-opt-icon data-ng-model="settings.product_page_gallery_text_icon"></j-opt-icon>
                                </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li data-ng-show="settings.product_page_gallery == '1'">
                                <span class="module-create-title">Large Image Zoom</span>
                                <span class="module-create-option">
                                <switch data-ng-model="settings.pp_gallery_zoom">
                                    <switch-option key="on">ON</switch-option>
                                    <switch-option key="off">OFF</switch-option>
                                </switch>
                            </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>

                            <li data-ng-show="settings.product_page_gallery == '1'">
                                <span class="module-create-title">Popup Backdrop Color</span>
                                <span class="module-create-option">
                                <j-opt-color data-ng-model="settings.pp_gallery_overlay_bg"></j-opt-color>
                            </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li data-ng-show="settings.product_page_gallery == '1'">
                                <span class="module-create-title">Bottom Caption Position</span>
                                <span class="module-create-option">
                                <switch data-ng-model="settings.pp_bottom_caption">
                                    <switch-option key="on">ON</switch-option>
                                    <switch-option key="off">OFF</switch-option>
                                </switch>
                            </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>

                            <li data-ng-show="settings.product_page_gallery == '1'">
                                <span class="module-create-title">Top Bar Background</span>
                                <span class="module-create-option">
                                <j-opt-color data-ng-model="settings.pp_gallery_bars_bg"></j-opt-color> -
                                <j-opt-background data-ng-model="settings.pp_gallery_caption_bar_bg_image"></j-opt-background>
                            </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li data-ng-show="settings.product_page_gallery == '1' && settings.pp_bottom_caption === 'on'">
                                <span class="module-create-title">Caption Bar Background <small>Color - Image</small></span>
                                <span class="module-create-option">
                                <j-opt-color data-ng-model="settings.pp_gallery_caption_bar_bg"></j-opt-color> -
                                    <j-opt-background data-ng-model="settings.pp_gallery_caption_bar_bg_image_2"></j-opt-background>

                            </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Hide Controls After <small>In milliseconds</small></span>
                                <span class="module-create-option">
                                    <j-opt-text data-ng-model="settings.pp_hide_gallery_bars_after" class="journal-number-field" placehode="3000"></j-opt-text>
                                </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li data-ng-show="settings.product_page_gallery == '1'">
                                <span class="module-create-title">Product Name Font</span>
                                <span class="module-create-option">
                                    <j-opt-font data-ng-model="settings.pp_gallery_name_font"></j-opt-font>
                                </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li data-ng-show="settings.product_page_gallery == '1'">
                                <span class="module-create-title">Product Name Overflow</span>
                                <span class="module-create-option">
                                <switch data-ng-model="settings.pp_gallery_name_overflow">
                                    <switch-option key="on">ON</switch-option>
                                    <switch-option key="off">OFF</switch-option>
                                </switch>
                            </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li data-ng-show="settings.product_page_gallery == '1'">
                                <span class="module-create-title">Image Counter</span>
                                <span class="module-create-option">
                                <switch data-ng-model="settings.pp_gallery_image_counter">
                                    <switch-option key="block">ON</switch-option>
                                    <switch-option key="none">OFF</switch-option>
                                </switch>
                            </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li data-ng-show="settings.product_page_gallery == '1'">
                                <span class="module-create-title">Image Counter Font</span>
                                <span class="module-create-option">
                                <j-opt-font data-ng-model="settings.pp_image_counter_color"></j-opt-font>
                            </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li data-ng-show="settings.product_page_gallery == '1'">
                                <span class="module-create-title">Close Button Icon Color</span>
                                <span class="module-create-option">
                                <j-opt-color data-ng-model="settings.pp_gallery_close_color"></j-opt-color> &nbsp; &nbsp;Hover
                                <j-opt-color data-ng-model="settings.pp_gallery_close_hover"></j-opt-color>
                            </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li data-ng-show="settings.product_page_gallery == '1' && settings.pp_gallery_zoom == 'on'">
                                <span class="module-create-title">Zoom Button Color</span>
                                <span class="module-create-option">
                                <j-opt-color data-ng-model="settings.pp_gallery_zoom_color"></j-opt-color> &nbsp; &nbsp;Hover
                                <j-opt-color data-ng-model="settings.pp_gallery_zoom_hover"></j-opt-color>
                            </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li data-ng-show="settings.product_page_gallery == '1'">
                                <span class="module-create-title">Left/Right Arrows Color</span>
                                <span class="module-create-option">
                                <j-opt-color data-ng-model="settings.pp_gallery_arrows_color"></j-opt-color> &nbsp; &nbsp;Hover
                                <j-opt-color data-ng-model="settings.pp_gallery_arrows_hover"></j-opt-color>
                            </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li data-ng-show="settings.product_page_gallery == '1'">
                                <span class="module-create-title">Left/Right Arrows Background</span>
                                <span class="module-create-option">
                                <j-opt-color data-ng-model="settings.pp_gallery_arrows_bg_color"></j-opt-color> &nbsp; &nbsp;Hover
                                <j-opt-color data-ng-model="settings.pp_gallery_arrows_bg_hover"></j-opt-color>
                            </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li data-ng-show="settings.product_page_gallery == '1'">
                                <span class="module-create-title">Arrows Background Border</span>
                                <span class="module-create-option">
                                <j-opt-border data-ng-model="settings.pp_gallery_arrows_bg_border"></j-opt-border> &nbsp; &nbsp;Hover
                                <j-opt-color data-ng-model="settings.pp_gallery_arrows_bg_border_hover"></j-opt-color>
                            </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li data-ng-show="settings.product_page_gallery == '1'">
                                <span class="module-create-title">Image Border Settings</span>
                                <span class="module-create-option">
                                    <j-opt-border data-ng-model="settings.pp_gallery_image_border"></j-opt-border>
                                </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <accordion-group is-open="false" data-ng-show="settings.product_page_gallery == '1'">
                                <accordion-heading>
                                    <div class="accordion-bar bar-level-2">Thumbnails</div>
                                </accordion-heading>
                                <ul class="module-create-options">
                                    <li>
                                        <span class="module-create-title">Status</span>
                                        <span class="module-create-option">
                                        <switch data-ng-model="settings.pp_gallery_thumbs">
                                            <switch-option key="on">ON</switch-option>
                                            <switch-option key="off">OFF</switch-option>
                                        </switch>
                                    </span>
                                        <a href="#" target="_blank" class="journal-tip"> </a>
                                    </li>
                                    <li data-ng-hide="settings.pp_gallery_thumbs === 'off'">
                                        <span class="module-create-title">Hidden</span>
                                        <span class="module-create-option">
                                        <switch data-ng-model="settings.pp_gallery_thumbs_hide">
                                            <switch-option key="on">ON</switch-option>
                                            <switch-option key="off">OFF</switch-option>
                                        </switch>
                                    </span>
                                        <a href="#" target="_blank" class="journal-tip"> </a>
                                    </li>
                                    <li data-ng-hide="settings.pp_gallery_thumbs === 'off'">
                                        <span class="module-create-title">Thumb Container Size <small>Width x Height</small></span>
                                        <span class="module-create-option">
                                        <j-opt-text data-ng-model="settings.pp_gallery_thumbs_width" class="journal-number-field"></j-opt-text> x
                                        <j-opt-text data-ng-model="settings.pp_gallery_thumbs_height" class="journal-number-field"></j-opt-text> &nbsp; &nbsp; <span style="position: absolute; top:4px;">Image dimensions are declared in Opencart > Extensions > Themes > Edit > Images > Additional Product Image Size</span>
                                    </span>
                                        <a href="#" target="_blank" class="journal-tip"></a>
                                    </li>
                                    <li data-ng-hide="settings.pp_gallery_thumbs === 'off'">
                                        <span class="module-create-title">Image Spacing</span>
                                        <span class="module-create-option">
                                        <j-opt-text data-ng-model="settings.pp_gallery_thumbs_spacing" class="journal-sort"></j-opt-text>
                                    </span>
                                        <a href="#" target="_blank" class="journal-tip"></a>
                                    </li>
                                    <li data-ng-hide="settings.pp_gallery_thumbs === 'off'">
                                        <span class="module-create-title">Image Border</span>
                                        <span class="module-create-option">
                                        <j-opt-border data-ng-model="settings.pp_gallery_thumbs_border"></j-opt-border> &nbsp; &nbsp; Hover
                                        <j-opt-color data-ng-model="settings.pp_gallery_thumbs_border_hover"></j-opt-color>
                                    </span>
                                        <a href="#" target="_blank" class="journal-tip"></a>
                                    </li>
                                    <li data-ng-hide="settings.pp_gallery_thumbs === 'off'">
                                        <span class="module-create-title">Container Background</span>
                                        <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.pp_gallery_thumbs_bg"></j-opt-color>
                                    </span>
                                        <a href="#" target="_blank" class="journal-tip"></a>
                                    </li>
                                    <li data-ng-hide="settings.pp_gallery_thumbs === 'off'">
                                        <span class="module-create-title">Open/Close Button Color</span>
                                        <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.pp_gallery_thumbs_button_color"></j-opt-color> &nbsp; &nbsp;Hover
                                        <j-opt-color data-ng-model="settings.pp_gallery_thumbs_button_hover"></j-opt-color>
                                    </span>
                                        <a href="#" target="_blank" class="journal-tip"></a>
                                    </li>
                                    <li data-ng-hide="settings.pp_gallery_thumbs === 'off'">
                                        <span class="module-create-title">Open/Close Button Background</span>
                                        <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.pp_gallery_thumbs_button_bg_color"></j-opt-color> &nbsp; &nbsp;Hover
                                        <j-opt-color data-ng-model="settings.pp_gallery_thumbs_button_bg_hover"></j-opt-color>
                                    </span>
                                        <a href="#" target="_blank" class="journal-tip"></a>
                                    </li>
                                </ul>
                </accordion-group>
                            </ul>
                        </accordion-group>

                <!--Product Labels-->
                    <accordion-group is-open="false">
                        <accordion-heading>
                            <div class="accordion-bar bar-level-1">Product Labels</div>
                        </accordion-heading>
                        <ul class="module-create-options">
                            <li>
                                <span class="module-create-title">Latest Label</span>
                                <span class="module-create-option">
                                    <switch data-ng-model="settings.product_page_latest_label_status">
                                        <switch-option key="block">ON</switch-option>
                                        <switch-option key="none">OFF</switch-option>
                                    </switch>
                                </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li>
                                <span class="module-create-title">Special Label</span>
                                <span class="module-create-option">
                                    <switch data-ng-model="settings.product_page_special_label_status">
                                        <switch-option key="block">ON</switch-option>
                                        <switch-option key="none">OFF</switch-option>
                                    </switch>
                                </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li>
                                <span class="module-create-title">Out of Stock</span>
                                <span class="module-create-option">
                                    <switch data-ng-model="settings.product_page_outofstock_label_status">
                                        <switch-option key="block">ON</switch-option>
                                        <switch-option key="none">OFF</switch-option>
                                    </switch>
                                </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                        </ul>
                    </accordion-group>
        </ul>
            </accordion-group>

        <!--Product Options-->
        <accordion-group is-open="accordion.accordions[3]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Product Details</div>
            </accordion-heading>
            <ul class="module-create-options">

            <li>
                <span class="module-create-title">Font</span>
                        <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.product_page_options_font"></j-opt-font>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Links</span>
                        <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.product_page_options_links"></j-opt-font>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Links Hover</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.product_page_options_links_hover"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Border Settings</span>
                        <span class="module-create-option">
                            <j-opt-border data-ng-model="settings.product_page_options_border"></j-opt-border>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Item Background Color</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.product_page_options_item_bg"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Item Border Settings</span>
                        <span class="module-create-option">
                            <j-opt-border data-ng-model="settings.product_page_options_item_border"></j-opt-border>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Item Padding <small>Top - Right - Bottom - Left</small></span>
                                <span class="module-create-option">
                                    <j-opt-text data-ng-model="settings.product_page_options_padding_top" class="journal-sort"></j-opt-text> -
                                    <j-opt-text data-ng-model="settings.product_page_options_padding_right" class="journal-sort"></j-opt-text> -
                                    <j-opt-text data-ng-model="settings.product_page_options_padding_bottom" class="journal-sort"></j-opt-text> -
                                    <j-opt-text data-ng-model="settings.product_page_options_padding_left" class="journal-sort"></j-opt-text>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Spacing <small>Margin Bottom</small></span>
                        <span class="module-create-option">
                            <j-opt-text data-ng-model="settings.product_page_options_margin" class="journal-number-field"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <!--Stats-->

                <accordion close-others="false">
                    <accordion-group is-open="false">
                        <accordion-heading>
                            <div class="accordion-bar bar-level-1">Product Stats</div>
                        </accordion-heading>
                        <ul class="module-create-options">
                            <li>
                                <span class="module-create-title">Brand Status</span>
                                <span class="module-create-option">
                                        <switch data-ng-model="settings.product_page_status_brand">
                                            <switch-option key="block">ON</switch-option>
                                            <switch-option key="none">OFF</switch-option>
                                        </switch>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Product Code Status</span>
                                <span class="module-create-option">
                                        <switch data-ng-model="settings.product_page_status_p_code">
                                            <switch-option key="block">ON</switch-option>
                                            <switch-option key="none">OFF</switch-option>
                                        </switch>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Availability Status</span>
                                <span class="module-create-option">
                                        <switch data-ng-model="settings.product_page_status_availability">
                                            <switch-option key="block">ON</switch-option>
                                            <switch-option key="none">OFF</switch-option>
                                        </switch>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Product Views Status</span>
                                    <span class="module-create-option">
                                        <switch data-ng-model="settings.product_page_options_views">
                                            <switch-option key="1">ON</switch-option>
                                            <switch-option key="0">OFF</switch-option>
                                        </switch>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li data-ng-show="settings.product_page_options_views == '1'">
                                <span class="module-create-title">Product Views Text</span>
                                    <span class="module-create-option">
                                        <j-opt-text-lang data-ng-model="settings.product_page_options_views_text"></j-opt-text-lang>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li>
                                <span class="module-create-title">In Stock Font</span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.product_page_options_instock_font"></j-opt-font>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Out of Stock Font</span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.product_page_options_outstock_font"></j-opt-font>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Background Color</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.product_page_stats_bg"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Section Padding</span>
                                    <span class="module-create-option">
                                        <j-opt-text data-ng-model="settings.product_page_stats_padding" class="journal-number-field"></j-opt-text>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <!-- SOLD COUNT -->

                            <accordion-group is-open="false">
                                <accordion-heading>
                                    <div class="accordion-bar bar-level-2">Sold Count</div>
                                </accordion-heading>
                                <ul class="module-create-options">
                                    <li>
                                        <span class="module-create-title">Status</span>
                                        <span class="module-create-option">
                                            <switch data-ng-model="settings.product_page_options_sold">
                                                <switch-option key="1">ON</switch-option>
                                                <switch-option key="0">OFF</switch-option>
                                            </switch>
                                        </span>
                                        <a href="#" target="_blank" class="journal-tip"></a>
                                    </li>

                                    <li data-ng-show="settings.product_page_options_sold == '1'">
                                        <span class="module-create-title">Text</span>
                                        <span class="module-create-option">
                                            <j-opt-text-lang data-ng-model="settings.product_page_options_sold_text"></j-opt-text-lang>
                                        </span>
                                        <a href="#" target="_blank" class="journal-tip"></a>
                                    </li>

                                    <li data-ng-show="settings.product_page_options_sold == '1'">
                                        <span class="module-create-title">Text Font</span>
                                        <span class="module-create-option">
                                            <j-opt-font data-ng-model="settings.product_page_options_sold_text_font"></j-opt-font>
                                        </span>
                                        <a href="#" target="_blank" class="journal-tip"></a>
                                    </li>
                                    <li data-ng-show="settings.product_page_options_sold == '1'">
                                        <span class="module-create-title">Count Font</span>
                                        <span class="module-create-option">
                                            <j-opt-font data-ng-model="settings.product_page_options_sold_count_font"></j-opt-font>
                                        </span>
                                        <a href="#" target="_blank" class="journal-tip"></a>
                                    </li>

                                    <!--<li data-ng-show="settings.product_page_options_sold == '1'">-->
                                        <!--<span class="module-create-title">Count Position <small>Before or After Text</small></span>-->
                                        <!--<span class="module-create-option">-->
                                            <!--<switch data-ng-model="settings.product_page_options_sold_count_position">-->
                                                <!--<switch-option key="none">Before &nbsp;&nbsp;</switch-option>-->
                                                <!--<switch-option key="inline-block">After</switch-option>-->
                                            <!--</switch>-->
                                        <!--</span>-->
                                        <!--<a href="#" target="_blank" class="journal-tip"></a>-->
                                    <!--</li>-->
                                    <li  data-ng-show="settings.product_page_options_sold == '1'">
                                        <span class="module-create-title">Background Color</span>
                                            <span class="module-create-option">
                                                <j-opt-color data-ng-model="settings.product_page_options_sold_count_bg"></j-opt-color>
                                            </span>
                                        <a href="#" target="_blank" class="journal-tip"></a>
                                    </li>

                                    <li data-ng-show="settings.product_page_options_sold == '1'">
                                        <span class="module-create-title">Padding <small>Top - Right - Bottom - Left</small></span>
                                        <span class="module-create-option">
                                            <j-opt-text data-ng-model="settings.product_page_options_sold_count_padding_top" class="journal-sort"></j-opt-text> -
                                            <j-opt-text data-ng-model="settings.product_page_options_sold_count_padding_right" class="journal-sort"></j-opt-text> -
                                            <j-opt-text data-ng-model="settings.product_page_options_sold_count_padding_bottom" class="journal-sort"></j-opt-text> -
                                            <j-opt-text data-ng-model="settings.product_page_options_sold_count_padding_left" class="journal-sort"></j-opt-text>
                                        </span>
                                        <a href="#" target="_blank" class="journal-tip"></a>
                                    </li>

                                    <li data-ng-show="settings.product_page_options_sold == '1'">
                                        <span class="module-create-title">Max Width</span>
                                        <span class="module-create-option">
                                            <j-opt-text data-ng-model="settings.product_page_options_sold_count_max_width" class="journal-number-field"></j-opt-text>
                                        </span>
                                        <a href="#" target="_blank" class="journal-tip"></a>
                                    </li>

                                </ul>
                            </accordion-group>

                            <!--Brand Image-->
                            <accordion-group is-open="false">
                                <accordion-heading>
                                    <div class="accordion-bar bar-level-2">Brand Image</div>
                                </accordion-heading>
                                <ul class="module-create-options">
                                    <li>
                                        <span class="module-create-title">Show Brand Image</span>
                                    <span class="module-create-option">
                                        <switch data-ng-model="settings.manufacturer_image">
                                            <switch-option key="1">ON</switch-option>
                                            <switch-option key="0">OFF</switch-option>
                                        </switch>
                                    </span>
                                        <a href="#" target="_blank" class="journal-tip"> </a>
                                    </li>
                                    <li data-ng-show="settings.manufacturer_image == '1'">
                                        <span class="module-create-title">Image Dimensions</span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.manufacturer_image_width" class="journal-number-field"></j-opt-text> x
                        <j-opt-text data-ng-model="settings.manufacturer_image_height" class="journal-number-field"></j-opt-text>
                    </span>
                                    </li>
                                    <li data-ng-show="settings.manufacturer_image == '1'">
                                        <span class="module-create-title">Additional Text</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.manufacturer_image_additional_text">
                            <switch-option key="none">None</switch-option>
                            <switch-option key="brand">Brand Name</switch-option>
                            <switch-option key="custom">Custom</switch-option>
                        </switch>
                    </span>
                                        <a href="#" target="_blank" class="journal-tip"> </a>
                                    </li>
                                    <li data-ng-show="settings.manufacturer_image == '1' && settings.manufacturer_image_additional_text == 'custom'">
                                        <span class="module-create-title">Custom Text</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="settings.manufacturer_image_custom_text"></j-opt-text-lang>
                    </span>
                                        <a href="#" target="_blank" class="journal-tip"> </a>
                                    </li>

                                    <li data-ng-show="settings.manufacturer_image == '1'">
                                        <span class="module-create-title">Text Link Font</span>
                                        <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.product_page_options_brand_font"></j-opt-font>
                                    </span>
                                        <a href="#" target="_blank" class="journal-tip"></a>
                                    </li>
                                    <li data-ng-show="settings.manufacturer_image == '1'">
                                        <span class="module-create-title">Text Link Hover</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.product_page_options_brand_font_hover"></j-opt-color>
                                    </span>
                                        <a href="#" target="_blank" class="journal-tip"></a>
                                    </li>
                                    <li data-ng-show="settings.manufacturer_image == '1'">
                                        <span class="module-create-title">Brand Image Border Settings</span>
                                    <span class="module-create-option">
                                        <j-opt-border data-ng-model="settings.product_page_options_brand_image_border"></j-opt-border>
                                    </span>
                                        <a href="#" target="_blank" class="journal-tip"></a>
                                    </li>
                                </ul>
                            </accordion-group>

                        </ul>
                    </accordion-group>
                </accordion>

                <!--Price-->
                <accordion close-others="false">
                    <accordion-group is-open="false">
                        <accordion-heading>
                            <div class="accordion-bar bar-level-1">Product Price</div>
                        </accordion-heading>
                        <ul class="module-create-options">
                            <li>
                                <span class="module-create-title">Price Font</span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.product_page_options_price_font"></j-opt-font>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Old Price Font</span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.product_page_options_old_price_font"></j-opt-font>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Old Price Background</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.product_page_options_old_price_bg"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Old Price Border Settings</span>
                                    <span class="module-create-option">
                                        <j-opt-border data-ng-model="settings.product_page_options_old_price_border"></j-opt-border>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Show Ex Tax</span>
                                <span class="module-create-option">
                                        <switch data-ng-model="settings.product_page_show_tax">
                                            <switch-option key="block">ON</switch-option>
                                            <switch-option key="none">OFF</switch-option>
                                        </switch>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li data-ng-hide="settings.product_page_show_tax === 'none'">
                                <span class="module-create-title">Ex Tax Font</span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.product_page_tax_font"></j-opt-font>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Reward Points Font</span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.product_page_rewards_font"></j-opt-font>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Discounts Font</span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.product_page_discount_font"></j-opt-font>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Background Color</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.product_page_price_bg"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Section Padding</span>
                                    <span class="module-create-option">
                                        <j-opt-text data-ng-model="settings.product_page_price_padding" class="journal-number-field"></j-opt-text>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                        </ul>
                    </accordion-group>
                </accordion>

                <!--Options-->
                <accordion close-others="false">
                    <accordion-group is-open="false">
                        <accordion-heading>
                            <div class="accordion-bar bar-level-1">Product Options</div>
                        </accordion-heading>
                        <ul class="module-create-options">
                            <li>
                                <span class="module-create-title">Auto Update Price</span>
                                    <span class="module-create-option">
                                        <switch data-ng-model="settings.product_page_auto_update_price">
                                            <switch-option key="1">ON</switch-option>
                                            <switch-option key="0">OFF</switch-option>
                                        </switch>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Title Status <small>Available Options</small></span>
                                    <span class="module-create-option">
                                        <switch data-ng-model="settings.product_page_title_status">
                                            <switch-option key="1">ON</switch-option>
                                            <switch-option key="0">OFF</switch-option>
                                        </switch>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li data-ng-show="settings.product_page_title_status == '1'">
                                <span class="module-create-title">Title Font</span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.product_page_options_title"></j-opt-font>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li data-ng-show="settings.product_page_title_status == '1'">
                                <span class="module-create-title">Title Background Color</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.product_page_options_title_bg"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Option Group Font</span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.product_page_option_font"></j-opt-font>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Option Label Font</span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.product_page_option_label"></j-opt-font>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Option Label Font Hover</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.product_page_option_label_hover"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li>
                                <span class="module-create-title">Background Color</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.product_page_option_bg"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Section Padding</span>
                                    <span class="module-create-option">
                                        <j-opt-text data-ng-model="settings.product_page_option_padding" class="journal-number-field"></j-opt-text>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <!--<li>-->
                                <!--<span class="module-create-title">Options Divider Color</span>-->
                                    <!--<span class="module-create-option">-->
                                        <!--<j-opt-color data-ng-model="settings.product_page_options_divider"></j-opt-color>-->
                                    <!--</span>-->
                                <!--<a href="#" target="_blank" class="journal-tip"></a>-->
                            <!--</li>-->
                            <accordion>
                                <accordion-group is-open="false">
                                    <accordion-heading>
                                        <div class="accordion-bar bar-level-2">Upload Button</div>
                                    </accordion-heading>
                                    <ul class="module-create-options">


                                    <li>
                                <span class="module-create-title">Button Color</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.upload_button_color"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Button Hover Color</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.upload_button_font_hover"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>


                            <li>
                                <span class="module-create-title">Background Color</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.upload_button_bg"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>


                            <li>
                                <span class="module-create-title">Background Hover</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.upload_button_bg_hover"></j-opt-color>
                                </span>
                                                <a href="#" target="_blank" class="journal-tip"></a>
                                            </li>

                                            <li>
                                                <span class="module-create-title">Border Settings</span>
                                <span class="module-create-option">
                                    <j-opt-border data-ng-model="settings.upload_button_border"></j-opt-border>
                                </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li>
                                <span class="module-create-title">Border Hover Color</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.upload_button_border_hover"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                                        </ul>
                                    </accordion-group>
                                </accordion>


                            <accordion>
                                <accordion-group is-open="false">
                                    <accordion-heading>
                                        <div class="accordion-bar bar-level-2">Push Options</div>
                                    </accordion-heading>
                                    <ul class="module-create-options">
                                        <li>
                                            <span class="module-create-title">Push Select</span>
                                            <span class="module-create-option">
                                                <switch data-ng-model="settings.product_page_options_push_select">
                                                    <switch-option key="1">ON</switch-option>
                                                    <switch-option key="0">OFF</switch-option>
                                                </switch>
                                            </span>
                                            <a href="#" target="_blank" class="journal-tip"></a>
                                        </li>
                                        <li>
                                            <span class="module-create-title">Push Image</span>
                                            <span class="module-create-option">
                                                <switch data-ng-model="settings.product_page_options_push_image">
                                                    <switch-option key="1">ON</switch-option>
                                                    <switch-option key="0">OFF</switch-option>
                                                </switch>
                                            </span>
                                            <a href="#" target="_blank" class="journal-tip"></a>
                                        </li>
                                        <li>
                                            <span class="module-create-title">Push Checkbox</span>
                                            <span class="module-create-option">
                                                <switch data-ng-model="settings.product_page_options_push_checkbox">
                                                    <switch-option key="1">ON</switch-option>
                                                    <switch-option key="0">OFF</switch-option>
                                                </switch>
                                            </span>
                                            <a href="#" target="_blank" class="journal-tip"></a>
                                        </li>
                                        <li>
                                            <span class="module-create-title">Push Radio</span>
                                            <span class="module-create-option">
                                                <switch data-ng-model="settings.product_page_options_push_radio">
                                                    <switch-option key="1">ON</switch-option>
                                                    <switch-option key="0">OFF</switch-option>
                                                </switch>
                                            </span>
                                            <a href="#" target="_blank" class="journal-tip"></a>
                                        </li>
                                        <li data-ng-show="settings.product_page_options_push_select == '1' || settings.product_page_options_push_image == '1' || settings.product_page_options_push_checkbox == '1' || settings.product_page_options_push_radio == '1'">
                                            <span class="module-create-title">Push Item Radius</span>
                                                <span class="module-create-option">
                                                    <j-opt-border data-ng-model="settings.product_page_options_push_border" editor="hide-style"></j-opt-border>
                                                </span>
                                            <a href="#" target="_blank" class="journal-tip"></a>
                                        </li>
                                        <li data-ng-show="settings.product_page_options_push_select == '1' || settings.product_page_options_push_image == '1' || settings.product_page_options_push_checkbox == '1' || settings.product_page_options_push_radio == '1'">
                                            <span class="module-create-title">Push Select Font</span>
                                                <span class="module-create-option">
                                                    <j-opt-font data-ng-model="settings.product_page_options_push_select_font"></j-opt-font>
                                                </span>
                                            <a href="#" target="_blank" class="journal-tip"></a>
                                        </li>

                                        <li data-ng-show="settings.product_page_options_push_select == '1' || settings.product_page_options_push_image == '1' || settings.product_page_options_push_checkbox == '1' || settings.product_page_options_push_radio == '1'">
                                            <span class="module-create-title">Push Background Color</span>
                                                <span class="module-create-option">
                                                    <j-opt-color data-ng-model="settings.product_page_options_push_select_bg"></j-opt-color>
                                                </span>
                                            <a href="#" target="_blank" class="journal-tip"></a>
                                        </li>

                                        <li data-ng-show="settings.product_page_options_push_select == '1' || settings.product_page_options_push_image == '1' || settings.product_page_options_push_checkbox == '1' || settings.product_page_options_push_radio == '1'">
                                            <span class="module-create-title">Push Active Font Color</span>
                                                <span class="module-create-option">
                                                    <j-opt-color data-ng-model="settings.product_page_options_push_select_font_active"></j-opt-color>
                                                </span>
                                            <a href="#" target="_blank" class="journal-tip"></a>
                                        </li>
                                        <li data-ng-show="settings.product_page_options_push_select == '1' || settings.product_page_options_push_image == '1' || settings.product_page_options_push_checkbox == '1' || settings.product_page_options_push_radio == '1'">
                                            <span class="module-create-title">Push Active Background</span>
                                                <span class="module-create-option">
                                                    <j-opt-color data-ng-model="settings.product_page_options_push_select_bg_active"></j-opt-color>
                                                </span>
                                            <a href="#" target="_blank" class="journal-tip"></a>
                                        </li>

                                        <li data-ng-show="settings.product_page_options_push_select == '1' || settings.product_page_options_push_image == '1' || settings.product_page_options_push_checkbox == '1' || settings.product_page_options_push_radio == '1'">
                                            <span class="module-create-title">Inner Shadow <small>Push Effect</small></span>
                                                <span class="module-create-option">
                                                    <switch data-ng-model="settings.product_page_options_push_shadow">
                                                        <switch-option key="inset 0 0 8px rgba(0, 0, 0, 0.7)">ON</switch-option>
                                                        <switch-option key="none">OFF</switch-option>
                                                    </switch>
                                                </span>
                                            <a href="#" target="_blank" class="journal-tip"></a>
                                        </li>

                                        <li>
                                            <span class="module-create-title">Push Image Border Settings</span>
                                                <span class="module-create-option">
                                                    <j-opt-border data-ng-model="settings.product_page_push_image_border"></j-opt-border>
                                                </span>
                                            <a href="#" target="_blank" class="journal-tip"></a>
                                        </li>

                                        <li data-ng-show="settings.product_page_options_push_select == '1' || settings.product_page_options_push_image == '1' || settings.product_page_options_push_checkbox == '1' || settings.product_page_options_push_radio == '1'">
                                            <span class="module-create-title">Push Image Border Hover</span>
                                                <span class="module-create-option">
                                                    <j-opt-color data-ng-model="settings.product_page_options_push_image_border_hover"></j-opt-color>
                                                </span>
                                            <a href="#" target="_blank" class="journal-tip"></a>
                                        </li>
                                        <li>
                                            <span class="module-create-title">Push Image Dimensions</span>
                                                <span class="module-create-option">
                                                    <j-opt-text data-ng-model="settings.product_page_options_push_image_width" class="journal-number-field"></j-opt-text> x <j-opt-text data-ng-model="settings.product_page_options_push_image_height" class="journal-number-field"></j-opt-text>
                                                </span>
                                            <a href="#" target="_blank" class="journal-tip"></a>
                                        </li>
                                        <li>
                                            <span class="module-create-title">Push Image Tooltips</span>
                                                <span class="module-create-option">
                                                    <switch data-ng-model="settings.product_page_push_tooltip">
                                                        <switch-option key="block">ON</switch-option>
                                                        <switch-option key="none">OFF</switch-option>
                                                    </switch>
                                                </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>
                                        <li>
                                            <span class="module-create-title">Tooltip Text Color</span>
                                                <span class="module-create-option">
                                                    <j-opt-color data-ng-model="settings.product_page_push_tooltip_color"></j-opt-color>
                                                </span>
                                            <a href="#" target="_blank" class="journal-tip"></a>
                                        </li>
                                        <li>
                                            <span class="module-create-title">Tooltip Background Color</span>
                                                <span class="module-create-option">
                                                    <j-opt-color data-ng-model="settings.product_page_push_tooltip_bg"></j-opt-color>
                                                </span>
                                            <a href="#" target="_blank" class="journal-tip"></a>
                                        </li>

                                        </ul>
                                    </accordion-group>
                                </accordion>
                        </ul>
                    </accordion-group>
                </accordion>

                <!--Quantity-->
                <accordion close-others="false">
                    <accordion-group is-open="false">
                        <accordion-heading>
                            <div class="accordion-bar bar-level-1">Quantity Buttons</div>
                        </accordion-heading>
                        <ul class="module-create-options">
                            <li>
                                <span class="module-create-title">Status</span>
                                    <span class="module-create-option">
                                        <switch data-ng-model="settings.product_page_qty_status">
                                            <switch-option key="on">ON</switch-option>
                                            <switch-option key="off">OFF</switch-option>
                                        </switch>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>

                            <li data-ng-show="settings.product_page_qty_status === 'on'">
                                <span class="module-create-title">Quantity Number Font</span>
                                        <span class="module-create-option">
                                            <j-opt-font data-ng-model="settings.product_page_qty_font"></j-opt-font>
                                        </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li data-ng-show="settings.product_page_qty_status === 'on'">
                                <span class="module-create-title">Input Background Color</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.product_page_qty_input_color"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li data-ng-show="settings.product_page_qty_status === 'on'">

                                <span class="module-create-title">- / + Symbol Size <small>Default = 25</small></span>
                                                <span class="module-create-option">
                                                    <j-opt-text data-ng-model="settings.product_page_quantity_symbol_size" class="journal-number-field"></j-opt-text>
                                                </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li data-ng-show="settings.product_page_qty_status === 'on'">

                                <span class="module-create-title">Buttons Color</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.product_page_qty_color"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li data-ng-show="settings.product_page_qty_status === 'on'">

                                <span class="module-create-title">Buttons Hover Color</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.product_page_qty_hover_color"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li data-ng-show="settings.product_page_qty_status === 'on'">

                                <span class="module-create-title">Background Color</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.product_page_qty_bg_color"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li data-ng-show="settings.product_page_qty_status === 'on'">

                                <span class="module-create-title">Background Hover Color</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.product_page_qty_bg_hover_color"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li data-ng-show="settings.product_page_qty_status === 'on'">

                                <span class="module-create-title">Border Settings</span>
                                    <span class="module-create-option">
                                        <j-opt-border data-ng-model="settings.product_page_qty_border"></j-opt-border>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                        </ul>
                    </accordion-group>
                </accordion>

                <!--Button Override-->
                <accordion>
                    <accordion-group is-open="false">
                        <accordion-heading>
                            <div class="accordion-bar bar-level-1">Add to Cart Button</div>
                        </accordion-heading>
                        <ul class="module-create-options">

                            <li>
                                <span class="module-create-title">Button Font</span>
                                <span class="module-create-option">
                                    <j-opt-font data-ng-model="settings.product_page_button_font"></j-opt-font>
                                </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Font Hover Color</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.product_page_button_font_hover"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>


                            <li>
                                <span class="module-create-title">Background <small>Color - Image</small></span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.product_page_button_bg"></j-opt-color> -
                                        <j-opt-background data-ng-model="settings.product_page_button_bg_image"></j-opt-background>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>


                            <li>
                                <span class="module-create-title">Background Hover <small>Color - Image</small></span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.product_page_button_bg_hover"></j-opt-color> -
                                        <j-opt-background data-ng-model="settings.product_page_button_bg_image_hover"></j-opt-background>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li>
                                <span class="module-create-title">Border Settings</span>
                                    <span class="module-create-option">
                                        <j-opt-border data-ng-model="settings.product_page_button_border"></j-opt-border>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li>
                                <span class="module-create-title">Border Hover Color</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.product_page_button_border_hover"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li>
                                <span class="module-create-title">Line Height Adjust <small>Vertical Centering</small> </span>
                                <span class="module-create-option">
                                    <j-opt-text data-ng-model="settings.product_page_button_line_height" class="journal-number-field"></j-opt-text>
                                </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li>
                                <span class="module-create-title">Button Icon</span>
                                <span class="module-create-option">
                                    <j-opt-icon data-ng-model="settings.product_page_button_icon"></j-opt-icon>
                                </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>

                            <li>
                                <span class="module-create-title">Icon Position</span>
                                    <span class="module-create-option">
                                        <switch data-ng-model="settings.product_page_button_icon_position">
                                            <switch-option key="left">Left</switch-option>
                                            <switch-option key="right">Right</switch-option>
                                        </switch>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li>
                                <span class="module-create-title">Inner Shadow <small>Push Effect</small></span>
                                    <span class="module-create-option">
                                        <switch data-ng-model="settings.product_page_button_active_shadow">
                                            <switch-option key="inset 0 1px 10px rgba(0, 0, 0, 0.8)">ON</switch-option>
                                            <switch-option key="none">OFF</switch-option>
                                        </switch>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>

                            <li>
                                <span class="module-create-title">Background Color</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.product_page_cart_bg"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Section Padding</span>
                                    <span class="module-create-option">
                                        <j-opt-text data-ng-model="settings.product_page_cart_padding" class="journal-number-field"></j-opt-text>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li>
                                <span class="module-create-title">Button Shadow</span>
                                <span class="module-create-option">
                                <j-opt-shadow data-ng-model="settings.pp_button_shadow" data-bgcolor="true"></j-opt-shadow>
                                </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li>
                                <span class="module-create-title">Shadow Hover</span>
                                <span class="module-create-option">
                                <j-opt-shadow data-ng-model="settings.pp_button_shadow_hover" data-bgcolor="true"></j-opt-shadow>
                                </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li>
                                <span class="module-create-title">Shadow Active <small>Push Effect</small></span>
                                <span class="module-create-option">
                                <j-opt-shadow data-ng-model="settings.pp_button_shadow_active" data-bgcolor="true"></j-opt-shadow>
                                </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>

                        </ul>
                    </accordion-group>
                </accordion>

                <!--Wishlist/Compare-->
                <accordion close-others="false">
                    <accordion-group is-open="false">
                        <accordion-heading>
                            <div class="accordion-bar bar-level-1">Wishlist Compare</div>
                        </accordion-heading>
                        <ul class="module-create-options">
                            <li>
                                <span class="module-create-title">Font</span>
                                <span class="module-create-option">
                                    <j-opt-font data-ng-model="settings.product_page_wishlist_font"></j-opt-font>
                                </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li>
                                <span class="module-create-title">Font Hover Color</span>
                                        <span class="module-create-option">
                                            <j-opt-color data-ng-model="settings.product_page_wishlist_font_hover"></j-opt-color>
                                        </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li>
                                <span class="module-create-title">Background Color</span>
                                        <span class="module-create-option">
                                            <j-opt-color data-ng-model="settings.product_page_wishlist_bg"></j-opt-color>
                                        </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li>
                                <span class="module-create-title">Wishlist Icon</span>
                                <span class="module-create-option">
                                    <j-opt-icon data-ng-model="settings.product_page_wishlist_icon"></j-opt-icon>
                                </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>

                            <li>
                                <span class="module-create-title">Compare Icon</span>
                                <span class="module-create-option">
                                    <j-opt-icon data-ng-model="settings.product_page_compare_icon"></j-opt-icon>
                                </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                        </ul>
                    </accordion-group>
                </accordion>


            </ul>
        </accordion-group>
        <!--Share Plugin-->
        <accordion-group is-open="accordion.accordions[4]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Share Plugin</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Status</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.share_buttons_status">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Background Color</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.share_buttons_bg"></j-opt-color>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Disable on mobile</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.share_buttons_disable_on_mobile">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li data-ng-show="settings.share_buttons_status == '1'">
                    <span class="module-create-title">Share Buttons</span>
                    <span class="module-create-option">
                        <ul class="simple-list">
                            <li data-ng-repeat="button in settings.share_buttons">
                                <img data-ng-src="{{shareThisButtons[button.id].img}}"/>
                                <select ui-select2="shareThisSelect" data-ng-model="button.id">
                                    <option value="{{b.id}}" data-img="{{b.img}}" data-ng-repeat="b in shareThisButtons">{{b.name}}</option>
                                </select>
                                <a class="btn red delete" href="javascript:;" data-ng-click="removeButton($index)">X</a>
                            </li>
                        </ul>
                        <a href="javascript:;" class="btn blue add-product" data-ng-click="addButton()">Add</a>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li data-ng-show="settings.share_buttons_status == '1'">
                    <span class="module-create-title">Buttons Style</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.share_buttons_style">
                            <switch-option key="_hcount">List</switch-option>
                            <switch-option key="_large">Large</switch-option>
                            <switch-option key=" ">Small</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li data-ng-show="settings.share_buttons_status == '1'">
                    <span class="module-create-title">Buttons Position</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.share_buttons_position">
                            <switch-option key="bottom">Bottom</switch-option>
                            <switch-option key="left">Left</switch-option>
                            <switch-option key="right">Right</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li data-ng-show="settings.share_buttons_status == '1'">
                    <span class="module-create-title">Share This Account Key <small>Optional</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.share_buttons_account_key"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
            </ul>
        </accordion-group>
        <!--Product Tabs-->
        <accordion-group is-open="accordion.accordions[5]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Product Tabs</div>
            </accordion-heading>
            <ul class="module-create-options">

                <!--Tabs-->

                <li>
                    <span class="module-create-title">Tabs Position <small>Opencart 2.0 only</small></span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.product_page_tabs_position">
                                <switch-option key="on">Image</switch-option>
                                <switch-option key="off">Bottom</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Tabs Font</span>
                        <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.product_page_tabs_font"></j-opt-font>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Tabs Font Hover/Active</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.product_page_tabs_font_hover"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Tabs Background</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.product_page_tabs_bg"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Tabs Background Hover/Active</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.product_page_tabs_bg_hover"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Tabs Border Settings <small>Individual Tabs</small></span>
                        <span class="module-create-option">
                            <j-opt-border data-ng-model="settings.product_page_tabs_border"></j-opt-border>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Tabs Group Border Radius <small>All Tabs</small></span>
                    <span class="module-create-option">
                            <j-opt-border data-ng-model="settings.product_page_tabs_group_radius" editor="hide-style"></j-opt-border>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Inner Shadow</span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.product_page_tabs_shadow">
                                <switch-option key="inset 0 -3px 6px -2px rgba(0, 0, 0, 0.5)">ON</switch-option>
                                <switch-option key="none">OFF</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Spacing</span>
                    <span class="module-create-option">
                         <j-opt-text data-ng-model="settings.product_page_tabs_spacing" class="journal-number-field"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <!--Tabs Content-->

                <accordion close-others="false">
                    <accordion-group is-open="false">
                        <accordion-heading>
                            <div class="accordion-bar bar-level-1">Tabs Content</div>
                        </accordion-heading>
                        <ul class="module-create-options">

                            <li>
                                <span class="module-create-title">Content Font</span>
                                <span class="module-create-option">
                                    <j-opt-font data-ng-model="settings.product_page_tabs_content_font"></j-opt-font>
                                </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Content H1</span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.product_page_tabs_content_h1"></j-opt-font> &nbsp; &nbsp; H2
                                        <j-opt-font data-ng-model="settings.product_page_tabs_content_h2"></j-opt-font> &nbsp; &nbsp; H3
                                        <j-opt-font data-ng-model="settings.product_page_tabs_content_h3"></j-opt-font>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li>
                                <span class="module-create-title">Content Lists Font</span>
                        <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.product_page_tabs_content_ul_font"></j-opt-font>
                        </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li>
                                <span class="module-create-title">Content Background</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.product_page_tabs_content_bg"></j-opt-color>
                        </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Content Border Settings</span>
                        <span class="module-create-option">
                            <j-opt-border data-ng-model="settings.product_page_tabs_content_border"></j-opt-border>
                        </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Content Padding</span>
                                    <span class="module-create-option">
                                        <j-opt-text data-ng-model="settings.product_page_tabs_content_padding" class="journal-number-field"></j-opt-text>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Description Line Height</span>
                                    <span class="module-create-option">
                                        <j-opt-text data-ng-model="settings.product_page_tabs_line_height" class="journal-number-field"></j-opt-text>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>

                        </ul>
                    </accordion-group>
                </accordion>

                <!--Specification-->

                <accordion close-others="false">
                    <accordion-group is-open="false">
                        <accordion-heading>
                            <div class="accordion-bar bar-level-1">Tabs Content<span>&nbsp; Specification</span></div>
                        </accordion-heading>
                        <ul class="module-create-options">

                            <li>
                                <span class="module-create-title">Title Font <small>Attribute Group</small></span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.product_page_spec_title_font"></j-opt-font>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li>
                                <span class="module-create-title">Specification Title Font <small>Attribute</small></span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.product_page_spec_font"></j-opt-font>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Specification Value Font<small>Attribute Text</small></span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.product_page_spec_value_font"></j-opt-font>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Specification Title Align</span>
                                    <span class="module-create-option">
                                        <switch data-ng-model="settings.product_page_spec_title_align">
                                            <switch-option key="left">Left</switch-option>
                                            <switch-option key="center">Center</switch-option>
                                            <switch-option key="right">Right</switch-option>
                                        </switch>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Specification Value Align</span>
                                    <span class="module-create-option">
                                        <switch data-ng-model="settings.product_page_spec_align">
                                            <switch-option key="left">Left</switch-option>
                                            <switch-option key="center">Center</switch-option>
                                            <switch-option key="right">Right</switch-option>
                                        </switch>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li>
                                <span class="module-create-title">Title Background</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.product_page_spec_title_bg"></j-opt-color>
                        </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li>
                                <span class="module-create-title">Tab Content Background</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.product_page_spec_content_bg"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li>
                                <span class="module-create-title">Table Border Color</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.product_page_spec_border_color"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                        </ul>
                    </accordion-group>
                </accordion>

                <!--Review-->

                <accordion close-others="false">
                    <accordion-group is-open="false">
                        <accordion-heading>
                            <div class="accordion-bar bar-level-1">Tabs Content<span>&nbsp; Review</span></div>
                        </accordion-heading>
                        <ul class="module-create-options">

                            <li>
                                <span class="module-create-title">Text Font</span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.product_page_review_font"></j-opt-font>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li>
                                <span class="module-create-title">Author Font</span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.product_page_review_font_author"></j-opt-font>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Date Font</span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.product_page_review_font_date"></j-opt-font>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Review Border Color <small>Opencart 1.5.x</small></span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.product_page_review_border"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li>
                                <span class="module-create-title">Heading Font <small>Write a review</small></span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.product_page_review_font_heading"></j-opt-font>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li>
                                <span class="module-create-title">Tab Content Background</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.product_page_review_bg"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Note Text Color <small>Opencart 2.0</small></span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.review_tex_danger_color"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li>
                                <span class="module-create-title">Note Text Background <small>Opencart 2.0</small></span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.review_text_danger_color_bg"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Input Fields Text Color</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.review_input_fields_color"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li>
                                <span class="module-create-title">Input Fields Background</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.review_input_fields_color_bg"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Button Bar Background</span>
                                <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.review_buttons_bg"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Button Bar Border</span>
                                <span class="module-create-option">
                                        <j-opt-border data-ng-model="settings.review_buttons_border"></j-opt-border>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Button Bar Padding</span>
                                <span class="module-create-option">
                                        <j-opt-text data-ng-model="settings.review_buttons_pt" class="journal-sort"></j-opt-text> -
                                        <j-opt-text data-ng-model="settings.review_buttons_pr" class="journal-sort"></j-opt-text> -
                                        <j-opt-text data-ng-model="settings.review_buttons_pb" class="journal-sort"></j-opt-text> -
                                        <j-opt-text data-ng-model="settings.review_buttons_pl" class="journal-sort"></j-opt-text>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                        </ul>
                    </accordion-group>
                </accordion>

                <!--Tabs Content Image-->

                <accordion close-others="false">
                    <accordion-group is-open="false">
                        <accordion-heading>
                            <div class="accordion-bar bar-level-1">Custom Blocks<span>&nbsp; Image Position</span></div>
                        </accordion-heading>
                        <ul class="module-create-options">

                            <li>
                                <span class="module-create-title">Title Font</span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.product_page_tabs_content_image_title_font"></j-opt-font>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li>
                                <span class="module-create-title">Content Font</span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.product_page_tabs_content_image_font"></j-opt-font>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>


                            <li>
                                <span class="module-create-title">Content Background</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.product_page_tabs_content_image_bg"></j-opt-color>
                        </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Content Border Settings</span>
                        <span class="module-create-option">
                            <j-opt-border data-ng-model="settings.product_page_tabs_content_image_border"></j-opt-border>
                        </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Content Padding <small>Top - Right - Bottom - Left</small></span>
                                    <span class="module-create-option">
                                        <j-opt-text data-ng-model="settings.product_page_tabs_content_image_padding_top" class="journal-sort"></j-opt-text> -
                                        <j-opt-text data-ng-model="settings.product_page_tabs_content_image_padding_right" class="journal-sort"></j-opt-text> -
                                        <j-opt-text data-ng-model="settings.product_page_tabs_content_image_padding_bottom" class="journal-sort"></j-opt-text> -
                                        <j-opt-text data-ng-model="settings.product_page_tabs_content_image_padding_left" class="journal-sort"></j-opt-text>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Line Height</span>
                                    <span class="module-create-option">
                                        <j-opt-text data-ng-model="settings.product_page_tab_image_line_height" class="journal-number-field"></j-opt-text>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>

                        </ul>
                    </accordion-group>
                </accordion>

                <!--Tabs Content Options-->

                <accordion close-others="false">
                    <accordion-group is-open="false">
                        <accordion-heading>
                            <div class="accordion-bar bar-level-1">Custom Blocks<span>&nbsp; Options Position</span></div>
                        </accordion-heading>
                        <ul class="module-create-options">

                            <li>
                                <span class="module-create-title">Title Font</span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.product_page_tabs_content_option_title_font"></j-opt-font>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li>
                                <span class="module-create-title">Content Font </span>
                        <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.product_page_tabs_content_option_font"></j-opt-font>
                        </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li>
                                <span class="module-create-title">Content Background</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.product_page_tabs_content_option_bg"></j-opt-color>
                        </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Content Border Settings</span>
                        <span class="module-create-option">
                            <j-opt-border data-ng-model="settings.product_page_tabs_content_option_border"></j-opt-border>
                        </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Content Padding <small>Top - Right - Bottom - Left</small></span>
                                    <span class="module-create-option">
                                        <j-opt-text data-ng-model="settings.product_page_tabs_content_option_padding_top" class="journal-sort"></j-opt-text> -
                                        <j-opt-text data-ng-model="settings.product_page_tabs_content_option_padding_right" class="journal-sort"></j-opt-text> -
                                        <j-opt-text data-ng-model="settings.product_page_tabs_content_option_padding_bottom" class="journal-sort"></j-opt-text> -
                                        <j-opt-text data-ng-model="settings.product_page_tabs_content_option_padding_left" class="journal-sort"></j-opt-text>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Line Height</span>
                                    <span class="module-create-option">
                                        <j-opt-text data-ng-model="settings.product_page_tab_options_line_height" class="journal-number-field"></j-opt-text>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>

                        </ul>
                    </accordion-group>
                </accordion>
            </ul>
        </accordion-group>

        <!--Product Tags-->
        <accordion-group is-open="accordion.accordions[6]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Product Tags</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                <span class="module-create-title">Title Font</span>
                        <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.tags_title_font"></j-opt-font>
                        </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>

                <li>
                    <span class="module-create-title">Title Background</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.tags_title_bg"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Tag Font</span>
                        <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.tags_font"></j-opt-font>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Tag Background</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.tags_bg"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Tag Font Hover</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.tags_hover_font"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Tag Background Hover</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.tags_hover_bg"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Tag Border Settings</span>
                        <span class="module-create-option">
                            <j-opt-border data-ng-model="settings.tags_border"></j-opt-border>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Tags Align</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.tags_align">
                            <switch-option key="left">Left</switch-option>
                            <switch-option key="center">Center</switch-option>
                            <switch-option key="right">Right</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
            </ul>
        </accordion-group>

        <!--Related Products-->
        <accordion-group is-open="accordion.accordions[7]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Related Products</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Status</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.related_products_status">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li data-ng-hide="settings.related_products_status == '0'">
                    <span class="module-create-title">Products per Row</span>
                    <span class="module-create-option">
                        <j-opt-items-per-row data-range="1,8" data-step="1" data-ng-model="settings.related_products_items_per_row"></j-opt-items-per-row>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li data-ng-hide="settings.related_products_status == '0'">
                    <span class="module-create-title">Carousel Mode</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.related_products_carousel">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li data-ng-hide="settings.related_products_carousel == '0' || settings.related_products_status == '0'">
                    <span class="module-create-title">Carousel Arrows</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.related_products_carousel_arrows">
                            <switch-option key="none">None</switch-option>
                            <switch-option key="top">Top</switch-option>
                            <switch-option key="side">Side</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-hide="settings.related_products_carousel == '0' || settings.related_products_status == '0'">
                    <span class="module-create-title">Carousel Bullets</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.related_products_carousel_bullets">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-hide="settings.related_products_carousel == '0' || settings.related_products_status == '0'">
                    <span class="module-create-title">Carousel Autoplay</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.related_products_carousel_autoplay">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-hide="settings.related_products_carousel == '0' || settings.related_products_status == '0' || settings.related_products_carousel_autoplay == '0'">
                    <span class="module-create-title">Pause on Hover</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.related_products_carousel_pause_on_hover">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="settings.related_products_carousel == '1' && settings.related_products_status == '1' && settings.related_products_carousel_autoplay == '1'">
                    <span class="module-create-title">Transition Delay</span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.related_products_carousel_transition_delay" class="journal-number-field"></j-opt-text>
                    </span>
                </li>
                <li data-ng-show="settings.related_products_carousel == '1' && settings.related_products_status == '1'">
                    <span class="module-create-title">Transition Speed</span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.related_products_carousel_transition_speed" class="journal-number-field"></j-opt-text>
                    </span>
                </li>
                <li data-ng-show="settings.related_products_carousel == '1' && settings.related_products_status == '1'">
                    <span class="module-create-title">Touch Drag</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.related_products_carousel_touch_drag">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
            </ul>
        </accordion-group>
    </accordion>
</div>
