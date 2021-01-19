<div class="sticky">
<div class="module-header">
    <div class='module-name'>Side Category<span data-ng-show="module_id == null">New Module</span><span data-ng-show="module_id != null">Edit Module</span></div>
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
                    <span class="module-create-title">Title</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="module_data.title"></j-opt-text-lang>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Enable Default Categories</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.show_categories">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
            </ul>
        </accordion-group>
        <accordion-group data-ng-repeat="section in module_data.sections" is-open="section.is_open">
            <accordion-heading>
                <div class="accordion-bar bar-level-1"> {{section.name.value[default_language] || ('Section ' + ($index + 1))}} <a href="javascript:;" class="accordion-remove slide-remove" data-ng-click="removeSection($index)"><b ></b>Remove</a> <a href="javascript:;" class="accordion-remove slide-remove" data-ng-click="duplicateSection($index); $event.stopPropagation()"><b ></b>Duplicate</a></div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Menu Item Name</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="section.name"></j-opt-text-lang>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Position <small>Above or below the default categories</small></span>
                    <span class="module-create-option">
                        <switch data-ng-model="section.position">
                            <switch-option key="top">Top</switch-option>
                            <switch-option key="bottom">Bottom &nbsp; &nbsp;</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Type</span>
                    <span class="module-create-option">
                        <switch data-ng-model="section.type">
                            <switch-option key="custom">Custom</switch-option>
                            <switch-option key="category">Category</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="section.type == 'custom'">
                    <span class="module-create-title">Link</span>
                    <span class="module-create-option">
                        <menu-item data-ng-model="section.link"></menu-item>
                    </span>
                </li>
                <li data-ng-show="section.type == 'custom'">
                    <span class="module-create-title">Open in New Tab</span>
                    <span class="module-create-option">
                        <switch data-ng-model="section.new_window">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="section.type == 'category'">
                    <span class="module-create-title">Category</span>
                    <span class="module-create-option">
                        <category-search model="section.category.data"></category-search>
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
    <div class="add-level add-level-1" data-ng-click="addSection()">Add Custom Menu +</div>
</div>
