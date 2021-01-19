<div class="sticky">
<div class="module-header">
    <div class='module-name'>Side Blocks <span data-ng-show="module_id == null">New Module</span><span data-ng-show="module_id != null">Edit Module</span></div>
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
    </div>
    <accordion close-others="false">
        <accordion-group is-open="true">
            <accordion-heading>
                <div class="accordion-bar bar-level-0" data-ng-click="$event.stopPropagation()">Side Block Settings</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Module Name</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input" data-ng-model="module_data.module_name" />
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Module Type</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.module_type">
                            <switch-option key="button">Button</switch-option>
                            <switch-option key="block">Block</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Icon</span>
                    <span class="module-create-option">
                        <icon-select data-ng-model="module_data.icon"></icon-select>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Button Size <small>Width x Height</small></span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input journal-number-field" data-ng-model="module_data.icon_width" /> x
                        <input type="text" class="journal-input journal-number-field" data-ng-model="module_data.icon_height" />
                    </span>
                </li>

                <li>
                    <span class="module-create-title">Icon Background Color</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input" color-picker data-ng-model="module_data.icon_bg_color" />
                    </span>
                </li>
                <li data-ng-show="module_data.module_type === 'button'">
                    <span class="module-create-title">Icon Background Hover Color</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input" color-picker data-ng-model="module_data.icon_bg_hover_color" />
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Icon Border Settings</span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="module_data.icon_border"></j-opt-border>
                    </span>
                </li>
                <li data-ng-show="module_data.module_type === 'block'">
                    <span class="module-create-title">Content Background Color</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input" color-picker data-ng-model="module_data.content_bg_color" />
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Position</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.alignment">
                            <switch-option key="left">Left</switch-option>
                            <switch-option key="right">Right</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Fixed</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.position">
                            <switch-option key="fixed">ON</switch-option>
                            <switch-option key="absolute">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Offset Top</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input journal-number-field" data-ng-model="module_data.offset_top" />
                    </span>
                </li>
                <li data-ng-show="module_data.module_type === 'button'">
                    <span class="module-create-title">Offset Side</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input journal-number-field" data-ng-model="module_data.offset_side" />
                    </span>
                </li>
                <li data-ng-show="module_data.module_type === 'block'">
                    <span class="module-create-title">Content Width</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input journal-number-field" data-ng-model="module_data.content_width" />
                    </span>
                </li>
                <li data-ng-show="module_data.module_type === 'block'">
                    <span class="module-create-title">Content Padding</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input journal-number-field" data-ng-model="module_data.content_padding" />
                    </span>
                </li>
                <li data-ng-show="module_data.module_type === 'button'">
                    <span class="module-create-title">Link</span>
                    <span class="module-create-option">
                        <menu-item data-ng-model="module_data.link"></menu-item>
                    </span>
                </li>
                <li data-ng-show="module_data.module_type === 'button'">
                    <span class="module-create-title">Open in New Tab</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.new_window">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Store</span>
                    <span class="module-create-option">
                        <select ui-select2="{minimumResultsForSearch: -1}" data-ng-model="module_data.store_id">
                            <option value="-1">All Stores</option>
                            <option data-ng-repeat="store in stores" value="{{store.store_id}}">{{store.name}}</option>
                        </select>
                    </span>
                </li>
                <li data-ng-show="module_data.module_type === 'block'">
                    <span class="module-create-title">Block Content</span>
                    <span class="module-create-option">
                        <ck-editor data-ng-model="module_data.content"></ck-editor>
                    </span>
                </li>
            </ul>
        </accordion-group>
    </accordion>
</div>

