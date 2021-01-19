<div class="sticky">
    <div class="module-header">
        <div class='module-name'>Settings<span>Quick Checkout</span></div>

        <skin-manager data-url="settings/journalcheckout"></skin-manager>

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

        <!--General -->
        <accordion-group is-open="accordion.accordions[0]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">General</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Active Checkout</span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.one_page_status">
                                <switch-option key="default">Default</switch-option>
                                <switch-option key="one-page">Quick Checkout &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li data-ng-show="settings.one_page_status == 'one-page'">
                    <span class="module-create-title">Default Authentication</span>
                             <span class="module-create-option">
                                <switch data-ng-model="settings.one_page_default_auth">
                                    <switch-option key="register">Register</switch-option>
                                    <switch-option key="guest">Guest</switch-option>
                                    <switch-option key="login">Login</switch-option>
                                </switch>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li data-ng-show="settings.one_page_status == 'one-page'">
                    <span class="module-create-title">Auto Save Fields<small>Needed by some payment / shipping methods. Should be set to Off by default. </small></span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.one_page_auto_save">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li data-ng-show="settings.one_page_status == 'one-page'">
                    <span class="module-create-title">Main Container Background</span>
                            <span class="module-create-option">
                                <j-opt-color data-ng-model="settings.one_page_main_bg"></j-opt-color>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li data-ng-show="settings.one_page_status == 'one-page'">
                    <span class="module-create-title">Main Container Padding <small>Top-Right-Bottom-Left</small></span>
                        <span class="module-create-option">
                            <j-opt-text data-ng-model="settings.one_page_main_padding_t" class="journal-sort"></j-opt-text> -
                            <j-opt-text data-ng-model="settings.one_page_main_padding_r" class="journal-sort"></j-opt-text> -
                            <j-opt-text data-ng-model="settings.one_page_main_padding_b" class="journal-sort"></j-opt-text> -
                            <j-opt-text data-ng-model="settings.one_page_main_padding_l" class="journal-sort"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
            </ul>
        </accordion-group>

        <!-- Page Title-->
        <accordion-group is-open="accordion.accordions[1]" data-ng-show="settings.one_page_status == 'one-page'">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Page Title</div>
            </accordion-heading>
            <ul>
                <li>
                    <span class="module-create-title">Status</span>
                    <span class="module-create-option">
                                <switch data-ng-model="settings.one_page_title_status">
                                    <switch-option key="on">ON</switch-option>
                                    <switch-option key="off">OFF</switch-option>
                                </switch>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Page Title Text</span>
                        <span class="module-create-option">
                            <j-opt-text-lang data-ng-model="settings.one_page_title"></j-opt-text-lang>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Page Title Font</span>
                            <span class="module-create-option">
                                <j-opt-font data-ng-model="settings.one_page_title_font"></j-opt-font>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Page Title Background</span>
                            <span class="module-create-option">
                                <j-opt-color data-ng-model="settings.one_page_title_bg"></j-opt-color>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Border Settings</span>
                            <span class="module-create-option">
                                <j-opt-border data-ng-model="settings.one_page_title_border"></j-opt-border>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Line Height <small>Vertical Centering</small></span>
                            <span class="module-create-option">
                                <j-opt-text data-ng-model="settings.one_page_title_line_height" class="journal-number-field"></j-opt-text>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Padding <small>Left - Right</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.one_page_title_padding_left" class="journal-sort"></j-opt-text> -
                        <j-opt-text data-ng-model="settings.one_page_title_padding_right" class="journal-sort"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Title Align</span>
                            <span class="module-create-option">
                                <switch data-ng-model="settings.one_page_title_align">
                                    <switch-option key="left">Left</switch-option>
                                    <switch-option key="center">Center</switch-option>
                                    <switch-option key="right">Right</switch-option>
                                </switch>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

            </ul>
        </accordion-group>

        <!--Sections-->
        <accordion-group is-open="accordion.accordions[2]" data-ng-show="settings.one_page_status == 'one-page'">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Sections</div>
            </accordion-heading>
            <ul>
                <li>
                    <span class="module-create-title">Section Font</span>
                        <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.one_page_section_font"></j-opt-font>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Section Background Color</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.one_page_section_bg"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Section Padding</span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.one_page_section_padding" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Section Border Settings</span>
                        <span class="module-create-option">
                            <j-opt-border data-ng-model="settings.one_page_section_border_settings"></j-opt-border>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Dividers Border Color</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.one_page_dividers_color"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Dividers Border Style</span>
                            <span class="module-create-option">
                                <switch data-ng-model="settings.one_page_dividers_style">
                                    <switch-option key="solid">Solid</switch-option>
                                    <switch-option key="dashed">Dashed</switch-option>
                                    <switch-option key="dotted">Dotted</switch-option>
                                </switch>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Hide Shipping Option Label</span>
                            <span class="module-create-option">
                                <switch data-ng-model="settings.one_page_hide_shipping_option_label">
                                    <switch-option key="none">ON</switch-option>
                                    <switch-option key="block">OFF</switch-option>
                                </switch>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
            </ul>

            <!--Text Input Fields-->
            <accordion>
                <accordion-group is-open="false">
                    <accordion-heading>
                        <div class="accordion-bar bar-level-1">Text Input Fields</div>
                    </accordion-heading>
                    <ul class="module-create-options">
                        <li>
                            <span class="module-create-title">Text Input Color</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.one_page_text_input_color"></j-opt-color>
                        </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Text Input Background Color</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.one_page_text_input_bg"></j-opt-color>
                        </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>

                        <li>
                            <span class="module-create-title">Text Input Border</span>
                        <span class="module-create-option">
                            <j-opt-border data-ng-model="settings.one_page_text_input_border"></j-opt-border>
                        </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>

                        <li>
                            <span class="module-create-title">Show Fax Input Field</span>
                                 <span class="module-create-option">
                                    <switch data-ng-model="settings.one_page_show_fax">
                                        <switch-option key="block">ON</switch-option>
                                        <switch-option key="none">OFF</switch-option>
                                    </switch>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Show Company Input Field</span>
                                 <span class="module-create-option">
                                    <switch data-ng-model="settings.one_page_show_company">
                                        <switch-option key="block">ON</switch-option>
                                        <switch-option key="none">OFF</switch-option>
                                    </switch>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Show Address 2 Input Field</span>
                                 <span class="module-create-option">
                                    <switch data-ng-model="settings.one_page_show_address_2">
                                        <switch-option key="block">ON</switch-option>
                                        <switch-option key="none">OFF</switch-option>
                                    </switch>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Telephone Field Required</span>
                            <span class="module-create-option">
                                    <switch data-ng-model="settings.one_page_phone_required">
                                        <switch-option key="block">ON</switch-option>
                                        <switch-option key="none">OFF</switch-option>
                                    </switch>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li data-ng-show="settings.one_page_phone_required === 'none'">
                            <span class="module-create-title">Show Telephone Field</span>
                            <span class="module-create-option">
                                    <switch data-ng-model="settings.one_page_show_phone">
                                        <switch-option key="block">ON</switch-option>
                                        <switch-option key="none">OFF</switch-option>
                                    </switch>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                    </ul>
                    </accordion-group>
            </accordion>
        </accordion-group>

        <!--Section Titles-->
        <accordion-group is-open="accordion.accordions[3]" data-ng-show="settings.one_page_status == 'one-page'">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Section Titles</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Section Title Font</span>
                            <span class="module-create-option">
                                <j-opt-font data-ng-model="settings.one_page_section_title_font"></j-opt-font>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Section Title Background</span>
                            <span class="module-create-option">
                                <j-opt-color data-ng-model="settings.one_page_section_title_bg"></j-opt-color>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Section Title Border</span>
                            <span class="module-create-option">
                                <j-opt-border data-ng-model="settings.one_page_section_title_border"></j-opt-border>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Section Title Padding <small>Top-Right-Bottom-Left</small></span>
                        <span class="module-create-option">
                            <j-opt-text data-ng-model="settings.one_page_section_padding_t" class="journal-sort"></j-opt-text> -
                            <j-opt-text data-ng-model="settings.one_page_section_padding_r" class="journal-sort"></j-opt-text> -
                            <j-opt-text data-ng-model="settings.one_page_section_padding_b" class="journal-sort"></j-opt-text> -
                            <j-opt-text data-ng-model="settings.one_page_section_padding_l" class="journal-sort"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Section Title Text Align</span>
                            <span class="module-create-option">
                                <switch data-ng-model="settings.one_page_section_title_align">
                                    <switch-option key="left">Left</switch-option>
                                    <switch-option key="center">Center</switch-option>
                                    <switch-option key="right">Right</switch-option>
                                </switch>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
            </ul>
            <accordion>
                <!--Titles Language-->
                <accordion-group is-open="false">
                    <accordion-heading>
                        <div class="accordion-bar bar-level-1">Titles Language</div>
                    </accordion-heading>
                    <ul class="module-create-options">
                        <li>
                            <span class="module-create-title">Register / Login Selector</span>
                                <span class="module-create-option">
                                    <j-opt-text-lang data-ng-model="settings.one_page_lang_register_selector"></j-opt-text-lang>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Your Personal Details</span>
                                <span class="module-create-option">
                                    <j-opt-text-lang data-ng-model="settings.one_page_lang_pers_details"></j-opt-text-lang>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Your Password</span>
                                <span class="module-create-option">
                                    <j-opt-text-lang data-ng-model="settings.one_page_lang_your_pass"></j-opt-text-lang>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Your Address</span>
                                <span class="module-create-option">
                                    <j-opt-text-lang data-ng-model="settings.one_page_lang_your_address"></j-opt-text-lang>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Billing Address</span>
                                <span class="module-create-option">
                                    <j-opt-text-lang data-ng-model="settings.one_page_lang_bill_address"></j-opt-text-lang>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Shipping Address</span>
                                <span class="module-create-option">
                                    <j-opt-text-lang data-ng-model="settings.one_page_lang_ship_address"></j-opt-text-lang>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Returning Customer</span>
                                <span class="module-create-option">
                                    <j-opt-text-lang data-ng-model="settings.one_page_lang_returning"></j-opt-text-lang>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Shipping Method</span>
                                <span class="module-create-option">
                                    <j-opt-text-lang data-ng-model="settings.one_page_lang_ship_method"></j-opt-text-lang>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Payment Method</span>
                                <span class="module-create-option">
                                    <j-opt-text-lang data-ng-model="settings.one_page_lang_payment_method"></j-opt-text-lang>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Coupon / Voucher</span>
                                <span class="module-create-option">
                                    <j-opt-text-lang data-ng-model="settings.one_page_lang_coupon_voucher"></j-opt-text-lang>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Payment Details</span>
                                <span class="module-create-option">
                                    <j-opt-text-lang data-ng-model="settings.one_page_lang_payment_details"></j-opt-text-lang>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Shopping Cart</span>
                                <span class="module-create-option">
                                    <j-opt-text-lang data-ng-model="settings.one_page_lang_shop_cart"></j-opt-text-lang>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Comments About Order</span>
                                <span class="module-create-option">
                                    <j-opt-text-lang data-ng-model="settings.one_page_lang_comments"></j-opt-text-lang>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                    </ul>
                </accordion-group>
            </accordion>
        </accordion-group>

        <!--Coupon/Voucher-->
        <accordion-group is-open="accordion.accordions[4]" data-ng-show="settings.one_page_status == 'one-page'">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Coupon / Voucher</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Coupon Status</span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.one_page_coupon_status">
                                <switch-option key="on">ON</switch-option>
                                <switch-option key="off">OFF</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Voucher Status</span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.one_page_voucher_status">
                                <switch-option key="on">ON</switch-option>
                                <switch-option key="off">OFF</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Reward Points Status</span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.one_page_reward_status">
                                <switch-option key="on">ON</switch-option>
                                <switch-option key="off">OFF</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Coupon Button Text</span>
                                        <span class="module-create-option">
                                            <j-opt-text-lang data-ng-model="settings.one_page_lang_coupon_button"></j-opt-text-lang>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Coupon Placeholder Text</span>
                                        <span class="module-create-option">
                                            <j-opt-text-lang data-ng-model="settings.one_page_lang_coupon_placeholder"></j-opt-text-lang>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Voucher Button Text</span>
                                        <span class="module-create-option">
                                            <j-opt-text-lang data-ng-model="settings.one_page_lang_voucher_button"></j-opt-text-lang>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Voucher Placeholder Text</span>
                                        <span class="module-create-option">
                                            <j-opt-text-lang data-ng-model="settings.one_page_lang_voucher_placeholder"></j-opt-text-lang>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Rewards Button Text</span>
                                        <span class="module-create-option">
                                            <j-opt-text-lang data-ng-model="settings.one_page_lang_reward_button"></j-opt-text-lang>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Rewards Placeholder Text</span>
                                        <span class="module-create-option">
                                            <j-opt-text-lang data-ng-model="settings.one_page_lang_reward_placeholder"></j-opt-text-lang>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

            </ul>

            <!--Coupon/Voucher Buttons-->
            <accordion>
                <accordion-group is-open="false">
                    <accordion-heading>
                        <div class="accordion-bar bar-level-1">Coupon / Voucher Buttons</div>
                    </accordion-heading>
                    <ul>

                        <li>
                            <span class="module-create-title">Buttons Font</span>
                                <span class="module-create-option">
                                    <j-opt-font data-ng-model="settings.one_page_coupon_voucher_button_font"></j-opt-font>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Font Hover Color</span>
                <span class="module-create-option">
                    <j-opt-color data-ng-model="settings.one_page_coupon_voucher_button_font_hover"></j-opt-color>
                </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>


                        <li>
                            <span class="module-create-title">Background <small>Color - Image</small></span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.one_page_coupon_voucher_button_bg"></j-opt-color> -
                                    <j-opt-background data-ng-model="settings.one_page_coupon_voucher_button_bg_image"></j-opt-background>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>


                        <li>
                            <span class="module-create-title">Background Hover <small>Color - Image</small></span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.one_page_coupon_voucher_button_bg_hover"></j-opt-color> -
                                    <j-opt-background data-ng-model="settings.one_page_coupon_voucher_button_bg_image_hover"></j-opt-background>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>

                        <li>
                            <span class="module-create-title">Border Settings</span>
                <span class="module-create-option">
                    <j-opt-border data-ng-model="settings.one_page_coupon_voucher_button_border"></j-opt-border>
                </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>

                        <li>
                            <span class="module-create-title">Border Hover Color</span>
                            <span class="module-create-option">
                                <j-opt-color data-ng-model="settings.one_page_coupon_voucher_button_border_hover"></j-opt-color>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>

                        <li>
                            <span class="module-create-title">Inner Shadow <small>Push Effect</small></span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.one_page_coupon_voucher_button_active_shadow">
                                <switch-option key="inset 0 1px 10px rgba(0, 0, 0, 0.8)">ON</switch-option>
                                <switch-option key="none">OFF</switch-option>
                            </switch>
                        </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>

                        <li>
                            <span class="module-create-title">Button Shadow</span>
                            <span class="module-create-option">
                                <j-opt-shadow data-ng-model="settings.cv_button_shadow" data-bgcolor="true"></j-opt-shadow>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Shadow Hover</span>
                            <span class="module-create-option">
                                <j-opt-shadow data-ng-model="settings.cv_button_shadow_hover" data-bgcolor="true"></j-opt-shadow>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Shadow Active <small>Push Effect</small></span>
                            <span class="module-create-option">
                                <j-opt-shadow data-ng-model="settings.cv_button_shadow_active" data-bgcolor="true"></j-opt-shadow>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>

                    </ul>
                </accordion-group>

            </accordion>
        </accordion-group>
        <!--Shopping Cart Table-->
        <accordion-group is-open="accordion.accordions[5]" data-ng-show="settings.one_page_status == 'one-page'">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Shopping Cart Table</div>
            </accordion-heading>
            <ul>
                <li>
                    <span class="module-create-title">Table Height <small>Generates Scrollbar</small></span>
                                        <span class="module-create-option">
                                            <j-opt-text data-ng-model="settings.one_page_table_height" class="journal-number-field"></j-opt-text>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Table Border Color</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.one_page_table_border"></j-opt-color>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Table Border Style</span>
                            <span class="module-create-option">
                                <switch data-ng-model="settings.one_page_table_style">
                                    <switch-option key="solid">Solid</switch-option>
                                    <switch-option key="dashed">Dashed</switch-option>
                                    <switch-option key="dotted">Dotted</switch-option>
                                </switch>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Header/Footer Background</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.one_page_table_header_bg"></j-opt-color>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Table Head Font</span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.one_page_table_header_font"></j-opt-font>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Table Footer Font</span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.one_page_table_footer_font"></j-opt-font>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Product Name Font</span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.one_page_table_product_name_font"></j-opt-font>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Product Name Font Hover</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.one_page_table_product_name_hover"></j-opt-color>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Product Image Border</span>
                                    <span class="module-create-option">
                                        <j-opt-border data-ng-model="settings.one_page_text_product_image_border"></j-opt-border>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <accordion-group is-open="false">
                    <accordion-heading>
                        <div class="accordion-bar bar-level-1">Update / Remove Buttons <span>Opencart 2.x only</span></div>
                    </accordion-heading>
                    <ul class="module-create-options">
                        <li>
                            <span class="module-create-title">Update Icon Color</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.one_page_update_button_icon_color"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Update Background Color</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.one_page_update_button_bg_color"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Update Icon Hover</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.one_page_update_button_icon_hover"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Update Background Hover</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.one_page_update_button_bg_hover"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>

                        <li>
                            <span class="module-create-title">Delete Icon Color</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.one_page_delete_button_icon_color"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Delete Background Color</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.one_page_delete_button_bg_color"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Delete Icon Hover</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.one_page_delete_button_icon_hover"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Delete Background Hover</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.one_page_delete_button_bg_hover"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>

                    </ul>
                </accordion-group>
            </ul>
        </accordion-group>
        <!-- Confirm Button-->
        <accordion-group is-open="accordion.accordions[6]" data-ng-show="settings.one_page_status == 'one-page'">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Confirm Order</div>
            </accordion-heading>
            <ul>
                <li>
                    <span class="module-create-title">Newsletter Subscribe</span>
                            <span class="module-create-option">
                                <switch data-ng-model="settings.one_page_hide_newsletter">
                                    <switch-option key="block">ON</switch-option>
                                    <switch-option key="none">OFF</switch-option>
                                </switch>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Agree to Privacy Policy</span>
                            <span class="module-create-option">
                                This is edited from <strong>Opencart > System > Settings > Option > Account > Account Terms</strong>.
                            </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Agree to Terms</span>
                            <span class="module-create-option">
                                This is edited from <strong>Opencart > System > Settings > Option > Checkout > Checkout Terms</strong>.
                            </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

            </ul>
            <accordion-group is-open="false">
                <accordion-heading>
                    <div class="accordion-bar bar-level-1">Confirm Button</div>
                </accordion-heading>
                <ul>
                    <li>
                        <span class="module-create-title">Confirm Button Text</span>
                        <span class="module-create-option">
                            <j-opt-text-lang data-ng-model="settings.one_page_lang_confirm_order"></j-opt-text-lang>
                        </span>
                        <a href="#" target="_blank" class="journal-tip"></a>
                    </li>
                    <li>
                        <span class="module-create-title">Button Loading Text</span>
                        <span class="module-create-option">
                            <j-opt-text-lang data-ng-model="settings.one_page_lang_loading_text"></j-opt-text-lang>
                        </span>
                        <a href="#" target="_blank" class="journal-tip"></a>
                    </li>
                    <li>
                        <span class="module-create-title">Button Align</span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.one_page_confirm_button_align">
                                <switch-option key="left">Left</switch-option>
                                <switch-option key="center">Center</switch-option>
                                <switch-option key="right">Right</switch-option>
                            </switch>
                        </span>
                        <a href="#" target="_blank" class="journal-tip"> </a>
                    </li>

                    <li>
                        <span class="module-create-title">Button Font</span>
                <span class="module-create-option">
                    <j-opt-font data-ng-model="settings.one_page_confirm_button_font"></j-opt-font>
                </span>
                        <a href="#" target="_blank" class="journal-tip"></a>
                    </li>
                    <li>
                        <span class="module-create-title">Font Hover Color</span>
                <span class="module-create-option">
                    <j-opt-color data-ng-model="settings.one_page_confirm_button_font_hover"></j-opt-color>
                </span>
                        <a href="#" target="_blank" class="journal-tip"></a>
                    </li>


                    <li>
                        <span class="module-create-title">Background <small>Color - Image</small></span>
                <span class="module-create-option">
                    <j-opt-color data-ng-model="settings.one_page_confirm_button_bg"></j-opt-color> -
                    <j-opt-background data-ng-model="settings.one_page_confirm_button_bg_image"></j-opt-background>
                </span>
                        <a href="#" target="_blank" class="journal-tip"></a>
                    </li>


                    <li>
                        <span class="module-create-title">Background Hover <small>Color - Image</small></span>
                <span class="module-create-option">
                    <j-opt-color data-ng-model="settings.one_page_confirm_button_bg_hover"></j-opt-color> -
                    <j-opt-background data-ng-model="settings.one_page_confirm_button_bg_image_hover"></j-opt-background>
                </span>
                        <a href="#" target="_blank" class="journal-tip"></a>
                    </li>

                    <li>
                        <span class="module-create-title">Border Settings</span>
                <span class="module-create-option">
                    <j-opt-border data-ng-model="settings.one_page_confirm_button_border"></j-opt-border>
                </span>
                        <a href="#" target="_blank" class="journal-tip"></a>
                    </li>

                    <li>
                        <span class="module-create-title">Border Hover Color</span>
                            <span class="module-create-option">
                                <j-opt-color data-ng-model="settings.one_page_confirm_button_border_hover"></j-opt-color>
                            </span>
                        <a href="#" target="_blank" class="journal-tip"></a>
                    </li>

                    <li>
                        <span class="module-create-title">Button Width <small>Padding Left / Right</small></span>
                        <span class="module-create-option">
                            <j-opt-text data-ng-model="settings.one_page_confirm_button_width" class="journal-number-field"></j-opt-text>
                        </span>
                        <a href="#" target="_blank" class="journal-tip"></a>
                    </li>

                    <li>
                        <span class="module-create-title">Button Height </span>
                        <span class="module-create-option">
                            <j-opt-text data-ng-model="settings.one_page_confirm_button_height" class="journal-number-field"></j-opt-text>
                        </span>
                        <a href="#" target="_blank" class="journal-tip"></a>
                    </li>

                    <li>
                        <span class="module-create-title">Button Shadow</span>
                        <span class="module-create-option">
                                <j-opt-shadow data-ng-model="settings.qc_button_shadow" data-bgcolor="true"></j-opt-shadow>
                                </span>
                        <a href="#" target="_blank" class="journal-tip"> </a>
                    </li>
                    <li>
                        <span class="module-create-title">Shadow Hover</span>
                        <span class="module-create-option">
                                <j-opt-shadow data-ng-model="settings.qc_button_shadow_hover" data-bgcolor="true"></j-opt-shadow>
                                </span>
                        <a href="#" target="_blank" class="journal-tip"> </a>
                    </li>
                    <li>
                        <span class="module-create-title">Shadow Active <small>Push Effect</small></span>
                        <span class="module-create-option">
                                <j-opt-shadow data-ng-model="settings.qc_button_shadow_active" data-bgcolor="true"></j-opt-shadow>
                                </span>
                        <a href="#" target="_blank" class="journal-tip"> </a>
                    </li>

                </ul>
            </accordion-group>
        </accordion-group>

</accordion>
</div>
