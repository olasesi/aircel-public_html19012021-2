<div class="sticky">
<div class="module-header">
    <div class='module-name'>Modules<span>Carousel</span></div>

    <skin-manager data-url="settings/modulecarousel"></skin-manager>

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
                        <j-opt-font data-ng-model="settings.carousel_title_font"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                 <li>
                    <span class="module-create-title">Title Bar Background</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.carousel_title_bg"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Title Bar Border Settings</span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="settings.carousel_title_border"></j-opt-border>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Active Tab Font Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.carousel_title_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Active Tab Background</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.carousel_title_bg_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Title Bar Height</span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.carousel_title_line_height" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Divider Color <small>Tabbed Carousels</small></span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.carousel_title_divider"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Divider Type <small>Tabbed Carousels</small></span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.carousel_title_divider_type">
                            <switch-option key="solid">Solid</switch-option>
                            <switch-option key="dashed">Dashed</switch-option>
                            <switch-option key="dotted">Dotted</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Side Column Title Bottom Margin</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.carousel_title_side_margin">
                            <switch-option key="on">ON</switch-option>
                            <switch-option key="off">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
            </ul>
        </accordion-group>
        <accordion-group is-open="accordion.accordions[1]">
                    <accordion-heading>
                        <div class="accordion-bar bar-level-0">Arrows Top</div>
                    </accordion-heading>
                    <ul class="module-create-options">
                        <li>
                            <span class="module-create-title">Left Arrow</span>
                    <span class="module-create-option">
                        <j-opt-icon data-ng-model="settings.carousel_left_icon"></j-opt-icon>
                    </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Right Arrow</span>
                    <span class="module-create-option">
                        <j-opt-icon data-ng-model="settings.carousel_right_icon"></j-opt-icon>
                    </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Arrows Hover</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.carousel_icon_hover"></j-opt-color>
                    </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Arrows Background</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.carousel_icon_bg"></j-opt-color>
                    </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Arrows Background Hover</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.carousel_icon_bg_hover"></j-opt-color>
                    </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Arrows Border Settings</span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="settings.carousel_icon_border"></j-opt-border>
                    </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Buttons Size <small>Width x Height</small></span>
                                <span class="module-create-option">
                                    <j-opt-text data-ng-model="settings.carousel_icon_width" class="journal-number-field" placeholder="40"></j-opt-text> x
                                    <j-opt-text data-ng-model="settings.carousel_icon_height" class="journal-number-field" placeholder="40"></j-opt-text>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Vertical Offset <small>Main Content - Side Column</small></span>
                                <span class="module-create-option">
                                    <j-opt-text data-ng-model="settings.carousel_icon_offset_top" class="journal-number-field" placeholder="-60"></j-opt-text> -
                                    <j-opt-text data-ng-model="settings.carousel_icon_offset_top_column" class="journal-number-field" placeholder="-60"></j-opt-text>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Horizontal Offset <small>Prev Button - Next Button</small></span>
                                <span class="module-create-option">
                                    <j-opt-text data-ng-model="settings.carousel_icon_offset_left" class="journal-number-field" placeholder="25"></j-opt-text> -
                                    <j-opt-text data-ng-model="settings.carousel_icon_offset_right" class="journal-number-field" placeholder="-5"></j-opt-text>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>

                    </ul>
                </accordion-group>
        <accordion-group is-open="accordion.accordions[2]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Arrows Sides</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Left Arrow</span>
                    <span class="module-create-option">
                        <j-opt-icon data-ng-model="settings.carousel_side_left_icon"></j-opt-icon>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Right Arrow</span>
                    <span class="module-create-option">
                        <j-opt-icon data-ng-model="settings.carousel_side_right_icon"></j-opt-icon>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Arrows Hover</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.carousel_side_icon_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Buttons Background</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.carousel_side_icon_bg"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Buttons Background Hover</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.carousel_side_icon_bg_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Buttons Border Settings</span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="settings.carousel_side_icon_border"></j-opt-border>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Buttons Size <small>Width x Height</small></span>
                                <span class="module-create-option">
                                    <j-opt-text data-ng-model="settings.carousel_side_icon_width" class="journal-number-field" placeholder="40"></j-opt-text> x
                                    <j-opt-text data-ng-model="settings.carousel_side_icon_height" class="journal-number-field" placeholder="40"></j-opt-text>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Vertical Offset</span>
                                <span class="module-create-option">
                                    <j-opt-text data-ng-model="settings.carousel_side_icon_offset_top" class="journal-number-field" placeholder="0"></j-opt-text>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Horizontal Offset <small>Prev Button - Next Button</small></span>
                                <span class="module-create-option">
                                    <j-opt-text data-ng-model="settings.carousel_side_icon_offset_left" class="journal-number-field" placeholder="0"></j-opt-text> -
                                    <j-opt-text data-ng-model="settings.carousel_side_icon_offset_right" class="journal-number-field" placeholder="0"></j-opt-text>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
            </ul>
        </accordion-group>
        <accordion-group is-open="accordion.accordions[3]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Bullets</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Bullets Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.carousel_bullet_color"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Bullets Hover</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.carousel_bullet_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Border</span>
                        <span class="module-create-option">
                            <j-opt-border data-ng-model="settings.carousel_bullet_border"></j-opt-border>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Border Hover Color</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.carousel_bullet_border_hover"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Margin</span>
                        <span class="module-create-option">
                            <j-opt-text data-ng-model="settings.carousel_bullet_margin" class="journal-number-field" placeholder="4"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li data-ng-hide="settings.product_grid_quickview_status == 'never'">
                    <span class="module-create-title">Size <small>Width / Height</small> </span>
                        <span class="module-create-option">
                            <j-opt-text data-ng-model="settings.carousel_bullet_width" class="journal-number-field" placeholder="10"></j-opt-text> x
                            <j-opt-text data-ng-model="settings.carousel_bullet_height" class="journal-number-field" placeholder="10"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Scale <small>Hover / Active</small></span>
                        <span class="module-create-option">
                            <j-opt-text data-ng-model="settings.carousel_bullet_scale" class="journal-number-field" placeholder="1.2"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
            </ul>
        </accordion-group>
        <accordion-group is-open="accordion.accordions[4]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Product Grid</div>
            </accordion-heading>
            <ul class="module-create-options">
                <!-- Product Grid General-->
                <li>
                    <span class="module-create-title">Background Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.carousel_product_grid_item_bg"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Background Hover Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.carousel_product_grid_details_bg_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Padding</span>
                        <span class="module-create-option">
                              <j-opt-text data-ng-model="settings.carousel_product_grid_item_padding" class="journal-number-field"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Border Settings</span>
                        <span class="module-create-option">
                            <j-opt-border data-ng-model="settings.carousel_product_grid_item_border"></j-opt-border>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Hover Border Color</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.carousel_product_grid_hover_border"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Shadow</span>
                    <span class="module-create-option">
                            <switch data-ng-model="settings.carousel_product_grid_box_shadow">
                                <switch-option key="inherit">Inherit</switch-option>
                                <switch-option key="none">None</switch-option>
                                <switch-option key="custom">Custom</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li data-ng-show="settings.carousel_product_grid_box_shadow === 'custom'">
                    <span class="module-create-title">Custom Shadow</span>
                    <span class="module-create-option">
                            <j-opt-shadow data-ng-model="settings.carousel_product_grid_shadow_custom"></j-opt-shadow>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li data-ng-hide="settings.carousel_product_grid_box_shadow === 'none' || settings.carousel_product_grid_box_shadow === 'inherit'">
                    <span class="module-create-title">Shadow Behavior</span>
                    <span class="module-create-option">
                            <switch data-ng-model="settings.carousel_product_grid_shadow_2">
                                <switch-option key="hover">Hover</switch-option>
                                <switch-option key="always">Always &nbsp; &nbsp;</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Container Mask Adjust <small>If Shadow Active - Shadow blur should not exceed 15px on carousel items.</small></span>
                        <span class="module-create-option">
                                <j-opt-text data-ng-model="settings.carousel_shadow_mask" class="journal-number-field"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
            </ul>
        </accordion-group>
        <accordion-group is-open="accordion.accordions[5]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Product Grid - Brands</div>
            </accordion-heading>
            <ul class="module-create-options">
                <!-- Product Grid General-->
                <li>
                    <span class="module-create-title">Background Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.carousel_brand_product_grid_item_bg"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Background Hover Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.carousel_brand_product_grid_details_bg_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Padding</span>
                        <span class="module-create-option">
                              <j-opt-text data-ng-model="settings.carousel_brand_product_grid_item_padding" class="journal-number-field"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Border Settings</span>
                        <span class="module-create-option">
                            <j-opt-border data-ng-model="settings.carousel_brand_product_grid_item_border"></j-opt-border>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Hover Border Color</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.carousel_brand_product_grid_hover_border"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Brand Name Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.carousel_brand_product_grid_name_font"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Brand Name Hover</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.carousel_brand_product_grid_name_font_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

            </ul>
        </accordion-group>
    </accordion>
</div>
