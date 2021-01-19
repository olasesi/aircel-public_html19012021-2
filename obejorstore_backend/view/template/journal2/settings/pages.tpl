<div class="sticky">
    <div class="module-header">
        <div class='module-name'>Settings<span>Pages</span></div>

        <skin-manager data-url="settings/pages"></skin-manager>

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
    <div class="accordion-bar bar-level-0 bar-expand">
        <a data-ng-click="toggleAccordion(true)" class="hint--top" data-hint="Expand All"><i
                    class="expand-icon"></i></a> <a data-ng-click="toggleAccordion(false)" class="hint--top"
                                                    data-hint="Collapse All"><i class="collapse-icon"></i></a>
        <label class="close-others hint--top" data-hint="Close Others"><input type="checkbox"
                                                                              data-ng-model="accordion.close_others"/></label>
    </div>
    <accordion id="main-accordion" close-others="accordion.close_others">

        <!--Information pages-->
        <accordion-group is-open="accordion.accordions[0]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Information Pages</div>
            </accordion-heading>
            <ul class="module-create-options">

                <li>
                    <span class="module-create-title">General Font</span>
                    <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.info_page_p_font"></j-opt-font>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Links Font</span>
                    <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.info_page_link_font"></j-opt-font>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Links Font Hover</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.info_page_link_font_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Line Height</span>
                    <span class="module-create-option">
                            <j-opt-text data-ng-model="settings.info_page_line_height"
                                        class="journal-number-field"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">H1 Font</span>
                    <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.info_page_h1_font"></j-opt-font>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">H2 Font</span>
                    <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.info_page_h2_font"></j-opt-font>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">H3 Font</span>
                    <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.info_page_h3_font"></j-opt-font>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">H4 Font</span>
                    <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.info_page_h4_font"></j-opt-font>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">H5 Font</span>
                    <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.info_page_h5_font"></j-opt-font>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <!-- Page Title-->
                <accordion-group is-open="true">
                    <accordion-heading>
                        <div class="accordion-bar bar-level-1">Page Title</div>
                    </accordion-heading>
                    <ul>

                        <li>
                            <span class="module-create-title">Page Title Font</span>
                            <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.info_page_title_font"></j-opt-font>
                                    </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>

                        <li>
                            <span class="module-create-title">Page Title Background</span>
                            <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.info_page_title_bg"></j-opt-color>
                                    </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>

                        <li>
                            <span class="module-create-title">Border Settings</span>
                            <span class="module-create-option">
                                        <j-opt-border data-ng-model="settings.info_page_title_border"></j-opt-border>
                                    </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>

                        <li>
                            <span class="module-create-title">Title Bar Height</span>
                            <span class="module-create-option">
                                        <j-opt-text data-ng-model="settings.info_page_title_line_height"
                                                    class="journal-number-field"></j-opt-text>
                                    </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Padding <small>Left - Right</small></span>
                            <span class="module-create-option">
                                <j-opt-text data-ng-model="settings.info_page_title_padding_left"
                                            class="journal-sort"></j-opt-text> -
                                <j-opt-text data-ng-model="settings.info_page_title_padding_right"
                                            class="journal-sort"></j-opt-text>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Title Align</span>
                            <span class="module-create-option">
                                        <switch data-ng-model="settings.info_page_title_align">
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

        <!--Tables-->
        <accordion-group is-open="accordion.accordions[1]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Tables</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Font Color</span>
                    <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.shopping_table_color"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Background Color</span>
                    <span class="module-create-option">
                                            <j-opt-color data-ng-model="settings.shopping_table_bg_color"></j-opt-color>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Links Color</span>
                    <span class="module-create-option">
                                            <j-opt-color
                                                    data-ng-model="settings.shopping_table_link_color"></j-opt-color>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Links Hover Color</span>
                    <span class="module-create-option">
                                            <j-opt-color
                                                    data-ng-model="settings.shopping_table_link_hover_color"></j-opt-color>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Content Border Settings</span>
                    <span class="module-create-option">
                                            <j-opt-border data-ng-model="settings.shopping_table_border"></j-opt-border>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Heading Font Color</span>
                    <span class="module-create-option">
                                            <j-opt-color
                                                    data-ng-model="settings.shopping_table_header_color"></j-opt-color>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Heading Background</span>
                    <span class="module-create-option">
                                            <j-opt-color
                                                    data-ng-model="settings.shopping_table_header_bg"></j-opt-color>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Image Border Settings <small>Shopping Cart, Wishlist, Compare</small></span>
                    <span class="module-create-option">
                                            <j-opt-border data-ng-model="settings.shopping_image_border"></j-opt-border>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Divider Color</span>
                    <span class="module-create-option">
                                            <j-opt-color data-ng-model="settings.shopping_divider"></j-opt-color>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Divider Style</span>
                    <span class="module-create-option">
                            <switch data-ng-model="settings.shopping_divider_style">
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
                <div class="accordion-bar bar-level-0">Account Page</div>
            </accordion-heading>
            <ul class="module-create-options">

                <li>
                    <span class="module-create-title">Login Background</span>
                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.login_screen_bg"></j-opt-color>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Login Text Font</span>
                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.login_screen_text_font_color"></j-opt-font>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Login Border Settings</span>
                    <span class="module-create-option">
                                <j-opt-border data-ng-model="settings.login_screen_border"></j-opt-border>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Login Buttons Divider</span>
                    <span class="module-create-option">
                                <j-opt-color data-ng-model="settings.login_screen_divider"></j-opt-color>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Container Padding</span>
                    <span class="module-create-option">
                                <j-opt-text data-ng-model="settings.login_screen_padding"
                                            class="journal-number-field"></j-opt-text>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Required Field Alert Font</span>
                    <span class="module-create-option">
                                <j-opt-font data-ng-model="settings.required_field_font"></j-opt-font>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Required Field Alert Background</span>
                    <span class="module-create-option">
                                <j-opt-color data-ng-model="settings.required_field_bg"></j-opt-color>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Register Page Text/Label Font</span>
                    <span class="module-create-option">
                                <j-opt-font data-ng-model="settings.register_field_font"></j-opt-font>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Account Page Links Font</span>
                    <span class="module-create-option">
                                <j-opt-font data-ng-model="settings.account_links_font"></j-opt-font> &nbsp; &nbsp;Hover
                        <j-opt-color data-ng-model="settings.account_links_font_hover"></j-opt-color>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <accordion-group is-open="false">
                    <accordion-heading>
                        <div class="accordion-bar bar-level-1">View Order / Reorder / Return Buttons <span>Opencart 2.x only</span>
                        </div>
                    </accordion-heading>
                    <ul class="module-create-options">
                        <li>
                            <span class="module-create-title">View Order Icon Color</span>
                            <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.view_order_button_icon_color"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">View Order Background Color</span>
                            <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.view_order_button_bg_color"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">View Order Icon Hover</span>
                            <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.view_order_button_icon_hover"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">View Order Background Hover</span>
                            <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.view_order_button_bg_hover"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Reorder Icon Color</span>
                            <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.reorder_button_icon_color"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Reorder Background Color</span>
                            <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.reorder_button_bg_color"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Reorder Icon Hover</span>
                            <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.reorder_button_icon_hover"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Reorder Background Hover</span>
                            <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.reorder_button_bg_hover"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>

                        <li>
                            <span class="module-create-title">Return Icon Color</span>
                            <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.return_button_icon_color"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Return Background Color</span>
                            <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.return_button_bg_color"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Return Icon Hover</span>
                            <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.return_button_icon_hover"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Return Background Hover</span>
                            <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.return_button_bg_hover"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>

                    </ul>
                </accordion-group>
            </ul>
        </accordion-group>
        <!--Tables-->
        <accordion-group is-open="accordion.accordions[3]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Text Input Fields</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Text Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.input_field_text_color"></j-opt-color> &nbsp;&nbsp; Hover&nbsp;
                        <j-opt-color data-ng-model="settings.input_field_text_color_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Background Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.input_field_bg_color"></j-opt-color> &nbsp;&nbsp; Hover&nbsp;
                        <j-opt-color data-ng-model="settings.input_field_bg_color_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Border Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.input_field_border_color"></j-opt-color> &nbsp;&nbsp; Hover&nbsp;
                        <j-opt-color data-ng-model="settings.input_field_border_color_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
            </ul>
        </accordion-group>

        <!--Shopping Cart Page-->
        <accordion-group is-open="accordion.accordions[4]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Shopping Cart Page</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Table Headings Font</span>
                    <span class="module-create-option">
                                            <j-opt-font data-ng-model="settings.shopping_table_headings"></j-opt-font>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Product Name Font <small>Font - Hover</small></span>
                    <span class="module-create-option">
                                            <j-opt-font data-ng-model="settings.shopping_product_name"></j-opt-font> - <j-opt-color
                                data-ng-model="settings.shopping_product_name_hover"></j-opt-color>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Heading Font</span>
                    <span class="module-create-option">
                                            <j-opt-font data-ng-model="settings.shopping_action_header"></j-opt-font>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Heading Background</span>
                    <span class="module-create-option">
                                            <j-opt-color
                                                    data-ng-model="settings.shopping_action_header_bg"></j-opt-color>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Action Area Font</span>
                    <span class="module-create-option">
                                            <j-opt-font data-ng-model="settings.shopping_action_font"></j-opt-font>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Action Area Background Color</span>
                    <span class="module-create-option">
                                            <j-opt-color data-ng-model="settings.shopping_action_bg"></j-opt-color>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Action Area Border</span>
                    <span class="module-create-option">
                                            <j-opt-border
                                                    data-ng-model="settings.shopping_action_border"></j-opt-border>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Action Area Spacing <small>Margin Top</small></span>
                    <span class="module-create-option">
                                            <j-opt-text data-ng-model="settings.shopping_action_margin"
                                                        class="journal-number-field"></j-opt-text>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>


                <li>
                    <span class="module-create-title">Option Font</span>
                    <span class="module-create-option">
                                            <j-opt-font data-ng-model="settings.shopping_option_font"></j-opt-font>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Option Font Hover Color</span>
                    <span class="module-create-option">
                                            <j-opt-color
                                                    data-ng-model="settings.shopping_option_hover_color"></j-opt-color>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Option Background Color</span>
                    <span class="module-create-option">
                                            <j-opt-color data-ng-model="settings.shopping_option_bg"></j-opt-color>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Option Background Hover</span>
                    <span class="module-create-option">
                                            <j-opt-color
                                                    data-ng-model="settings.shopping_option_bg_hover"></j-opt-color>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Option Divider Color</span>
                    <span class="module-create-option">
                                            <j-opt-color data-ng-model="settings.shopping_option_divider"></j-opt-color>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Total Font</span>
                    <span class="module-create-option">
                                            <j-opt-font data-ng-model="settings.shopping_total_font"></j-opt-font>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <accordion-group is-open="false">
                    <accordion-heading>
                        <div class="accordion-bar bar-level-1">Buttons</div>
                    </accordion-heading>
                    <ul class="module-create-options">
                        <li>
                            <span class="module-create-title">Checkout Color</span>
                            <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.cart_page_checkout_button_color"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Checkout Hover Color</span>
                            <span class="module-create-option">
                                    <j-opt-color
                                            data-ng-model="settings.cart_page_checkout_button_color_hover"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Checkout Background Color</span>
                            <span class="module-create-option">
                                    <j-opt-color
                                            data-ng-model="settings.cart_page_checkout_button_bg_color"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Checkout Background Hover Color</span>
                            <span class="module-create-option">
                                    <j-opt-color
                                            data-ng-model="settings.cart_page_checkout_button_bg_hover_color"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Checkout Button Border</span>
                            <span class="module-create-option">
                                        <j-opt-border data-ng-model="settings.button_checkout_border"></j-opt-border>
                                    </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Continue Shopping Color</span>
                            <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.cart_page_continue_button_color"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Continue Shopping Hover Color</span>
                            <span class="module-create-option">
                                    <j-opt-color
                                            data-ng-model="settings.cart_page_continue_button_color_hover"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Continue Shopping Background Color</span>
                            <span class="module-create-option">
                                    <j-opt-color
                                            data-ng-model="settings.cart_page_continue_button_bg_color"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Continue Shopping Background Hover Color</span>
                            <span class="module-create-option">
                                    <j-opt-color
                                            data-ng-model="settings.cart_page_continue_button_bg_hover_color"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Continue Shopping Button Border</span>
                            <span class="module-create-option">
                                        <j-opt-border data-ng-model="settings.button_continue_border"></j-opt-border>
                                    </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                    </ul>
                </accordion-group>

                <accordion-group is-open="false">
                    <accordion-heading>
                        <div class="accordion-bar bar-level-1">Update / Remove Buttons <span>Opencart 2.x only</span>
                        </div>
                    </accordion-heading>
                    <ul class="module-create-options">
                        <li>
                            <span class="module-create-title">Update Icon Color</span>
                            <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.update_button_icon_color"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Update Background Color</span>
                            <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.update_button_bg_color"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Update Icon Hover</span>
                            <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.update_button_icon_hover"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Update Background Hover</span>
                            <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.update_button_bg_hover"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>

                        <li>
                            <span class="module-create-title">Delete Icon Color</span>
                            <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.delete_button_icon_color"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Delete Background Color</span>
                            <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.delete_button_bg_color"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Delete Icon Hover</span>
                            <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.delete_button_icon_hover"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Delete Background Hover</span>
                            <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.delete_button_bg_hover"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>

                    </ul>
                </accordion-group>

            </ul>
        </accordion-group>
        <!--Checkout Page-->
        <accordion-group is-open="accordion.accordions[5]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Checkout Page <span> - Default Opencart</span></div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Background Color</span>
                    <span class="module-create-option">
                                            <j-opt-color data-ng-model="settings.checkout_bg"></j-opt-color>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Container Padding</span>
                    <span class="module-create-option">
                                            <j-opt-text data-ng-model="settings.checkout_padding"
                                                        class="journal-number-field"></j-opt-text>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Heading Font</span>
                    <span class="module-create-option">
                                            <j-opt-font data-ng-model="settings.checkout_heading_font"></j-opt-font>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Heading Font Hover <small>Opencart 2.x</small></span>
                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.checkout_heading_font_hover"></j-opt-color>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Heading Background Color</span>
                    <span class="module-create-option">
                                            <j-opt-color
                                                    data-ng-model="settings.checkout_heading_bg_color"></j-opt-color>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Heading Background Hover <small>Opencart 2.x</small></span>
                    <span class="module-create-option">
                                            <j-opt-color
                                                    data-ng-model="settings.checkout_heading_bg_hover"></j-opt-color>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Heading Divider Color <small>Opencart 1.5.x</small></span>
                    <span class="module-create-option">
                                            <j-opt-color
                                                    data-ng-model="settings.checkout_heading_divider_color"></j-opt-color>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Heading Divider Type  <small>Opencart 1.5.x</small></span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.checkout_heading_divider_type">
                            <switch-option key="solid">Solid</switch-option>
                            <switch-option key="dashed">Dashed</switch-option>
                            <switch-option key="dotted">Dotted</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Checkout Border Radius</span>
                    <span class="module-create-option">
                                            <j-opt-border data-ng-model="settings.checkout_border"
                                                          editor="hide-style"></j-opt-border>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Confirm Order Font Color</span>
                    <span class="module-create-option">
                                            <j-opt-color data-ng-model="settings.checkout_confirm_color"></j-opt-color>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Confirm Order Background Color</span>
                    <span class="module-create-option">
                                            <j-opt-color
                                                    data-ng-model="settings.checkout_confirm_bg_color"></j-opt-color>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Confirm Order Divider Color</span>
                    <span class="module-create-option">
                                            <j-opt-color
                                                    data-ng-model="settings.checkout_confirm_divider_color"></j-opt-color>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Colorbox Text Color  <small>Opencart 1.5.x</small></span>
                    <span class="module-create-option">
                                            <j-opt-color data-ng-model="settings.colorbox_text_color"></j-opt-color>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Modify Link Font   <small>Opencart 1.5.x</small></span>
                    <span class="module-create-option">
                                            <j-opt-font data-ng-model="settings.checkout_modify_font"></j-opt-font>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Modify Link Font Hover   <small>Opencart 1.5.x</small></span>
                    <span class="module-create-option">
                                            <j-opt-color
                                                    data-ng-model="settings.checkout_modify_font_hover"></j-opt-color>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <accordion>
                    <accordion-group is-open="false">
                        <accordion-heading>
                            <div class="accordion-bar bar-level-1">Confirm Order Button</div>
                        </accordion-heading>
                        <ul class="module-create-options">
                            <li>
                                <span class="module-create-title">Color</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.checkout_confirm_button_color"></j-opt-color>
                                </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li>
                                <span class="module-create-title">Hover Color</span>
                                <span class="module-create-option">
                                    <j-opt-color
                                            data-ng-model="settings.checkout_confirm_button_color_hover"></j-opt-color>
                                </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li>
                                <span class="module-create-title">Background Color</span>
                                <span class="module-create-option">
                                    <j-opt-color
                                            data-ng-model="settings.checkout_confirm_button_bg_color"></j-opt-color>
                                </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li>
                                <span class="module-create-title">Background Hover Color</span>
                                <span class="module-create-option">
                                    <j-opt-color
                                            data-ng-model="settings.checkout_confirm_button_bg_hover_color"></j-opt-color>
                                </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li>
                                <span class="module-create-title">Button Border</span>
                                <span class="module-create-option">
                                        <j-opt-border data-ng-model="settings.checkout_confirm_border"></j-opt-border>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                        </ul>
                    </accordion-group>
                </accordion>
            </ul>
        </accordion-group>

        <!--Wishlist Page-->
        <!--<accordion-group is-open="accordion.accordions[6]">-->
        <!--<accordion-heading>-->
        <!--<div class="accordion-bar bar-level-0">Wishlist Page</div>-->
        <!--</accordion-heading>-->
        <!--<ul class="module-create-options">-->

        <!--</ul>-->
        <!--</accordion-group>-->

        <!--Action Buttons-->
        <accordion-group is-open="accordion.accordions[6]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Action Buttons</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Action Buttons Background</span>
                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.actions_bg_color"></j-opt-color>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Action Buttons Border</span>
                    <span class="module-create-option">
                                <j-opt-border data-ng-model="settings.actions_border"></j-opt-border>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Action Buttons Padding <small>Top-Bottom / Left-Right</small></span>
                    <span class="module-create-option">
                                <j-opt-text data-ng-model="settings.actions_padding_tb"
                                            class="journal-number-field"></j-opt-text> x
                                <j-opt-text data-ng-model="settings.actions_padding_lr"
                                            class="journal-number-field"></j-opt-text>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <accordion-group is-open="false">
                    <accordion-heading>
                        <div class="accordion-bar bar-level-1">Compare Page Buttons</div>
                    </accordion-heading>
                    <ul class="module-create-options">

                        <li>
                            <span class="module-create-title">Add to Cart Color <small>Normal - Hover</small></span>
                            <span class="module-create-option">
                                <j-opt-color data-ng-model="settings.compare_add_color"></j-opt-color> -
                                <j-opt-color data-ng-model="settings.compare_add_color_hover"></j-opt-color>

                            </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Add to Cart Background Color <small>Normal - Hover</small></span>
                            <span class="module-create-option">
                                <j-opt-color data-ng-model="settings.compare_add_bg"></j-opt-color> -
                                <j-opt-color data-ng-model="settings.compare_add_bg_hover"></j-opt-color>

                            </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>

                        <li>
                            <span class="module-create-title">Remove Color <small>Normal - Hover</small></span>
                            <span class="module-create-option">
                                <j-opt-color data-ng-model="settings.compare_remove_color"></j-opt-color> -
                                <j-opt-color data-ng-model="settings.compare_remove_color_hover"></j-opt-color>

                        </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Remove Background Color <small>Normal - Hover</small></span>
                            <span class="module-create-option">
                                <j-opt-color data-ng-model="settings.compare_remove_bg"></j-opt-color> -
                                <j-opt-color data-ng-model="settings.compare_remove_bg_hover"></j-opt-color>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                    </ul>
                </accordion-group>
            </ul>
        </accordion-group>

        <!--Site Map-->
        <accordion-group is-open="accordion.accordions[7]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Site Map</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Top Category Font</span>
                    <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.site_map_top"></j-opt-font>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Sub Category Font</span>
                    <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.site_map_sub"></j-opt-font>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Background Color</span>
                    <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.site_map_bg"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Background Border Settings</span>
                    <span class="module-create-option">
                            <j-opt-border data-ng-model="settings.site_map_border"></j-opt-border>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Background Padding</span>
                    <span class="module-create-option">
                            <j-opt-text data-ng-model="settings.site_map_padding"
                                        class="journal-number-field"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

            </ul>
        </accordion-group>

        <!--ALERTS-->
        <accordion-group is-open="accordion.accordions[8]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Alerts</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Warning Font</span>
                    <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.warning_font"></j-opt-font>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Warning Background Color</span>
                    <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.warning_bg"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Warning Link Color</span>
                    <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.warning_font_color"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Warning Link Hover</span>
                    <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.warning_font_hover"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Success Font</span>
                    <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.success_font"></j-opt-font>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Success Link Color</span>
                    <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.success_font_color"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Success Link Hover</span>
                    <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.success_font_hover"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Success Background Color</span>
                    <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.success_bg"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
            </ul>
        </accordion-group>

        <!--MAINTENANCE-->
        <accordion-group is-open="accordion.accordions[9]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Maintenance Page</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Text Font</span>
                    <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.maintenance_title"></j-opt-font>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Text Line Height</span>
                    <span class="module-create-option">
                            <j-opt-text data-ng-model="settings.maintenance_line_height"
                                        class="journal-number-field"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Text Top Margin</span>
                    <span class="module-create-option">
                            <j-opt-text data-ng-model="settings.maintenance_padding"
                                        class="journal-number-field"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Content Background Color</span>
                    <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.maintenance_bg_color"
                                         class="journal-number-field"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Content Background Image</span>
                    <span class="module-create-option">
                            <j-opt-background data-ng-model="settings.maintenance_bg"
                                              class="journal-number-field"></j-opt-background>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Content Min Height</span>
                    <span class="module-create-option">
                            <j-opt-text data-ng-model="settings.maintenance_min_height"
                                        class="journal-number-field"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
            </ul>
        </accordion-group>

        <!--BLOG MANAGER-->
        <accordion-group is-open="accordion.accordions[10]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Blog Manager Extension <span>Opencart 1.5.6</span></div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Blog Post Title Font</span>
                    <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.blog_manager_post_title"></j-opt-font>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
            </ul>
        </accordion-group>
    </accordion>
</div>
