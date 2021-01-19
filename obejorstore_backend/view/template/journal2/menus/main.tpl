<div class="sticky">
<div class="module-header">
    <div class='module-name'>Header<span>Main Menu</span></div>

    <store-picker data-url="menus/main"></store-picker>

    <div class="module-buttons">
        <a class="btn green" data-ng-click="save($event)">Save</a>
        <a class="btn red" data-ng-click="reset($event)">Reset</a>
    </div>
</div>
</div>
<div class="module-body">
    <div class="accordion-bar bar-level-0 bar-expand" >
        <a data-ng-click="toggleAccordion(items, null, true)" class="hint--top" data-hint="Expand All"><i class="expand-icon"></i></a>  <a data-ng-click="toggleAccordion(items, null, false)" class="hint--top" data-hint="Collapse All"><i class="collapse-icon"></i></a>
        <label class="close-others hint--top" data-hint="Close Others"><input type="checkbox" data-ng-model="close_others" /></label>
    </div>
    <accordion close-others="close_others">
        <accordion-group is-open="options.is_open">
            <accordion-heading>
                <div class="accordion-bar bar-level-0"> General Options</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Menu Display <small>Center / Mega Headers</small></span>
                    <span class="module-create-option">
                        <switch data-ng-model="options.display">
                            <switch-option key="table">Table</switch-option>
                            <switch-option key="floated">Float</switch-option>
                            <switch-option key="centered">Centered</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="options.display === 'table'">
                    <span class="module-create-title">Table Layout</span>
                    <span class="module-create-option">
                        <switch data-ng-model="options.table_layout">
                            <switch-option key="fixed">Fixed</switch-option>
                            <switch-option key="auto">Auto</switch-option>
                        </switch>
                    </span>
                </li>
            </ul>
        </accordion-group>
        <accordion-group data-ng-repeat="menu in items" is-open="menu.is_open" ng-init="$parentIndex = $index">
            <accordion-heading>
                <div class="accordion-bar bar-level-0"> {{getItemName($index, menu)}} <a href="javascript:;" class="accordion-remove slide-remove" data-ng-click="removeMenu($index)"><b></b>Remove</a> <a class="accordion-remove slide-remove" data-ng-click="duplicateMenu($index); $event.stopPropagation()"><b ></b>Duplicate</a></div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Item Name</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input journal-name-field" data-ng-model="menu.item_name" required />
                    </span>
                </li>
                <!-- menu type -->
                <li>
                    <span class="module-create-title">Main Menu Type</span>
                    <span class="module-create-option">
                        <switch data-ng-model="menu.type">
                            <switch-option key="categories">Category</switch-option>
                            <switch-option key="products">Products</switch-option>
                            <switch-option key="manufacturers">Brands</switch-option>
                            <switch-option key="custom">Custom</switch-option>
                            <switch-option key="html">HTML</switch-option>
                            <switch-option key="mixed">Mixed</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Icon</span>
                    <span class="module-create-option">
                        <icon-select data-ng-model="menu.icon"></icon-select>
                    </span>
                </li>
                <li data-ng-show="options.display === 'floated'">
                    <span class="module-create-title">Float</span>
                    <span class="module-create-option">
                        <switch data-ng-model="menu.float">
                            <switch-option key="left">Left</switch-option>
                            <switch-option key="right">Right</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Hide Text</span>
                    <span class="module-create-option">
                        <switch data-ng-model="menu.hide_text">
                            <switch-option key="1">Yes</switch-option>
                            <switch-option key="0">No</switch-option>
                        </switch>
                    </span>
                </li>
                <!-- categories -->
                <li data-ng-show="menu.type === 'categories'">
                    <span class="module-create-title">Category Menu Type</span>
                    <span class="module-create-option">
                        <switch data-ng-model="menu.categories.render_as">
                            <switch-option key="megamenu">Mega Menu</switch-option>
                            <switch-option key="dropdown">Multi Level</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="menu.type === 'categories'">
                    <span class="module-create-title">Category Menu Item</span>
                    <span class="module-create-option">
                        <switch data-ng-model="menu.categories.type">
                            <switch-option key="existing">&nbsp;&nbsp;&nbsp;Existing&nbsp;&nbsp;&nbsp;</switch-option>
                            <switch-option key="custom">&nbsp;&nbsp;Manual&nbsp;&nbsp;</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="menu.type === 'categories' && menu.categories.type === 'existing'">
                    <span class="module-create-title">Top Category</span>
                    <span class="module-create-option">
                        <category-search model="menu.categories.top"></category-search>
                    </span>
                </li>
                <li data-ng-show="menu.type === 'categories' && menu.categories.type === 'custom'">
                    <span class="module-create-title">Categories</span>
                    <span class="module-create-option">
                        <ul class="simple-list">
                            <li data-ng-repeat="item in menu.categories.items">
                                <category-search model="item.data"></category-search>
                                <a class="btn red delete" data-ng-click="removeItem(menu.categories, $index)">X</a>
                            </li>
                        </ul>
                        <a class="btn blue add-product" data-ng-click="addItem(menu.categories)">Add</a>
                    </span>
                </li>
                <li data-ng-show="menu.type === 'categories' && menu.categories.render_as === 'megamenu'">
                    <span class="module-create-title">Links Type</span>
                    <span class="module-create-option">
                        <switch data-ng-model="menu.categories.links_type">
                            <switch-option key="categories">SubCateg</switch-option>
                            <switch-option key="products">Products</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="menu.type === 'categories' && menu.categories.render_as === 'megamenu'">
                    <span class="module-create-title">Show</span>
                    <span class="module-create-option">
                        <switch data-ng-model="menu.categories.show">
                            <switch-option key="links">Links</switch-option>
                            <switch-option key="image">Image</switch-option>
                            <switch-option key="both">Both</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="menu.type === 'categories' && menu.categories.render_as === 'megamenu' && menu.categories.show === 'both'">
                    <span class="module-create-title">Image Position</span>
                    <span class="module-create-option">
                        <switch data-ng-model="menu.categories.image_position">
                            <switch-option key="left">Left</switch-option>
                            <switch-option key="top">Top</switch-option>
                            <switch-option key="right">Right</switch-option>
                        </switch>
                    </span>
                </li>

                <!-- products -->
                <li data-ng-show="menu.type === 'products'">
                    <span class="module-create-title">Source</span>
                    <span class="module-create-option">
                        <switch data-ng-model="menu.products.source">
                            <switch-option key="module">Module</switch-option>
                            <switch-option key="category">Category</switch-option>
                            <switch-option key="manufacturer">Brand</switch-option>
                            <switch-option key="random">Random</switch-option>
                            <switch-option key="custom">Custom</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="menu.type === 'products' && menu.products.source === 'category'">
                    <span class="module-create-title">Category</span>
                    <span class="module-create-option">
                        <category-search model="menu.products.category"></category-search>
                    </span>
                </li>
                <li data-ng-show="menu.type === 'products' && menu.products.source === 'module'">
                    <span class="module-create-title">Module</span>
                    <span class="module-create-option">
                        <switch data-ng-model="menu.products.module_type">
                            <switch-option key="featured">Featured</switch-option>
                            <switch-option key="latest">Latest</switch-option>
                            <switch-option key="bestseller">Bestseller</switch-option>
                            <switch-option key="special">Special</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="menu.type === 'products' && menu.products.source === 'module' && menu.products.module_type == 'featured' && featured_modules !== null">
                    <span class="module-create-title">Featured Modules</span>
                    <span class="module-create-option">
                        <select data-ng-model="menu.products.featured_module_id" ui-select2="{width: 50, minimumResultsForSearch: -1, placeholder: 'Choose Module'}">
                            <option value=""></option>
                            <option data-ng-repeat="module in featured_modules" value="{{module.module_id}}">{{module.name}}</option>
                        </select>
                    </span>
                </li>
                <li data-ng-show="menu.type === 'products' && menu.products.source === 'manufacturer'">
                    <span class="module-create-title">Brand</span>
                    <span class="module-create-option">
                        <manufacturer-search model="menu.products.manufacturer"></manufacturer-search>
                    </span>
                </li>
                <!-- custom -->
                <li data-ng-show="menu.type === 'custom'">
                    <span class="module-create-title">Menu Link</span>
                    <span class="module-create-option">
                        <menu-item data-ng-model="menu.custom.top"></menu-item>
                    </span>
                </li>
                <li data-ng-show="menu.type === 'custom'">
                    <span class="module-create-title">Open in New Tab</span>
                    <span class="module-create-option">
                        <switch data-ng-model="menu.custom.target">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">{{ menu.type === 'manufacturers' || menu.type === 'custom' || menu.type === 'html' || menu.type === 'mixed' || (menu.type === 'categories' && menu.categories.type === 'custom') ? '' : 'Overwrite ' }}Menu Name</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="menu.name"></j-opt-text-lang>
                    </span>
                </li>

                <li data-ng-hide="menu.type === 'categories' || menu.type === 'custom'">
                    <span class="module-create-title">Menu Link</span>
                    <span class="module-create-option">
                        <menu-item data-ng-model="menu.html_menu_link"></menu-item>
                    </span>
                </li>

                <!-- custom products -->
                <li data-ng-show="menu.type === 'products' && menu.products.source === 'custom'">
                    <span class="module-create-title">Products</span>
                    <span class="module-create-option">
                        <ul class="simple-list">
                            <li data-ng-repeat="item in menu.products.items">
                                <input type="text" ng-model="item.sort_order" class="journal-sort" placeholder="Sort" />
                                <product-search model="item.data"></product-search>
                                <a class="btn red delete" data-ng-click="removeItem(menu.products, $index)">X</a>
                            </li>
                        </ul>
                        <a class="btn blue add-product" data-ng-click="addItem(menu.products)">Add</a>
                    </span>
                </li>
                <li data-ng-show="menu.type === 'manufacturers'">
                    <span class="module-create-title">Manufacturers</span>
                    <span class="module-create-option">
                        <switch data-ng-model="menu.manufacturers.type">
                            <switch-option key="all">All</switch-option>
                            <switch-option key="custom">Custom &nbsp; &nbsp; &nbsp;</switch-option>
                        </switch>
                    </span>
                </li>
                <!-- manufacturers -->
                <li data-ng-show="menu.type === 'manufacturers' && menu.manufacturers.type === 'custom'">
                    <span class="module-create-title">Manufacturers</span>
                    <span class="module-create-option">
                        <ul class="simple-list">
                            <li data-ng-repeat="item in menu.manufacturers.items">
                                <manufacturer-search model="item.data"></manufacturer-search>
                                <a class="btn red delete" data-ng-click="removeItem(menu.manufacturers, $index)">X</a>
                            </li>
                        </ul>
                        <a class="btn blue add-product" data-ng-click="addItem(menu.manufacturers)">Add</a>
                    </span>
                </li>
                <li data-ng-show="menu.type === 'manufacturers'">
                    <span class="module-create-title">Show</span>
                    <span class="module-create-option">
                        <switch data-ng-model="menu.manufacturers.show">
                            <switch-option key="text">Text</switch-option>
                            <switch-option key="image">Image</switch-option>
                            <switch-option key="both">Both</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="(menu.type === 'categories' && menu.categories.render_as === 'megamenu' && menu.categories.show !== 'links') || menu.type === 'products' || (menu.type === 'manufacturers' && menu.manufacturers.show != 'text')">
                    <span class="module-create-title">Image Dimensions</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-number-field" data-ng-model="menu.image_width" /> x <input type="text" class="journal-number-field" data-ng-model="menu.image_height" />
                        <switch data-ng-model="menu.image_type">
                            <switch-option key="fit">Fit</switch-option>
                            <switch-option key="crop">Crop &nbsp;&nbsp;</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-hide="(menu.type === 'categories' && menu.categories.render_as === 'dropdown') || (menu.type === 'custom') || (menu.type === 'mixed')">
                    <span class="module-create-title">Items per Row</span>
                    <span class="module-create-option">
                        <j-opt-items-per-row data-ng-model="menu.items_per_row"></j-opt-items-per-row>
                    </span>
                </li>
                <li data-ng-show="(menu.type === 'categories' && menu.categories.render_as === 'megamenu') || (menu.type === 'manufacturers' && menu.manufacturers.type === 'all') || (menu.type === 'products' && menu.products.source !== 'custom')">
                    <span class="module-create-title">Item Limit</span>
                    <span class="module-create-option">
                        <input type="text" data-ng-model="menu.items_limit" class="journal-input journal-sort" />
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Menu Item Text Color <small>Optional different text colors per menu item. <br /><strong>Color - Hover</strong></small></span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="menu.color"></j-opt-color> -
                        <j-opt-color data-ng-model="menu.hover_color"></j-opt-color>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Menu Item Background Color <small>Optional different background colors per menu item. <br /><strong>Color - Hover</strong></small></span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="menu.bg_color"></j-opt-color> -
                        <j-opt-color data-ng-model="menu.bg_hover_color"></j-opt-color>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Enable on Phone</span>
                    <span class="module-create-option">
                        <switch data-ng-model="menu.enable_on_phone">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Enable on Tablet</span>
                    <span class="module-create-option">
                        <switch data-ng-model="menu.enable_on_tablet">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Enable on Desktop</span>
                    <span class="module-create-option">
                        <switch data-ng-model="menu.enable_on_desktop">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>

                <!-- status -->
                <li>
                    <span class="module-create-title">Status</span>
                    <span class="module-create-option">
                        <switch data-ng-model="menu.status">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <!-- sort order -->
                <li>
                    <span class="module-create-title">Sort Order</span>
                    <span class="module-create-option">
                        <input type="text" data-ng-model="menu.sort_order" class="journal-input journal-sort" />
                    </span>
                </li>
            </ul>
            <!-- custom text -->
            <div data-ng-show="menu.type === 'html'" class="accordion-bar bar-level-1 bar-expand" >
                <a data-ng-click="toggleAccordion(menu.html_blocks, menu, true)" class="hint--top hint-fix" data-hint="Expand All"><i class="expand-icon"></i></a>  <a data-ng-click="toggleAccordion(menu.html_blocks, menu, false)" class="hint--top hint-fix" data-hint="Collapse All"><i class="collapse-icon"></i></a>
                <label class="close-others hint--top" data-hint="Close Others"><input type="checkbox" data-ng-model="menu.close_others" /></label>
            </div>
            <accordion data-ng-show="menu.type === 'html'" close-others="menu.close_others">
                <accordion-group data-ng-repeat="block in menu.html_blocks" is-open="block.is_open">
                    <accordion-heading>
                        <div class="accordion-bar bar-level-2">Sub Item {{$index + 1}} <a href="javascript:;" class="accordion-remove slide-remove" data-ng-click="removeHtmlBlock(menu, $index)"><b></b>Remove</a></div>
                    </accordion-heading>
                    <ul class="module-create-options">
                        <li>
                            <span class="module-create-title">Title</span>
                            <span class="module-create-option">
                                <j-opt-text-lang data-ng-model="block.title"></j-opt-text-lang>
                            </span>
                        </li>
                        <li>
                            <span class="module-create-title">Menu Link</span>
                            <span class="module-create-option">
                                <menu-item data-ng-model="block.link"></menu-item>
                            </span>
                        </li>
                        <li>
                            <span class="module-create-title">Status</span>
                            <span class="module-create-option">
                                <switch data-ng-model="block.status">
                                    <switch-option key="1">ON</switch-option>
                                    <switch-option key="0">OFF</switch-option>
                                </switch>
                            </span>
                        </li>
                        <li>
                            <span class="module-create-title">Sort Order</span>
                            <span class="module-create-option">
                                <input type="text" data-ng-model="block.sort_order" class="journal-input journal-sort" />
                            </span>
                        </li>
                        <li>
                            <span class="module-create-title">Content</span>
                            <span class="module-create-option">
                                <ck-editor data-ng-model="block.text"></ck-editor>
                            </span>
                        </li>
                    </ul>
                </accordion-group>
             </accordion>
            <!-- custom items -->
            <div data-ng-show="menu.type === 'custom'" class="accordion-bar bar-level-1 bar-expand" >
                <a data-ng-click="toggleAccordion(menu.custom.items, menu.custom, true)" class="hint--top hint-fix" data-hint="Expand All"><i class="expand-icon"></i></a>  <a data-ng-click="toggleAccordion(menu.custom.items, menu.custom, false)" class="hint--top hint-fix" data-hint="Collapse All"><i class="collapse-icon"></i></a>
                <label class="close-others hint--top" data-hint="Close Others"><input type="checkbox" data-ng-model="menu.custom.close_others" /></label>
            </div>
            <accordion data-ng-show="menu.type === 'custom'" close-others="menu.custom.close_others">
                <accordion-group data-ng-repeat="item in menu.custom.items" is-open="item.is_open">
                    <accordion-heading>
                        <div class="accordion-bar bar-level-2">Sub Item {{$index + 1}} <a href="javascript:;" class="accordion-remove slide-remove" data-ng-click="removeSubMenu(menu.custom, $index)"><b></b>Remove</a></div>
                    </accordion-heading>
                    <ul class="module-create-options">
                        <li>
                            <span class="module-create-title">Menu Name</span>
                            <span class="module-create-option">
                                <j-opt-text-lang data-ng-model="item.name"></j-opt-text-lang>
                            </span>
                        </li>
                        <li>
                            <span class="module-create-title">Link</span>
                            <span class="module-create-option">
                                <menu-item data-ng-model="item.menu"></menu-item>
                            </span>
                        </li>
                        <li data-ng-show="menu.type === 'custom'">
                            <span class="module-create-title">Open in New Tab</span>
                            <span class="module-create-option">
                                <switch data-ng-model="item.target">
                                    <switch-option key="1">ON</switch-option>
                                    <switch-option key="0">OFF</switch-option>
                                </switch>
                            </span>
                        </li>
                        <li>
                            <span class="module-create-title">Sort Order</span>
                            <span class="module-create-option">
                                <input type="text" data-ng-model="item.sort_order" class="journal-input journal-sort" />
                            </span>
                        </li>
                    </ul>
                </accordion-group>
            </accordion>
            <!-- mixed -->
            <div data-ng-show="menu.type === 'mixed'" class="accordion-bar bar-level-1 bar-expand" >
                <a data-ng-click="toggleAccordion(menu.custom.items, menu.custom, true)" class="hint--top hint-fix" data-hint="Expand All"><i class="expand-icon"></i></a>  <a data-ng-click="toggleAccordion(menu.custom.items, menu.custom, false)" class="hint--top hint-fix" data-hint="Collapse All"><i class="collapse-icon"></i></a>
                <label class="close-others hint--top" data-hint="Close Others"><input type="checkbox" data-ng-model="menu.custom.close_others" /></label>
            </div>
            <accordion data-ng-show="menu.type === 'mixed'" close-others="menu.custom.close_others">
                <accordion-group data-ng-repeat="column in menu.mixed_columns" is-open="column.is_open">
                    <accordion-heading>
                        <div class="accordion-bar bar-level-2">Column {{$index + 1}} <a href="javascript:;" class="accordion-remove slide-remove" data-ng-click="removeColumn(menu, $index)"><b></b>Remove</a> <a class="accordion-remove slide-remove" data-ng-click="duplicateColumn($parentIndex, $index); $event.stopPropagation()"><b ></b>Duplicate</a></div>
                    </accordion-heading>
                    <ul class="module-create-options">
                        <li>
                            <span class="module-create-title">Column Type</span>
                            <span class="module-create-option">
                                <switch data-ng-model="column.type">
                                    <switch-option key="categories">Category</switch-option>
                                    <switch-option key="products">Products</switch-option>
                                    <switch-option key="manufacturers">Brands</switch-option>
                                    <switch-option key="html-block">HTML</switch-option>
                                </switch>
                            </span>
                        </li>
                        <li data-ng-hide="column.type === 'categories'">
                            <span class="module-create-title">Menu Name</span>
                            <span class="module-create-option">
                                <j-opt-text-lang data-ng-model="column.name"></j-opt-text-lang>
                            </span>
                        </li>

                        <!-- ------------- mixed categories --------------- -->

                        <li data-ng-show="column.type === 'categories'">
                            <span class="module-create-title">Category Menu Item</span>
                            <span class="module-create-option">
                                <switch data-ng-model="column.categories.type">
                                    <switch-option key="existing">&nbsp;&nbsp;&nbsp;Existing&nbsp;&nbsp;&nbsp;</switch-option>
                                    <switch-option key="custom">&nbsp;&nbsp;Manual&nbsp;&nbsp;</switch-option>
                                </switch>
                            </span>
                        </li>
                        <li data-ng-show="column.type === 'categories' && column.categories.type === 'existing'">
                            <span class="module-create-title">Top Category</span>
                            <span class="module-create-option">
                                <category-search model="column.categories.top"></category-search>
                            </span>
                        </li>
                        <li data-ng-show="column.type === 'categories' && column.categories.type === 'custom'">
                            <span class="module-create-title">Categories</span>
                            <span class="module-create-option">
                                <ul class="simple-list">
                                    <li data-ng-repeat="item in column.categories.items">
                                        <category-search model="item.data"></category-search>
                                        <a class="btn red delete" data-ng-click="removeItem(column.categories, $index)">X</a>
                                    </li>
                                </ul>
                                <a class="btn blue add-product" data-ng-click="addItem(column.categories)">Add</a>
                            </span>
                        </li>
                        <li data-ng-show="column.type === 'categories'">
                            <span class="module-create-title">Links Type</span>
                            <span class="module-create-option">
                                <switch data-ng-model="column.categories.links_type">
                                    <switch-option key="categories">SubCateg</switch-option>
                                    <switch-option key="products">Products</switch-option>
                                </switch>
                            </span>
                        </li>
                        <li data-ng-show="column.type === 'categories'">
                            <span class="module-create-title">Show</span>
                            <span class="module-create-option">
                                <switch data-ng-model="column.categories.show">
                                    <switch-option key="links">Links</switch-option>
                                    <switch-option key="image">Image</switch-option>
                                    <switch-option key="both">Both</switch-option>
                                </switch>
                            </span>
                        </li>
                        <li data-ng-show="column.type === 'categories' && column.categories.show === 'both'">
                            <span class="module-create-title">Image Position</span>
                            <span class="module-create-option">
                                <switch data-ng-model="column.categories.image_position">
                                    <switch-option key="left">Left</switch-option>
                                    <switch-option key="top">Top</switch-option>
                                    <switch-option key="right">Right</switch-option>
                                </switch>
                            </span>
                        </li>

                        <!-- ---------------------------------------------- -->

                        <!-- ---------- mixed products -------------------- -->
                        <li data-ng-show="column.type === 'products'">
                            <span class="module-create-title">Source</span>
                            <span class="module-create-option">
                                <switch data-ng-model="column.products.source">
                                    <switch-option key="module">Module</switch-option>
                                    <switch-option key="category">Category</switch-option>
                                    <switch-option key="manufacturer">Brand</switch-option>
                                    <switch-option key="random">Random</switch-option>
                                    <switch-option key="custom">Custom</switch-option>
                                </switch>
                            </span>
                        </li>
                        <li data-ng-show="column.type === 'products' && column.products.source === 'category'">
                            <span class="module-create-title">Category</span>
                            <span class="module-create-option">
                                <category-search model="column.products.category"></category-search>
                            </span>
                        </li>
                        <li data-ng-show="column.type === 'products' && column.products.source === 'module'">
                            <span class="module-create-title">Module</span>
                            <span class="module-create-option">
                                <switch data-ng-model="column.products.module_type">
                                    <switch-option key="featured">Featured</switch-option>
                                    <switch-option key="latest">Latest</switch-option>
                                    <switch-option key="bestseller">Bestseller</switch-option>
                                    <switch-option key="special">Special</switch-option>
                                </switch>
                            </span>
                        </li>
                        <li data-ng-show="column.type === 'products' && column.products.source === 'module' && column.products.module_type == 'featured' && featured_modules !== null">
                            <span class="module-create-title">Featured Modules</span>
                            <span class="module-create-option">
                                <select data-ng-model="column.products.featured_module_id" ui-select2="{width: 50, minimumResultsForSearch: -1, placeholder: 'Choose Module'}">
                                    <option value=""></option>
                                    <option data-ng-repeat="module in featured_modules" value="{{module.module_id}}">{{module.name}}</option>
                                </select>
                            </span>
                        </li>
                        <li data-ng-show="column.type === 'products' && column.products.source === 'manufacturer'">
                            <span class="module-create-title">Brand</span>
                            <span class="module-create-option">
                                <manufacturer-search model="column.products.manufacturer"></manufacturer-search>
                            </span>
                        </li>
                        <li data-ng-show="column.type === 'products' && column.products.source === 'custom'">
                            <span class="module-create-title">Products</span>
                            <span class="module-create-option">
                                <ul class="simple-list">
                                    <li data-ng-repeat="item in column.products.items">
                                        <input type="text" ng-model="item.sort_order" class="journal-sort" placeholder="Sort" />
                                        <product-search model="item.data"></product-search>
                                        <a class="btn red delete" data-ng-click="removeItem(column.products, $index)">X</a>
                                    </li>
                                </ul>
                                <a class="btn blue add-product" data-ng-click="addItem(column.products)">Add</a>
                            </span>
                        </li>

                        <!-- ---------------------------------------------- -->

                        <!-- ------------- manufacturers ------------------ -->

                        <li data-ng-show="column.type === 'manufacturers'">
                            <span class="module-create-title">Manufacturers</span>
                            <span class="module-create-option">
                                <switch data-ng-model="column.manufacturers.type">
                                    <switch-option key="all">All</switch-option>
                                    <switch-option key="custom">Custom &nbsp; &nbsp; &nbsp;</switch-option>
                                </switch>
                            </span>
                        </li>
                        <li data-ng-show="column.type === 'manufacturers' && column.manufacturers.type === 'custom'">
                            <span class="module-create-title">Manufacturers</span>
                            <span class="module-create-option">
                                <ul class="simple-list">
                                    <li data-ng-repeat="item in column.manufacturers.items">
                                        <manufacturer-search model="item.data"></manufacturer-search>
                                        <a class="btn red delete" data-ng-click="removeItem(column.manufacturers, $index)">X</a>
                                    </li>
                                </ul>
                                <a class="btn blue add-product" data-ng-click="addItem(column.manufacturers)">Add</a>
                            </span>
                        </li>
                        <li data-ng-show="column.type === 'manufacturers'">
                            <span class="module-create-title">Show</span>
                            <span class="module-create-option">
                                <switch data-ng-model="column.manufacturers.show">
                                    <switch-option key="text">Text</switch-option>
                                    <switch-option key="image">Image</switch-option>
                                    <switch-option key="both">Both</switch-option>
                                </switch>
                            </span>
                        </li>



                        <!-- ---------------------------------------------- -->
                        <!-- -------------- global settings --------------- -->
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
                        <li data-ng-hide="column.type === 'html-block'">
                            <span class="module-create-title">Image Dimensions</span>
                            <span class="module-create-option">
                                <input type="text" class="journal-number-field" data-ng-model="column.image_width" /> x <input type="text" class="journal-number-field" data-ng-model="column.image_height" />
                                <switch data-ng-model="column.image_type">
                                    <switch-option key="fit">Fit</switch-option>
                                    <switch-option key="crop">Crop &nbsp;&nbsp;</switch-option>
                                </switch>
                            </span>
                        </li>
                        <li data-ng-hide="column.type === 'html-block'">
                            <span class="module-create-title">Items per Row</span>
                            <span class="module-create-option">
                                <j-opt-items-per-row data-ng-model="column.items_per_row"></j-opt-items-per-row>
                            </span>
                        </li>
                        <li data-ng-hide="column.type === 'html-block'">
                            <span class="module-create-title">Item Limit</span>
                            <span class="module-create-option">
                                <input type="text" data-ng-model="column.items_limit" class="journal-input journal-sort" />
                            </span>
                        </li>
                        <li>
                            <span class="module-create-title">Enable on Phone</span>
                            <span class="module-create-option">
                                <switch data-ng-model="column.enable_on_phone">
                                    <switch-option key="1">ON</switch-option>
                                    <switch-option key="0">OFF</switch-option>
                                </switch>
                            </span>
                        </li>
                        <li>
                            <span class="module-create-title">Enable on Tablet</span>
                            <span class="module-create-option">
                                <switch data-ng-model="column.enable_on_tablet">
                                    <switch-option key="1">ON</switch-option>
                                    <switch-option key="0">OFF</switch-option>
                                </switch>
                            </span>
                        </li>
                        <li>
                            <span class="module-create-title">Enable on Desktop</span>
                            <span class="module-create-option">
                                <switch data-ng-model="column.enable_on_desktop">
                                    <switch-option key="1">ON</switch-option>
                                    <switch-option key="0">OFF</switch-option>
                                </switch>
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
                                <input type="text" data-ng-model="column.sort_order" class="journal-input journal-sort" />
                            </span>
                        </li>
                        <!-- ---------------------------------------------- -->

                        <!-- --------------- html block ------------------- -->

                        <li data-ng-show="column.type === 'html-block'">
                            <span class="module-create-title">Content</span>
                            <span class="module-create-option">
                                <ck-editor data-ng-model="column.html_text"></ck-editor>
                            </span>
                        </li>
                    </ul>
                    <accordion close-others="false">
                        <accordion-group data-ng-repeat="cms_block in column.cms_blocks" is-open="cms_block.is_open">
                            <accordion-heading>
                                <div class="accordion-bar bar-level-2">CMS Block {{$index + 1}} <a href="javascript:;" class="accordion-remove slide-remove" data-ng-click="removeCMSBlock(column, $index)"><b></b>Remove</a></div>
                            </accordion-heading>
                            <ul class="module-create-options">

                                <li>
                                    <span class="module-create-title">Position</span>
                                    <span class="module-create-option">
                                        <switch data-ng-model="cms_block.position">
                                            <switch-option key="top">Top</switch-option>
                                            <switch-option key="bottom">Bottom</switch-option>
                                        </switch>
                                    </span>
                                </li>
                                <li>
                                    <span class="module-create-title">Status</span>
                                    <span class="module-create-option">
                                        <switch data-ng-model="cms_block.status">
                                            <switch-option key="1">ON</switch-option>
                                            <switch-option key="0">OFF</switch-option>
                                        </switch>
                                    </span>
                                </li>
                                <li>
                                    <span class="module-create-title">Sort Order</span>
                                    <span class="module-create-option">
                                        <input type="text" data-ng-model="cms_block.sort_order" class="journal-input journal-sort" />
                                    </span>
                                </li>
                                <li>
                                    <span class="module-create-title">Content</span>
                                    <span class="module-create-option">
                                        <ck-editor data-ng-model="cms_block.content"></ck-editor>
                                    </span>
                                </li>
                            </ul>
                        </accordion-group>
                    </accordion>
                    <div data-ng-show="menu.type === 'mixed'" class="add-level add-level-3" data-ng-click="addCMSBlock(column)">Add CMS Block +</div>
                </accordion-group>
            </accordion>
            <div data-ng-show="menu.type === 'custom'" class="add-level add-level-2" data-ng-click="addSubMenu(menu.custom)">Add Sub Item +</div>
            <div data-ng-show="menu.type === 'html'" class="add-level add-level-2" data-ng-click="addHtmlBlock(menu)">Add Block +</div>
            <div data-ng-show="menu.type === 'mixed'" class="add-level add-level-2" data-ng-click="addColumn(menu)">Add Column +</div>
        </accordion-group>
    </accordion>
    <div class="add-level add-level-1" data-ng-click="addMenu()">Add Menu Item +</div>
</div>
