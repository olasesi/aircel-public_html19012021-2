<div class="sticky">
<div class="module-header">
    <div class='module-name'>Header<span>General</span></div>
    <skin-manager data-url="settings/header"></skin-manager>
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
        <accordion-group is-open="accordion.accordions[0]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">General</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Boxed Header</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.boxed_header">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li data-ng-hide="settings.boxed_header == '0'">
                    <span class="module-create-title">Optional Top Spacing</span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.boxed_top_spacing" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Header Type</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.header_type">
                            <switch-option key="default">Classic</switch-option>
                            <switch-option key="extended">Slim</switch-option>
                            <switch-option key="center">Central</switch-option>
                            <switch-option key="mega">Mega</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li data-ng-hide="settings.header_type == 'center' || settings.header_type == 'mega'">
                    <span class="module-create-title">Logo Background <small>Color - Image</small></span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.logo_bg_color"></j-opt-color> -
                        <j-opt-background data-ng-model="settings.logo_bg_image"></j-opt-background>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li data-ng-show="settings.header_type == 'center' || settings.header_type == 'mega'">
                    <span class="module-create-title">Logo Background <small>Color - Image</small></span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.center_logo_bg_color"></j-opt-color> -
                        <j-opt-background data-ng-model="settings.center_logo_bg_image"></j-opt-background>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Header Background <small>Home Page</small> </span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.header_bg_color"></j-opt-color> -
                        <j-opt-background data-ng-model="settings.header_bg_default"></j-opt-background>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Header Background <small>All other pages (optional)</small></span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.header_bg_color_pages"></j-opt-color> -
                        <j-opt-background data-ng-model="settings.header_bg_pages"></j-opt-background>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li data-ng-show="settings.header_type == 'mega'">
                    <span class="module-create-title">Logo Align</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.mega_header_align_2">
                            <switch-option key="left">Left</switch-option>
                            <switch-option key="center">Center &nbsp;&nbsp;&nbsp;</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li data-ng-show="settings.header_type == 'center' || settings.header_type == 'mega'">
                    <span class="module-create-title">Show Top Menus Bar <small>OFF will remove Top Menus + Language/Currency</small></span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.remove_top_bar">
                            <switch-option key="on">ON</switch-option>
                            <switch-option key="off">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li data-ng-hide="settings.remove_top_bar == 'off' || settings.header_type == 'default' || settings.header_type == 'extended' || settings.header_type == 'compact'">
                    <span class="module-create-title">Top Bar Height <small>Central or Mega Headers Only</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.top_bar_height" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li data-ng-show="settings.header_type == 'center' || settings.header_type == 'mega'">
                    <span class="module-create-title">Logo Area Height <small>Central or Mega Headers Only</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.header_height_input" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li data-ng-show="settings.header_type == 'center' || settings.header_type == 'mega'">
                    <span class="module-create-title"> Main Menu Bar Height <small>Central or Mega Headers Only</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.main_menu_height" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li data-ng-hide="settings.remove_top_bar == 'off' || settings.header_type == 'compact'">
                    <span class="module-create-title">Top Bar Background Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.top_bar_bg_color"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li data-ng-hide="settings.header_type == 'default' || settings.header_type == 'extended' || settings.header_type == 'compact' || settings.remove_top_bar == 'off'">
                    <span class="module-create-title">Top Bar Border Color <small>Central / Mega Headers</small></span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.center_top_menu_border"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li data-ng-hide="settings.header_type == 'default' || settings.header_type == 'extended' || settings.header_type == 'compact' || settings.remove_top_bar == 'off'">
                    <span class="module-create-title">Top Bar Border Type</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.top_bar_divider_type">
                            <switch-option key="solid">Solid</switch-option>
                            <switch-option key="dashed">Dashed</switch-option>
                            <switch-option key="dotted">Dotted</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li data-ng-hide="settings.header_type == 'compact'">
                    <span class="module-create-title">Top Bar Shadow</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.top_bar_shadow_type">
                            <switch-option key="none">None</switch-option>
                            <switch-option key="default">Default</switch-option>
                            <switch-option key="custom">Custom</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li data-ng-hide="settings.header_type == 'compact' || settings.top_bar_shadow_type !== 'custom'">
                    <span class="module-create-title">Custom Top Bar Shadow</span>
                    <span class="module-create-option">
                       <j-opt-shadow data-ng-model="settings.top_bar_shadow" data-bgcolor="true"></j-opt-shadow>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Header Shadow</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.header_box_shadow_type">
                            <switch-option key="none">None</switch-option>
                            <switch-option key="default">Default</switch-option>
                            <switch-option key="custom">Custom</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li data-ng-hide="settings.header_box_shadow_type !== 'custom'">
                    <span class="module-create-title">Custom Header Shadow</span>
                    <span class="module-create-option">
                        <j-opt-shadow data-ng-model="settings.header_box_shadow" data-bgcolor="true"></j-opt-shadow>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Retina Logo <small>Retina logo dimensions must be twice as large as your normal logo.</small></span>
                    <span class="module-create-option">
                        <j-opt-image data-ng-model="settings.retina_logo"></j-opt-image>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Retina Logo Height Ratio</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.logo_ratio">
                            <switch-option key="on">ON</switch-option>
                            <switch-option key="off">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Enable Logo on Phone</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.logo_on_phone">
                            <switch-option key="on">ON</switch-option>
                            <switch-option key="off">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li data-ng-hide="settings.logo_on_phone == 'off'">
                    <span class="module-create-title">Logo Area Height on Phone <small>Use this to make the logo container height smaller on phones.</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.header_height_input_phone" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li data-ng-hide="settings.logo_on_phone == 'off'">
                    <span class="module-create-title">Logo Image Max Width on Phone <small>Use this to make the logo image smaller on phones.</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.logo_height_phone" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <!--Sticky-->
                <accordion-group is-open="true">
                    <accordion-heading>
                        <div class="accordion-bar bar-level-1">Sticky Header</div>
                    </accordion-heading>

                    <li>
                        <span class="module-create-title">Sticky Header</span>
                        <span class="module-create-option">
                        <switch data-ng-model="settings.sticky_header">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                        <a href="#" target="_blank" class="journal-tip"></a>
                    </li>
                    <li data-ng-show="settings.sticky_header == '1'">
                        <span class="module-create-title">Sticky Header Style</span>
                        <span class="module-create-option">
                        <switch data-ng-model="settings.sticky_header_style">
                            <switch-option key="default">Default</switch-option>
                            <switch-option key="menu">Menu</switch-option>
                            <switch-option key="full">Full</switch-option>
                        </switch>
                        </span>
                        <a href="#" target="_blank" class="journal-tip"></a>
                    </li>
                    <li>
                        <span class="module-create-title">Hide on Scroll Up</span>
                        <span class="module-create-option">
                        <switch data-ng-model="settings.sticky_header_hide">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                        <a href="#" target="_blank" class="journal-tip"></a>
                    </li>
                    <li data-ng-show="settings.sticky_header === '1' && settings.sticky_header_style === 'menu' || settings.sticky_header_style === 'central'">
                        <span class="module-create-title">Fullwidth Menu Background</span>
                        <span class="module-create-option">
                        <switch data-ng-model="settings.boxed_menu_off">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                        </span>
                    </li>
                    <li data-ng-show="settings.header_type == 'center' || settings.header_type == 'mega' && settings.sticky_header == '1'" data-ng-hide="settings.sticky_header_style == 'menu'">
                        <span class="module-create-title">Logo Area Height <small>Overwrites Logo Area Height</small></span>
                        <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.sticky_header_height_input" class="journal-number-field"></j-opt-text>
                    </span>
                        <a href="#" target="_blank" class="journal-tip"></a>
                    </li>

                    <li data-ng-show="settings.header_type == 'center' || settings.header_type == 'mega' && settings.sticky_header == '1'">
                        <span class="module-create-title"> Main Menu Bar Height <small>Overwrites Main Menu Bar Height</small></span>
                        <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.sticky_main_menu_height" class="journal-number-field"></j-opt-text
                    </span>
                        <a href="#" target="_blank" class="journal-tip"></a>
                    </li>
                    <li data-ng-show="settings.sticky_header == '1'" data-ng-hide="settings.sticky_header_style == 'menu'">
                        <span class="module-create-title">Sticky Header Background <small>Overwrites Header Background</small></span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.header_bg_sticky_color"></j-opt-color> -
                        <j-opt-background data-ng-model="settings.header_bg_sticky"></j-opt-background>
                        </span>
                        <a href="#" target="_blank" class="journal-tip"> </a>
                    </li>
                    <li data-ng-show="settings.sticky_header == '1'">
                        <span class="module-create-title">Sticky Menu Background <small>Overwrites Main Menu Bar Background</small></span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.menu_bg_sticky_bg_color"></j-opt-color> -
                        <j-opt-background data-ng-model="settings.menu_bg_image_sticky"></j-opt-background>
                        </span>
                        <a href="#" target="_blank" class="journal-tip"> </a>
                    </li>
                    <li data-ng-show="settings.sticky_header == '1'">
                        <span class="module-create-title">Sticky Menu Font Color <small>Overwrites Main Menu Bar Font Color <br /> Color - Hover</small></span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.menu_sticky_font_color"></j-opt-color> -
                            <j-opt-color data-ng-model="settings.menu_sticky_font_color_hover"></j-opt-color>
                        </span>
                        <a href="#" target="_blank" class="journal-tip"> </a>
                    </li>
                    <li data-ng-show="settings.sticky_header == '1'">
                        <span class="module-create-title">Sticky Menu Items Divider Color <small>Overwrites Main Menu Divider Color</small></span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.menu_sticky_border_color"></j-opt-color>
                        </span>
                        <a href="#" target="_blank" class="journal-tip"> </a>
                    </li>
                    <li data-ng-show="settings.sticky_header == '1'">
                        <span class="module-create-title">Sticky Menu Bar Border <small>Overwrites Main Menu Bar Border</small></span>
                        <span class="module-create-option">
                            <j-opt-border data-ng-model="settings.menu_sticky_border"></j-opt-border>
                        </span>
                        <a href="#" target="_blank" class="journal-tip"> </a>
                    </li>
                    <li data-ng-show="settings.sticky_header == '1'">
                        <span class="module-create-title">Sticky Header Shadow <small>Overwrites Header Shadow</small></span>
                        <span class="module-create-option">
                        <j-opt-shadow data-ng-model="settings.sticky_header_box_shadow" data-bgcolor="true"></j-opt-shadow>
                        </span>
                        <a href="#" target="_blank" class="journal-tip"> </a>
                    </li>

                    <li data-ng-show="settings.sticky_header === '1'">
                        <span class="module-create-title">Enable on Tablet</span>
                        <span class="module-create-option">
                        <switch data-ng-model="settings.sticky_header_tablet">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                        <a href="#" target="_blank" class="journal-tip"></a>
                    </li>

                </accordion-group>
            </ul>
        </accordion-group>
        <!-- Cart -->
        <accordion-group is-open="accordion.accordions[1]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Cart</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Heading Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.cart_heading_font"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li data-ng-hide="settings.header_type == 'center' || settings.header_type == 'mega' || settings.header_type == 'compact'">
                    <span class="module-create-title">Heading Background Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.cart_heading_bg"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li data-ng-show="settings.header_type == 'center' || settings.header_type == 'mega'">
                    <span class="module-create-title">Heading Background Color <small>Center / Mega Header</small></span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.cart_heading_bg_center"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li data-ng-show="settings.header_type == 'center' || settings.header_type == 'mega'">
                    <span class="module-create-title">Heading Background Hover <small>Center / Mega Header</small></span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.cart_heading_bg_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li data-ng-hide="settings.header_type == 'compact'">
                    <span class="module-create-title">Mobile Background Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.cart_heading_bg_mobile"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li data-ng-show="settings.header_type == 'center' || settings.header_type == 'mega'">
                    <span class="module-create-title">Heading Border Settings <small>Center / Mega Header</small></span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="settings.cart_heading_border"></j-opt-border>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li data-ng-show="settings.header_type == 'center' || settings.header_type == 'mega'">
                    <span class="module-create-title">Content Border Radius <small>Center / Mega Header</small></span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="settings.cart_heading_content_border" editor="hide-style"></j-opt-border>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Cart Icon</span>
                    <span class="module-create-option">
                        <j-opt-icon data-ng-model="settings.cart_heading_icon"></j-opt-icon>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Cart Icon Hover</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.cart_icon_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Cart Icon Background</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.cart_heading_icon_bg"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Cart Icon Background Hover</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.cart_heading_icon_bg_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Mobile Cart Icon Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.cart_icon_mobile"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Mobile Cart Icon Background Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.cart_icon_bg_mobile"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Cart Icon Divider Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.cart_icon_divider"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Cart Icon Divider Type</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.cart_icon_divider_type">
                            <switch-option key="none">None</switch-option>
                            <switch-option key="solid">Solid</switch-option>
                            <switch-option key="dashed">Dashed</switch-option>
                            <switch-option key="dotted">Dotted</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li data-ng-show="settings.header_type == 'center' || settings.header_type == 'mega'">
                    <span class="module-create-title">Cart Icon Border Radius <small>Center Header</small></span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="settings.cart_heading_icon_border" editor="hide-style"></j-opt-border>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Content Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.cart_content_font"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Content Background Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.cart_content_bg"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Image Border Settings</span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="settings.cart_content_image_border"></j-opt-border>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Delete Button Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.cart_content_delete_icon_color"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Delete Button Hover</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.cart_content_delete_icon_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Divider Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.cart_content_divider_color"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Divider Type</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.cart_content_divider_type">
                            <switch-option key="none">None</switch-option>
                            <switch-option key="solid">Solid</switch-option>
                            <switch-option key="dashed">Dashed</switch-option>
                            <switch-option key="dotted">Dotted</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Content Max Height</span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.cart_content_height" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Totals Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.cart_total_font"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Totals Background</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.cart_total_bg"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Cart Heading Shadow</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.cart_header_shadow">
                            <switch-option key="none">None</switch-option>
                            <switch-option key="default">Default</switch-option>
                            <switch-option key="custom">Custom</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li data-ng-show="settings.cart_header_shadow === 'custom'">
                    <span class="module-create-title">Cart Heading Custom Shadow</span>
                    <span class="module-create-option">
                        <j-opt-shadow data-ng-model="settings.cart_header_shadow_custom" data-bgcolor="true"></j-opt-shadow>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Cart Content Shadow</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.cart_content_shadow">
                            <switch-option key="none">None</switch-option>
                            <switch-option key="default">Default</switch-option>
                            <switch-option key="custom">Custom</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li data-ng-show="settings.cart_content_shadow === 'custom'">
                    <span class="module-create-title">Cart Content Custom Shadow</span>
                    <span class="module-create-option">
                        <j-opt-shadow data-ng-model="settings.cart_content_shadow_custom" data-bgcolor="true"></j-opt-shadow>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>


                <accordion-group is-open="false">
                    <accordion-heading>
                        <div class="accordion-bar bar-level-1">View Cart / Checkout Buttons</div>
                    </accordion-heading>
                    <ul class="module-create-options">
                        <li>
                            <span class="module-create-title">Cart Color</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.cart_button_color"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Cart Hover Color</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.cart_button_color_hover"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Cart Background <small>Color - Image</small></span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.cart_button_bg_color"></j-opt-color> -
                                    <j-opt-background data-ng-model="settings.cart_button_bg_color_image"></j-opt-background>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Cart Background Hover <small>Color - Image</small></span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.cart_button_bg_hover_color"></j-opt-color> -
                                    <j-opt-background data-ng-model="settings.cart_button_bg_color_image_hover"></j-opt-background>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Cart Button Border</span>
                                <span class="module-create-option">
                                    <j-opt-border data-ng-model="settings.cart_button_border"></j-opt-border>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>

                        <li>
                            <span class="module-create-title">Checkout Color</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.header_cart_checkout_button_color"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Checkout Hover Color</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.header_cart_checkout_button_color_hover"></j-opt-color>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Checkout Background <small>Color - Image</small></span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.header_cart_checkout_button_bg_color"></j-opt-color> -
                                    <j-opt-background data-ng-model="settings.header_cart_checkout_button_bg_color_image"></j-opt-background>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Checkout Background Hover <small>Color - Image</small></span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.header_cart_checkout_button_bg_hover_color"></j-opt-color> -
                                    <j-opt-background data-ng-model="settings.header_cart_checkout_button_bg_color_image_hover"></j-opt-background>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Checkout Button Border</span>
                                <span class="module-create-option">
                                    <j-opt-border data-ng-model="settings.header_cart_checkout_button_border"></j-opt-border>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Buttons Shadow</span>
                            <span class="module-create-option">
                                <j-opt-shadow data-ng-model="settings.header_cart_button_shadow" data-bgcolor="true"></j-opt-shadow>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Shadow Hover</span>
                            <span class="module-create-option">
                                <j-opt-shadow data-ng-model="settings.header_cart_button_shadow_hover" data-bgcolor="true"></j-opt-shadow>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Shadow Active <small>Push Effect</small></span>
                            <span class="module-create-option">
                                <j-opt-shadow data-ng-model="settings.header_cart_button_shadow_active" data-bgcolor="true"></j-opt-shadow>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                    </ul>
                </accordion-group>

            </ul>
        </accordion-group>
        <!-- Search -->
        <accordion-group is-open="accordion.accordions[2]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Search</div>
            </accordion-heading>
            <ul class="module-create-options">

                <li>
                    <span class="module-create-title">Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.search_font"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Placeholder Text</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="settings.search_placeholder_text"></j-opt-text-lang>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Placeholder Text Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.search_placeholder_color"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Mobile Placeholder Text Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.search_placeholder_color_mobile"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>


                <li data-ng-hide="settings.header_type == 'center' || settings.header_type == 'mega'">
                    <span class="module-create-title">Background Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.search_bg"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li data-ng-show="settings.header_type == 'center' || settings.header_type == 'mega'">
                    <span class="module-create-title">Background Color <small>Center Header</small></span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.search_bg_center"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li data-ng-show="settings.header_type == 'center' || settings.header_type == 'mega'">
                    <span class="module-create-title">Background Hover <small>Center Header</small></span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.search_bg_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Mobile Background Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.search_bg_mobile"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li data-ng-show="settings.header_type == 'center' || settings.header_type == 'mega'">
                    <span class="module-create-title">Input Border Settings<small>Center / Mega Header</small></span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="settings.search_radius"></j-opt-border>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li data-ng-show="settings.header_type == 'center' || settings.header_type == 'mega'">
                    <span class="module-create-title">Mobile Input Border<small>Center / Mega Header</small></span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="settings.search_radius_mobile"></j-opt-border>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Button Position</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.search_button_pos">
                            <switch-option key="left">Left</switch-option>
                            <switch-option key="right">Right &nbsp;</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Button Icon</span>
                    <span class="module-create-option">
                        <j-opt-icon data-ng-model="settings.search_icon"></j-opt-icon>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Button Icon Hover</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.search_icon_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Button Background Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.search_button_bg"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Button Background Hover</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.search_button_bg_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Icon Color Mobile</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.search_icon_color_mobile"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Button Background Mobile</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.search_button_bg_mobile"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li data-ng-show="settings.header_type == 'center' || settings.header_type == 'mega'">
                    <span class="module-create-title">Button Radius <small>Center Header</small></span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="settings.search_button_radius" editor="hide-style"></j-opt-border>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Divider Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.search_divider"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Divider Type</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.search_divider_type">
                            <switch-option key="none">None</switch-option>
                            <switch-option key="solid">Solid</switch-option>
                            <switch-option key="dashed">Dashed</switch-option>
                            <switch-option key="dotted">Dotted</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li data-ng-hide="settings.header_type == 'compact'">
                    <span class="module-create-title">Top Divider on Phone</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.top_divider_phone">
                            <switch-option key="on">ON</switch-option>
                            <switch-option key="off">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Search Shadow</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.search_shadow">
                            <switch-option key="none">None</switch-option>
                            <switch-option key="default">Default</switch-option>
                            <switch-option key="custom">Custom</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li data-ng-show="settings.search_shadow === 'custom'">
                    <span class="module-create-title">Custom Shadow</span>
                    <span class="module-create-option">
                        <j-opt-shadow data-ng-model="settings.search_shadow_custom" data-bgcolor="true"></j-opt-shadow>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li data-ng-show="settings.header_type == 'mega'">
                    <span class="module-create-title">Search Field Max Width <small>Mega Headers for Desktop & Tablet Only.<br /><strong> In Percent.</strong></small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.search_width" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li data-ng-show="settings.header_type == 'mega'">
                    <span class="module-create-title">Search Field Offset <small>Mega Headers for Desktop & Tablet Only.<br /><strong> In pixels.</strong></small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.search_offset" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <accordion>
                <accordion-group is-open="true">
                    <accordion-heading>
                        <div class="accordion-bar bar-level-1">Auto-Suggest</div>
                    </accordion-heading>
                    <ul class="module-create-options">
                        <li>
                            <span class="module-create-title">Status<small>Desktop</small></span>
                            <span class="module-create-option">
                                <switch data-ng-model="settings.search_autocomplete">
                                    <switch-option key="1">ON</switch-option>
                                    <switch-option key="0">OFF</switch-option>
                                </switch>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Status<small>Tablet</small></span>
                            <span class="module-create-option">
                                <switch data-ng-model="settings.search_autocomplete_tablet">
                                    <switch-option key="1">ON</switch-option>
                                    <switch-option key="0">OFF</switch-option>
                                </switch>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Status<small>Phone</small></span>
                            <span class="module-create-option">
                                <switch data-ng-model="settings.search_autocomplete_phone">
                                    <switch-option key="1">ON</switch-option>
                                    <switch-option key="0">OFF</switch-option>
                                </switch>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Search in Description</span>
                            <span class="module-create-option">
                                <switch data-ng-model="settings.search_autocomplete_include_description">
                                    <switch-option key="1">ON</switch-option>
                                    <switch-option key="0">OFF</switch-option>
                                </switch>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Show Product Image</span>
                                <span class="module-create-option">
                                    <switch data-ng-model="settings.autosuggest_product_image">
                                        <switch-option key="block">ON</switch-option>
                                        <switch-option key="none">OFF</switch-option>
                                    </switch>
                                </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li data-ng-show="settings.autosuggest_product_image === 'block'">
                            <span class="module-create-title">Product Image Size</span>
                            <span class="module-create-option">
                                <j-opt-text data-ng-model="settings.autosuggest_product_image_width" class="journal-number-field"></j-opt-text> x
                                <j-opt-text data-ng-model="settings.autosuggest_product_image_height" class="journal-number-field"></j-opt-text>
                                <switch data-ng-model="settings.autosuggest_product_image_type">
                                    <switch-option key="fit">Fit</switch-option>
                                    <switch-option key="crop">Crop&nbsp;&nbsp;&nbsp;</switch-option>
                                </switch>
                            </span>
                        </li>
                        <li>
                            <span class="module-create-title">Background Color</span>
                            <span class="module-create-option">
                                <j-opt-color data-ng-model="settings.autosuggest_bg"></j-opt-color>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                         <li>
                            <span class="module-create-title">Item Hover Color</span>
                            <span class="module-create-option">
                                <j-opt-color data-ng-model="settings.autosuggest_hover"></j-opt-color>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Product Name Font</span>
                            <span class="module-create-option">
                                <j-opt-font data-ng-model="settings.autosuggest_name_font"></j-opt-font>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Product Price Font</span>
                            <span class="module-create-option">
                                <j-opt-font data-ng-model="settings.autosuggest_price_font"></j-opt-font>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Product Price Status</span>
                            <span class="module-create-option">
                                 <switch data-ng-model="settings.autosuggest_price_status">
                                     <switch-option key="block">ON</switch-option>
                                     <switch-option key="none">OFF</switch-option>
                                 </switch>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>

                        <li>
                            <span class="module-create-title">Image Border Settings</span>
                            <span class="module-create-option">
                                <j-opt-border data-ng-model="settings.autosuggest_image_border"></j-opt-border>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>

                        <li data-ng-show="settings.header_type == 'center' || settings.header_type == 'mega'">
                            <span class="module-create-title">Border Radius <small>Center Header</small></span>
                            <span class="module-create-option">
                                <j-opt-border data-ng-model="settings.autosuggest_border" editor="hide-style"></j-opt-border>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Divider Color</span>
                            <span class="module-create-option">
                                <j-opt-color data-ng-model="settings.autosuggest_divider"></j-opt-color>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Divider Type</span>
                            <span class="module-create-option">
                                <switch data-ng-model="settings.autosuggest_divider_type">
                                    <switch-option key="solid">Solid</switch-option>
                                    <switch-option key="dashed">Dashed</switch-option>
                                    <switch-option key="dotted">Dotted</switch-option>
                                </switch>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>

                        <li>
                            <span class="module-create-title">Container Max Height <small>Generates Scrollbar</small></span>
                            <span class="module-create-option">
                                <j-opt-text data-ng-model="settings.autosuggest_height" class="journal-number-field"></j-opt-text>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>

                        <li>
                            <span class="module-create-title">Suggestions Limit</span>
                            <span class="module-create-option">
                                <j-opt-text data-ng-model="settings.autosuggest_limit" class="journal-number-field"></j-opt-text>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>

                        <li>
                            <span class="module-create-title">View More Text</span>
                            <span class="module-create-option">
                                <j-opt-text-lang data-ng-model="settings.autosuggest_view_more_text"></j-opt-text-lang>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">View More Font</span>
                            <span class="module-create-option">
                                <j-opt-font data-ng-model="settings.autosuggest_view_more_font"></j-opt-font>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">View More Font Hover</span>
                            <span class="module-create-option">
                                <j-opt-color data-ng-model="settings.autosuggest_view_more_font_hover"></j-opt-color>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">No Results Font</span>
                            <span class="module-create-option">
                                <j-opt-font data-ng-model="settings.autosuggest_no_results_font"></j-opt-font>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li>
                            <span class="module-create-title">Shadow Type</span>
                            <span class="module-create-option">
                                <switch data-ng-model="settings.search_autosuggest_shadow">
                                    <switch-option key="none">None</switch-option>
                                    <switch-option key="default">Default</switch-option>
                                    <switch-option key="custom">Custom</switch-option>
                                </switch>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li data-ng-show="settings.search_autosuggest_shadow === 'custom'">
                            <span class="module-create-title">Shadow</span>
                            <span class="module-create-option">
                                <j-opt-shadow data-ng-model="settings.search_autosuggest_shadow_custom" data-bgcolor="true"></j-opt-shadow>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                    </ul>
                </accordion-group>
            </accordion>
            </ul>
        </accordion-group>
        <accordion-group is-open="accordion.accordions[3]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Language / Currency</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Language Display</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.language_display">
                            <switch-option key="flag">&nbsp;&nbsp;&nbsp;Flag &nbsp;&nbsp;</switch-option>
                            <switch-option key="text">Text</switch-option>
                            <switch-option key="full">Full</switch-option>
                        </switch>
                        <span style="position: relative; top: -10px;">&nbsp;&nbsp;&nbsp;Mobile View&nbsp;</span>
                        <switch data-ng-model="settings.language_display_mobile">
                            <switch-option key="flag">&nbsp;&nbsp;&nbsp;Flag &nbsp;&nbsp;</switch-option>
                            <switch-option key="text">Text</switch-option>
                            <switch-option key="full">Full</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Currency Display</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.currency_display">
                            <switch-option key="symbol">Symbol</switch-option>
                            <switch-option key="code">Code</switch-option>
                            <switch-option key="full">Full</switch-option>
                        </switch>
                        <span style="position: relative; top: -10px;">&nbsp;&nbsp;&nbsp;Mobile View&nbsp;</span>
                        <switch data-ng-model="settings.currency_display_mobile">
                            <switch-option key="symbol">Symbol</switch-option>
                            <switch-option key="code">Code</switch-option>
                            <switch-option key="full">Full</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Text Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.full_text_font"></j-opt-font> &nbsp; &nbsp; Phone Color
                        <j-opt-color data-ng-model="settings.full_text_font_phone"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li data-ng-show="settings.header_type == 'center' || settings.header_type == 'mega'">
                    <span class="module-create-title">Background Color <small>Central / Mega Headers</small></span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.lang_bg"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Currency Symbol Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.curr_font"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Currency Background Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.curr_bg"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Currency Radius</span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="settings.curr_radius" editor="hide-style"></j-opt-border>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li data-ng-show="settings.header_type == 'center' || settings.header_type == 'mega'">
                    <span class="module-create-title">Divider Color <small>Center / Mega Headers</small></span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.lang_divider"></j-opt-color> &nbsp; &nbsp; Phone Color
                        <j-opt-color data-ng-model="settings.lang_divider_phone"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li data-ng-show="settings.header_type == 'center' || settings.header_type == 'mega'">
                    <span class="module-create-title">Divider Type <small>Center / Mega Headers</small></span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.lang_divider_type">
                            <switch-option key="solid">Solid</switch-option>
                            <switch-option key="dashed">Dashed</switch-option>
                            <switch-option key="dotted">Dotted</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Dropdown Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.lang_drop_font"></j-opt-font> &nbsp; &nbsp; Hover
                        <j-opt-color data-ng-model="settings.lang_drop_color_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Dropdown Background Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.lang_drop_bg"></j-opt-color> &nbsp; &nbsp; Hover
                        <j-opt-color data-ng-model="settings.lang_drop_bg_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Dropdown Radius</span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="settings.drop_radius" editor="hide-style"></j-opt-border>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Dropdown Divider Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.drop_lang_divider"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Dropdown Divider Type</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.drop_lang_divider_type">
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
                        <switch data-ng-model="settings.lang_shadow">
                            <switch-option key="0 2px 2px rgba(0, 0, 0, 0.15)">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

            </ul>
        </accordion-group>
    </accordion>
</div>
