<div class="sticky">
<div class="module-header">
    <div class='module-name'>Settings<span>Product Labels</span></div>

    <skin-manager data-url="settings/productlabels"></skin-manager>

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
        <accordion-group is-open="accordion.accordions[0]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Latest Label</div>
            </accordion-heading>

            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Display</span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.label_latest_status">
                                <switch-option key="always">Always</switch-option>
                                <switch-option key="hover">Hover</switch-option>
                                <switch-option key="never">Never</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li  data-ng-hide="settings.label_latest_status == 'never'">
                    <span class="module-create-title">Text</span>
                            <span class="module-create-option">
                                <j-opt-text-lang data-ng-model="settings.label_latest_text"></j-opt-text-lang>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li  data-ng-hide="settings.label_latest_status == 'never'">
                    <span class="module-create-title">Product Limit</span>
                            <span class="module-create-option">
                                <j-opt-text data-ng-model="settings.label_latest_limit" class="journal-number-field"></j-opt-text>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li  data-ng-hide="settings.label_latest_status == 'never'">
                    <span class="module-create-title">Font</span>
                            <span class="module-create-option">
                                <j-opt-font data-ng-model="settings.label_latest_font"></j-opt-font>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li  data-ng-hide="settings.label_latest_status == 'never'">
                    <span class="module-create-title">Background Color</span>
                            <span class="module-create-option">
                                <j-opt-color data-ng-model="settings.label_latest_bg"></j-opt-color>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li  data-ng-hide="settings.label_latest_status == 'never'">
                    <span class="module-create-title">Border Settings</span>
                            <span class="module-create-option">
                                <j-opt-border data-ng-model="settings.label_latest_border"></j-opt-border>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li  data-ng-hide="settings.label_latest_status == 'never'">
                    <span class="module-create-title">Dimensions <small>Width / Height</small></span>
                        <span class="module-create-option">
                            <j-opt-text data-ng-model="settings.label_latest_width" class="journal-number-field"></j-opt-text> x
                            <j-opt-text data-ng-model="settings.label_latest_height" class="journal-number-field"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

            </ul>
        </accordion-group>
        <accordion-group is-open="accordion.accordions[1]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Special Label</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Display</span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.label_special_status">
                                <switch-option key="always">Always</switch-option>
                                <switch-option key="hover">Hover</switch-option>
                                <switch-option key="never">Never</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li  data-ng-hide="settings.label_special_status == 'never'">
                    <span class="module-create-title">Display As</span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.label_special_type">
                                <switch-option key="percent"> % </switch-option>
                                <switch-option key="text">Text &nbsp;&nbsp;</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li  data-ng-hide="settings.label_special_type == 'percent' || settings.label_special_status == 'never'">
                    <span class="module-create-title">Text</span>
                            <span class="module-create-option">
                                <j-opt-text-lang data-ng-model="settings.label_special_text"></j-opt-text-lang>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li  data-ng-hide="settings.label_special_status == 'never'">
                    <span class="module-create-title">Font</span>
                            <span class="module-create-option">
                                <j-opt-font data-ng-model="settings.label_special_font"></j-opt-font>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li  data-ng-hide="settings.label_special_status == 'never'">
                    <span class="module-create-title">Background Color</span>
                            <span class="module-create-option">
                                <j-opt-color data-ng-model="settings.label_special_bg"></j-opt-color>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li  data-ng-hide="settings.label_special_status == 'never'">
                    <span class="module-create-title">Border Settings</span>
                            <span class="module-create-option">
                                <j-opt-border data-ng-model="settings.label_special_border"></j-opt-border>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li  data-ng-hide="settings.label_special_status == 'never'">
                    <span class="module-create-title">Dimensions <small>Width / Height</small></span>
                            <span class="module-create-option">
                                <j-opt-text data-ng-model="settings.label_special_width" class="journal-number-field"></j-opt-text> x
                                <j-opt-text data-ng-model="settings.label_special_height" class="journal-number-field"></j-opt-text>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
            </ul>
        </accordion-group>

        <!--Out of Stock-->
        <accordion-group is-open="accordion.accordions[2]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Out of Stock</div>
            </accordion-heading>
            <ul class="module-create-options">

                <li>
                    <span class="module-create-title">Display</span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.out_of_stock_status">
                                <switch-option key="always">Always</switch-option>
                                <switch-option key="hover">Hover</switch-option>
                                <switch-option key="never">Never</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li data-ng-hide="settings.out_of_stock_status == 'never'">
                    <span class="module-create-title">Style</span>
                    <span class="module-create-option">
                            <switch data-ng-model="settings.out_of_stock_style">
                                <switch-option key="diagonal">Diagonal</switch-option>
                                <switch-option key="normal">Normal</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li  data-ng-hide="settings.out_of_stock_status == 'never' || settings.out_of_stock_style == 'normal'">
                    <span class="module-create-title">Text Spacing <small>Top - Right - Bottom - Left</small></span>
                    <span class="module-create-option">
                            <j-opt-text data-ng-model="settings.out_of_stock_ribbon_top_space" class="journal-sort" placeholder="7"></j-opt-text> -
                            <j-opt-text data-ng-model="settings.out_of_stock_ribbon_right_space" class="journal-sort"placeholder="40"></j-opt-text> -
                            <j-opt-text data-ng-model="settings.out_of_stock_ribbon_bottom_space" class="journal-sort"placeholder="7"></j-opt-text> -
                            <j-opt-text data-ng-model="settings.out_of_stock_ribbon_left_space" class="journal-sort"placeholder="40"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li  data-ng-hide="settings.out_of_stock_status == 'never'">
                    <span class="module-create-title">Ribbon Font</span>
                        <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.out_of_stock_ribbon_font_size"></j-opt-font>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li  data-ng-hide="settings.out_of_stock_status == 'never'">
                    <span class="module-create-title">Background Color</span>
                            <span class="module-create-option">
                                <j-opt-color data-ng-model="settings.out_of_stock_bg"></j-opt-color>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Disable Add to Cart Button</span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.out_of_stock_disable_button">
                                <switch-option key="1">ON</switch-option>
                                <switch-option key="0">OFF</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li data-ng-hide="settings.out_of_stock_disable_button == 0">
                    <span class="module-create-title">Disabled Button Opacity <small>.5 = 50%</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.out_of_stock_disable_button_opacity" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                
            </ul>
        </accordion-group>
    </accordion>
</div>
