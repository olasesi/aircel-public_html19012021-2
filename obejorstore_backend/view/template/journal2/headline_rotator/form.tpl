<div class="sticky">
<div class="module-header">
    <div class='module-name'>Headline Rotator <span data-ng-show="module_id == null">New Module</span><span data-ng-show="module_id != null">Edit Module</span></div>
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
                    <span class="module-create-title">Transition Delay</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input journal-number-field" data-ng-model="module_data.transition_delay" required />
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Module Min Height</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input journal-number-field" data-ng-model="module_data.headline_rotator_height" placeholder="Auto" required />
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Module Padding <small>Top-Right-Bottom-Left</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="module_data.padding_t" class="journal-sort"></j-opt-text> -
                        <j-opt-text data-ng-model="module_data.padding_r" class="journal-sort"></j-opt-text> -
                        <j-opt-text data-ng-model="module_data.padding_b" class="journal-sort"></j-opt-text> -
                        <j-opt-text data-ng-model="module_data.padding_l" class="journal-sort"></j-opt-text>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Pause on Hover</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.pause_on_hover">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Background Settings</span>
                    <span class="module-create-option">
                        <j-opt-background data-ng-model="module_data.text_background" data-bgcolor="true"></j-opt-background>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Text Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="module_data.text_font"></j-opt-font>
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
                    <span class="module-create-title">Bullets</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.bullets">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="module_data.bullets == 1">
                    <span class="module-create-title">Bullets Position</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.bullets_position">
                            <switch-option key="left">Left</switch-option>
                            <switch-option key="center">Center</switch-option>
                            <switch-option key="right">Right</switch-option>
                        </switch>
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
                <li data-ng-show="module_data.fullwidth == 0">
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
            </ul>
        </accordion-group>

        <accordion-group data-ng-repeat="section in module_data.sections" is-open="section.is_open">
            <accordion-heading>
                <div class="accordion-bar bar-level-1"> {{section.name || ('Item ' + ($index + 1))}} <a href="javascript:;" class="accordion-remove slide-remove" data-ng-click="removeSection($index)"><b ></b>Remove</a> <a href="javascript:;" class="accordion-remove slide-remove" data-ng-click="duplicateSection($index); $event.stopPropagation()"><b ></b>Duplicate</a></div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Item Name</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input" data-ng-model="section.name" />
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Text</span>
                    <span class="module-create-option">
                        <j-opt-textarea-lang data-ng-model="section.text" data-rows="4" data-cols="30"></j-opt-textarea-lang>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Text Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="section.font"></j-opt-font>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Text Background Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="section.bg"></j-opt-color>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Line Through <small>Optional line through decoration for modules used as section titles.</small></span>
                    <span class="module-create-option">
                        <switch data-ng-model="section.line_through">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Headline Icon</span>
                    <span class="module-create-option">
                        <icon-select data-ng-model="section.icon"></icon-select>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Call to Action Button</span>
                    <span class="module-create-option">
                        <switch data-ng-model="section.cta">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="section.cta == '1'">
                    <span class="module-create-title">Button Text</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="section.cta_text"></j-opt-text-lang>
                    </span>
                </li>
                <li data-ng-show="section.cta == '1'">
                    <span class="module-create-title">Button Icon</span>
                    <span class="module-create-option">
                        <icon-select data-ng-model="section.cta_icon"></icon-select>
                    </span>
                </li>
                <li data-ng-show="section.cta == '1'">
                    <span class="module-create-title">Icon Position</span>
                    <span class="module-create-option">
                        <switch data-ng-model="section.cta_icon_position">
                            <switch-option key="left">Left</switch-option>
                            <switch-option key="right">Right</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="section.cta == '1'">
                    <span class="module-create-title">Link</span>
                    <span class="module-create-option">
                        <menu-item data-ng-model="section.cta_link"></menu-item>
                    </span>
                </li>
                <li data-ng-show="section.cta == '1'">
                    <span class="module-create-title">Open in New Tab</span>
                    <span class="module-create-option">
                        <switch data-ng-model="section.cta_new_window">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="section.cta == '1'">
                    <span class="module-create-title">Button Position</span>
                    <span class="module-create-option">
                        <switch data-ng-model="section.cta_position">
                            <switch-option key="left">Left</switch-option>
                            <switch-option key="center">Center</switch-option>
                            <switch-option key="right">Right</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="section.cta == '1'">
                    <span class="module-create-title">Button Offset</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input journal-number-field" data-ng-model="section.cta_offset_top" placeholder="Top"/> &nbsp;
                        <input type="text" class="journal-input journal-number-field" data-ng-model="section.cta_offset_left" placeholder="Left"/>
                    </span>
                </li>

                <li>
                    <span class="module-create-title">Status</span>
                    <span class="module-create-option">
                        <switch data-ng-model="section.status">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Sort Order</span>
                    <span class="module-create-option">
                         <input type="text" class="journal-input journal-sort" data-ng-model="section.sort_order" />
                    </span>
                </li>
            </ul>
        </accordion-group>
    </accordion>
    <div class="add-level add-level-1" data-ng-click="addSection()">Add Item +</div>
</div>
