<div class="sticky">
<div class="module-header">
    <div class='module-name'>Settings<span>Product List</span></div>

    <skin-manager data-url="settings/productlist"></skin-manager>

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
    <!-- general -->
        <accordion-group is-open="accordion.accordions[0]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Product List</div>
            </accordion-heading>
            <ul class="module-create-options">
            <!-- Product List General-->
                <li>
                    <span class="module-create-title">Background Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.product_list_item_bg"></j-opt-color>
                    </span>
                <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Border Settings</span>
                        <span class="module-create-option">
                            <j-opt-border data-ng-model="settings.product_list_item_border"></j-opt-border>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Shadow</span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.product_list_shadow">
                                <switch-option key="hover">Hover</switch-option>
                                <switch-option key="always">Always</switch-option>
                                <switch-option key="never">Never</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
            </ul>
        </accordion-group>
        <!--Product Image-->
        <accordion-group is-open="accordion.accordions[1]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Product Image</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Second Image on Hover</span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.product_list_second_image">
                                <switch-option key="1">ON</switch-option>
                                <switch-option key="0">OFF</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Image Border Settings</span>
                        <span class="module-create-option">
                            <j-opt-border data-ng-model="settings.product_list_image_border"></j-opt-border>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Hover Overlay Color</span>
                        <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.product_list_image_overlay"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Hover Overlay Opacity</span>
                        <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.product_list_image_overlay_opacity" class="journal-number-field"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Show Rating Stars</span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.product_list_show_ratings">
                                <switch-option key="block">ON</switch-option>
                                <switch-option key="none">OFF</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
            </ul>
        </accordion-group>
        <!--Product Labels-->
        <accordion-group is-open="accordion.accordions[2]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Product Labels</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Latest Label</span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.product_list_latest_label_status">
                                <switch-option key="block">ON</switch-option>
                                <switch-option key="none">OFF</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Special Label</span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.product_list_special_label_status">
                                <switch-option key="block">ON</switch-option>
                                <switch-option key="none">OFF</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Out of Stock</span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.product_list_outofstock_label_status">
                                <switch-option key="block">ON</switch-option>
                                <switch-option key="none">OFF</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

            </ul>
        </accordion-group>
        <!--Product Details-->
        <accordion-group is-open="accordion.accordions[3]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Product Details</div>
            </accordion-heading>

            <ul class="module-create-options">

                <li>
                    <span class="module-create-title">Product Name Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.product_list_name_font"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Product Name Hover</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.product_list_name_font_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Underline Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.product_list_name_underline"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Product Price Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.product_list_price_font"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Old Price</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.product_list_old_price_font"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Description Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.product_list_description_font"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
            </ul>
        </accordion-group>
        <!--Quickview Button-->
        <accordion-group is-open="accordion.accordions[5]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Quickview Button</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Display</span>
                            <span class="module-create-option">
                                <switch data-ng-model="settings.product_list_quickview_status">
                                    <switch-option key="hover">Hover</switch-option>
                                    <switch-option key="always">Always</switch-option>
                                    <switch-option key="never">Never</switch-option>
                                </switch>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li data-ng-hide="settings.product_list_quickview_status == 'never'">
                    <span class="module-create-title">Offset <small>X / Y</small> </span>
                            <span class="module-create-option">
                                <j-opt-text data-ng-model="settings.product_list_quickview_offset_x" class="journal-number-field"></j-opt-text> x
                                <j-opt-text data-ng-model="settings.product_list_quickview_offset_y" class="journal-number-field"></j-opt-text>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li data-ng-hide="settings.product_list_quickview_status == 'never'">
                    <span class="module-create-title">Button Font</span>
                        <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.product_list_quickview_button_font"></j-opt-font>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li data-ng-hide="settings.product_list_quickview_status == 'never'">
                    <span class="module-create-title">Font Hover Color</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.product_list_quickview_button_font_hover"></j-opt-color>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>


                <li data-ng-hide="settings.product_list_quickview_status == 'never'">
                    <span class="module-create-title">Background Color</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.product_list_quickview_button_bg"></j-opt-color>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>


                <li data-ng-hide="settings.product_list_quickview_status == 'never'">
                    <span class="module-create-title">Background Hover Color</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.product_list_quickview_button_bg_hover"></j-opt-color>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li data-ng-hide="settings.product_list_quickview_status == 'never'">
                    <span class="module-create-title">Border Settings</span>
                                <span class="module-create-option">
                                    <j-opt-border data-ng-model="settings.product_list_quickview_button_border"></j-opt-border>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li data-ng-hide="settings.product_list_quickview_status == 'never'">
                    <span class="module-create-title">Border Hover Color</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.product_list_quickview_button_border_hover"></j-opt-color>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li data-ng-show="settings.product_list_quickview_button_icon_display == 'icon'">
                    <span class="module-create-title">Button Width <small>Pixel Width</small></span>
                        <span class="module-create-option">
                            <j-opt-text data-ng-model="settings.product_list_quickview_button_width_px" class="journal-number-field"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li data-ng-show="settings.product_list_quickview_button_icon_display == 'icon'">
                    <span class="module-create-title">Button Height <small>Pixel Height</small></span>
                        <span class="module-create-option">
                            <j-opt-text data-ng-model="settings.product_list_quickview_button_height_px" class="journal-number-field"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li data-ng-hide="settings.product_list_quickview_status == 'never' || settings.product_list_quickview_button_icon_display == 'icon'">
                    <span class="module-create-title">Button Width <small>Padding Left/Right</small></span>
                            <span class="module-create-option">
                                <j-opt-text data-ng-model="settings.product_list_quickview_button_width" class="journal-number-field"></j-opt-text>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li data-ng-hide="settings.product_list_quickview_status == 'never' || settings.product_list_quickview_button_icon_display == 'icon'">
                    <span class="module-create-title">Button Height <small>Line Height</small></span>
                            <span class="module-create-option">
                                <j-opt-text data-ng-model="settings.product_list_quickview_button_height" class="journal-number-field"></j-opt-text>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li data-ng-hide="settings.product_list_quickview_status == 'never'">
                    <span class="module-create-title">Inner Shadow <small>Push Effect</small></span>
                            <span class="module-create-option">
                                <switch data-ng-model="settings.product_list_quickview_button_active_shadow">
                                    <switch-option key="inset 0 1px 10px rgba(0, 0, 0, 0.8)">ON</switch-option>
                                    <switch-option key="none">OFF</switch-option>
                                </switch>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li data-ng-hide="settings.product_list_quickview_status == 'never'">
                    <span class="module-create-title">Display</span>
                            <span class="module-create-option">
                                <switch data-ng-model="settings.product_list_quickview_button_icon_display">
                                    <switch-option key="text">Text Only</switch-option>
                                    <switch-option key="both">Icon + Text</switch-option>
                                    <switch-option key="icon">Icon Only</switch-option>
                                </switch>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li data-ng-hide="settings.product_list_quickview_status == 'never' || settings.product_list_quickview_button_icon_display == 'text'">
                    <span class="module-create-title">Button Icon</span>
                        <span class="module-create-option">
                            <j-opt-icon data-ng-model="settings.product_list_quickview_button_icon"></j-opt-icon>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li data-ng-hide="settings.product_list_quickview_status == 'never' || settings.product_list_quickview_button_icon_display == 'text'">
                    <span class="module-create-title">Icon Position</span>
                            <span class="module-create-option">
                                <switch data-ng-model="settings.product_list_quickview_button_icon_position">
                                    <switch-option key="left">Left</switch-option>
                                    <switch-option key="right">Right</switch-option>
                                </switch>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li data-ng-hide="settings.product_list_quickview_status == 'never' || settings.product_list_quickview_button_icon_display == 'text' || settings.product_list_quickview_button_icon_display == 'both'">
                    <span class="module-create-title">Tooltip Font Color</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.product_list_quickview_button_tooltip_font"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li data-ng-hide="settings.product_list_quickview_status == 'never' || settings.product_list_quickview_button_icon_display == 'text' || settings.product_list_quickview_button_icon_display == 'both'">
                    <span class="module-create-title">Tooltip Background Color</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.product_list_quickview_button_tooltip_bg_color"></j-opt-color>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li data-ng-hide="settings.product_list_quickview_status == 'never' || settings.product_list_quickview_button_icon_display == 'text' || settings.product_list_quickview_button_icon_display == 'both'">
                    <span class="module-create-title">Tooltip Border Radius</span>
                                <span class="module-create-option">
                                    <j-opt-border data-ng-model="settings.product_list_quickview_button_tooltip_border" editor="hide-style"></j-opt-border>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

            </ul>
        </accordion-group>
    <!--Button Override-->
    <accordion-group is-open="accordion.accordions[4]">
        <accordion-heading>
            <div class="accordion-bar bar-level-0">Add to Cart Button</div>
        </accordion-heading>
        <ul class="module-create-options">

            <li>
                <span class="module-create-title">Button Font</span>
                        <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.product_list_button_font"></j-opt-font>
                        </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>
            <li>
                <span class="module-create-title">Font Hover Color</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.product_list_button_font_hover"></j-opt-color>
                                </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>


            <li>
                <span class="module-create-title">Background <small>Color - Image</small></span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.product_list_button_bg"></j-opt-color> -
                                    <j-opt-background data-ng-model="settings.product_list_button_bg_image"></j-opt-background>
                                </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>


            <li>
                <span class="module-create-title">Background Hover <small>Color - Image</small></span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.product_list_button_bg_hover"></j-opt-color> -
                                    <j-opt-background data-ng-model="settings.product_list_button_bg_image_hover"></j-opt-background>
                                </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>

            <li>
                <span class="module-create-title">Border Settings</span>
                                <span class="module-create-option">
                                    <j-opt-border data-ng-model="settings.product_list_button_border"></j-opt-border>
                                </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>

            <li>
                <span class="module-create-title">Border Hover Color</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.product_list_button_border_hover"></j-opt-color>
                                </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>

            <li data-ng-show="settings.product_list_button_icon_display == 'icon'">
                <span class="module-create-title">Button Width <small>Pixel Width</small></span>
                        <span class="module-create-option">
                            <j-opt-text data-ng-model="settings.product_list_button_width_px" class="journal-number-field"></j-opt-text>
                        </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>

            <li data-ng-show="settings.product_list_button_icon_display == 'icon'">
                <span class="module-create-title">Button Height <small>Pixel Height</small></span>
                        <span class="module-create-option">
                            <j-opt-text data-ng-model="settings.product_list_button_height_px" class="journal-number-field"></j-opt-text>
                        </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>

            <li data-ng-hide="settings.product_list_button_icon_display == 'icon'">
                <span class="module-create-title">Button Width <small>Padding Left/Right</small></span>
                            <span class="module-create-option">
                                <j-opt-text data-ng-model="settings.product_list_button_width" class="journal-number-field"></j-opt-text>
                            </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>

            <li data-ng-hide="settings.product_list_button_icon_display == 'icon'">
                <span class="module-create-title">Button Height <small>Line Height</small></span>
                            <span class="module-create-option">
                                <j-opt-text data-ng-model="settings.product_list_button_height" class="journal-number-field"></j-opt-text>
                            </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>

            <li>
                <span class="module-create-title">Inner Shadow <small>Push Effect</small></span>
                            <span class="module-create-option">
                                <switch data-ng-model="settings.product_list_button_active_shadow">
                                    <switch-option key="inset 0 1px 10px rgba(0, 0, 0, 0.8)">ON</switch-option>
                                    <switch-option key="none">OFF</switch-option>
                                </switch>
                            </span>
                <a href="#" target="_blank" class="journal-tip"> </a>
            </li>

            <li>
                <span class="module-create-title">Display</span>
                            <span class="module-create-option">
                                <switch data-ng-model="settings.product_list_button_icon_display">
                                    <switch-option key="text">Text Only</switch-option>
                                    <switch-option key="both">Icon + Text</switch-option>
                                    <switch-option key="icon">Icon Only</switch-option>
                                </switch>
                            </span>
                <a href="#" target="_blank" class="journal-tip"> </a>
            </li>

            <li data-ng-hide="settings.product_list_button_icon_display == 'text'">
                <span class="module-create-title">Button Icon</span>
                        <span class="module-create-option">
                            <j-opt-icon data-ng-model="settings.product_list_button_icon"></j-opt-icon>
                        </span>
                <a href="#" target="_blank" class="journal-tip"> </a>
            </li>

            <li data-ng-hide="settings.product_list_button_icon_display == 'text'">
                <span class="module-create-title">Icon Hover Color</span>
                <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.product_list_button_icon_hover"></j-opt-color>
                    </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>

            <li data-ng-hide="settings.product_list_button_icon_display == 'text'">
                <span class="module-create-title">Icon Position</span>
                            <span class="module-create-option">
                                <switch data-ng-model="settings.product_list_button_icon_position">
                                    <switch-option key="left">Left</switch-option>
                                    <switch-option key="right">Right</switch-option>
                                </switch>
                            </span>
                <a href="#" target="_blank" class="journal-tip"> </a>
            </li>

            <li data-ng-hide="settings.product_list_button_icon_display == 'text' || settings.product_list_button_icon_display == 'both'">
                <span class="module-create-title">Tooltip Font Color</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.product_list_button_tooltip_font"></j-opt-color>
                        </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>
            <li data-ng-hide="settings.product_list_button_icon_display == 'text' || settings.product_list_button_icon_display == 'both'">
                <span class="module-create-title">Tooltip Background Color</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.product_list_button_tooltip_bg_color"></j-opt-color>
                                </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>

            <li data-ng-hide="settings.product_list_button_icon_display == 'text' || settings.product_list_button_icon_display == 'both'">
                <span class="module-create-title">Tooltip Border Radius</span>
                                <span class="module-create-option">
                                    <j-opt-border data-ng-model="settings.product_list_button_tooltip_border" editor="hide-style"></j-opt-border>
                                </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>
            <li>
                <span class="module-create-title">Button Shadow</span>
                <span class="module-create-option">
                                <j-opt-shadow data-ng-model="settings.pl_button_shadow" data-bgcolor="true"></j-opt-shadow>
                                </span>
                <a href="#" target="_blank" class="journal-tip"> </a>
            </li>
            <li>
                <span class="module-create-title">Shadow Hover</span>
                <span class="module-create-option">
                                <j-opt-shadow data-ng-model="settings.pl_button_shadow_hover" data-bgcolor="true"></j-opt-shadow>
                                </span>
                <a href="#" target="_blank" class="journal-tip"> </a>
            </li>
            <li>
                <span class="module-create-title">Shadow Active <small>Push Effect</small></span>
                <span class="module-create-option">
                                <j-opt-shadow data-ng-model="settings.pl_button_shadow_active" data-bgcolor="true"></j-opt-shadow>
                                </span>
                <a href="#" target="_blank" class="journal-tip"> </a>
            </li>

        </ul>
    </accordion-group>

    <!--Wishlist / Compare-->
        <accordion-group is-open="accordion.accordions[6]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Wishlist / Compare</div>
            </accordion-heading>
            <ul class="module-create-options">

                <li>
                    <span class="module-create-title">Font</span>
                        <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.product_list_wishlist_font"></j-opt-font>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Font Hover Color</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.product_list_wishlist_font_hover"></j-opt-color>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Wishlist Icon</span>
                        <span class="module-create-option">
                            <j-opt-icon data-ng-model="settings.product_list_wishlist_icon"></j-opt-icon>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Compare Icon</span>
                        <span class="module-create-option">
                            <j-opt-icon data-ng-model="settings.product_list_compare_icon"></j-opt-icon>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Wishlist Icon Hover</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.product_list_wishlist_icon_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Compare Icon Hover</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.product_list_compare_icon_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>


            </ul>
        </accordion-group>
    </accordion>
</div>
