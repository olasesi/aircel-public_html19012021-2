<div class="sticky">
<div class="module-header">
    <div class='module-name'>Modules<span>Flyout Menu</span></div>

    <skin-manager data-url="settings/moduleflyout"></skin-manager>

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
                    <span class="module-create-title">Title Bar Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.flyout_title_font"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                 <li>
                    <span class="module-create-title">Title Bar Background</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.flyout_title_bg"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Title Bar Border Settings</span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="settings.flyout_title_border"></j-opt-border>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                <span class="module-create-title">Title Line Height <small>Vertical Centering</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.flyout_title_line_height" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Menu Item Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.flyout_link_font"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Menu Item Font Hover</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.flyout_link_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Menu Item Background Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.flyout_link_bg"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Menu Item Background Hover</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.flyout_link_bg_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
<!--                <li>-->
<!--                    <span class="module-create-title">Mega Menu Container Background</span>-->
<!--                    <span class="module-create-option">-->
<!--                        <j-opt-color data-ng-model="settings.flyout_mega_container_color"></j-opt-color>-->
<!--                    </span>-->
<!--                    <a href="#" target="_blank" class="journal-tip"> </a>-->
<!--                </li>-->
                <li>
                    <span class="module-create-title">Menu Item Divider Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.flyout_divider"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Menu Item Divider Type</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.flyout_divider_type">
                            <switch-option key="solid">Solid</switch-option>
                            <switch-option key="dashed">Dashed</switch-option>
                            <switch-option key="dotted">Dotted</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Menu Item Min-Height <small>Minimum 40</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.flyout_menu_item_height" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Menu Item Left Padding </span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.flyout_menu_item_left_padding" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Sub-level Indicator Icon</span>
                    <span class="module-create-option">
                        <j-opt-icon data-ng-model="settings.flyout_link_icon"></j-opt-icon>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Sub-level Indicator Hover</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.flyout_link_icon_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <span class="module-create-title">Sub-level Indicator Offset <small>Top - Right</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.flyout_link_icon_offset_top" class="journal-sort"></j-opt-text> -
                        <j-opt-text data-ng-model="settings.flyout_link_icon_offset_right" class="journal-sort"></j-opt-text>
                    </span>
                <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
            </ul>
        </accordion-group>


        <accordion-group is-open="accordion.accordions[1]">
                    <accordion-heading>
                        <div class="accordion-bar bar-level-0">Mega Menu</div>
                    </accordion-heading>
                    <ul class="module-create-options">
                        <li>
                            <span class="module-create-title">Container Background <small>Color - Image</small></span>
                            <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.flyout_container_bg"></j-opt-color> -
                                <j-opt-background data-ng-model="settings.flyout_container_bg_image"></j-opt-background>
                    </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>

                        <li>
                            <span class="module-create-title">Container Border</span>
                            <span class="module-create-option">
                        <j-opt-border data-ng-model="settings.flyout_container_border"></j-opt-border>
                    </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>

                        <li>
                            <span class="module-create-title">Container Padding</span>
                                <span class="module-create-option">
                                    <j-opt-text data-ng-model="settings.flyout_container_padding" class="journal-number-field"></j-opt-text>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Container Shadow</span>
                                <span class="module-create-option">
                                    <switch data-ng-model="settings.flyout_container_shadow">
                                        <switch-option key="0 2px 8px -2px rgba(0, 0, 0, 0.4)">ON</switch-option>
                                        <switch-option key="none">OFF</switch-option>
                                    </switch>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>

                        <!-- Mega Menu Categories-->
                        <accordion>
                            <accordion-group is-open="false">
                                <accordion-heading>
                                    <div class="accordion-bar bar-level-1">Categories</div>
                                </accordion-heading>
                                <ul class="module-create-options">

                                    <li>
                                        <span class="module-create-title">Item Background</span>
                                            <span class="module-create-option">
                                                <j-opt-color data-ng-model="settings.flyout_categories_bg"></j-opt-color>
                                            </span>
                                        <a href="#" target="_blank" class="journal-tip"> </a>
                                    </li>
                                    <li>
                                        <span class="module-create-title">Item Border Settings</span>
                                            <span class="module-create-option">
                                                <j-opt-border data-ng-model="settings.flyout_categories_border"></j-opt-border>
                                            </span>
                                        <a href="#" target="_blank" class="journal-tip"> </a>
                                    </li>

                                    <li>
                                        <span class="module-create-title">Item Padding</span>
                                            <span class="module-create-option">
                                                <j-opt-text data-ng-model="settings.flyout_categories_padding" class="journal-number-field"></j-opt-text>
                                            </span>
                                        <a href="#" target="_blank" class="journal-tip"> </a>
                                    </li>


                                    <li>
                                        <span class="module-create-title">Link Font</span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.flyout_categories_link_font"></j-opt-font>
                                    </span>
                                        <a href="#" target="_blank" class="journal-tip"> </a>
                                    </li>
                                    <li>
                                        <span class="module-create-title">Link Hover</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.flyout_categories_link_font_hover"></j-opt-color>
                                    </span>
                                        <a href="#" target="_blank" class="journal-tip"> </a>
                                    </li>
                                    <li>
                                        <span class="module-create-title">Links Icon</span>
                                    <span class="module-create-option">
                                        <j-opt-icon data-ng-model="settings.flyout_categories_link_icon"></j-opt-icon>
                                    </span>
                                        <a href="#" target="_blank" class="journal-tip"> </a>
                                    </li>
                                    <li>
                                        <span class="module-create-title">Link Left Padding</span>
                                        <span class="module-create-option">
                                            <j-opt-text data-ng-model="settings.flyout_categories_link_padding" class="journal-number-field"></j-opt-text>
                                        </span>
                                        <a href="#" target="_blank" class="journal-tip"> </a>
                                    </li>
                                    <li>
                                        <span class="module-create-title">Link Bottom Padding</span>
                                        <span class="module-create-option">
                                            <j-opt-text data-ng-model="settings.flyout_categories_link_bottom_margin" class="journal-number-field"></j-opt-text>
                                        </span>
                                        <a href="#" target="_blank" class="journal-tip"> </a>
                                    </li>

                                    <li>
                                        <span class="module-create-title">Image Border Settings</span>
                                        <span class="module-create-option">
                                            <j-opt-border data-ng-model="settings.flyout_categories_image_border"></j-opt-border>
                                        </span>
                                        <a href="#" target="_blank" class="journal-tip"> </a>
                                    </li>

                                    <li>
                                        <span class="module-create-title">View More Font</span>
                                        <span class="module-create-option">
                                            <j-opt-font data-ng-model="settings.flyout_view_more_font"></j-opt-font>
                                        </span>
                                        <a href="#" target="_blank" class="journal-tip"> </a>
                                    </li>
                                    <li>
                                        <span class="module-create-title">View More Font Hover</span>
                                        <span class="module-create-option">
                                            <j-opt-color data-ng-model="settings.flyout_view_more_font_hover"></j-opt-color>
                                        </span>
                                        <a href="#" target="_blank" class="journal-tip"> </a>
                                    </li>

                                    <accordion>
                                        <accordion-group is-open="false">
                                            <accordion-heading>
                                                <div class="accordion-bar bar-level-2">Category Title</div>
                                            </accordion-heading>
                                            <ul class="module-create-options">

                                                <li>
                                                    <span class="module-create-title">Title Font</span>
                                                        <span class="module-create-option">
                                                            <j-opt-font data-ng-model="settings.flyout_categories_title_font"></j-opt-font>
                                                        </span>
                                                    <a href="#" target="_blank" class="journal-tip"> </a>
                                                </li>
                                                <li>
                                                    <span class="module-create-title">Title Font Hover</span>
                                                        <span class="module-create-option">
                                                            <j-opt-color data-ng-model="settings.flyout_categories_title_font_hover"></j-opt-color>
                                                        </span>
                                                    <a href="#" target="_blank" class="journal-tip"> </a>
                                                </li>
                                                <li>
                                                    <span class="module-create-title">Title Background</span>
                                                        <span class="module-create-option">
                                                            <j-opt-color data-ng-model="settings.flyout_categories_title_bg"></j-opt-color>
                                                        </span>
                                                    <a href="#" target="_blank" class="journal-tip"> </a>
                                                </li>

                                                <li>
                                                    <span class="module-create-title">Title Background Hover</span>
                                                        <span class="module-create-option">
                                                            <j-opt-color data-ng-model="settings.flyout_categories_title_bg_hover"></j-opt-color>
                                                        </span>
                                                    <a href="#" target="_blank" class="journal-tip"> </a>
                                                </li>
                                                <li>
                                                    <span class="module-create-title">Title Border Settings</span>
                                                    <span class="module-create-option">
                                                        <j-opt-border data-ng-model="settings.flyout_categories_title_border"></j-opt-border>
                                                    </span>
                                                    <a href="#" target="_blank" class="journal-tip"> </a>
                                                </li>
                                                <li>
                                                    <span class="module-create-title">Title Border Hover</span>
                                                    <span class="module-create-option">
                                                        <j-opt-color data-ng-model="settings.flyout_categories_title_border_hover"></j-opt-color>
                                                    </span>
                                                    <a href="#" target="_blank" class="journal-tip"> </a>
                                                </li>
                                                <li>
                                                    <span class="module-create-title">Title Padding <small>Top - Right - Bottom - Left</small></span>
                                                    <span class="module-create-option">
                                                        <j-opt-text data-ng-model="settings.flyout_categories_title_padding_top" class="journal-sort"></j-opt-text> -
                                                        <j-opt-text data-ng-model="settings.flyout_categories_title_padding_right" class="journal-sort"></j-opt-text> -
                                                        <j-opt-text data-ng-model="settings.flyout_categories_title_padding_bottom" class="journal-sort"></j-opt-text> -
                                                        <j-opt-text data-ng-model="settings.flyout_categories_title_padding_left" class="journal-sort"></j-opt-text>
                                                    </span>
                                                    <a href="#" target="_blank" class="journal-tip"> </a>
                                                </li>
                                                <li>
                                                    <span class="module-create-title">Title Overflow</span>
                                                    <span class="module-create-option">
                                                        <switch data-ng-model="settings.flyout_categories_title_overflow">
                                                            <switch-option key="nowrap">ON</switch-option>
                                                            <switch-option key="normal">OFF</switch-option>
                                                        </switch>
                                                    </span>
                                                    <a href="#" target="_blank" class="journal-tip"> </a>
                                                </li>

                                                <li>
                                                    <span class="module-create-title">Title Align</span>
                                                    <span class="module-create-option">
                                                        <switch data-ng-model="settings.flyout_categories_title_align">
                                                            <switch-option key="left">Left</switch-option>
                                                            <switch-option key="center">Center</switch-option>
                                                            <switch-option key="right">Right</switch-option>
                                                        </switch>
                                                    </span>
                                                    <a href="#" target="_blank" class="journal-tip"> </a>
                                                </li>

                                            </ul>
                                        </accordion-group>
                                    </accordion>

                                </ul>
                            </accordion-group>
                        </accordion>

                        <!-- Mega Menu Products-->
                        <accordion>
                            <accordion-group is-open="false">
                                <accordion-heading>
                                    <div class="accordion-bar bar-level-1">Products</div>
                                </accordion-heading>
                                <ul class="module-create-options">

                                    <li>
                                        <span class="module-create-title">Background Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.fly_menu_product_grid_item_bg"></j-opt-color>
                    </span>
                                        <a href="#" target="_blank" class="journal-tip"></a>
                                    </li>
                                    <li>
                                        <span class="module-create-title">Background Hover Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.fly_menu_product_grid_details_bg_hover"></j-opt-color>
                    </span>
                                        <a href="#" target="_blank" class="journal-tip"></a>
                                    </li>
                                    <li>
                                        <span class="module-create-title">Padding</span>
                        <span class="module-create-option">
                              <j-opt-text data-ng-model="settings.fly_menu_product_grid_item_padding" class="journal-number-field"></j-opt-text>
                        </span>
                                        <a href="#" target="_blank" class="journal-tip"></a>
                                    </li>

                                    <li>
                                        <span class="module-create-title">Border Settings</span>
                        <span class="module-create-option">
                            <j-opt-border data-ng-model="settings.fly_menu_product_grid_item_border"></j-opt-border>
                        </span>
                                        <a href="#" target="_blank" class="journal-tip"></a>
                                    </li>
                                    <li>
                                        <span class="module-create-title">Hover Border Color</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.fly_menu_product_grid_hover_border"></j-opt-color>
                        </span>
                                        <a href="#" target="_blank" class="journal-tip"></a>
                                    </li>

                                    <li>
                                        <span class="module-create-title">Product Name Font</span>
                        <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.fly_menu_product_grid_name_font"></j-opt-font>
                        </span>
                                        <a href="#" target="_blank" class="journal-tip"></a>
                                    </li>


                                    <li>
                                        <span class="module-create-title">Product Name Hover</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.fly_menu_product_grid_name_font_hover"></j-opt-color>
                        </span>
                                        <a href="#" target="_blank" class="journal-tip"></a>
                                    </li>

                                    <li>
                                        <span class="module-create-title">Price Font</span>
                        <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.fly_menu_product_grid_price_font"></j-opt-font>
                        </span>
                                        <a href="#" target="_blank" class="journal-tip"></a>
                                    </li>
                                    <li>
                                        <span class="module-create-title">Price Border Settings</span>
                        <span class="module-create-option">
                            <j-opt-border data-ng-model="settings.fly_menu_product_grid_price_border"></j-opt-border>
                        </span>
                                        <a href="#" target="_blank" class="journal-tip"></a>
                                    </li>

                                    <li>
                                        <span class="module-create-title">Add to Cart</span>
                                                    <span class="module-create-option">
                                                        <switch data-ng-model="settings.flyout_categories_title_align">
                                                            <switch-option key="left">Left</switch-option>
                                                            <switch-option key="center">Center</switch-option>
                                                            <switch-option key="right">Right</switch-option>
                                                        </switch>
                                                    </span>
                                        <a href="#" target="_blank" class="journal-tip"> </a>
                                    </li>



                                    <accordion>
                                        <accordion-group is-open="false">
                                            <accordion-heading>
                                                <div class="accordion-bar bar-level-2">Add to Cart </div>
                                            </accordion-heading>
                                            <ul class="module-create-options">

                                                <li>
                                                    <span class="module-create-title">Button Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.fly_menu_product_grid_button_font"></j-opt-font>
                    </span>
                                                    <a href="#" target="_blank" class="journal-tip"></a>
                                                </li>
                                                <li>
                                                    <span class="module-create-title">Font Hover Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.fly_menu_product_grid_button_font_hover"></j-opt-color>
                    </span>
                                                    <a href="#" target="_blank" class="journal-tip"></a>
                                                </li>


                                                <li>
                                                    <span class="module-create-title">Background Color</span>
                            <span class="module-create-option">
                                <j-opt-color data-ng-model="settings.fly_menu_product_grid_button_bg"></j-opt-color>
                            </span>
                                                    <a href="#" target="_blank" class="journal-tip"></a>
                                                </li>


                                                <li>
                                                    <span class="module-create-title">Background Hover Color</span>
                            <span class="module-create-option">
                                <j-opt-color data-ng-model="settings.fly_menu_product_grid_button_bg_hover"></j-opt-color>
                            </span>
                                                    <a href="#" target="_blank" class="journal-tip"></a>
                                                </li>

                                                <li>
                                                    <span class="module-create-title">Border Settings</span>
                            <span class="module-create-option">
                                <j-opt-border data-ng-model="settings.fly_menu_product_grid_button_border"></j-opt-border>
                            </span>
                                                    <a href="#" target="_blank" class="journal-tip"></a>
                                                </li>

                                                <li>
                                                    <span class="module-create-title">Border Hover Color</span>
                            <span class="module-create-option">
                                <j-opt-color data-ng-model="settings.fly_menu_product_grid_button_border_hover"></j-opt-color>
                            </span>
                                                    <a href="#" target="_blank" class="journal-tip"></a>
                                                </li>
                                            </ul>
                                        </accordion-group>
                                    </accordion>

                                </ul>
                            </accordion-group>
                        </accordion>

                        <!-- Mega Menu Brands-->
                        <accordion>
                            <accordion-group is-open="false">
                                <accordion-heading>
                                    <div class="accordion-bar bar-level-1">Brands</div>
                                </accordion-heading>
                                <ul class="module-create-options">
                                    <li>
                                        <span class="module-create-title">Item Background</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.fly_menu_brands_bg"></j-opt-color>
                                    </span>
                                        <a href="#" target="_blank" class="journal-tip"> </a>
                                    </li>
                                    <li>
                                        <span class="module-create-title">Item Border Settings</span>
                                    <span class="module-create-option">
                                        <j-opt-border data-ng-model="settings.fly_menu_brands_border"></j-opt-border>
                                    </span>
                                        <a href="#" target="_blank" class="journal-tip"> </a>
                                    </li>
                                    <li>
                                        <span class="module-create-title">Item Padding</span>
                                    <span class="module-create-option">
                                        <j-opt-text data-ng-model="settings.fly_menu_brands_padding" class="journal-number-field"></j-opt-text>
                                    </span>
                                        <a href="#" target="_blank" class="journal-tip"> </a>
                                    </li>

                                    <li>
                                        <span class="module-create-title">Image Border Settings</span>
                                    <span class="module-create-option">
                                        <j-opt-border data-ng-model="settings.fly_menu_brands_image_border"></j-opt-border>
                                    </span>
                                        <a href="#" target="_blank" class="journal-tip"> </a>
                                    </li>

                                    <accordion>
                                        <accordion-group is-open="false">
                                            <accordion-heading>
                                                <div class="accordion-bar bar-level-2">Brand Title</div>
                                            </accordion-heading>
                                            <ul class="module-create-options">

                                                <li>
                                                    <span class="module-create-title">Title Font</span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.fly_menu_brands_title_font"></j-opt-font>
                                    </span>
                                                    <a href="#" target="_blank" class="journal-tip"> </a>
                                                </li>
                                                <li>
                                                    <span class="module-create-title">Title Font Hover</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.fly_menu_brands_title_font_hover"></j-opt-color>
                                    </span>
                                                    <a href="#" target="_blank" class="journal-tip"> </a>
                                                </li>
                                                <li>
                                                    <span class="module-create-title">Title Background</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.fly_menu_brands_title_bg"></j-opt-color>
                                    </span>
                                                    <a href="#" target="_blank" class="journal-tip"> </a>
                                                </li>

                                                <li>
                                                    <span class="module-create-title">Title Background Hover</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.fly_menu_brands_title_bg_hover"></j-opt-color>
                                    </span>
                                                    <a href="#" target="_blank" class="journal-tip"> </a>
                                                </li>
                                                <li>
                                                    <span class="module-create-title">Title Border Settings</span>
                                                        <span class="module-create-option">
                                                            <j-opt-border data-ng-model="settings.fly_menu_brands_title_border"></j-opt-border>
                                                        </span>
                                                                        <a href="#" target="_blank" class="journal-tip"> </a>
                                                                    </li>
                                                                    <li>
                                                                        <span class="module-create-title">Title Border Hover</span>
                                                        <span class="module-create-option">
                                                            <j-opt-color data-ng-model="settings.fly_menu_brands_title_border_hover"></j-opt-color>
                                                        </span>
                                                    <a href="#" target="_blank" class="journal-tip"> </a>
                                                </li>
                                                <li>
                                                    <span class="module-create-title">Title Padding <small>Top - Right - Bottom - Left</small></span>
                                                <span class="module-create-option">
                                                    <j-opt-text data-ng-model="settings.fly_menu_brands_title_padding_top" class="journal-sort"></j-opt-text> -
                                                    <j-opt-text data-ng-model="settings.fly_menu_brands_title_padding_right" class="journal-sort"></j-opt-text> -
                                                    <j-opt-text data-ng-model="settings.fly_menu_brands_title_padding_bottom" class="journal-sort"></j-opt-text> -
                                                    <j-opt-text data-ng-model="settings.fly_menu_brands_title_padding_left" class="journal-sort"></j-opt-text>
                                                </span>
                                                    <a href="#" target="_blank" class="journal-tip"> </a>
                                                </li>
                                                <li>
                                                    <span class="module-create-title">Title Align</span>
                                                    <span class="module-create-option">
                                                        <switch data-ng-model="settings.fly_menu_brands_title_align">
                                                            <switch-option key="left">Left</switch-option>
                                                            <switch-option key="center">Center</switch-option>
                                                            <switch-option key="right">Right</switch-option>
                                                        </switch>
                                                    </span>
                                                    <a href="#" target="_blank" class="journal-tip"> </a>
                                                </li>

                                            </ul>
                                        </accordion-group>
                                    </accordion>

                                </ul>
                            </accordion-group>
                        </accordion>


                        <!-- Mega Menu HTML-->
                        <accordion>
                            <accordion-group is-open="false">
                                <accordion-heading>
                                    <div class="accordion-bar bar-level-1">HTML</div>
                                </accordion-heading>
                                <ul class="module-create-options">

                                    <li>
                                        <span class="module-create-title">Headings Font <small>H1 - H3 tags</small></span>
                                                <span class="module-create-option">
                                                    <j-opt-font data-ng-model="settings.fly_html_heading_font"></j-opt-font>
                                                </span>
                                        <a href="#" target="_blank" class="journal-tip"> </a>
                                    </li>

                                    <li>
                                        <span class="module-create-title">Block Font <small>p tag</small></span>
                                                <span class="module-create-option">
                                                    <j-opt-font data-ng-model="settings.fly_html_font"></j-opt-font>
                                                </span>
                                        <a href="#" target="_blank" class="journal-tip"> </a>
                                    </li>
                                    <li>
                                        <span class="module-create-title">Block Link Font <small>a tag</small></span>
                                                <span class="module-create-option">
                                                    <j-opt-color data-ng-model="settings.fly_html_link_font"></j-opt-color>
                                                </span>
                                        <a href="#" target="_blank" class="journal-tip"> </a>
                                    </li>
                                    <li>
                                        <span class="module-create-title">Block Link Hover<small>a tag</small></span>
                                                <span class="module-create-option">
                                                    <j-opt-color data-ng-model="settings.fly_html_link_font_hover"></j-opt-color>
                                                </span>
                                        <a href="#" target="_blank" class="journal-tip"> </a>
                                    </li>


                                    <li>
                                        <span class="module-create-title">Block Background</span>
                                                <span class="module-create-option">
                                                    <j-opt-color data-ng-model="settings.fly_html_block_bg"></j-opt-color>
                                                </span>
                                        <a href="#" target="_blank" class="journal-tip"> </a>
                                    </li>

                                    <li>
                                        <span class="module-create-title">Block Text Line Height <small>Pixels</small></span>
                                                <span class="module-create-option">
                                                    <j-opt-text data-ng-model="settings.fly_html_block_line_height" class="journal-number-field"></j-opt-text>
                                                </span>
                                        <a href="#" target="_blank" class="journal-tip"> </a>
                                    </li>

                                    <li>
                                        <span class="module-create-title">Headings Spacing <small>Padding Bottom</small></span>
                                                <span class="module-create-option">
                                                    <j-opt-text data-ng-model="settings.fly_html_heading_padding" class="journal-number-field"></j-opt-text>
                                                </span>
                                        <a href="#" target="_blank" class="journal-tip"> </a>
                                    </li>

                                    <li>
                                        <span class="module-create-title">Content Padding <small>Top - Right - Bottom - Left</small></span>
                                                <span class="module-create-option">
                                                    <j-opt-text data-ng-model="settings.fly_html_padding_top" class="journal-sort"></j-opt-text> -
                                                    <j-opt-text data-ng-model="settings.fly_html_padding_right" class="journal-sort"></j-opt-text> -
                                                    <j-opt-text data-ng-model="settings.fly_html_padding_bottom" class="journal-sort"></j-opt-text> -
                                                    <j-opt-text data-ng-model="settings.fly_html_padding_left" class="journal-sort"></j-opt-text>
                                                </span>
                                        <a href="#" target="_blank" class="journal-tip"> </a>
                                    </li>

                                </ul>
                            </accordion-group>
                        </accordion>

                        <!--Section Titles-->
                        <accordion>
                            <accordion-group is-open="false">
                                <accordion-heading>
                                    <div class="accordion-bar bar-level-1">Section Titles <span> (Brands / HTML)</span></div>
                                </accordion-heading>
                                <ul class="module-create-options">

                                    <li>
                                        <span class="module-create-title">Title Font</span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.fly_menu_html_title_font"></j-opt-font>
                                    </span>
                                        <a href="#" target="_blank" class="journal-tip"> </a>
                                    </li>
                                    <li>
                                        <span class="module-create-title">Title Background</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.fly_menu_html_title_bg"></j-opt-color>
                                    </span>
                                        <a href="#" target="_blank" class="journal-tip"> </a>
                                    </li>

                                    <li>
                                        <span class="module-create-title">Title Border Settings</span>
                                    <span class="module-create-option">
                                        <j-opt-border data-ng-model="settings.fly_menu_html_title_border"></j-opt-border>
                                    </span>
                                        <a href="#" target="_blank" class="journal-tip"> </a>
                                    </li>
                                    <li>
                                        <span class="module-create-title">Title Padding <small>Top - Right - Bottom - Left</small></span>
                                    <span class="module-create-option">
                                        <j-opt-text data-ng-model="settings.fly_menu_html_title_padding_top" class="journal-sort"></j-opt-text> -
                                        <j-opt-text data-ng-model="settings.fly_menu_html_title_padding_right" class="journal-sort"></j-opt-text> -
                                        <j-opt-text data-ng-model="settings.fly_menu_html_title_padding_bottom" class="journal-sort"></j-opt-text> -
                                        <j-opt-text data-ng-model="settings.fly_menu_html_title_padding_left" class="journal-sort"></j-opt-text>
                                    </span>
                                        <a href="#" target="_blank" class="journal-tip"> </a>
                                    </li>
                                    <li>
                                        <span class="module-create-title">Title Align</span>
                                        <span class="module-create-option">
                                            <switch data-ng-model="settings.fly_menu_html_title_align">
                                                <switch-option key="left">Left</switch-option>
                                                <switch-option key="center">Center</switch-option>
                                                <switch-option key="right">Right</switch-option>
                                            </switch>
                                        </span>
                                        <a href="#" target="_blank" class="journal-tip"> </a>
                                    </li>

                                </ul>
                            </accordion-group>
                        </accordion>

                    </ul>
                </accordion-group>
        <!-- Dropdown Menu -->
            <accordion-group is-open="accordion.accordions[2]">
                <accordion-heading>
                    <div class="accordion-bar bar-level-0">Multi-Level / Custom</div>
                </accordion-heading>
                <ul class="module-create-options">

                    <li>
                        <span class="module-create-title">Font</span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.fly_dropdown_font"></j-opt-font>
                                    </span>
                        <a href="#" target="_blank" class="journal-tip"> </a>
                    </li>

                    <li>
                        <span class="module-create-title">Font Hover</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.fly_dropdown_font_hover"></j-opt-color>
                                    </span>
                        <a href="#" target="_blank" class="journal-tip"> </a>
                    </li>

                    <li>
                        <span class="module-create-title">Background Color</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.fly_dropdown_bg"></j-opt-color>
                                    </span>
                        <a href="#" target="_blank" class="journal-tip"> </a>
                    </li>

                    <li>
                        <span class="module-create-title">Background Hover</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.fly_dropdown_bg_hover"></j-opt-color>
                                    </span>
                        <a href="#" target="_blank" class="journal-tip"> </a>
                    </li>
                    <li>
                        <span class="module-create-title">Sub-level Indicator Icon</span>
                                    <span class="module-create-option">
                                        <j-opt-icon data-ng-model="settings.fly_dropdown_icon"></j-opt-icon>
                                    </span>
                        <a href="#" target="_blank" class="journal-tip"> </a>
                    </li>
                    <li>
                        <span class="module-create-title">Sub Level Icon Hover</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.fly_dropdown_icon_hover"></j-opt-color>
                                    </span>
                        <a href="#" target="_blank" class="journal-tip"> </a>
                    </li>

                    <li>
                        <span class="module-create-title">Divider Color</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.fly_dropdown_divider"></j-opt-color>
                                    </span>
                        <a href="#" target="_blank" class="journal-tip"> </a>
                    </li>
                    <li>
                        <span class="module-create-title">Divider Type</span>
                                    <span class="module-create-option">
                                        <switch data-ng-model="settings.fly_dropdown_divider_type">
                                            <switch-option key="solid">Solid</switch-option>
                                            <switch-option key="dashed">Dashed</switch-option>
                                            <switch-option key="dotted">Dotted</switch-option>
                                        </switch>
                                    </span>
                        <a href="#" target="_blank" class="journal-tip"> </a>
                    </li>
                    <li>
                        <span class="module-create-title">Dropdown Shadow</span>
                                    <span class="module-create-option">
                                        <switch data-ng-model="settings.fly_dropdown_shadow">
                                            <switch-option key="0 1px 8px -3px rgba(0, 0, 0, 0.5)">ON</switch-option>
                                            <switch-option key="none">OFF</switch-option>
                                        </switch>
                                    </span>
                        <a href="#" target="_blank" class="journal-tip"> </a>
                    </li>
                </ul>
            </accordion-group>

</accordion>
</div>
