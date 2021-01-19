<div class="sticky">
<div class="module-header">
    <div class='module-name'>FullScreen Slider <span data-ng-show="module_id == null">New Module</span><span data-ng-show="module_id != null">Edit Module</span></div>
    <div class="module-buttons">
        <a href="<?php echo $base_href;?>#/module/{{module_type}}/all/{{module_id}}" data-ng-show="module_id != null" class="btn blue">Add to Layout</a>
        <a data-ng-click="save($event)" class="btn green">Save</a>
        <a href="<?php echo $base_href;?>#/module/{{module_type}}/all" data-ng-show="module_id == null" class="btn red">Cancel</a>
        <a data-ng-click="delete($event)" data-ng-show="module_id != null" class="btn red">Delete</a>
    </div>
</div>
</div>
<div class="module-body module-form fullscreen-slider">
    <div class="accordion-bar bar-level-0 bar-expand" >
        <a data-ng-click="toggleAccordion(module_data.images, true)" class="hint--top" data-hint="Expand All"><i class="expand-icon"></i></a>  <a data-ng-click="toggleAccordion(module_data.images, false)" class="hint--top" data-hint="Collapse All"><i class="collapse-icon"></i></a>
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
                        <input type="text" class="journal-input" style="width: 215px;" data-ng-model="module_data.module_name" />
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Transition</span>
                        <span class="module-create-option">
                            <select ui-select2="" data-ng-model="module_data.transition">
                                <option data-ng-repeat="tr in transitions" value="{{tr.id}}">{{tr.name}}</option>
                            </select>
                        </span>
                </li>
                <li>
                    <span class="module-create-title">Transition Speed</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input journal-number-field" data-ng-model="module_data.transition_speed" />
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Transition Delay</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input journal-number-field" data-ng-model="module_data.transition_delay" />
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Transparent Overlay</span>
                    <span class="module-create-option">
                        <image-select image="module_data.transparent_overlay"></image-select>
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
        <accordion-group data-ng-repeat="image in module_data.images" is-open="image.is_open">
            <accordion-heading>
                <div class="accordion-bar bar-level-1"> Image {{$index + 1}} <a href="javascript:;" class="accordion-remove slide-remove" data-ng-click="removeImage($index)"><b ></b>Remove</a> <a href="javascript:;" class="accordion-remove slide-remove" data-ng-click="duplicateImage($index); $event.stopPropagation()"><b ></b>Duplicate</a></div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Image</span>
                    <span class="module-create-option">
                        <image-select-lang image="image.image"></image-select-lang>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Status</span>
                    <span class="module-create-option">
                        <switch data-ng-model="image.status">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Sort Order</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input journal-sort" data-ng-model="image.sort_order" />
                    </span>
                </li>
            </ul>
        </accordion-group>
    </accordion>
    <div class="add-level add-level-1" data-ng-click="addImage()">Add Image +</div>
</div>
