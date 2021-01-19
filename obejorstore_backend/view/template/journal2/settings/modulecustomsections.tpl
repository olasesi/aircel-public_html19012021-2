<div class="sticky">
<div class="module-header">
    <div class='module-name'>Modules<span>Custom Sections</span></div>

    <skin-manager data-url="settings/modulecustomsections"></skin-manager>

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
                    <span class="module-create-title">Tab Bar Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.cs_title_font"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Tabs Bar Background</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.cs_title_bg"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Fullwidth Bar Background <small>Top or Bottom Positions</small></span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.cs_fullwidth_title_bg"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Tabs Bar Border Settings</span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="settings.cs_title_border"></j-opt-border>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Active Tab Font Color </span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.cs_title_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Active Tab Background</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.cs_title_bg_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Tabs Bar Height</span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.cs_title_line_height" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Divider Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.cs_title_divider"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Divider Type</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.cs_title_divider_type">
                            <switch-option key="solid">Solid</switch-option>
                            <switch-option key="dashed">Dashed</switch-option>
                            <switch-option key="dotted">Dotted</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Dividers on End <small>If Fullwidth Background</small></span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.cs_fullwidth_divider">
                            <switch-option key="on">ON</switch-option>
                            <switch-option key="off">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">2 Tabs per Row on Phone <small>Turn OFF to display 1 per row.</small></span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.cs_two_per_row">
                            <switch-option key="on">ON</switch-option>
                            <switch-option key="off">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Tabs Bar Shadow</span>
                    <span class="module-create-option">
                            <j-opt-shadow data-ng-model="settings.cs_shadow_custom"></j-opt-shadow>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
            </ul>
        </accordion-group>
        <accordion-group is-open="accordion.accordions[1]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Product Grid Override</div>
            </accordion-heading>
            <ul class="module-create-options">
                <!-- Product Grid General-->
                <li>
                    <span class="module-create-title">Background Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.cs_product_grid_item_bg"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Background Hover Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.cs_product_grid_details_bg_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Padding</span>
                        <span class="module-create-option">
                              <j-opt-text data-ng-model="settings.cs_product_grid_item_padding" class="journal-number-field"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Border Settings</span>
                        <span class="module-create-option">
                            <j-opt-border data-ng-model="settings.cs_product_grid_item_border"></j-opt-border>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Hover Border Color</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.cs_product_grid_hover_border"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Shadow</span>
                    <span class="module-create-option">
                            <switch data-ng-model="settings.cs_product_grid_box_shadow">
                                <switch-option key="inherit">Inherit</switch-option>
                                <switch-option key="none">None</switch-option>
                                <switch-option key="custom">Custom</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li data-ng-show="settings.cs_product_grid_box_shadow === 'custom'">
                    <span class="module-create-title">Custom Shadow</span>
                    <span class="module-create-option">
                            <j-opt-shadow data-ng-model="settings.cs_product_grid_shadow_custom"></j-opt-shadow>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li data-ng-hide="settings.cs_product_grid_box_shadow === 'none' || settings.cs_product_grid_box_shadow === 'inherit'">
                    <span class="module-create-title">Shadow Behavior</span>
                    <span class="module-create-option">
                            <switch data-ng-model="settings.cs_product_grid_shadow_2">
                                <switch-option key="hover">Hover</switch-option>
                                <switch-option key="always">Always &nbsp; &nbsp;</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
            </ul>
        </accordion-group>
    </accordion>
</div>
