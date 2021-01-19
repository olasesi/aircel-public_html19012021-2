<div class="sticky">
<div class="module-header">
    <div class='module-name'>Newsletter <span data-ng-show="module_id == null">New Module</span><span data-ng-show="module_id != null">Edit Module</span></div>
    <div class="module-buttons">
        <a href="<?php echo $base_href;?>#/module/{{module_type}}/all/{{module_id}}" data-ng-show="module_id != null" class="btn blue">Add to Layout</a>
        <a data-ng-click="save($event)" class="btn green">Save</a>
        <a href="<?php echo $base_href;?>#/module/{{module_type}}/all" data-ng-show="module_id == null" class="btn red">Cancel</a>
        <a data-ng-click="delete($event)" data-ng-show="module_id != null" class="btn red">Delete</a>
    </div>
</div>
</div>
<div class="module-body module-form">
    <div class="accordion-bar bar-level-0 bar-expand" >
        <a data-ng-click="toggleAccordion(true)" class="hint--top" data-hint="Expand All"><i class="expand-icon"></i></a>  <a data-ng-click="toggleAccordion(false)" class="hint--top" data-hint="Collapse All"><i class="collapse-icon"></i></a>
        <label class="close-others hint--top" data-hint="Close Others"><input type="checkbox" data-ng-model="module_data.close_others" /></label>
    </div>
    <accordion close-others="module_data.close_others">
        <accordion-group is-open="module_data.general_is_open">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">General Options</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Module Name</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input journal-name-field" data-ng-model="module_data.module_name" required />
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Module Title</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="module_data.module_title"></j-opt-text-lang>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Module Text</span>
                    <span class="module-create-option">
                        <j-opt-textarea-lang data-ng-model="module_data.module_text" data-rows="4" data-cols="30"></j-opt-textarea-lang>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Module Text Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="module_data.module_text_font"></j-opt-font>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Module Background</span>
                    <span class="module-create-option">
                        <j-opt-background data-ng-model="module_data.module_background" data-bgcolor="true"></j-opt-background>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Module Shadow</span>
                    <span class="module-create-option">
                        <j-opt-shadow data-ng-model="module_data.module_shadow"></j-opt-shadow>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Module Border Settings</span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="module_data.module_border"></j-opt-border>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Module Padding<small>Top - Right - Bottom - Left</small></span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input journal-sort" data-ng-model="module_data.module_padding_top" /> -
                        <input type="text" class="journal-input journal-sort" data-ng-model="module_data.module_padding_right" /> -
                        <input type="text" class="journal-input journal-sort" data-ng-model="module_data.module_padding_bottom" /> -
                        <input type="text" class="journal-input journal-sort" data-ng-model="module_data.module_padding_left" />
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Text Position</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.text_position">
                            <switch-option key="left">Left</switch-option>
                            <switch-option key="top">Top</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Input Height</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input journal-number-field" data-ng-model="module_data.input_height" placeholder="Height"/>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Input Placeholder</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="module_data.input_placeholder"></j-opt-text-lang>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Input Background Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="module_data.input_bg_color"></j-opt-color>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Input Text Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="module_data.input_font"></j-opt-font>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Input Border Settings</span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="module_data.input_border"></j-opt-border>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Input Shadow</span>
                    <span class="module-create-option">
                        <j-opt-shadow data-ng-model="module_data.input_shadow"></j-opt-shadow>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Button Text</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="module_data.button_text"></j-opt-text-lang>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Button Icon</span>
                    <span class="module-create-option">
                        <icon-select data-ng-model="module_data.button_icon"></icon-select>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Button Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="module_data.button_font"></j-opt-font> &nbsp; &nbsp; Hover
                        <j-opt-color data-ng-model="module_data.button_font_color_hover"></j-opt-color>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Button Background</span>
                    <span class="module-create-option">
                        <j-opt-background data-ng-model="module_data.button_bg_image" data-bgcolor="true"></j-opt-background> &nbsp; &nbsp; Hover
                        <j-opt-background data-ng-model="module_data.button_bg_image_hover" data-bgcolor="true"></j-opt-background>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Button Border</span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="module_data.button_border"></j-opt-border> &nbsp; &nbsp; Hover
                        <j-opt-color data-ng-model="module_data.button_border_hover"></j-opt-color>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Button Shadow</span>
                    <span class="module-create-option">
                        <j-opt-shadow data-ng-model="module_data.button_shadow"></j-opt-shadow> &nbsp; &nbsp; Hover
                        <j-opt-shadow data-ng-model="module_data.button_shadow_hover"></j-opt-shadow> &nbsp; &nbsp; Active
                        <j-opt-shadow data-ng-model="module_data.button_shadow_active"></j-opt-shadow>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Button Offset</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input journal-number-field" data-ng-model="module_data.button_offset_top" placeholder="Top"/> &nbsp;
                        <input type="text" class="journal-input journal-number-field" data-ng-model="module_data.button_offset_left" placeholder="Left"/>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Enable on Phone</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.enable_on_phone">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Enable on Tablet</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.enable_on_tablet">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Enable on Desktop</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.enable_on_desktop">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
            </ul>
        </accordion-group>
        <accordion-group is-open="module_data.top_bottom_is_open">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Top or Bottom Position Settings</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Background</span>
                        <span class="module-create-option">
                            <j-opt-background data-ng-model="module_data.background" data-bgcolor="true"></j-opt-background>
                        </span>
                </li>
<!--                <li>-->
<!--                    <span class="module-create-title">Video Background</span>-->
<!--                    <span class="module-create-option">-->
<!--                        <j-opt-text data-ng-model="module_data.video_background"></j-opt-text>-->
<!--                    </span>-->
<!--                </li>-->
                <li>
                    <span class="module-create-title">Fullwidth Module</span>
                        <span class="module-create-option">
                            <switch data-ng-model="module_data.fullwidth">
                                <switch-option key="1">ON</switch-option>
                                <switch-option key="0">OFF</switch-option>
                            </switch>
                        </span>
                </li>
                <li>
                    <span class="module-create-title">Margin<small>Top/Bottom</small></span>
                    <span class="module-create-option">
                        <input type="text" class="journal-number-field" data-ng-model="module_data.margin_top" /> x <input type="text" class="journal-number-field" data-ng-model="module_data.margin_bottom" />
                    </span>
                </li>
            </ul>
        </accordion-group>
    </accordion>
</div>
