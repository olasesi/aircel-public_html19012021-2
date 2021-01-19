<div class="sticky">
<div class="module-header">
    <div class='module-name'>Settings<span>Side Column</span></div>

    <skin-manager data-url="settings/sidecolumn"></skin-manager>

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
        <accordion-group is-open="accordion.accordions[0]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">General</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Left Column on Tablet <small>Portrait</small></span>
                    <span class="module-create-option">
                                <switch data-ng-model="settings.left_column_on_tablet">
                                    <switch-option key="on">ON</switch-option>
                                    <switch-option key="off">OFF</switch-option>
                                </switch>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Right Column on Tablet <small>Portrait</small></span>
                    <span class="module-create-option">
                                <switch data-ng-model="settings.right_column_on_tablet">
                                    <switch-option key="on">ON</switch-option>
                                    <switch-option key="off">OFF</switch-option>
                                </switch>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                 <li>
                    <span class="module-create-title">Title Bar Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.side_title_font"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Title Bar Background Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.side_title_bg"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Title Bar Border Settings</span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="settings.side_title_border"></j-opt-border>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Title Bar Height</span>
                                    <span class="module-create-option">
                                        <j-opt-text data-ng-model="settings.side_title_line_height" class="journal-number-field"></j-opt-text>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Title Padding <small>Left - Right</small></span>
                        <span class="module-create-option">
                            <j-opt-text data-ng-model="settings.side_title_padding_left" class="journal-sort"></j-opt-text> -
                            <j-opt-text data-ng-model="settings.side_title_padding_right" class="journal-sort"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Module Background Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.side_module_bg"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Module Border Settings</span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="settings.side_module_border"></j-opt-border>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Module Divider Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.side_module_divider"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Module Divider Type</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.side_module_divider_type">
                            <switch-option key="solid">Solid</switch-option>
                            <switch-option key="dashed">Dashed</switch-option>
                            <switch-option key="dotted">Dotted</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Side Modules Margin <small>Spacing between modules</small></span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.side_modules_margin">
                            <switch-option key="on">ON</switch-option>
                            <switch-option key="off">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li data-ng-hide="settings.side_modules_margin == 'off'">
                    <span class="module-create-title">Custom Margin</span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.side_modules_margin_custom" class="journal-number-field" placeholder="20"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

            </ul>
        </accordion-group>


        <accordion-group is-open="accordion.accordions[1]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Side Category</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Category Links Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.side_module_link_font"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Links Hover Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.side_module_link_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Background Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.side_module_link_bg"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Background Hover / Active Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.side_module_link_bg_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Top Category Icon</span>
                    <span class="module-create-option">
                        <j-opt-icon data-ng-model="settings.side_module_link_icon"></j-opt-icon>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Subcategory Icon</span>
                    <span class="module-create-option">
                        <j-opt-icon data-ng-model="settings.side_module_sub_link_icon"></j-opt-icon>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Subcategory Offset <small>Left Spacing</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.side_category_sub_left_padding" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Category Link Padding</span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.side_category_link_padding_top" class="journal-sort"></j-opt-text> -
                        <j-opt-text data-ng-model="settings.side_category_link_padding_right" class="journal-sort"></j-opt-text> -
                        <j-opt-text data-ng-model="settings.side_category_link_padding_bottom" class="journal-sort"></j-opt-text> -
                        <j-opt-text data-ng-model="settings.side_category_link_padding_left" class="journal-sort"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <accordion-group is-open="false">
                    <accordion-heading>
                        <div class="accordion-bar bar-level-1">Multi-Level Button</div>
                    </accordion-heading>
                    <ul class="module-create-options">

                        <li>
                            <span class="module-create-title">+ / - Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.category_plus_font"></j-opt-font>
                    </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>

                        <li>
                            <span class="module-create-title">Background Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.category_plus_bg"></j-opt-color>
                    </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Hover Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.category_plus_hover"></j-opt-color>
                    </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Background Hover Color</span>
                    <span class="module-create-option">
                     <j-opt-color data-ng-model="settings.category_plus_bg_hover"></j-opt-color>

                    </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>

                        <li>
                            <span class="module-create-title">Border Radius</span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="settings.category_plus_border"></j-opt-border>
                    </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>

                        <li>
                            <span class="module-create-title">Size <small>Width x Height</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.side_category_link_plus_width" class="journal-number-field"></j-opt-text> x
                        <j-opt-text data-ng-model="settings.side_category_link_plus_height" class="journal-number-field"></j-opt-text>

                    </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>

                        <li>
                            <span class="module-create-title">Offset <small>Top x Right</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.side_category_link_plus" class="journal-number-field"></j-opt-text> x
                        <j-opt-text data-ng-model="settings.side_category_link_plus_right" class="journal-number-field"></j-opt-text>

                    </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                    </ul>
                </accordion-group>
            </ul>
       </accordion-group>


        <accordion-group is-open="accordion.accordions[2]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Side Products</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Image Dimensions <small>Width x Height</small></span>
                        <span class="module-create-option">
                            <j-opt-text data-ng-model="settings.side_product_image_width" class="journal-number-field"></j-opt-text> x
                            <j-opt-text data-ng-model="settings.side_product_image_height" class="journal-number-field"></j-opt-text>
                            <switch data-ng-model="settings.side_product_image_type" class="fit-side-column">
                                <switch-option key="fit">Fit</switch-option>
                                <switch-option key="crop">Crop &nbsp;&nbsp;&nbsp;</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Product Name Overflow </span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.side_product_name_overflow">
                            <switch-option key="nowrap">ON</switch-option>
                            <switch-option key="normal">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Name Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.side_product_name_font"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Name Font Hover</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.side_product_name_font_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Price Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.side_product_price_font"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Old Price Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.side_product_old_price_font"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                <li>
                    <span class="module-create-title">Image Border Settings</span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="settings.side_module_image_border"></j-opt-border>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Product Item Padding</span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.side_category_product_padding_top" class="journal-sort"></j-opt-text> -
                        <j-opt-text data-ng-model="settings.side_category_product_padding_right" class="journal-sort"></j-opt-text> -
                        <j-opt-text data-ng-model="settings.side_category_product_padding_bottom" class="journal-sort"></j-opt-text> -
                        <j-opt-text data-ng-model="settings.side_category_product_padding_left" class="journal-sort"></j-opt-text>

                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
            </ul>
        </accordion-group>
    </accordion>
</div>
