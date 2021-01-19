<div class="sticky">
<div class="module-header">
    <div class='module-name'>Modules<span>Enquiry Button</span></div>

    <skin-manager data-url="settings/moduleproducttabs"></skin-manager>

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
                <div class="accordion-bar bar-level-0">Enquiry Button &nbsp; <span>Product Grid / List</span></div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Font <small>Font - Hover</small></span>
                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.enquiry_button_font"></j-opt-font> -
                        <j-opt-color data-ng-model="settings.enquiry_button_font_hover"></j-opt-color>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Icon Color <small>Color - Hover</small></span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.enquiry_button_icon_color"></j-opt-color> -
                        <j-opt-color data-ng-model="settings.enquiry_button_icon_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Icon Status</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.enquiry_button_icon_status">
                            <switch-option key="inline-flex">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Icon Offset <small>Top - Left</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.enquiry_button_icon_offset_top" class="journal-sort"></j-opt-text> -
                        <j-opt-text data-ng-model="settings.enquiry_button_icon_offset_left" class="journal-sort"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Background <small>Color - Image</small></span>
                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.enquiry_button_bg"></j-opt-color> -
                                        <j-opt-background data-ng-model="settings.enquiry_button_bg_image"></j-opt-background>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>


                <li>
                    <span class="module-create-title">Background Hover <small>Color - Image</small></span>
                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.enquiry_button_bg_hover"></j-opt-color> -
                                        <j-opt-background data-ng-model="settings.enquiry_button_bg_image_hover"></j-opt-background>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Border Settings</span>
                    <span class="module-create-option">
                            <j-opt-border data-ng-model="settings.enquiry_button_border"></j-opt-border>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Border Hover Color</span>
                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.enquiry_button_border_hover"></j-opt-color>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Button Width <small>Padding Left/Right</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.enquiry_button_button_width" class="journal-number-field"></j-opt-text>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Button Height <small>Line Height</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.enquiry_button_button_height" class="journal-number-field"></j-opt-text>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Button Shadow</span>
                    <span class="module-create-option">
                       <j-opt-shadow data-ng-model="settings.enquiry_shadow" data-bgcolor="true"></j-opt-shadow>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Shadow Hover</span>
                    <span class="module-create-option">
                       <j-opt-shadow data-ng-model="settings.enquiry_shadow_hover" data-bgcolor="true"></j-opt-shadow>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Shadow Active <small>Push Effect</small></span>
                    <span class="module-create-option">
                       <j-opt-shadow data-ng-model="settings.enquiry_shadow_active" data-bgcolor="true"></j-opt-shadow>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
            </ul>
        </accordion-group>


        <accordion-group is-open="accordion.accordions[1]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Product Page</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Font <small>Font - Hover</small></span>
                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.pp_enquiry_button_font"></j-opt-font> -
                        <j-opt-color data-ng-model="settings.pp_enquiry_button_font_hover"></j-opt-color>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Icon Color <small>Color - Hover</small></span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.pp_enquiry_button_icon_color"></j-opt-color> -
                                        <j-opt-color data-ng-model="settings.pp_enquiry_button_icon_hover"></j-opt-color>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Icon Status</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.pp_enquiry_button_icon_status">
                            <switch-option key="inline-flex">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Icon Offset <small>Top - Left</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.pp_enquiry_button_icon_offset_top" class="journal-sort"></j-opt-text> -
                        <j-opt-text data-ng-model="settings.pp_enquiry_button_icon_offset_left" class="journal-sort"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Background <small>Color - Image</small></span>
                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.pp_enquiry_button_bg"></j-opt-color> -
                                        <j-opt-background data-ng-model="settings.pp_enquiry_button_bg_image"></j-opt-background>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>


                <li>
                    <span class="module-create-title">Background Hover <small>Color - Image</small></span>
                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.pp_enquiry_button_bg_hover"></j-opt-color> -
                                        <j-opt-background data-ng-model="settings.pp_enquiry_button_bg_image_hover"></j-opt-background>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Border Settings</span>
                    <span class="module-create-option">
                            <j-opt-border data-ng-model="settings.pp_enquiry_button_border"></j-opt-border>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Border Hover Color</span>
                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.pp_enquiry_button_border_hover"></j-opt-color>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Button Shadow</span>
                    <span class="module-create-option">
                       <j-opt-shadow data-ng-model="settings.pp_enquiry_shadow" data-bgcolor="true"></j-opt-shadow>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Shadow Hover</span>
                    <span class="module-create-option">
                       <j-opt-shadow data-ng-model="settings.pp_enquiry_shadow_hover" data-bgcolor="true"></j-opt-shadow>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Shadow Active <small>Push Effect</small></span>
                    <span class="module-create-option">
                       <j-opt-shadow data-ng-model="settings.pp_enquiry_shadow_active" data-bgcolor="true"></j-opt-shadow>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
            </ul>
        </accordion-group>
    </accordion>
</div>
