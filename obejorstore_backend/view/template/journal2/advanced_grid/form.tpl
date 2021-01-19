<div class="sticky">
<div class="module-header">
    <div class='module-name'>Advanced Grid <span data-ng-show="module_id == null">New Module</span><span data-ng-show="module_id != null">Edit Module</span></div>
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
        <a data-ng-click="toggleAccordion(module_data.columns, true)" class="hint--top" data-hint="Expand All"><i class="expand-icon"></i></a>  <a data-ng-click="toggleAccordion(module_data.columns, false)" class="hint--top" data-hint="Collapse All"><i class="collapse-icon"></i></a>
        <label class="close-others hint--top" data-hint="Close Others"><input type="checkbox" data-ng-model="module_data.close_others" /></label>
    </div>
    <accordion close-others="module_data.close_others">
        <accordion-group is-open="module_data.general_is_open">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">General</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Module Name</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input journal-name-field" data-ng-model="module_data.module_name" required />
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Height</span>
                        <span class="module-create-option">
                             <input type="text" class="journal-input journal-number-field" data-ng-model="module_data.height" />
                        </span>
                </li>
                <li>
                    <span class="module-create-title">Spacing</span>
                        <span class="module-create-option">
                             <input type="text" class="journal-input journal-number-field" data-ng-model="module_data.module_spacing" />
                        </span>
                </li>
                <li>
                    <span class="module-create-title">Show Grid Dimensions</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.grid_dimensions">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
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
        <accordion-group data-ng-repeat="column in module_data.columns" is-open="column.is_open" ng-init="$parentIndex = $index">
            <accordion-heading>
                <div class="accordion-bar bar-level-1"> {{'Column ' + ($index + 1)}} - {{column.width}} % <a href="javascript:;" class="accordion-remove slide-remove" data-ng-click="removeColumn($index)"><b></b>Remove</a> <a href="javascript:;" class="accordion-remove slide-remove" data-ng-click="duplicateColumn($index); $event.stopPropagation()"><b></b>Duplicate</a></div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Column Width</span>
                    <span class="module-create-option">
                        <select data-ng-model="column.width" ui-select2="{width: 50, minimumResultsForSearch: -1, placeholder: 'Choose Width'}">
                            <option value=""></option>
                            <option value="25">25%</option>
                            <option value="33.33333">33%</option>
                            <option value="50">50%</option>
                            <option value="66.66666">66%</option>
                            <option value="75">75%</option>
                            <option value="100">100%</option>
                        </select>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Status</span>
                    <span class="module-create-option">
                        <switch data-ng-model="column.status">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Sort Order</span>
                    <span class="module-create-option">
                         <input type="text" class="journal-input journal-sort" data-ng-model="column.sort_order" />
                    </span>
                </li>
            </ul>
            <div class="accordion-bar bar-level-1 bar-expand">
                <a data-ng-click="toggleAccordion2(column, true)" class="hint--top hint-fix" data-hint="Expand All"><i class="expand-icon"></i></a>  <a data-ng-click="toggleAccordion2(column, false)" class="hint--top hint-fix" data-hint="Collapse All"><i class="collapse-icon"></i></a>
                <label class="close-others hint--top" data-hint="Close Others"><input type="checkbox" data-ng-model="column.close_others" /></label>
            </div>
            <accordion close-others="column.close_others">
                <accordion-group data-ng-repeat="module in column.modules" is-open="module.is_open">
                    <accordion-heading>
                        <div class="accordion-bar bar-level-2">Module {{$index + 1}} <a href="javascript:;" class="accordion-remove slide-remove" data-ng-click="removeModule(column, $index)"><b></b>Remove</a> <a href="javascript:;" class="accordion-remove slide-remove" data-ng-click="duplicateModule($parentIndex, $index); $event.stopPropagation()"><b></b>Duplicate</a></div>
                    </accordion-heading>
                    <ul class="module-create-options">
                        <li>
                            <span class="module-create-title">Module</span>
                            <span class="module-create-option">
                                <select data-ng-model="module.module_id" ui-select2="{width: 50, minimumResultsForSearch: -1, placeholder: 'Choose Module'}">
                                    <option value=""></option>
                                    <optgroup data-ng-repeat="group in modules" label="{{group.module_type}}">
                                        <option data-ng-repeat="module in group.modules" value="{{module.module_id}}">{{module.module_name}}</option>
                                    </optgroup>
                                </select>
                            </span>
                        </li>
                        <li>
                            <span class="module-create-title">Module Height</span>
                            <span class="module-create-option">
                                <select data-ng-model="module.height" ui-select2="{width: 50, minimumResultsForSearch: -1, placeholder: 'Choose Height'}">
                                    <option value=""></option>
                                    <option value="25">25%</option>
                                    <option value="33.33333">33%</option>
                                    <option value="50">50%</option>
                                    <option value="66.66666">66%</option>
                                    <option value="75">75%</option>
                                    <option value="100">100%</option>
                                </select>
                            </span>
                        </li>
                        <li>
                            <span class="module-create-title">Enable on Phone</span>
                            <span class="module-create-option">
                                <switch data-ng-model="module.enable_on_phone">
                                    <switch-option key="1">ON</switch-option>
                                    <switch-option key="0">OFF</switch-option>
                                </switch>
                            </span>
                        </li>
                        <li>
                            <span class="module-create-title">Enable on Tablet</span>
                            <span class="module-create-option">
                                <switch data-ng-model="module.enable_on_tablet">
                                    <switch-option key="1">ON</switch-option>
                                    <switch-option key="0">OFF</switch-option>
                                </switch>
                            </span>
                        </li>
                        <li>
                            <span class="module-create-title">Enable on Desktop</span>
                            <span class="module-create-option">
                                <switch data-ng-model="module.enable_on_desktop">
                                    <switch-option key="1">ON</switch-option>
                                    <switch-option key="0">OFF</switch-option>
                                </switch>
                            </span>
                        </li>
                        <li>
                            <span class="module-create-title">Status</span>
                            <span class="module-create-option">
                                <switch data-ng-model="module.status">
                                    <switch-option key="1">ON</switch-option>
                                    <switch-option key="0">OFF</switch-option>
                                </switch>
                            </span>
                        </li>
                        <li>
                            <span class="module-create-title">Sort Order</span>
                            <span class="module-create-option">
                                <input type="text" data-ng-model="module.sort_order" class="journal-input journal-sort" />
                            </span>
                        </li>
                    </ul>
                </accordion-group>
            </accordion>
            <div class="add-level add-level-2" data-ng-click="addModule(column)">Add Module +</div>
        </accordion-group>
    </accordion>
    <div class="add-level add-level-1" data-ng-click="addColumn()">Add Column +</div>
</div>
