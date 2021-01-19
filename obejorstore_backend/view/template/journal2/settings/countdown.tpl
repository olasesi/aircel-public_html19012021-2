<div class="sticky">
<div class="module-header">
    <div class='module-name'>Settings<span>Countdown</span></div>

    <skin-manager data-url="settings/countdown"></skin-manager>

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
        <!--Countdown-->
        <accordion-group is-open="accordion.accordions[0]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Language</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Days Text</span>
                    <span class="module-create-option countdown-text">
                        <j-opt-text-lang data-ng-model="settings.countdown_days" class="journal-number-field"></j-opt-text-lang>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Hours Text</span>
                    <span class="module-create-option countdown-text">
                        <j-opt-text-lang data-ng-model="settings.countdown_hours" class="journal-number-field"></j-opt-text-lang>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Min Text</span>
                    <span class="module-create-option countdown-text">
                        <j-opt-text-lang data-ng-model="settings.countdown_min" class="journal-number-field"></j-opt-text-lang>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Sec Text</span>
                    <span class="module-create-option countdown-text">
                        <j-opt-text-lang data-ng-model="settings.countdown_sec" class="journal-number-field"></j-opt-text-lang>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

            </ul>
        </accordion-group>

        <accordion-group is-open="accordion.accordions[1]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Product Grid / List</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Show Countdown</span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.show_countdown">
                                <switch-option key="never">Never</switch-option>
                                <switch-option key="hidden">Hidden</switch-option>
                                <switch-option key="hover">Hover</switch-option>
                                <switch-option key="always">Always</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Background Color</span>
                        <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.countdown_bg"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>


                <li>
                    <span class="module-create-title">Numbers Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.countdown_numbers_font"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Text Font <small>Days, Hours, Min, Sec</small></span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.countdown_text_font"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>


                <li>
                    <span class="module-create-title">Divider Color</span>
                        <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.countdown_divider_color"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Divider Type </span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.countdown_divider_type">
                                <switch-option key="solid">Solid</switch-option>
                                <switch-option key="dashed">Dashed</switch-option>
                                <switch-option key="dotted">Dotted</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

            </ul>
        </accordion-group>

        <accordion-group is-open="accordion.accordions[2]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Product Page</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Show Countdown</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.show_countdown_product_page">
                            <switch-option key="on">ON</switch-option>
                            <switch-option key="off">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Background Color</span>
                        <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.pp_countdown_bg"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Numbers Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.pp_countdown_numbers_font"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Text Font <small>Days, Hours, Min, Sec</small></span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.pp_countdown_text_font"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Divider Color</span>
                        <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.pp_countdown_divider_color"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Divider Type </span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.pp_countdown_divider_type">
                                <switch-option key="solid">Solid</switch-option>
                                <switch-option key="dashed">Dashed</switch-option>
                                <switch-option key="dotted">Dotted</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Countdown Max Width</span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.countdown_product_page_width" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                <li>
                    <span class="module-create-title">Title Text</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="settings.countdown_product_page_title"></j-opt-text-lang>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Title Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.countdown_product_page_title_font"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Title Background Color</span>
                        <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.countdown_product_page_title_bg"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Title Padding <small>Top - Right - Bottom - Left</small></span>
                        <span class="module-create-option">
                            <j-opt-text data-ng-model="settings.countdown_product_page_padding_top" class="journal-sort"></j-opt-text> -
                            <j-opt-text data-ng-model="settings.countdown_product_page_padding_right" class="journal-sort"></j-opt-text> -
                            <j-opt-text data-ng-model="settings.countdown_product_page_padding_bottom" class="journal-sort"></j-opt-text> -
                            <j-opt-text data-ng-model="settings.countdown_product_page_padding_left" class="journal-sort"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Title Align </span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.countdown_product_page_title_align">
                                <switch-option key="left">Left</switch-option>
                                <switch-option key="center">Center</switch-option>
                                <switch-option key="right">Right</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Section Background Color</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.countdown_product_page_option_bg"></j-opt-color>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Section Padding</span>
                                    <span class="module-create-option">
                                        <j-opt-text data-ng-model="settings.countdown_product_page_option_padding" class="journal-number-field"></j-opt-text>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Border Setting</span>
                                    <span class="module-create-option">
                                        <j-opt-border data-ng-model="settings.countdown_product_page_border"></j-opt-border>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

            </ul>
        </accordion-group>
    </accordion>
</div>
