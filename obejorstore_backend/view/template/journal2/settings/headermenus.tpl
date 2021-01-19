<div class="sticky">
    <div class="module-header">
        <div class='module-name'>Header<span>Menus</span></div>

        <skin-manager data-url="settings/headermenus"></skin-manager>

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

<div class="module-body header">
    <div class="accordion-bar bar-level-0 bar-expand" >
        <a data-ng-click="toggleAccordion(true)" class="hint--top" data-hint="Expand All"><i class="expand-icon"></i></a>  <a data-ng-click="toggleAccordion(false)" class="hint--top" data-hint="Collapse All"><i class="collapse-icon"></i></a>
        <label class="close-others hint--top" data-hint="Close Others"><input type="checkbox" data-ng-model="accordion.close_others" /></label>
    </div>
    <accordion id="main-accordion" close-others="accordion.close_others">
        <!--Top Menu-->
        <accordion-group is-open="accordion.accordions[0]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Top Menu</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Link Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.top_menu_link_font"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Link Hover Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.top_menu_link_hover_color"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Static Text Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.top_menu_text_font"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Border Color <small>Classic / Slim Headers</small></span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.top_menu_border_color"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Background Color <small>Classic / Slim Headers</small></span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.top_menu_bg_color"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Background Hover <small>Classic / Slim Headers</small></span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.top_menu_link_hover_bg_color"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Bottom Border <small>Classic / Slim Headers</small></span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.top_menu_border_bottom">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Inline Icons <small>OFF will displays the icon on top of the menu text</small></span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.top_menu_icons_display">
                            <switch-option key="inline">ON</switch-option>
                            <switch-option key="block">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Enable on Phone</span>
                    <span class="module-create-option">
                            <switch data-ng-model="settings.hide_menus_on_phone">
                                <switch-option key="on">ON</switch-option>
                                <switch-option key="off">OFF</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li data-ng-hide="settings.hide_menus_on_phone === 'off'">
                    <span class="module-create-title">Phone Display <small>Bottom will displays as a sticky bottom bar on phones - Icons only.</small></span>
                    <span class="module-create-option">
                            <switch data-ng-model="settings.sticky_bottom_bar">
                                <switch-option key="top">Top</switch-option>
                                <switch-option key="bottom">Bottom &nbsp; &nbsp;</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li data-ng-hide="settings.hide_menus_on_phone === 'off' || settings.sticky_bottom_bar === 'top'">
                    <span class="module-create-title">Icon Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.bottom_bar_color"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li data-ng-hide="settings.hide_menus_on_phone === 'off' || settings.sticky_bottom_bar === 'top'">
                    <span class="module-create-title">Border Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.bottom_bar_border_color"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li data-ng-hide="settings.hide_menus_on_phone === 'off' || settings.sticky_bottom_bar === 'top'">
                    <span class="module-create-title">Background Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.bottom_bar_bg_color"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
            </ul>
        </accordion-group>
        <!--Secondary Menu-->
        <accordion-group is-open="accordion.accordions[2]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Secondary Menu</div>
            </accordion-heading>
            <ul class="module-create-options">

                <li>
                    <span class="module-create-title">Link Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.secondary_menu_link_font"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Link Hover</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.secondary_menu_link_hover_color"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Static Text Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.secondary_menu_text_font"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Background Color <small>Classic / Slim Header</small></span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.secondary_menu_bg_color"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Mobile Background Color <small>Classic / Slim Header</small></span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.secondary_menu_bg_color_mobile"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Enable on Phone</span>
                    <span class="module-create-option">
                            <switch data-ng-model="settings.hide_secondary_on_phone">
                                <switch-option key="on">ON</switch-option>
                                <switch-option key="off">OFF</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

            </ul>
        </accordion-group>
        <!--  Top Menus Dropdowns-->
        <accordion-group is-open="accordion.accordions[1]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Top Menus Dropdown</div>
            </accordion-heading>
            <li>
                <span class="module-create-title">Border Color</span>
                <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.top_menus_dropdown_border_color"></j-opt-color>
                        </span>
                <a href="#" target="_blank" class="journal-tip"> </a>
            </li>
            <li>
                <span class="module-create-title">Font</span>
                <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.top_menus_dropdown_font"></j-opt-font> &nbsp;&nbsp;Hover &nbsp;
                            <j-opt-color data-ng-model="settings.top_menus_dropdown_font_hover"></j-opt-color>
                        </span>
                <a href="#" target="_blank" class="journal-tip"> </a>
            </li>
            <li>
                <span class="module-create-title">Background Color</span>
                <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.top_menus_dropdown_bg_color"></j-opt-color> &nbsp;&nbsp;Hover &nbsp;
                            <j-opt-color data-ng-model="settings.top_menus_dropdown_bg_color_hover"></j-opt-color>
                        </span>
                <a href="#" target="_blank" class="journal-tip"> </a>
            </li>
            <li>
                <span class="module-create-title">Triangle Color</span>
                <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.top_menus_triangle_color"></j-opt-color> &nbsp;&nbsp;Hover &nbsp;
                            <j-opt-color data-ng-model="settings.top_menus_triangle_color_hover"></j-opt-color>
                        </span>
                <a href="#" target="_blank" class="journal-tip"> </a>
            </li>
            <li>
                <span class="module-create-title">Item Height</span>
                <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.top_menus_height" class="journal-number-field"></j-opt-text>
                        </span>
                <a href="#" target="_blank" class="journal-tip"> </a>
            </li>
            <li>
                <span class="module-create-title">Border Radius</span>
                <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.top_menu_radius" class="journal-number-field"></j-opt-text>
                        </span>
                <a href="#" target="_blank" class="journal-tip"> </a>
            </li>
        </accordion-group>

        <!--Main Menu-->
        <accordion-group is-open="accordion.accordions[3]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Main Menu</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Menu Background</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.main_menu_bg_color"></j-opt-color> -
                        <j-opt-background data-ng-model="settings.main_menu_bg_image"></j-opt-background>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li data-ng-hide="settings.header_type == 'default'">
                    <span class="module-create-title">Fullwidth Background <small>Slim / Central / Mega Header</small></span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.main_menu_bg_full_color"></j-opt-color> -
                        <j-opt-background data-ng-model="settings.main_menu_bg_full_image"></j-opt-background>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Menu Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.main_menu_font"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Menu Font Hover</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.menu_font_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Menu Background Hover</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.menu_bg_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Menu Bar Border</span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="settings.main_menu_border"></j-opt-border>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Fullwidth Bar Border</span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="settings.main_menu_border_fw"></j-opt-border>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Menu Bar Shadow</span>
                    <span class="module-create-option">
                        <j-opt-shadow data-ng-model="settings.menu_bar_shadow" data-bgcolor="true"></j-opt-shadow>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Menu Divider Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.menu_divider"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Menu Divider Type</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.menu_divider_type">
                            <switch-option key="none">None</switch-option>
                            <switch-option key="solid">Solid</switch-option>
                            <switch-option key="dashed">Dashed</switch-option>
                            <switch-option key="dotted">Dotted</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Divider Hover Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.menu_divider_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Menu Line Height <small>Vertical Centering</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.menu_line_height" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Menu Item Padding <small>Left - Right (For Centered Main Menu)</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.menu_item_padding" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Mega Menu Background <small>Color - Image</small></span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.mega_menu_bg"></j-opt-color> -
                        <j-opt-background data-ng-model="settings.mega_menu_bg_image"></j-opt-background>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Mega Menu Border</span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="settings.mega_menu_border"></j-opt-border>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Mega Menu Padding</span>
                    <span class="module-create-option">
                                        <j-opt-text data-ng-model="settings.mega_menu_padding" class="journal-number-field"></j-opt-text>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Column Spacing</span>
                    <span class="module-create-option">
                                        <j-opt-text data-ng-model="settings.menu_categories_item_margin" class="journal-number-field"></j-opt-text>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Mega Menu Shadow</span>
                    <span class="module-create-option">
                        <j-opt-shadow data-ng-model="settings.mega_menu_shadow_custom" data-bgcolor="true"></j-opt-shadow>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Mega Menu Max Height <small>Will show inner scrollbar on large mega menu containers</small></span>
                    <span class="module-create-option">
                            <j-opt-text data-ng-model="settings.mega_menu_max_height" class="journal-number-field"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Animate Dropdowns on Hover</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.mega_menu_animate">
                            <switch-option key="on">ON</switch-option>
                            <switch-option key="off">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <!-- Mobile Main Menu-->
                <accordion-group is-open="false">
                    <accordion-heading>
                        <div class="accordion-bar bar-level-1">Mobile Menu</div>
                    </accordion-heading>
                    <ul class="module-create-options">
                        <li>
                            <span class="module-create-title">Enable On</span>
                            <span class="module-create-option">
                                    <switch data-ng-model="settings.mobile_menu_on">
                                        <switch-option key="phone">Phone</switch-option>
                                        <switch-option key="tablet">Tablet</switch-option>
                                    </switch>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Display Menu Below Cart <small>OFF will move the mobile menu trigger on the same line with the cart</small></span>
                            <span class="module-create-option">
                                    <switch data-ng-model="settings.mobile_menu_cart_display">
                                        <switch-option key="on">ON</switch-option>
                                        <switch-option key="off">OFF</switch-option>
                                    </switch>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>

                        <li>
                            <span class="module-create-title">Sticky Menu/Cart on Phone</span>
                            <span class="module-create-option">
                            <switch data-ng-model="settings.sticky_menu_phone_2">
                                <switch-option key="on">ON</switch-option>
                                <switch-option key="off">OFF</switch-option>
                            </switch>
                        </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>

                        <li>
                            <span class="module-create-title">Menu Trigger Background</span>
                            <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.main_menu_mobile_bg_color"></j-opt-color> -
                                        <j-opt-background data-ng-model="settings.main_menu_mobile_bg_image"></j-opt-background>
                                    </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>

                        <li>
                            <span class="module-create-title">Menu Trigger Icon</span>
                            <span class="module-create-option">
                                        <j-opt-icon data-ng-model="settings.mobile_menu_icon"></j-opt-icon>
                                    </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Menu Trigger Text</span>
                            <span class="module-create-option">
                                        <j-opt-text-lang data-ng-model="settings.mobile_menu_text"></j-opt-text-lang>
                                    </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Menu Trigger Text Font</span>
                            <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.mobile_text_font"></j-opt-font>
                                    </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>

                        <li data-ng-show="settings.mobile_menu_cart_display == 'off'">
                        <span class="module-create-title">Text - Icon Color Cart Same Line <small>Optional different trigger text and icon color if menu is displayed on the same line with cart.</small></span>
                            <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.mobile_trigger_text_color_cart_same_line"></j-opt-color> -
                                <j-opt-color data-ng-model="settings.mobile_trigger_icon_color_cart_same_line"></j-opt-color>
                                    </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>

                        <li>
                            <span class="module-create-title">Menu Item Color on Phone</span>
                            <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.mobile_menu_item_color_phone"></j-opt-color>
                                    </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Menu Item Background on Phone</span>
                            <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.mobile_menu_item_bg_phone"></j-opt-color>
                                    </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>

                        <li>
                            <span class="module-create-title">Menu Items Divider Color</span>
                            <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.main_menu_mobile_border_color"></j-opt-color>
                                    </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Menu Items Divider Type</span>
                            <span class="module-create-option">
                                    <switch data-ng-model="settings.main_menu_mobile_border_type">
                                        <switch-option key="solid">Solid</switch-option>
                                        <switch-option key="dashed">Dashed</switch-option>
                                        <switch-option key="dotted">Dotted</switch-option>
                                    </switch>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Plus Color</span>
                            <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.mobile_plus_color"></j-opt-color>
                                    </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>

                        <li>
                            <span class="module-create-title">Plus Background Color</span>
                            <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.mobile_plus_bg"></j-opt-color>
                                    </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Show Category Images in Mega Menu</span>
                            <span class="module-create-option">
                                    <switch data-ng-model="settings.mobile_menu_show_category_images">
                                        <switch-option key="on">ON</switch-option>
                                        <switch-option key="off">OFF</switch-option>
                                    </switch>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                    </ul>

                </accordion-group>

                <!-- Dropdown Menu -->
                <accordion>
                    <accordion-group is-open="false">
                        <accordion-heading>
                            <div class="accordion-bar bar-level-1">Dropdown</div>
                        </accordion-heading>
                        <ul class="module-create-options">

                            <li>
                                <span class="module-create-title">Font</span>
                                <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.dropdown_font"></j-opt-font>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>

                            <li>
                                <span class="module-create-title">Font Hover</span>
                                <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.dropdown_font_hover"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>

                            <li>
                                <span class="module-create-title">Background Color</span>
                                <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.dropdown_bg"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>

                            <li>
                                <span class="module-create-title">Background Hover</span>
                                <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.dropdown_bg_hover"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li>
                                <span class="module-create-title">Links Icon</span>
                                <span class="module-create-option">
                                        <j-opt-icon data-ng-model="settings.dropdown_link_icon"></j-opt-icon>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li>
                                <span class="module-create-title">Sub Level Icon</span>
                                <span class="module-create-option">
                                        <j-opt-icon data-ng-model="settings.dropdown_icon"></j-opt-icon>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li>
                                <span class="module-create-title">Sub Level Icon Hover</span>
                                <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.dropdown_icon_hover"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>

                            <li>
                                <span class="module-create-title">Divider Color</span>
                                <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.dropdown_divider"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li>
                                <span class="module-create-title">Divider Type</span>
                                <span class="module-create-option">
                                        <switch data-ng-model="settings.dropdown_divider_type">
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
                                        <switch data-ng-model="settings.dropdown_shadow">
                                            <switch-option key="on">ON</switch-option>
                                            <switch-option key="none">OFF</switch-option>
                                        </switch>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li data-ng-hide="settings.dropdown_shadow == 'none'">
                                <span class="module-create-title">Dropdown Custom Shadow <small>Overrides Mega Menu Shadow</small></span>
                                <span class="module-create-option">
                                    <j-opt-shadow data-ng-model="settings.dropdown_shadow_custom"></j-opt-shadow>
                                </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                        </ul>
                    </accordion-group>
                </accordion>

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
                                        <j-opt-color data-ng-model="settings.menu_categories_bg"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li>
                                <span class="module-create-title">Item Border Settings</span>
                                <span class="module-create-option">
                                        <j-opt-border data-ng-model="settings.menu_categories_border"></j-opt-border>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>

                            <li>
                                <span class="module-create-title">Item Padding</span>
                                <span class="module-create-option">
                                        <j-opt-text data-ng-model="settings.menu_categories_padding" class="journal-number-field"></j-opt-text>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>



                            <li>
                                <span class="module-create-title">Link Font</span>
                                <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.menu_categories_link_font"></j-opt-font>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li>
                                <span class="module-create-title">Link Hover</span>
                                <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.menu_categories_link_font_hover"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li>
                                <span class="module-create-title">Links Icon</span>
                                <span class="module-create-option">
                                        <j-opt-icon data-ng-model="settings.menu_categories_link_icon"></j-opt-icon>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li>
                                <span class="module-create-title">Link Left Padding</span>
                                <span class="module-create-option">
                                        <j-opt-text data-ng-model="settings.menu_categories_link_padding" class="journal-number-field"></j-opt-text>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li>
                                <span class="module-create-title">Link Bottom Padding</span>
                                <span class="module-create-option">
                                        <j-opt-text data-ng-model="settings.menu_categories_link_bottom_margin" class="journal-number-field"></j-opt-text>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>

                            <li>
                                <span class="module-create-title">Image Border Settings</span>
                                <span class="module-create-option">
                                        <j-opt-border data-ng-model="settings.menu_categories_image_border"></j-opt-border>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>

                            <li>
                                <span class="module-create-title">View More Text</span>
                                <span class="module-create-option">
                                        <j-opt-text-lang data-ng-model="settings.view_more_text"></j-opt-text-lang>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li>
                                <span class="module-create-title">View More Font</span>
                                <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.view_more_font"></j-opt-font>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li>
                                <span class="module-create-title">View More Font Hover</span>
                                <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.view_more_font_hover"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>

                            <accordion>
                                <accordion-group is-open="false">
                                    <accordion-heading>
                                        <div class="accordion-bar bar-level-2">Title</div>
                                    </accordion-heading>
                                    <ul class="module-create-options">

                                        <li>
                                            <span class="module-create-title">Title Font</span>
                                            <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.menu_categories_title_font"></j-opt-font>
                                    </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>
                                        <li>
                                            <span class="module-create-title">Title Font Hover</span>
                                            <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.menu_categories_title_font_hover"></j-opt-color>
                                    </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>
                                        <li>
                                            <span class="module-create-title">Title Background</span>
                                            <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.menu_categories_title_bg"></j-opt-color>
                                    </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>

                                        <li>
                                            <span class="module-create-title">Title Background Hover</span>
                                            <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.menu_categories_title_bg_hover"></j-opt-color>
                                    </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>
                                        <li>
                                            <span class="module-create-title">Title Border Settings</span>
                                            <span class="module-create-option">
                                                <j-opt-border data-ng-model="settings.menu_categories_title_border"></j-opt-border>
                                            </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>
                                        <li>
                                            <span class="module-create-title">Title Border Hover</span>
                                            <span class="module-create-option">
                                                <j-opt-color data-ng-model="settings.menu_categories_title_border_hover"></j-opt-color>
                                            </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>
                                        <li>
                                            <span class="module-create-title">Title Padding <small>Top - Right - Bottom - Left</small></span>
                                            <span class="module-create-option">
                                                <j-opt-text data-ng-model="settings.menu_categories_title_padding_top" class="journal-sort"></j-opt-text> -
                                                <j-opt-text data-ng-model="settings.menu_categories_title_padding_right" class="journal-sort"></j-opt-text> -
                                                <j-opt-text data-ng-model="settings.menu_categories_title_padding_bottom" class="journal-sort"></j-opt-text> -
                                                <j-opt-text data-ng-model="settings.menu_categories_title_padding_left" class="journal-sort"></j-opt-text>
                                            </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>
                                        <li>
                                            <span class="module-create-title">Title Align</span>
                                            <span class="module-create-option">
                                            <switch data-ng-model="settings.menu_categories_title_align">
                                                <switch-option key="left">Left</switch-option>
                                                <switch-option key="center">Center</switch-option>
                                                <switch-option key="right">Right</switch-option>
                                            </switch>
                                        </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>

                                        <li>
                                            <span class="module-create-title">Title Overflow <small>Keep long category titles on the same line.</small></span>
                                            <span class="module-create-option">
                                            <switch data-ng-model="settings.main_menu_category_title_overflow">
                                                <switch-option key="nowrap">ON</switch-option>
                                                <switch-option key="normal">OFF</switch-option>
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
                                <span class="module-create-title">Item Background <small>Color - Hover</small></span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.menu_product_grid_item_bg"></j-opt-color> -
                                    <j-opt-color data-ng-model="settings.menu_product_grid_details_bg_hover"></j-opt-color>
                                </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Product Details Background <small>Color - Hover</small></span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.menu_product_grid_item_bg_details"></j-opt-color> -
                                    <j-opt-color data-ng-model="settings.menu_product_grid_details_bg_hover_details"></j-opt-color>
                                </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Padding</span>
                                <span class="module-create-option">
                              <j-opt-text data-ng-model="settings.menu_product_grid_item_padding" class="journal-number-field"></j-opt-text>
                        </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li>
                                <span class="module-create-title">Border Settings</span>
                                <span class="module-create-option">
                            <j-opt-border data-ng-model="settings.menu_product_grid_item_border"></j-opt-border>
                        </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Hover Border Color</span>
                                <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.menu_product_grid_hover_border"></j-opt-color>
                        </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li>
                                <span class="module-create-title">Product Name Font</span>
                                <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.menu_product_grid_name_font"></j-opt-font>
                        </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>


                            <li>
                                <span class="module-create-title">Product Name Hover</span>
                                <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.menu_product_grid_name_font_hover"></j-opt-color>
                        </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>

                            <li>
                                <span class="module-create-title">Price Font</span>
                                <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.menu_product_grid_price_font"></j-opt-font>
                        </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Price Border Settings</span>
                                <span class="module-create-option">
                            <j-opt-border data-ng-model="settings.menu_product_grid_price_border"></j-opt-border>
                        </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
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
                        <j-opt-font data-ng-model="settings.menu_product_grid_button_font"></j-opt-font>
                    </span>
                                            <a href="#" target="_blank" class="journal-tip"></a>
                                        </li>
                                        <li>
                                            <span class="module-create-title">Font Hover Color</span>
                                            <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.menu_product_grid_button_font_hover"></j-opt-color>
                    </span>
                                            <a href="#" target="_blank" class="journal-tip"></a>
                                        </li>


                                        <li>
                                            <span class="module-create-title">Background Color</span>
                                            <span class="module-create-option">
                                <j-opt-color data-ng-model="settings.menu_product_grid_button_bg"></j-opt-color>
                            </span>
                                            <a href="#" target="_blank" class="journal-tip"></a>
                                        </li>


                                        <li>
                                            <span class="module-create-title">Background Hover Color</span>
                                            <span class="module-create-option">
                                <j-opt-color data-ng-model="settings.menu_product_grid_button_bg_hover"></j-opt-color>
                            </span>
                                            <a href="#" target="_blank" class="journal-tip"></a>
                                        </li>

                                        <li>
                                            <span class="module-create-title">Border Settings</span>
                                            <span class="module-create-option">
                                <j-opt-border data-ng-model="settings.menu_product_grid_button_border"></j-opt-border>
                            </span>
                                            <a href="#" target="_blank" class="journal-tip"></a>
                                        </li>

                                        <li>
                                            <span class="module-create-title">Border Hover Color</span>
                                            <span class="module-create-option">
                                <j-opt-color data-ng-model="settings.menu_product_grid_button_border_hover"></j-opt-color>
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
                                        <j-opt-color data-ng-model="settings.menu_brands_bg"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li>
                                <span class="module-create-title">Item Border Settings</span>
                                <span class="module-create-option">
                                        <j-opt-border data-ng-model="settings.menu_brands_border"></j-opt-border>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li>
                                <span class="module-create-title">Item Padding</span>
                                <span class="module-create-option">
                                        <j-opt-text data-ng-model="settings.menu_brands_padding" class="journal-number-field"></j-opt-text>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>

                            <li>
                                <span class="module-create-title">Image Border Settings</span>
                                <span class="module-create-option">
                                        <j-opt-border data-ng-model="settings.menu_brands_image_border"></j-opt-border>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <!--<li>-->
                            <!--<span class="module-create-title">Image Top Spacing <small>Distance from Title</small></span>-->
                            <!--<span class="module-create-option">-->
                            <!--<j-opt-text data-ng-model="settings.menu_brands_image_top_spacing" class="journal-number-field"></j-opt-text>-->
                            <!--</span>-->
                            <!--<a href="#" target="_blank" class="journal-tip"> </a>-->
                            <!--</li>-->

                            <accordion>
                                <accordion-group is-open="false">
                                    <accordion-heading>
                                        <div class="accordion-bar bar-level-2">Title</div>
                                    </accordion-heading>
                                    <ul class="module-create-options">

                                        <li>
                                            <span class="module-create-title">Title Font</span>
                                            <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.menu_brands_title_font"></j-opt-font>
                                    </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>
                                        <li>
                                            <span class="module-create-title">Title Font Hover</span>
                                            <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.menu_brands_title_font_hover"></j-opt-color>
                                    </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>
                                        <li>
                                            <span class="module-create-title">Title Background</span>
                                            <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.menu_brands_title_bg"></j-opt-color>
                                    </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>

                                        <li>
                                            <span class="module-create-title">Title Background Hover</span>
                                            <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.menu_brands_title_bg_hover"></j-opt-color>
                                    </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>
                                        <li>
                                            <span class="module-create-title">Title Border Settings</span>
                                            <span class="module-create-option">
                                        <j-opt-border data-ng-model="settings.menu_brands_title_border"></j-opt-border>
                                    </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>
                                        <li>
                                            <span class="module-create-title">Title Border Hover</span>
                                            <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.menu_brands_title_border_hover"></j-opt-color>
                                    </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>
                                        <li>
                                            <span class="module-create-title">Title Padding <small>Top - Right - Bottom - Left</small></span>
                                            <span class="module-create-option">
                                        <j-opt-text data-ng-model="settings.menu_brands_title_padding_top" class="journal-sort"></j-opt-text> -
                                        <j-opt-text data-ng-model="settings.menu_brands_title_padding_right" class="journal-sort"></j-opt-text> -
                                        <j-opt-text data-ng-model="settings.menu_brands_title_padding_bottom" class="journal-sort"></j-opt-text> -
                                        <j-opt-text data-ng-model="settings.menu_brands_title_padding_left" class="journal-sort"></j-opt-text>
                                    </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>
                                        <li>
                                            <span class="module-create-title">Title Align</span>
                                            <span class="module-create-option">
                                            <switch data-ng-model="settings.menu_brands_title_align">
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
                                <span class="module-create-title">Content Font</span>
                                <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.menu_html_font"></j-opt-font>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>

                            <li>
                                <span class="module-create-title">Content Background Color</span>
                                <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.menu_html_bg"></j-opt-color>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>

                            <li>
                                <span class="module-create-title">Content Border Settings</span>
                                <span class="module-create-option">
                                        <j-opt-border data-ng-model="settings.menu_html_border"></j-opt-border>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>

                            <li>
                                <span class="module-create-title">Content Padding</span>
                                <span class="module-create-option">
                                        <j-opt-text data-ng-model="settings.menu_html_padding_top" class="journal-sort"></j-opt-text> -
                                        <j-opt-text data-ng-model="settings.menu_html_padding_right" class="journal-sort"></j-opt-text> -
                                        <j-opt-text data-ng-model="settings.menu_html_padding_bottom" class="journal-sort"></j-opt-text> -
                                        <j-opt-text data-ng-model="settings.menu_html_padding_left" class="journal-sort"></j-opt-text>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>

                            <accordion>
                                <accordion-group is-open="false">
                                    <accordion-heading>
                                        <div class="accordion-bar bar-level-2">Title</div>
                                    </accordion-heading>
                                    <ul class="module-create-options">

                                        <li>
                                            <span class="module-create-title">Title Font</span>
                                            <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.menu_html_title_font"></j-opt-font>
                                    </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>
                                        <li>
                                            <span class="module-create-title">Title Font Hover</span>
                                            <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.menu_html_title_font_hover"></j-opt-color>
                                    </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>
                                        <li>
                                            <span class="module-create-title">Title Background</span>
                                            <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.menu_html_title_bg"></j-opt-color>
                                    </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>

                                        <li>
                                            <span class="module-create-title">Title Background Hover</span>
                                            <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.menu_html_title_bg_hover"></j-opt-color>
                                    </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>
                                        <li>
                                            <span class="module-create-title">Title Border Settings</span>
                                            <span class="module-create-option">
                                        <j-opt-border data-ng-model="settings.menu_html_title_border"></j-opt-border>
                                    </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>
                                        <li>
                                            <span class="module-create-title">Title Border Hover</span>
                                            <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.menu_html_title_border_hover"></j-opt-color>
                                    </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>
                                        <li>
                                            <span class="module-create-title">Title Padding <small>Top - Right - Bottom - Left</small></span>
                                            <span class="module-create-option">
                                        <j-opt-text data-ng-model="settings.menu_html_title_padding_top" class="journal-sort"></j-opt-text> -
                                        <j-opt-text data-ng-model="settings.menu_html_title_padding_right" class="journal-sort"></j-opt-text> -
                                        <j-opt-text data-ng-model="settings.menu_html_title_padding_bottom" class="journal-sort"></j-opt-text> -
                                        <j-opt-text data-ng-model="settings.menu_html_title_padding_left" class="journal-sort"></j-opt-text>
                                    </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>
                                        <li>
                                            <span class="module-create-title">Title Align</span>
                                            <span class="module-create-option">
                                            <switch data-ng-model="settings.menu_html_title_align">
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

                <!-- Mega Menu MIXED-->
                <accordion>
                    <accordion-group is-open="false">
                        <accordion-heading>
                            <div class="accordion-bar bar-level-1">Mixed</div>
                        </accordion-heading>
                        <ul class="module-create-options">

                            <accordion>
                                <accordion-group is-open="true">
                                    <accordion-heading>
                                        <div class="accordion-bar bar-level-2">HTML Blocks</div>
                                    </accordion-heading>
                                    <ul class="module-create-options">

                                        <li>
                                            <span class="module-create-title">Headings Font <small>H1 - H3 tags</small></span>
                                            <span class="module-create-option">
                                                    <j-opt-font data-ng-model="settings.mixed_cms_heading_font"></j-opt-font>
                                                </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>

                                        <li>
                                            <span class="module-create-title">Block Font <small>p tag</small></span>
                                            <span class="module-create-option">
                                                    <j-opt-font data-ng-model="settings.mixed_cms_font"></j-opt-font>
                                                </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>

                                        <li>
                                            <span class="module-create-title">Block Text Line Height <small>Pixels</small></span>
                                            <span class="module-create-option">
                                                    <j-opt-text data-ng-model="settings.mixed_cms_block_line_height" class="journal-number-field"></j-opt-text>
                                                </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>

                                        <li>
                                            <span class="module-create-title">Block Background</span>
                                            <span class="module-create-option">
                                                    <j-opt-color data-ng-model="settings.mixed_cms_block_bg"></j-opt-color>
                                                </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>
                                        <li>
                                            <span class="module-create-title">Headings Spacing <small>Padding Bottom</small></span>
                                            <span class="module-create-option">
                                                    <j-opt-text data-ng-model="settings.mixed_cms_heading_padding" class="journal-number-field"></j-opt-text>
                                                </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>

                                        <li>
                                            <span class="module-create-title">Content Padding <small>Top - Right - Bottom - Left</small></span>
                                            <span class="module-create-option">
                                                    <j-opt-text data-ng-model="settings.mixed_cms_padding_top" class="journal-sort"></j-opt-text> -
                                                    <j-opt-text data-ng-model="settings.mixed_cms_padding_right" class="journal-sort"></j-opt-text> -
                                                    <j-opt-text data-ng-model="settings.mixed_cms_padding_bottom" class="journal-sort"></j-opt-text> -
                                                    <j-opt-text data-ng-model="settings.mixed_cms_padding_left" class="journal-sort"></j-opt-text>
                                                </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>
                                    </ul>
                                </accordion-group>
                            </accordion>

                            <accordion>
                                <accordion-group is-open="true">
                                    <accordion-heading>
                                        <div class="accordion-bar bar-level-2">Titles</div>
                                    </accordion-heading>
                                    <ul class="module-create-options">
                                        <li>
                                            <span class="module-create-title">Title Font</span>
                                            <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.mixed_cms_title_font"></j-opt-font>
                                    </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>

                                        <li>
                                            <span class="module-create-title">Title Background</span>
                                            <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.mixed_cms_title_bg"></j-opt-color>
                                    </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>


                                        <li>
                                            <span class="module-create-title">Title Border Settings</span>
                                            <span class="module-create-option">
                                        <j-opt-border data-ng-model="settings.mixed_cms_title_border"></j-opt-border>
                                    </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>

                                        <li>
                                            <span class="module-create-title">Spacing <small>Margin Bottom</small></span>
                                            <span class="module-create-option">
                                                    <j-opt-text data-ng-model="settings.mixed_cms_margin_bottom" class="journal-number-field"></j-opt-text>
                                                </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>

                                        <li>
                                            <span class="module-create-title">Title Padding <small>Top - Right - Bottom - Left</small></span>
                                            <span class="module-create-option">
                                        <j-opt-text data-ng-model="settings.mixed_cms_title_padding_top" class="journal-sort"></j-opt-text> -
                                        <j-opt-text data-ng-model="settings.mixed_cms_title_padding_right" class="journal-sort"></j-opt-text> -
                                        <j-opt-text data-ng-model="settings.mixed_cms_title_padding_bottom" class="journal-sort"></j-opt-text> -
                                        <j-opt-text data-ng-model="settings.mixed_cms_title_padding_left" class="journal-sort"></j-opt-text>
                                    </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>


                                    </ul>
                                </accordion-group>
                            </accordion>
                        </ul>
                    </accordion-group>
                </accordion>
            </ul>

        </accordion-group>
    </accordion>
</div>
