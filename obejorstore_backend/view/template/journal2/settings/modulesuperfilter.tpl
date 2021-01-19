<div class="sticky">
<div class="module-header">
    <div class='module-name'>Modules<span>Super Filter</span></div>

    <skin-manager data-url="settings/modulesuperfilter"></skin-manager>

    <div class="module-buttons">
        <?php if (defined('J2ENV')): ?>
        <a class="btn blue" data-ng-show="skin_id < 100" data-ng-click="saveDefault($event)">Export</a>
        <?php endif; ?>
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
                    <span class="module-create-title">Collapse Sections</span>
                    <span class="module-create-option">
                            <switch data-ng-model="settings.filter_collapse">
                                <switch-option key="on">ON</switch-option>
                                <switch-option key="off">OFF</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li data-ng-hide="settings.filter_collapse == 'off'">
                    <span class="module-create-title">Initial State Expanded<small>Turn OFF to collapse sections</small></span>
                    <span class="module-create-option">
                            <switch data-ng-model="settings.filter_collapsed_state">
                                <switch-option key="expanded">ON</switch-option>
                                <switch-option key="collapsed">OFF</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Show Checkbox</span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.filter_show_box">
                                <switch-option key="1">ON</switch-option>
                                <switch-option key="0">OFF</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Heading Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.filter_heading_font"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Heading Background Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.filter_heading_bg"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Heading Border</span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="settings.filter_heading_border"></j-opt-border>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Heading Height <small>Line Height</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.filter_heading_height" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Option Font</span>
                        <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.filter_font"></j-opt-font>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Active Option Font Color</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.filter_active_text"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>




                <li>
                    <span class="module-create-title">Section Background Color</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.filter_section_bg"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
               

                <li>
                    <span class="module-create-title">Item Divider Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.filter_item_divider"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Item Divider Type</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.filter_item_divider_type">
                            <switch-option key="solid">Solid</switch-option>
                            <switch-option key="dashed">Dashed</switch-option>
                            <switch-option key="dotted">Dotted</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Section Max Height <small>Generates Scrollbar</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.filter_height" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Section Spacing <small>Distance between sections</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.filter_section_spacing" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Section Padding <small>Top / Bottom</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.filter_section_padding_from_title" class="journal-sort"></j-opt-text> -
                        <j-opt-text data-ng-model="settings.filter_section_padding_from_bottom" class="journal-sort"></j-opt-text>

                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Options Padding <small>Top - Right - Bottom - Left</small></span>
                            <span class="module-create-option">
                                <j-opt-text data-ng-model="settings.filter_section_padding_top" class="journal-sort"></j-opt-text> -
                                <j-opt-text data-ng-model="settings.filter_section_padding_right" class="journal-sort"></j-opt-text> -
                                <j-opt-text data-ng-model="settings.filter_section_padding_bottom" class="journal-sort"></j-opt-text> -
                                <j-opt-text data-ng-model="settings.filter_section_padding_left" class="journal-sort"></j-opt-text>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Image Section Padding <small>Top - Right - Bottom - Left</small></span>
                            <span class="module-create-option">
                                <j-opt-text data-ng-model="settings.filter_image_section_padding_top" class="journal-sort"></j-opt-text> -
                                <j-opt-text data-ng-model="settings.filter_image_section_padding_right" class="journal-sort"></j-opt-text> -
                                <j-opt-text data-ng-model="settings.filter_image_section_padding_bottom" class="journal-sort"></j-opt-text> -
                                <j-opt-text data-ng-model="settings.filter_image_section_padding_left" class="journal-sort"></j-opt-text>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Image Margin <small>Right - Bottom</small></span>
                            <span class="module-create-option">
                                <j-opt-text data-ng-model="settings.filter_image_section_margin_right" class="journal-sort"></j-opt-text> -
                                <j-opt-text data-ng-model="settings.filter_image_section_margin_bottom" class="journal-sort"></j-opt-text>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Image Border Settings</span>
                        <span class="module-create-option">
                            <j-opt-border data-ng-model="settings.filter_border"></j-opt-border>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Active Image Border Color</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.filter_active_border"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Category Image Size</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.filter_cat_image_size">
                            <switch-option key="12.5">Tiny</switch-option>
                            <switch-option key="16.666666">Small</switch-option>
                            <switch-option key="20">Medium</switch-option>
                            <switch-option key="25">Large</switch-option>
                            <switch-option key="33.333333">Larger</switch-option>
                        </switch>
                        <j-opt-text type="text" class="journal-number-field switch-field" data-ng-model="settings.filter_cat_image_width" placeholder="Width"></j-opt-text> <span class="switch-field">x</span> <j-opt-text type="text" class="journal-number-field switch-field" data-ng-model="settings.filter_cat_image_height" placeholder="Height"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Brands Image Size</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.filter_brand_image_size">
                            <switch-option key="12.5">Tiny</switch-option>
                            <switch-option key="16.666666">Small</switch-option>
                            <switch-option key="20">Medium</switch-option>
                            <switch-option key="25">Large</switch-option>
                            <switch-option key="33.333333">Larger</switch-option>
                        </switch>
                        <j-opt-text type="text" class="journal-number-field switch-field" data-ng-model="settings.filter_brand_image_width" placeholder="Width"></j-opt-text> <span class="switch-field">x</span> <j-opt-text type="text" class="journal-number-field switch-field" data-ng-model="settings.filter_brand_image_height" placeholder="Height"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Options Image Size</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.filter_image_size">
                            <switch-option key="12.5">Tiny</switch-option>
                            <switch-option key="16.666666">Small</switch-option>
                            <switch-option key="20">Medium</switch-option>
                            <switch-option key="25">Large</switch-option>
                            <switch-option key="33.333333">Larger</switch-option>
                        </switch>
                        <j-opt-text type="text" class="journal-number-field switch-field" data-ng-model="settings.filter_option_image_width" placeholder="Width"></j-opt-text> <span class="switch-field">x</span> <j-opt-text type="text" class="journal-number-field switch-field" data-ng-model="settings.filter_option_image_height" placeholder="Height"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Loading Text</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="settings.filter_loading_text"></j-opt-text-lang>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Brands Title Text</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="settings.filter_brands_text"></j-opt-text-lang>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Categories Title Text</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="settings.filter_categories_text"></j-opt-text-lang>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Tags Title Text</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="settings.filter_tags_text"></j-opt-text-lang>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Availability Title Text</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="settings.filter_availability_text"></j-opt-text-lang>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">In Stock Text</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="settings.filter_availability_yes_text"></j-opt-text-lang>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Out of Stock Text</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="settings.filter_availability_no_text"></j-opt-text-lang>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>


                <!--<li>-->
                    <!--<span class="module-create-title">No Products Text</span>-->
                    <!--<span class="module-create-option">-->
                        <!--<j-opt-text-lang data-ng-model="settings.filter_no_products_text"></j-opt-text-lang>-->
                    <!--</span>-->
                    <!--<a href="#" target="_blank" class="journal-tip"></a>-->
                <!--</li>-->
                <!--<li>-->
                    <!--<span class="module-create-title">No Filters Text</span>-->
                    <!--<span class="module-create-option">-->
                        <!--<j-opt-text-lang data-ng-model="settings.filter_no_filters_text"></j-opt-text-lang>-->
                    <!--</span>-->
                    <!--<a href="#" target="_blank" class="journal-tip"></a>-->
                <!--</li>-->

            </ul>
        </accordion-group>
        <accordion-group is-open="accordion.accordions[1]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Price</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Price Title Text</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="settings.filter_price_text"></j-opt-text-lang>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Price Input Button Text</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="settings.filter_price_apply_text"></j-opt-text-lang>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Buttons Color</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.filter_price_button"></j-opt-color>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Buttons Hover</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.filter_price_button_hover"></j-opt-color>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Buttons Size <small>Width x Height</small></span>
                        <span class="module-create-option">
                            <j-opt-text data-ng-model="settings.filter_price_button_width" class="journal-number-field"></j-opt-text> x
                            <j-opt-text data-ng-model="settings.filter_price_button_height" class="journal-number-field"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Buttons Top Offset</span>
                        <span class="module-create-option">
                            <j-opt-text data-ng-model="settings.filter_price_bar_offset" class="journal-number-field"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Buttons Radius</span>
                                    <span class="module-create-option">
                                        <j-opt-border data-ng-model="settings.filter_price_button_radius" editor="hide-style"></j-opt-border>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Price Color</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.filter_price_color"></j-opt-color>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Price Tooltip Color</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.filter_price_tip"></j-opt-color>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Price Tooltip Radius</span>
                                    <span class="module-create-option">
                                        <j-opt-border data-ng-model="settings.filter_price_tip_radius" editor="hide-style"></j-opt-border>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Bar Color</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.filter_price_bar"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Static Bar Color</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.filter_price_bar_static_color"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Bar Height</span>
                        <span class="module-create-option">
                            <j-opt-text data-ng-model="settings.filter_price_bar_height" class="journal-number-field"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Price Section Padding <small>Top - Right - Bottom - Left</small></span>
                            <span class="module-create-option">
                                <j-opt-text data-ng-model="settings.filter_price_padding_top" class="journal-sort"></j-opt-text> -
                                <j-opt-text data-ng-model="settings.filter_price_padding_right" class="journal-sort"></j-opt-text> -
                                <j-opt-text data-ng-model="settings.filter_price_padding_bottom" class="journal-sort"></j-opt-text> -
                                <j-opt-text data-ng-model="settings.filter_price_padding_left" class="journal-sort"></j-opt-text>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Price Tooltip Font</span>
                    <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.filter_price_font_tooltip"></j-opt-font>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Price Symbol Font <small>For input type</small></span>
                        <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.filter_price_font"></j-opt-font>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

            </ul>
        </accordion-group>
        <accordion-group is-open="accordion.accordions[2]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Reset</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Reset Text</span>
                            <span class="module-create-option">
                                <j-opt-text-lang data-ng-model="settings.filter_reset_text"></j-opt-text-lang>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Display As</span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.filter_reset_display">
                                <switch-option key="text">Text Only</switch-option>
                                <switch-option key="both">Icon + Text</switch-option>
                                <switch-option key="icon">Icon Only</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Top Offset</span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.reset_top_offset" class="journal-number-field" placeholder="10"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Text Color</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.reset_color"></j-opt-color>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Hover Color</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.reset_hover"></j-opt-color>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Reset Icon</span>
                                <span class="module-create-option">
                                    <j-opt-icon data-ng-model="settings.reset_icon"></j-opt-icon>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Reset Icon Hover</span>
                    <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.reset_icon_hover"></j-opt-color>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Tooltip Text Color</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.reset_tip_text"></j-opt-color>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Tooltip Background Color</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.reset_tip_bg"></j-opt-color>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Tooltip Radius</span>
                        <span class="module-create-option">
                            <j-opt-border data-ng-model="settings.filter_price_tooltip_radius" editor="hide-style"></j-opt-border>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
            </ul>
        </accordion-group>
        <accordion-group is-open="accordion.accordions[4]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Filter on Mobile</div>
            </accordion-heading>
            <li data-ng-hide="settings.filter_collapse == 'off'">
                <span class="module-create-title">Initial State Expanded<small>Turn OFF to collapse sections</small></span>
                <span class="module-create-option">
                        <switch data-ng-model="settings.filter_collapsed_state_mobile">
                            <switch-option key="expanded">ON</switch-option>
                            <switch-option key="collapsed">OFF</switch-option>
                        </switch>
                    </span>
                <a href="#" target="_blank" class="journal-tip"> </a>
            </li>
            <li>
                <span class="module-create-title">Columns on Phone<small>Displays options in 1 or 2 columns</small></span>
                <span class="module-create-option">
                            <switch data-ng-model="settings.filter_columns_mobile">
                                <switch-option key="1">1</switch-option>
                                <switch-option key="0">2</switch-option>
                            </switch>
                        </span>
                <a href="#" target="_blank" class="journal-tip"> </a>
            </li>
            <li>
                <span class="module-create-title">Icon</span>
                <span class="module-create-option">
                    <j-opt-icon data-ng-model="settings.filter_mobile_icon"></j-opt-icon>
                </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>
            <li>
                <span class="module-create-title">Text</span>
                <span class="module-create-option">
                    <j-opt-text-lang data-ng-model="settings.filter_mobile_text"></j-opt-text-lang>
                </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>
            <li>
                <span class="module-create-title">Text Font</span>
                <span class="module-create-option">
                    <j-opt-font data-ng-model="settings.filter_mobile_text_font"></j-opt-font>
                </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>
            <li>
                <span class="module-create-title">Background Color</span>
                <span class="module-create-option">
                    <j-opt-color data-ng-model="settings.filter_mobile_bg"></j-opt-color>
                </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>
            <li>
                <span class="module-create-title">Bottom Spacing</span>
                <span class="module-create-option">
                    <j-opt-text data-ng-model="settings.filter_mobile_spacing" class="journal-number-field"></j-opt-text>
                </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>
        </accordion-group>
    </accordion>
</div>
