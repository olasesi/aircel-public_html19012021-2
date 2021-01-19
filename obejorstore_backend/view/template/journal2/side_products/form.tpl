<div class="sticky">
<div class="module-header">
    <div class='module-name'>Side Products <span data-ng-show="module_id == null">New Module</span><span data-ng-show="module_id != null">Edit Module</span></div>
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
        <accordion-group is-open="true">
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
                        <j-opt-text-lang data-ng-model="module_data.section_title"></j-opt-text-lang>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Section Type</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.section_type">
                            <switch-option key="module">Module</switch-option>
                            <switch-option key="category">Category</switch-option>
                            <switch-option key="manufacturer">Brand</switch-option>
                            <switch-option key="random">Random</switch-option>
                            <switch-option key="custom">Custom</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="module_data.section_type == 'module'">
                    <span class="module-create-title">Module Type <small data-ng-show="module_data.section_type == 'module' && (module_data.module_type === 'related' || module_data.module_type === 'people-also-bought')">Product and Blog Post Layouts Only</small></span>
                    <span class="module-create-option">
                        <select data-ng-model="module_data.module_type" ui-select2="{minimumResultsForSearch: -1}">
                            <option value="featured">Featured</option>
                            <option value="bestsellers">Bestsellers</option>
                            <option value="specials">Specials</option>
                            <option value="latest">Latest</option>
                            <option value="related">Related</option>
                            <option value="people-also-bought">Also Bought</option>
                            <option value="recently-viewed">Recently Viewed</option>
                            <option value="most-viewed">Most Viewed</option>
                        </select>
                    </span>
                </li>
                <li data-ng-show="module_data.section_type == 'module' && module_data.module_type == 'featured' && featured_modules !== null">
                    <span class="module-create-title">Featured Modules</span>
                    <span class="module-create-option">
                        <select data-ng-model="module_data.featured_module_id" ui-select2="{width: 50, minimumResultsForSearch: -1, placeholder: 'Choose Module'}">
                            <option value=""></option>
                            <option data-ng-repeat="module in featured_modules" value="{{module.module_id}}">{{module.name}}</option>
                        </select>
                    </span>
                </li>
                <li data-ng-show="module_data.section_type == 'category'">
                    <span class="module-create-title">Category</span>
                    <span class="module-create-option">
                        <category-search model="module_data.category.data"></category-search>
                    </span>
                </li>
                <li data-ng-show="module_data.section_type == 'manufacturer'">
                    <span class="module-create-title">Brand</span>
                    <span class="module-create-option">
                        <manufacturer-search model="module_data.manufacturer.data"></manufacturer-search>
                    </span>
                </li>
                <li data-ng-show="module_data.section_type == 'custom'">
                    <span class="module-create-title">Products</span>
                    <span class="module-create-option">
                         <ul class="simple-list">
                             <li data-ng-repeat="item in module_data.products">
                                 <input type="text" ng-model="item.sort_order" class="journal-sort" placeholder="Sort" />
                                 <product-search model="item.data"></product-search>
                                 <a class="btn red delete" href="javascript:;" data-ng-click="removeProduct($index)">X</a>
                             </li>
                         </ul>
                        <a href="javascript:;" class="btn blue add-product" data-ng-click="addProduct()">Add</a>
                    </span>
                </li>
                <li data-ng-show="module_data.section_type == 'random'">
                    <span class="module-create-title">Random From</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.random_from">
                            <switch-option key="all"> &nbsp;&nbsp;&nbsp; All &nbsp;&nbsp;&nbsp;</switch-option>
                            <switch-option key="category">Category</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="module_data.section_type == 'random' && module_data.random_from == 'category'">
                    <span class="module-create-title">Category</span>
                    <span class="module-create-option">
                        <category-search model="module_data.random_from_category"></category-search>
                    </span>
                </li>

                <!--<li data-ng-show="module_data.section_type == 'module' && (module_data.module_type === 'featured' || module_data.module_type === 'bestsellers' || module_data.module_type === 'specials' || module_data.module_type === 'latest')">-->
                    <!--<span class="module-create-title">Auto Category<small>Category Layout Only</small></span>-->
                       <!--<span class="module-create-option">-->
                       <!--<switch data-ng-model="module_data.filter_category">-->
                           <!--<switch-option key="1">ON</switch-option>-->
                           <!--<switch-option key="0">OFF</switch-option>-->
                       <!--</switch>-->
                    <!--</span>-->
                <!--</li>-->
                <li>
                    <span class="module-create-title">Item Limit</span>
                    <span class="module-create-option">
                         <input type="text" value="" class="journal-input journal-sort" data-ng-model="module_data.items_limit" />
                    </span>
                </li>
            </ul>
        </accordion-group>
    </accordion>
</div>
