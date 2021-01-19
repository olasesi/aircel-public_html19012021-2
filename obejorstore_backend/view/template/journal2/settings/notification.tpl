<div class="sticky">
<div class="module-header">
    <div class='module-name'>Settings<span>Notification</span></div>

    <skin-manager data-url="settings/notification"></skin-manager>

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
        <!--Notification-->
        <accordion-group is-open="accordion.accordions[0]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">General</div>
            </accordion-heading>
            <ul class="module-create-options">

                <li>
                    <span class="module-create-title">Status</span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.notification_status">
                                <switch-option key="block">ON</switch-option>
                                <switch-option key="none">OFF</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>


                <li  data-ng-show="settings.notification_status == 'block'">
                    <span class="module-create-title">Position</span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.notification_position">
                                <switch-option key="top-left">Top Left</switch-option>
                                <switch-option key="top-center">Top Center</switch-option>
                                <switch-option key="top-right">Top Right</switch-option>
                                <switch-option key="center">Center</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li  data-ng-show="settings.notification_status == 'block'">
                    <span class="module-create-title">Show Close Button</span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.notification_show_close">
                                <switch-option key="hover">Hover</switch-option>
                                <switch-option key="always">Always</switch-option>
                                <switch-option key="never">Never</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li  data-ng-show="settings.notification_status == 'block' && settings.notification_show_close == 'hover' || settings.notification_show_close == 'always'">
                    <span class="module-create-title">Close Button Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.notification_close_color"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li  data-ng-show="settings.notification_status == 'block' && settings.notification_show_close == 'hover' || settings.notification_show_close == 'always'">
                    <span class="module-create-title">Close Button Hover Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.notification_close_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li  data-ng-show="settings.notification_status == 'block'">
                    <span class="module-create-title">Close Button Offset <small>Top - Right</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.notification_offset_top" class="journal-sort"></j-opt-text> -
                        <j-opt-text data-ng-model="settings.notification_offset_right" class="journal-sort"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li  data-ng-show="settings.notification_status == 'block'">
                    <span class="module-create-title">Container Width</span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.notification_width" placeholder="350" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li  data-ng-show="settings.notification_status == 'block'">
                    <span class="module-create-title">Hide Notification After</span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.notification_hide" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li  data-ng-show="settings.notification_status == 'block'">
                    <span class="module-create-title">Shadow</span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.notification_shadow">
                                <switch-option key="1">ON</switch-option>
                                <switch-option key="0">OFF</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li  data-ng-show="settings.notification_status == 'block'">
                    <span class="module-create-title">Background Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.notification_bg_color"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li  data-ng-show="settings.notification_status == 'block'">
                    <span class="module-create-title">Border Settings</span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="settings.notification_border"></j-opt-border>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li  data-ng-show="settings.notification_status == 'block'">
                    <span class="module-create-title">Title Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.notification_title_font"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li  data-ng-show="settings.notification_status == 'block'">
                    <span class="module-create-title">Title Background</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.notification_title_bg"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li  data-ng-show="settings.notification_status == 'block'">
                    <span class="module-create-title">Title Border Settings</span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="settings.notification_title_border"></j-opt-border>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li  data-ng-show="settings.notification_status == 'block'">
                    <span class="module-create-title">Text Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.notification_text_font"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li  data-ng-show="settings.notification_status == 'block'">
                    <span class="module-create-title">Link Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.notification_text_link_color"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li  data-ng-show="settings.notification_status == 'block'">
                    <span class="module-create-title">Link Hover Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.notification_text_link_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li  data-ng-show="settings.notification_status == 'block'">
                    <span class="module-create-title">Show Product Image</span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.notification_show_image">
                                <switch-option key="block">ON</switch-option>
                                <switch-option key="none">OFF</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li  data-ng-show="settings.notification_status == 'block' && settings.notification_show_image == 'block'">
                    <span class="module-create-title">Image Border Settings</span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="settings.notification_image_border"></j-opt-border>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <accordion data-ng-show="settings.notification_status == 'block'">

                <accordion-group is-open="true">
                        <accordion-heading>
                            <div class="accordion-bar bar-level-1">Cart / Checkout Buttons</div>
                        </accordion-heading>
                        <ul class="module-create-options">

                            <li  data-ng-show="settings.notification_status == 'block'">
                                <span class="module-create-title">Buttons Status</span>
                                <span class="module-create-option">
                                    <switch data-ng-model="settings.notification_buttons_status">
                                        <switch-option key="block">ON</switch-option>
                                        <switch-option key="none">OFF</switch-option>
                                    </switch>
                                </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>

                            <li data-ng-show="settings.notification_buttons_status == 'block'">
                                <span class="module-create-title">View Cart Font</span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.notification_cart_button_font"></j-opt-font>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>

                            <li data-ng-show="settings.notification_buttons_status == 'block'">
                                <span class="module-create-title">View Cart Font Hover</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.notification_cart_button_color_hover"></j-opt-color>
                                </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li data-ng-show="settings.notification_buttons_status == 'block'">
                                <span class="module-create-title">View Cart Background <small>Color - Image</small></span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.notification_cart_button_bg_color"></j-opt-color> -
                                    <j-opt-background data-ng-model="settings.notification_cart_button_bg_color_image"></j-opt-background>
                                </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>

                            <li data-ng-show="settings.notification_buttons_status == 'block'">
                                <span class="module-create-title">View Cart Background Hover <small>Color - Image</small></span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.notification_cart_button_bg_hover_color"></j-opt-color> -
                                    <j-opt-background data-ng-model="settings.notification_cart_button_bg_color_image_hover"></j-opt-background>

                                </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>

                            <li data-ng-show="settings.notification_buttons_status == 'block'">
                                <span class="module-create-title">Checkout Cart Font</span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.notification_checkout_button_font"></j-opt-font>
                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>

                            <li data-ng-show="settings.notification_buttons_status == 'block'">
                                <span class="module-create-title">Checkout Font Hover</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.notification_checkout_button_color_hover"></j-opt-color>
                                </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li data-ng-show="settings.notification_buttons_status == 'block'">
                                <span class="module-create-title">Checkout Background <small>Color - Image</small></span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.notification_checkout_button_bg_color"></j-opt-color> -
                                    <j-opt-background data-ng-model="settings.notification_checkout_button_bg_color_image"></j-opt-background>
                                </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li data-ng-show="settings.notification_buttons_status == 'block'">
                                <span class="module-create-title">Checkout Background Hover <small>Color - Image</small></span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.notification_checkout_button_bg_hover_color"></j-opt-color> -
                                    <j-opt-background data-ng-model="settings.notification_checkout_button_bg_color_image_hover"></j-opt-background>
                                </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li>
                                <span class="module-create-title">Button Shadow</span>
                                <span class="module-create-option">
                                <j-opt-shadow data-ng-model="settings.noti_button_shadow" data-bgcolor="true"></j-opt-shadow>
                                </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li>
                                <span class="module-create-title">Shadow Hover</span>
                                <span class="module-create-option">
                                <j-opt-shadow data-ng-model="settings.noti_button_shadow_hover" data-bgcolor="true"></j-opt-shadow>
                                </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li>
                                <span class="module-create-title">Shadow Active <small>Push Effect</small></span>
                                <span class="module-create-option">
                                <j-opt-shadow data-ng-model="settings.noti_button_shadow_active" data-bgcolor="true"></j-opt-shadow>
                                </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                        </ul>
                    </accordion-group>
                </accordion>
            </ul>
        </accordion-group>

    </accordion>
</div>
