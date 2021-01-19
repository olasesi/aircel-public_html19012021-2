<div class="sticky">
<div class="module-header">
    <div class='module-name'>Super Filter <span data-ng-show="module_id == null">New Module</span><span data-ng-show="module_id != null">Edit Module</span></div>
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
        <a data-ng-click="toggleAccordion(module_data.is_open, true)" class="hint--top" data-hint="Expand All"><i class="expand-icon"></i></a>  <a data-ng-click="toggleAccordion(module_data.is_open, false)" class="hint--top" data-hint="Collapse All"><i class="collapse-icon"></i></a>
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
                    <span class="module-create-title">Show Reset Button</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.reset">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Show Product Count</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.product_count">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Price Filter</span>
                    <span class="module-create-option filter-multi">
                        <switch data-ng-model="module_data.price">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                        <input type="text" class="journal-input journal-sort" data-ng-model="module_data.sort_orders['p']" placeholder="Sort" />
                    </span>
                </li>
                <li data-ng-show="module_data.price == '1'">
                    <span class="module-create-title">Price Filter Type</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.price_slider">
                            <switch-option key="1">Slider</switch-option>
                            <switch-option key="0">Input</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="module_data.price == '1'">
                    <span class="module-create-title">Tax Class</span>
                    <span class="module-create-option">
                        <select ui-select2="{minimumResultsForSearch: -1}" data-ng-model="module_data.tax_class_id">
                            <option data-ng-repeat="t in tax_classes" value="{{t.tax_class_id}}">{{t.title}}</option>
                        </select>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Categories</span>
                    <span class="module-create-option filter-multi">
                        <switch data-ng-model="module_data.category">
                            <switch-option key="list">List</switch-option>
                            <switch-option key="image">Image</switch-option>
                            <switch-option key="both">Both</switch-option>
                            <switch-option key="off">OFF</switch-option>
                        </switch>
                        <switch data-ng-model="module_data.category_type">
                            <switch-option key="multi">Multi</switch-option>
                            <switch-option key="single">Single</switch-option>
                        </switch>
                        <input type="text" class="journal-input journal-sort" data-ng-model="module_data.sort_orders['c']" placeholder="Sort" />
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Brands</span>
                    <span class="module-create-option filter-multi">
                        <switch data-ng-model="module_data.manufacturer">
                            <switch-option key="list">List</switch-option>
                            <switch-option key="image">Image</switch-option>
                            <switch-option key="both">Both</switch-option>
                            <switch-option key="off">OFF</switch-option>
                        </switch>
                        <switch data-ng-model="module_data.manufacturer_type">
                            <switch-option key="multi">Multi</switch-option>
                            <switch-option key="single">Single</switch-option>
                        </switch>
                        <input type="text" class="journal-input journal-sort" data-ng-model="module_data.sort_orders['m']" placeholder="Sort" />
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Tags</span>
                    <span class="module-create-option filter-multi">
                        <switch data-ng-model="module_data.tags">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                        <input type="text" class="journal-input journal-sort" data-ng-model="module_data.sort_orders['t']" placeholder="Sort" />
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Availability</span>
                    <span class="module-create-option filter-multi">
                        <switch data-ng-model="module_data.availability">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                        <input type="text" class="journal-input journal-sort" data-ng-model="module_data.sort_orders['a']" placeholder="Sort" />
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
        <accordion-group is-open="module_data.options_is_open" ng-show="options && options.length > 0">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Options</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li data-ng-repeat="option in options">
                    <span class="module-create-title">{{option.name}}</span>
                    <span class="module-create-option filter-multi">
                        <switch data-ng-model="module_data.options[option.option_id]">
                            <switch-option key="list">List</switch-option>
                            <switch-option key="image">Image</switch-option>
                            <switch-option key="both">Both</switch-option>
                            <switch-option key="off">OFF</switch-option>
                        </switch>
                        <switch data-ng-model="module_data.options_type[option.option_id]">
                            <switch-option key="multi">Multi</switch-option>
                            <switch-option key="single">Single</switch-option>
                        </switch>
                        <input type="text" class="journal-input journal-sort" data-ng-model="module_data.sort_orders['o_' + option.option_id]" placeholder="Sort" />
                    </span>
                </li>
            </ul>
        </accordion-group>
        <accordion-group is-open="module_data.filters_is_open" ng-show="filters && filters.length > 0">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Opencart Filters</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li data-ng-repeat="filter in filters">
                    <span class="module-create-title">{{filter.name}}</span>
                    <span class="module-create-option filter-multi">
                        <switch data-ng-model="module_data.filters[filter.filter_group_id]">
                            <switch-option key="on">ON</switch-option>
                            <switch-option key="off">OFF</switch-option>
                        </switch>
                        <switch data-ng-model="module_data.filters_type[filter.filter_group_id]">
                            <switch-option key="multi">Multi</switch-option>
                            <switch-option key="single">Single</switch-option>
                        </switch>
                        <input type="text" class="journal-input journal-sort" data-ng-model="module_data.sort_orders['f_' + filter.filter_group_id]" placeholder="Sort" />
                    </span>
                </li>
            </ul>
        </accordion-group>
        <accordion-group is-open="module_data.is_open[attribute_group.group_id].is_open" data-ng-repeat="attribute_group in attributes">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">{{attribute_group.group_name}} Attributes</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li data-ng-repeat="attribute in attribute_group.attributes">
                    <span class="module-create-title">{{attribute.name}}</span>
                    <span class="module-create-option filter-multi">
                        <switch data-ng-model="module_data.attributes[attribute.attribute_id]">
                            <switch-option key="on">ON</switch-option>
                            <switch-option key="off">OFF</switch-option>
                        </switch>
                        <switch data-ng-model="module_data.attributes_type[attribute.attribute_id]">
                            <switch-option key="multi">Multi</switch-option>
                            <switch-option key="single">Single</switch-option>
                        </switch>
                        <input type="text" class="journal-input journal-sort" data-ng-model="module_data.sort_orders['a_' + attribute.attribute_id]" placeholder="Sort" />
                    </span>
                </li>
            </ul>
        </accordion-group>
    </accordion>
</div>
