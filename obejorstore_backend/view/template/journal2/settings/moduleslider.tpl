<div class="sticky">
<div class="module-header">
    <div class='module-name'>Modules<span>Slider</span></div>

    <skin-manager data-url="settings/moduleslider"></skin-manager>

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
                    <span class="module-create-title">Left Arrow</span>
                    <span class="module-create-option">
                        <j-opt-icon data-ng-model="settings.slider_left_icon"></j-opt-icon>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Right Arrow</span>
                    <span class="module-create-option">
                        <j-opt-icon data-ng-model="settings.slider_right_icon"></j-opt-icon>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Arrows Hover</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.slider_icon_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Timer Color <small>Revolution Slider</small></span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.slider_timer_color"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Timer Size <small>Revolution Slider</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.slider_timer_size" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Thumbs Container Border <small>Revolution Slider</small></span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="settings.slider_thumbs_border"></j-opt-border>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Thumb Overlay Opacity <small>Revolution Slider</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.slider_thumbs_overlay" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Active Overlay Opacity <small>Revolution Slider</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.slider_thumbs_active_overlay" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
            </ul>
        </accordion-group>
        <accordion-group is-open="accordion.accordions[1]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Bullets</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.slider_bullet_color"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Hover Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.slider_bullet_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Border</span>
                        <span class="module-create-option">
                            <j-opt-border data-ng-model="settings.slider_bullet_border"></j-opt-border>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Border Hover Color</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.slider_bullet_border_hover"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Margin</span>
                        <span class="module-create-option">
                            <j-opt-text data-ng-model="settings.slider_bullet_margin" class="journal-number-field"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li data-ng-hide="settings.product_grid_quickview_status == 'never'">
                    <span class="module-create-title">Size <small>Width / Height</small> </span>
                        <span class="module-create-option">
                            <j-opt-text data-ng-model="settings.slider_bullet_width" class="journal-number-field"></j-opt-text> x
                            <j-opt-text data-ng-model="settings.slider_bullet_height" class="journal-number-field"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Scale <small>Hover / Active</small></span>
                        <span class="module-create-option">
                            <j-opt-text data-ng-model="settings.slider_bullet_scale" class="journal-number-field"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
            </ul>
        </accordion-group>
    </accordion>
</div>
