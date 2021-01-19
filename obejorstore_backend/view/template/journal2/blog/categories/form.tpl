<div class="sticky">
<div class="module-header">
    <div class='module-name'>Blog Categories <span data-ng-show="category_id == null">New Category</span><span data-ng-show="category_id != null">Edit Category</span></div>
    <div class="module-buttons">
        <a href="<?php echo $base_href;?>#/blog/categories" class="btn blue">Back</a>
        <a data-ng-click="save($event)" class="btn green">Save</a>
        <a data-ng-click="delete($event)" data-ng-show="category_id != null" class="btn red">Delete</a>
    </div>
</div>
</div>
<div class="module-body module-form">
    <div class="accordion-bar bar-level-0 bar-expand" >
        <a data-ng-click="toggleAccordion(true)" class="hint--top" data-hint="Expand All"><i class="expand-icon"></i></a>  <a data-ng-click="toggleAccordion(false)" class="hint--top" data-hint="Collapse All"><i class="collapse-icon"></i></a>
        <label class="close-others hint--top" data-hint="Close Others"><input type="checkbox" data-ng-model="accordion.close_others" /></label>
    </div>
    <accordion id="main-accordion" close-others="accordion.close_others">
        <accordion-group is-open="accordion.general_is_open">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">General</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Category Name</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="category_data.name"></j-opt-text-lang>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Seo Keyword</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="category_data.keyword"></j-opt-text-lang>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Category Description</span>
                    <span class="module-create-option">
                        <ck-editor data-ng-model="category_data.description"></ck-editor>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Status</span>
                    <span class="module-create-option">
                        <switch data-ng-model="category_data.status">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Sort Order</span>
                    <span class="module-create-option">
                         <input type="text" class="journal-input journal-sort" data-ng-model="category_data.sort_order" />
                    </span>
                </li>
            </ul>
        </accordion-group>
        <accordion-group is-open="accordion.data_is_open">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Meta Data</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Category Meta Title</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="category_data.meta_title"></j-opt-text-lang>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Category Meta Keywords</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="category_data.meta_keywords"></j-opt-text-lang>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Category Meta Description</span>
                    <span class="module-create-option">
                        <j-opt-textarea-lang data-ng-model="category_data.meta_description"></j-opt-textarea-lang>
                    </span>
                </li>
            </ul>
        </accordion-group>
        <accordion-group is-open="accordion.layouts_is_open">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Layout Overwrite</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li data-ng-repeat="store in stores">
                    <span class="module-create-title">{{store.name}} Store</span>
                    <span class="module-create-option">
                        <select class="journal-select" data-ng-model="category_data.layouts['s_' + store.store_id]" ui-select2="{width: 400, minimumResultsForSearch: -1, placeholder: 'Choose Layout'}" required>
                            <option value="">&nbsp;</option>
                            <option data-ng-repeat="l in layouts" value="{{l.layout_id}}">{{l.name}}</option>
                        </select>
                    </span>
                </li>
            </ul>
        </accordion-group>
        <accordion-group is-open="accordion.stores_is_open">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Stores</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li data-ng-repeat="store in stores">
                    <span class="module-create-title">{{store.name}} Store</span>
                    <span class="module-create-option">
                        <switch data-ng-model="category_data.stores['s_' + store.store_id]">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
            </ul>
        </accordion-group>
    </accordion>
</div>
