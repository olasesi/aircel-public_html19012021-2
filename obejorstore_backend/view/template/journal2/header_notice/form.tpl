<div class="sticky">
<div class="module-header">
    <div class='module-name'>Header Notice <span data-ng-show="module_id == null">New Module</span><span data-ng-show="module_id != null">Edit Module</span></div>
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
        <a data-ng-click="toggleAccordion(module_data.sections, true)" class="hint--top" data-hint="Expand All"><i class="expand-icon"></i></a>  <a data-ng-click="toggleAccordion(module_data.sections, false)" class="hint--top" data-hint="Collapse All"><i class="collapse-icon"></i></a>
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
                    <span class="module-create-title">Notice Text <small>Can use <i><</i>a> tags for links:<br/><i><</i>a href="..."><i>Link<</i>/a></small></span>
                    <span class="module-create-option">
                        <j-opt-textarea-lang data-ng-model="module_data.text" data-rows="4" data-cols="30"></j-opt-textarea-lang>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Text Align</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.text_align">
                            <switch-option key="left">Left</switch-option>
                            <switch-option key="center">Center</switch-option>
                            <switch-option key="right">Right</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Fullwidth Text</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.fullwidth">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Main Container Padding <small>Top-Right-Bottom-Left</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="module_data.padding_t" class="journal-sort"></j-opt-text> -
                        <j-opt-text data-ng-model="module_data.padding_r" class="journal-sort"></j-opt-text> -
                        <j-opt-text data-ng-model="module_data.padding_b" class="journal-sort"></j-opt-text> -
                        <j-opt-text data-ng-model="module_data.padding_l" class="journal-sort"></j-opt-text>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="module_data.text_font"></j-opt-font>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Background Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="module_data.text_background_color"></j-opt-color>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Background Image</span>
                    <span class="module-create-option">
                        <j-opt-background data-ng-model="module_data.text_background_image"></j-opt-background>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Shadow</span>
                    <span class="module-create-option">
                        <j-opt-shadow data-ng-model="module_data.text_shadow"></j-opt-shadow>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Text Link Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="module_data.text_link_color"></j-opt-color>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Text Link Hover Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="module_data.text_link_hover_color"></j-opt-color>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Icon</span>
                    <span class="module-create-option">
                        <icon-select data-ng-model="module_data.icon"></icon-select>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Float Icon</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.float_icon">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>

                <li>
                    <span class="module-create-title">Close Button Type</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.close_button_type">
                            <switch-option key="icon">X</switch-option>
                            <switch-option key="text">Text &nbsp;&nbsp;&nbsp;&nbsp;</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="module_data.close_button_type === 'text'">
                    <span class="module-create-title">Close Button Text</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="module_data.close_button_text"></j-opt-text-lang>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Close Button Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="module_data.button_color"></j-opt-color>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Close Button Hover Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="module_data.button_hover_color"></j-opt-color>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Close Button Background Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="module_data.button_bg_color"></j-opt-color>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Close Button Background Hover Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="module_data.button_hover_bg_color"></j-opt-color>
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
                <li>
                    <span class="module-create-title">Show Only Once</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.show_only_once">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Don't Show Again if Closed</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.do_not_show_again">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Reset Cookie</span>
                    <span class="module-create-option">
                        <a class="btn blue" data-ng-click="resetCookie()">Reset</a>
                    </span>
                </li>
            </ul>
        </accordion-group>
    </accordion>
</div>
