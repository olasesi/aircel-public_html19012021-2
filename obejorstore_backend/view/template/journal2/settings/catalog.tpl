<div class="sticky">
    <div class="module-header">
        <div class='module-name'>Settings<span>Catalog Mode</span></div>

        <skin-manager data-url="settings/catalog"></skin-manager>

        <div class="module-buttons">
            <?php if (defined('J2ENV')): ?>
            <a class="btn blue" data-ng-show="skin_id < 100" data-ng-click="saveDefault($event)">Export</a>
            <?php endif; ?>
            <!--<a class="btn blue" data-ng-click="multiStore($event)">MultiStore</a>-->
            <a class="btn blue" data-ng-click="saveAs($event)">Save As</a>
            <a class="btn green" data-ng-click="save($event)">Save</a>
            <a class="btn red" data-ng-show="skin_id < 100" data-ng-click="reset($event)">Reset</a>
            <a class="btn red" data-ng-show="skin_id >= 100" data-ng-click="delete($event)">Delete</a>
        </div>
    </div>
</div>
<div class="module-body custom-code">
    <div class="accordion-bar bar-level-0 bar-expand" >
        <a data-ng-click="toggleAccordion(true)" class="hint--top" data-hint="Expand All"><i class="expand-icon"></i></a>  <a data-ng-click="toggleAccordion(false)" class="hint--top" data-hint="Collapse All"><i class="collapse-icon"></i></a>
        <label class="close-others hint--top" data-hint="Close Others"><input type="checkbox" data-ng-model="accordion.close_others" /></label>
    </div>
    <accordion id="main-accordion" close-others="accordion.close_others">
        <accordion-group is-open="accordion.accordions[0]">
        <accordion-heading>
            <div class="accordion-bar bar-level-0">Header</div>
        </accordion-heading>
        <ul class="module-create-options">
            <li>
                <span class="module-create-title">Cart</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_header_cart2">
                            <switch-option key="visible">ON</switch-option>
                            <switch-option key="hidden">OFF</switch-option>
                        </switch>
                    </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>
            <li>
                <span class="module-create-title">Search</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_header_search">
                            <switch-option key="block">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>
            <li>
                <span class="module-create-title">Language</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_header_lang2">
                            <switch-option key="visible">ON</switch-option>
                            <switch-option key="hidden">OFF</switch-option>
                        </switch>
                    </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>
            <li>
                <span class="module-create-title">Currency</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_header_curr2">
                            <switch-option key="visible">ON</switch-option>
                            <switch-option key="hidden">OFF</switch-option>
                        </switch>
                    </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>
        </ul>
    </accordion-group>

        <accordion-group is-open="accordion.accordions[1]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Product Grid</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Add to Cart</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_grid_cart">
                            <switch-option key="block">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Wishlist</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_grid_wishlist">
                            <switch-option key="inline-block">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Compare</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_grid_compare">
                            <switch-option key="inline-block">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Price</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_grid_price">
                            <switch-option key="inline-block">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Name</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_grid_name">
                            <switch-option key="table">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>



                <accordion-group is-open="false">
                    <accordion-heading>
                        <div class="accordion-bar bar-level-1">Carousel</div>
                    </accordion-heading>
                    <ul class="module-create-options">
                        <li>
                            <span class="module-create-title">Add to Cart</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_grid_carousel_cart">
                            <switch-option key="block">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Wishlist</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_grid_carousel_wishlist">
                            <switch-option key="inline-block">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Compare</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_grid_carousel_compare">
                            <switch-option key="inline-block">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Price</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_grid_carousel_price">
                            <switch-option key="inline-block">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Name</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_grid_carousel_name">
                            <switch-option key="table">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>

                    </ul>
                </accordion-group>

                <accordion-group is-open="false">
                    <accordion-heading>
                        <div class="accordion-bar bar-level-1">Carousel - Side Column</div>
                    </accordion-heading>
                    <ul class="module-create-options">
                        <li>
                            <span class="module-create-title">Add to Cart</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_grid_side_carousel_cart">
                            <switch-option key="block">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Wishlist</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_grid_side_carousel_wishlist">
                            <switch-option key="inline-block">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Compare</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_grid_side_carousel_compare">
                            <switch-option key="inline-block">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Price</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_grid_side_carousel_price">
                            <switch-option key="inline-block">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Name</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_grid_side_carousel_name">
                            <switch-option key="table">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>

                    </ul>
                </accordion-group>

                <accordion-group is-open="false">
                    <accordion-heading>
                        <div class="accordion-bar bar-level-1">Custom Sections</div>
                    </accordion-heading>
                    <ul class="module-create-options">
                        <li>
                            <span class="module-create-title">Add to Cart</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_grid_cs_cart">
                            <switch-option key="block">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Wishlist</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_grid_cs_wishlist">
                            <switch-option key="inline-block">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Compare</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_grid_cs_compare">
                            <switch-option key="inline-block">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Price</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_grid_cs_price">
                            <switch-option key="inline-block">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Name</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_grid_cs_name">
                            <switch-option key="table">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>

                    </ul>
                </accordion-group>
                <accordion-group is-open="false">
                    <accordion-heading>
                        <div class="accordion-bar bar-level-1">Main Menu</div>
                    </accordion-heading>
                    <ul class="module-create-options">
                        <li>
                            <span class="module-create-title">Add to Cart</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_grid_main_menu_cart">
                            <switch-option key="block">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Wishlist</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_grid_main_menu_wishlist">
                            <switch-option key="inline-block">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Compare</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_grid_main_menu_compare">
                            <switch-option key="inline-block">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Price</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_grid_main_menu_price">
                            <switch-option key="inline-block">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Name</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_grid_main_menu_name">
                            <switch-option key="table">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>

                    </ul>
                </accordion-group>
            </ul>
        </accordion-group>


        <accordion-group is-open="accordion.accordions[2]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Product List</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Add to Cart</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_list_cart">
                            <switch-option key="block">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Wishlist</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_list_wishlist">
                            <switch-option key="inline-block">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Compare</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_list_compare">
                            <switch-option key="inline-block">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Price</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_list_price">
                            <switch-option key="inline-block">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Name</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_list_name">
                            <switch-option key="table">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Description <small>Product List</small></span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_list_description">
                            <switch-option key="block">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
            </ul>
        </accordion-group>

        <accordion-group is-open="accordion.accordions[3]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Side Products / Footer Products</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Price</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.side_list_price">
                            <switch-option key="inline-block">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
            </ul>
            </accordion-group>


        <accordion-group is-open="accordion.accordions[4]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Product Page</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Add to Cart</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_product_page_cart">
                            <switch-option key="block">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Wishlist</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_product_page_wishlist">
                            <switch-option key="inline-block">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Compare</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_product_page_compare">
                            <switch-option key="inline-block">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Product Details</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_product_page_details">
                            <switch-option key="block">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Price Section</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_product_page_price">
                            <switch-option key="block">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Options</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.catalog_product_page_options">
                            <switch-option key="block">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
            </ul>
        </accordion-group>
    </accordion>
</div>
