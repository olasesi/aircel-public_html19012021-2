<div class="sticky">
<div class="module-header">
    <div class='module-name'>Modules<span>Accordion</span></div>

    <skin-manager data-url="settings/moduleaccordion"></skin-manager>

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
        <accordion-group is-open="true">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Heading</div>
            </accordion-heading>
            <ul class="module-create-options">

                <li>
                    <span class="module-create-title">Font</span>
                        <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.accordion_heading_font"></j-opt-font> &nbsp;&nbsp; Hover &nbsp;
                            <j-opt-color data-ng-model="settings.accordion_heading_font_hover"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Background Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.accordion_heading_bg_color"></j-opt-color> &nbsp;&nbsp; Hover &nbsp;
                        <j-opt-color data-ng-model="settings.accordion_heading_bg_color_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Divider Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.accordion_heading_divider_color"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Divider Style</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.accordion_heading_divider_style">
                                <switch-option key="solid">Solid</switch-option>
                                <switch-option key="dashed">Dashed</switch-option>
                                <switch-option key="solid">Dotted</switch-option>
                            </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Last Item Divider</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.accordion_heading_divider_last">
                                <switch-option key="1">ON</switch-option>
                                <switch-option key="0">OFF</switch-option>
                            </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Padding <small>Top - Right - Bottom - Left</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.accordion_heading_padding_top" class="journal-sort"></j-opt-text> -
                        <j-opt-text data-ng-model="settings.accordion_heading_padding_right" class="journal-sort"></j-opt-text> -
                        <j-opt-text data-ng-model="settings.accordion_heading_padding_bottom" class="journal-sort"></j-opt-text> -
                        <j-opt-text data-ng-model="settings.accordion_heading_padding_left" class="journal-sort"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Text Align</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.accordion_heading_text_align">
                                <switch-option key="left">Left</switch-option>
                                <switch-option key="center">Center</switch-option>
                                <switch-option key="right">Right</switch-option>
                            </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
            </ul>
        </accordion-group>

        <accordion-group is-open="true">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Content</div>
            </accordion-heading>
            <ul class="module-create-options">

                <li>
                    <span class="module-create-title">General Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.accordion_content_font"></j-opt-font> &nbsp;&nbsp; H1&nbsp;
                        <j-opt-font data-ng-model="settings.accordion_content_h1_font"></j-opt-font> &nbsp;&nbsp; H2&nbsp;
                        <j-opt-font data-ng-model="settings.accordion_content_h2_font"></j-opt-font> &nbsp;&nbsp; H3&nbsp;
                        <j-opt-font data-ng-model="settings.accordion_content_h3_font"></j-opt-font> &nbsp;&nbsp; H4&nbsp;
                        <j-opt-font data-ng-model="settings.accordion_content_h4_font"></j-opt-font>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Background</span>
                    <span class="module-create-option">
                        <j-opt-background data-ng-model="settings.accordion_content_bg" data-bgcolor="true"></j-opt-background>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Padding <small>Top - Right - Bottom - Left</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.accordion_content_padding_top" class="journal-sort"></j-opt-text> -
                        <j-opt-text data-ng-model="settings.accordion_content_padding_right" class="journal-sort"></j-opt-text> -
                        <j-opt-text data-ng-model="settings.accordion_content_padding_bottom" class="journal-sort"></j-opt-text> -
                        <j-opt-text data-ng-model="settings.accordion_content_padding_left" class="journal-sort"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Text Align</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.accordion_content_text_align">
                                <switch-option key="left">Left</switch-option>
                                <switch-option key="center">Center</switch-option>
                                <switch-option key="right">Right</switch-option>
                            </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
            </ul>
        </accordion-group>
    </accordion>
</div>
