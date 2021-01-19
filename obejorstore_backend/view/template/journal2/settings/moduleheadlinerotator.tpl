<div class="sticky">
<div class="module-header">
    <div class='module-name'>Modules<span>Headline Rotator</span></div>

    <skin-manager data-url="settings/moduleheadlinerotator"></skin-manager>

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
                <div class="accordion-bar bar-level-0">Call to Action Button</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Button Font</span>
                        <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.cta_button_font"></j-opt-font>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Font Hover Color</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.cta_button_font_hover"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>


                <li>
                    <span class="module-create-title">Background<small>Color - Image</small></span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.cta_button_bg"></j-opt-color> -
                            <j-opt-background data-ng-model="settings.cta_button_bg_image"></j-opt-background>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>


                <li>
                    <span class="module-create-title">Background Hover<small>Color - Image</small></span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.cta_button_bg_hover"></j-opt-color> -
                            <j-opt-background data-ng-model="settings.cta_button_bg_image_hover"></j-opt-background>

                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Border Settings</span>
                        <span class="module-create-option">
                            <j-opt-border data-ng-model="settings.cta_button_border"></j-opt-border>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Border Hover Color</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.cta_button_border_hover"></j-opt-color>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Button Width <small>Padding Left / Right</small></span>
                                <span class="module-create-option">
                                    <j-opt-text data-ng-model="settings.cta_button_width" class="journal-number-field"></j-opt-text>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Button Height </span>
                                <span class="module-create-option">
                                    <j-opt-text data-ng-model="settings.cta_button_height" class="journal-number-field"></j-opt-text>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Button Shadow</span>
                    <span class="module-create-option">
                                <j-opt-shadow data-ng-model="settings.hr_button_shadow" data-bgcolor="true"></j-opt-shadow>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Shadow Hover</span>
                    <span class="module-create-option">
                                <j-opt-shadow data-ng-model="settings.hr_button_shadow_hover" data-bgcolor="true"></j-opt-shadow>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Shadow Active <small>Push Effect</small></span>
                    <span class="module-create-option">
                                <j-opt-shadow data-ng-model="settings.hr_button_shadow_active" data-bgcolor="true"></j-opt-shadow>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
            </ul>
        </accordion-group>
        <accordion-group is-open="accordion.accordions[1]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Bullets</div>
            </accordion-heading>

            <ul>
                <li>
                    <span class="module-create-title">Color</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.headline_bullet_color"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Hover Color</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.headline_bullet_hover_color"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Border</span>
                        <span class="module-create-option">
                            <j-opt-border data-ng-model="settings.headline_bullet_border"></j-opt-border>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Border Hover Color</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.headline_bullet_border_hover"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Margin</span>
                        <span class="module-create-option">
                            <j-opt-text data-ng-model="settings.headline_bullet_margin" class="journal-number-field"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li data-ng-hide="settings.product_grid_quickview_status == 'never'">
                    <span class="module-create-title">Size <small>Width / Height</small> </span>
                        <span class="module-create-option">
                            <j-opt-text data-ng-model="settings.headline_bullet_width" class="journal-number-field"></j-opt-text> x
                            <j-opt-text data-ng-model="settings.headline_bullet_height" class="journal-number-field"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Scale <small>Hover / Active</small></span>
                        <span class="module-create-option">
                            <j-opt-text data-ng-model="settings.headline_bullet_scale" class="journal-number-field"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

            </ul>
        </accordion-group>

    </accordion>
</div>
