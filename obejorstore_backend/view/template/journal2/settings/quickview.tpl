<div class="sticky">
<div class="module-header">
    <div class='module-name'>Settings<span>QuickView</span></div>

    <skin-manager data-url="settings/quickview"></skin-manager>

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

<div class="module-body">
    <div class="accordion-bar bar-level-0 bar-expand" >
        <a data-ng-click="toggleAccordion(true)" class="hint--top" data-hint="Expand All"><i class="expand-icon"></i></a>  <a data-ng-click="toggleAccordion(false)" class="hint--top" data-hint="Collapse All"><i class="collapse-icon"></i></a>
        <label class="close-others hint--top" data-hint="Close Others"><input type="checkbox" data-ng-model="accordion.close_others" /></label>
    </div>
    <accordion id="main-accordion" close-others="accordion.close_others">
        <!--Notification-->
        <accordion-group is-open="accordion.accordions[0]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">QuickView</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Status</span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.quickview_status">
                                <switch-option key="1">ON</switch-option>
                                <switch-option key="0">OFF</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li  data-ng-show="settings.quickview_status == '1'">
                    <span class="module-create-title">Modal Height</span>
                        <span class="module-create-option">
                            <!--<j-opt-text data-ng-model="settings.quickview_width" class="journal-number-field"></j-opt-text> x-->
                            <j-opt-text data-ng-model="settings.quickview_height" class="journal-number-field"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li  data-ng-show="settings.quickview_status == '1'">
                    <span class="module-create-title">Background Color</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.quickview_bg_color"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li  data-ng-show="settings.quickview_status == '1'">
                    <span class="module-create-title">Border Settings</span>
                        <span class="module-create-option">
                            <j-opt-border data-ng-model="settings.quickview_border" editor="hide-radius"></j-opt-border>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li  data-ng-show="settings.quickview_status == '1'">
                    <span class="module-create-title">Title Bar Font</span>
                        <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.quickview_title_font"></j-opt-font>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li  data-ng-show="settings.quickview_status == '1'">
                    <span class="module-create-title">Title Background</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.quickview_title_bg"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li  data-ng-show="settings.quickview_status == '1'">
                    <span class="module-create-title">Title Border</span>
                        <span class="module-create-option">
                            <j-opt-border data-ng-model="settings.quickview_title_border"></j-opt-border>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Title Padding <small>Left - Right</small></span>
                            <span class="module-create-option">
                                <j-opt-text data-ng-model="settings.quickview_title_padding_left" class="journal-sort"></j-opt-text> -
                                <j-opt-text data-ng-model="settings.quickview_title_padding_right" class="journal-sort"></j-opt-text>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Title Text Align</span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.quickview_title_align">
                                <switch-option key="left">Left</switch-option>
                                <switch-option key="center">Center</switch-option>
                                <switch-option key="right">Right</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>


                <li  data-ng-show="settings.quickview_status == '1'">
                    <span class="module-create-title">Show Product Options</span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.quickview_product_options">
                                <switch-option key="1">ON</switch-option>
                                <switch-option key="0">OFF</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li  data-ng-show="settings.quickview_status == '1'">
                    <span class="module-create-title">Cloud Zoom</span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.quickview_cloud_zoom">
                                <switch-option key="1">ON</switch-option>
                                <switch-option key="0">OFF</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li  data-ng-show="settings.quickview_status == '1'">
                    <span class="module-create-title">Quickview Button Text</span>
                        <span class="module-create-option">
                            <j-opt-text-lang data-ng-model="settings.quickview_button_text"></j-opt-text-lang>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li  data-ng-show="settings.quickview_status == '1'">
                    <span class="module-create-title">More Details Button</span>
                    <span class="module-create-option">
                            <switch data-ng-model="settings.quickview_more_details">
                                <switch-option key="1">ON</switch-option>
                                <switch-option key="0">OFF</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li  data-ng-show="settings.quickview_status == '1'">
                    <span class="module-create-title">More Details Text</span>
                        <span class="module-create-option">
                            <j-opt-text-lang data-ng-model="settings.quickview_more_details_text"></j-opt-text-lang>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li  data-ng-show="settings.quickview_status == '1'">
                    <span class="module-create-title">More Details Button Background Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.quickview_more_details_bg_color"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li  data-ng-show="settings.quickview_status == '1'">
                    <span class="module-create-title">More Details Button Background Hover</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.quickview_more_details_bg_color_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li  data-ng-show="settings.quickview_status == '1'">
                    <span class="module-create-title">More Details Icon</span>
                        <span class="module-create-option">
                            <j-opt-icon data-ng-model="settings.quickview_more_details_icon"></j-opt-icon>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li  data-ng-show="settings.quickview_status == '1'">
                    <span class="module-create-title">Tooltip Font Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.quickview_more_details_tip_font"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li  data-ng-show="settings.quickview_status == '1'">
                    <span class="module-create-title">Tooltip Background Color</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.quickview_more_details_tip_bg"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li  data-ng-show="settings.quickview_status == '1'">
                    <span class="module-create-title">Tooltip Border Radius</span>
                            <span class="module-create-option">
                                <j-opt-border data-ng-model="settings.quickview_more_details_tip_border" editor="hide-style"></j-opt-border>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>


                <li  data-ng-show="settings.quickview_status == '1'">
                    <span class="module-create-title">Description Position</span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.quickview_description_position">
                                <switch-option key="image">Image</switch-option>
                                <switch-option key="options">Options</switch-option>
                                <switch-option key="bottom">Bottom</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Description Padding <small>Top - Right - Bottom - Left</small></span>
                            <span class="module-create-option">
                                <j-opt-text data-ng-model="settings.quickview_description_padding_top" class="journal-sort"></j-opt-text> -
                                <j-opt-text data-ng-model="settings.quickview_description_padding_right" class="journal-sort"></j-opt-text> -
                                <j-opt-text data-ng-model="settings.quickview_description_padding_bottom" class="journal-sort"></j-opt-text> -
                                <j-opt-text data-ng-model="settings.quickview_description_padding_left" class="journal-sort"></j-opt-text>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li  data-ng-show="settings.quickview_status == '1'">
                    <span class="module-create-title">Description Font</span>
                            <span class="module-create-option">
                                <j-opt-font data-ng-model="settings.quickview_description_font" editor="hide-style"></j-opt-font>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li  data-ng-show="settings.quickview_status == '1'">
                    <span class="module-create-title">Description Background Color</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.quickview_desc_bg"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

            </ul>
        </accordion-group>
    </accordion>
</div>
