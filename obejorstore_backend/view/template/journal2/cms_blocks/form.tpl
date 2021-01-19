<div class="sticky">
<div class="module-header">
    <div class='module-name'>CMS Blocks <span data-ng-show="module_id == null">New Module</span><span data-ng-show="module_id != null">Edit Module</span></div>
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
                    <span class="module-create-title">Module Title</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="module_data.module_title"></j-opt-text-lang>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Items per Row</span>
                    <span class="module-create-option">
                        <j-opt-items-per-row data-ng-model="module_data.items_per_row"></j-opt-items-per-row>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Block Background</span>
                    <span class="module-create-option">
                        <j-opt-background bgcolor="true" data-ng-model="module_data.bg"></j-opt-background>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Block Shadow</span>
                    <span class="module-create-option">
                        <j-opt-shadow data-ng-model="module_data.shadow"></j-opt-shadow>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Block Border Settings</span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="module_data.border"></j-opt-border>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Block Container Padding</span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="module_data.padding" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Blocks Bottom Margin</span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="module_data.bottom_margin" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Headings Font <small>H1 - H3 tags</small></span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="module_data.cms_heading_font"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Block Font <small>p tag</small></span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="module_data.cms_font_color"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Block Text Line Height <small>Pixels</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="module_data.cms_block_line_height" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Headings Spacing <small>Padding Bottom</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="module_data.cms_heading_padding" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Paragraph  Spacing <small>Padding Bottom</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="module_data.cms_block_p_padding" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
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
                <li data-ng-show="module_data.fullwidth == 0">
                    <span class="module-create-title">Gutter</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.module_padding">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
            </ul>
        </accordion-group>
        <accordion-group data-ng-repeat="section in module_data.sections" is-open="section.is_open">
            <accordion-heading>
                <div class="accordion-bar bar-level-1"> {{'Item ' + ($index + 1)}} <a href="javascript:;" class="accordion-remove slide-remove" data-ng-click="removeSection($index)"><b></b>Remove</a> <a href="javascript:;" class="accordion-remove slide-remove" data-ng-click="duplicateSection($index); $event.stopPropagation()"><b></b>Duplicate</a></div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Background</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="section.bg_color"></j-opt-color>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Background</span>
                    <span class="module-create-option">
                        <j-opt-background data-ng-model="section.background"></j-opt-background>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Add Icon</span>
                    <span class="module-create-option">
                        <switch data-ng-model="section.icon_status">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="section.icon_status == 1">
                    <span class="module-create-title">Icon Position</span>
                    <span class="module-create-option">
                        <switch data-ng-model="section.icon_position">
                            <switch-option key="left">Left</switch-option>
                            <switch-option key="top">Top</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="section.icon_status == 1">
                    <span class="module-create-title">Icon Negative Offset <small>Pushes icon up out of the block content</small></span>
                    <span class="module-create-option">
                         <input type="text" value="" class="journal-number-field" data-ng-model="section.block_icon_offset" />
                    </span>
                </li>
                <li data-ng-show="section.icon_status == 1">
                    <span class="module-create-title">Icon</span>
                    <span class="module-create-option">
                        <icon-select data-ng-model="section.icon"></icon-select>
                    </span>
                </li>

                <li data-ng-show="section.icon_status == 1">
                    <span class="module-create-title">Icon Container Background</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="section.icon_bg_color"></j-opt-color>
                    </span>
                </li>
                <li data-ng-show="section.icon_status == 1">
                    <span class="module-create-title">Icon Container Border</span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="section.icon_border"></j-opt-border>
                    </span>
                </li>
                <li data-ng-show="section.icon_status == 1">
                    <span class="module-create-title">Icon Container Dimensions</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-number-field" data-ng-model="section.icon_width" /> x <input type="text" class="journal-number-field" data-ng-model="section.icon_height" />
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
                         <input type="text" value="" class="journal-input journal-sort" data-ng-model="section.sort_order" />
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Block Content Align</span>
                    <span class="module-create-option">
                        <switch data-ng-model="section.text_align">
                            <switch-option key="left">Left</switch-option>
                            <switch-option key="center">Center</switch-option>
                            <switch-option key="right">Right</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Content</span>
                    <span class="module-create-option">
                        <ck-editor data-ng-model="section.text"></ck-editor>
                    </span>
                </li>
            </ul>
        </accordion-group>
    </accordion>
    <div class="add-level add-level-1" data-ng-click="addSection()">Add Block +</div>
</div>
