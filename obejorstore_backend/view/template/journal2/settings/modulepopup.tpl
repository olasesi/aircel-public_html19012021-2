<div class="sticky">
<div class="module-header">
    <div class='module-name'>Modules<span>Popup</span></div>

    <skin-manager data-url="settings/modulepopup"></skin-manager>

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
                <div class="accordion-bar bar-level-0">Close Button</div>
            </accordion-heading>
            <ul class="module-create-options">

                <li>
                    <span class="module-create-title">Color</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.popup_close_color"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Hover Color</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.popup_close_color_hover"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Mobile Color</span>
                    <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.popup_close_color_mobile"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Size </span>
                                <span class="module-create-option">
                                    <j-opt-text data-ng-model="settings.popup_close_size" class="journal-number-field"></j-opt-text>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Offset <small>Top - Right</small> </span>
                                <span class="module-create-option">
                                    <j-opt-text data-ng-model="settings.popup_close_offset_top" class="journal-number-field"></j-opt-text> -
                                     <j-opt-text data-ng-model="settings.popup_close_offset_right" class="journal-number-field"></j-opt-text>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

            </ul>
        </accordion-group>

        <accordion-group is-open="accordion.accordions[1]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Content Fonts</div>
            </accordion-heading>
            <ul class="module-create-options">

                <li>
                    <span class="module-create-title">General Font</span>
                        <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.popup_p_font"></j-opt-font>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">H1 Font</span>
                        <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.popup_h1_font"></j-opt-font>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">H2 Font</span>
                        <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.popup_h2_font"></j-opt-font>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">H3 Font</span>
                        <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.popup_h3_font"></j-opt-font>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

            </ul>
        </accordion-group>
    </accordion>
</div>
