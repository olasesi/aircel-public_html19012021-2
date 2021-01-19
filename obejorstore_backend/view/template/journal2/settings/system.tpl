<div class="sticky">
<div class="module-header">
    <div class='module-name'>Settings<span>System & Performance</span></div>

    <div class="module-buttons">
        <a class="btn green" data-ng-click="save($event)">Save</a>
        <a class="btn red" data-ng-click="clearCache($event)">Clear Cache</a>
    </div>
</div>
</div>
<div class="module-body">
    <div class="accordion-bar bar-level-0 bar-expand" >
    </div>
    <accordion close-others="false">
        <accordion-group is-open="true">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">General</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Caching System</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.developer_mode">
                            <switch-option key="0">ON</switch-option>
                            <switch-option key="1">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
            </ul>
        </accordion-group>

        <accordion-group is-open="true" data-ng-show="settings.developer_mode == 0">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Minifier</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Minify HTML</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.minify_html">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Minify CSS</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.minify_css">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Minify JS</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.minify_js">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
            </ul>
        </accordion-group>

        <accordion-group is-open="true" data-ng-show="settings.developer_mode == 0">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">
                    Modules Cache
                    <a class="toggle-modules accordion-remove" data-ng-click="toggle_modules($event, '0')">Disable All</a>
                    <a class="toggle-modules accordion-remove" data-ng-click="toggle_modules($event, '1')">Enable All</a>
                </div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Journal Slider</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.simple_slider_cache">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Revolution Slider</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.slider_cache">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Banners</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.static_banners_cache">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Carousel</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.carousel_cache">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Custom Sections</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.custom_sections_cache">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">CMS Blocks</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.cms_blocks_cache">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Side Category</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.side_category_cache">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Flyout Menu</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.side_column_menu_cache">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Text Rotator</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.text_rotator_cache">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Headline Rotator</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.headline_rotator_cache">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Photo Gallery</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.photo_gallery_cache">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Side Blocks</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.side_blocks_cache">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Fullscreen Slider</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.fullscreen_slider_cache">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Advanced Grid</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.advanced_grid_cache">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Carousel Grid</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.carousel_grid_cache">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Side Products</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.side_products_cache">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
            </ul>
        </accordion-group>

        <accordion-group is-open="true">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Database Indexes</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li data-ng-show="table_columns === null">
                    <span class="module-create-title">Actions</span>
                    <span class="module-create-option">
                        <a class="btn blue" data-ng-click="getDatabaseIndexStatus($event)">Check Indexes</a>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li data-ng-show="table_columns !== null">
                    <span class="module-create-title">Columns Not Indexed</span>
                    <span class="module-create-option">
                        {{table_columns.length == 0 ? 'All columns are indexed.' : ''}}
                        <ul>
                            <li data-ng-repeat="column in table_columns" data-ng-class="{indexed: column.index}">{{column.column + (column.status ? ' - ' + column.status : '')}}</li>
                        </ul>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li data-ng-show="table_columns !== null && table_columns.length > 0">
                    <span class="module-create-title">Actions</span>
                    <span class="module-create-option">
                        <a class="btn blue" data-ng-click="addDatabaseIndexes($event)">Add Indexes</a>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
            </ul>
        </accordion-group>

        <accordion-group is-open="true" data-ng-show="settings.developer_mode == 0">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Advanced Cache Options</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Cache By Customer Group ID</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.cache_by_cg_id">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
            </ul>
        </accordion-group>
    </accordion>
</div>
