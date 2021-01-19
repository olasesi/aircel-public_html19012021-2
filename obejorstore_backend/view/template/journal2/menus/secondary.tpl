<div class="sticky">
<div class="module-header">
    <div class='module-name'>Header<span>Secondary Menu</span></div>

    <store-picker data-url="menus/secondary"></store-picker>

    <div class="module-buttons">
        <a class="btn green" data-ng-click="save($event)">Save</a>
        <a class="btn red" data-ng-click="reset()">Reset</a>
    </div>
</div>
</div>

<div class="module-body" data-ng-hide="isLoading">
    <div class="accordion-bar bar-level-0 bar-expand" >
        <a data-ng-click="toggleAccordion(items, true)" class="hint--top" data-hint="Expand All"><i class="expand-icon"></i></a>  <a data-ng-click="toggleAccordion(items, false)" class="hint--top" data-hint="Collapse All"><i class="collapse-icon"></i></a>
        <label class="close-others hint--top" data-hint="Close Others"><input type="checkbox" data-ng-model="close_others" /></label>
    </div>
    <accordion close-others="close_others">
        <accordion-group data-ng-repeat="item in items" is-open="item.is_open">
            <accordion-heading>
                <div class="accordion-bar bar-level-0"> {{getItemName($index, item)}} <a href="javascript:;" class="accordion-remove slide-remove" data-ng-click="removeItem($index)"><b></b>Remove</a></div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Item Name</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input journal-name-field" data-ng-model="item.item_name" required />
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Icon</span>
                    <span class="module-create-option">
                        <icon-select data-ng-model="item.icon"></icon-select>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Icon Position</span>
                    <span class="module-create-option">
                        <switch data-ng-model="item.icon_position">
                            <switch-option key="left">Left</switch-option>
                            <switch-option key="right">Right</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Enable on Phone</span>
                    <span class="module-create-option">
                        <switch data-ng-model="item.enable_on_phone">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Enable on Tablet</span>
                    <span class="module-create-option">
                        <switch data-ng-model="item.enable_on_tablet">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Enable on Desktop</span>
                    <span class="module-create-option">
                        <switch data-ng-model="item.enable_on_desktop">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="item.enable_on_phone == '1'">
                    <span class="module-create-title">Mobile View</span>
                    <span class="module-create-option">
                        <switch data-ng-model="item.mobile_view">
                            <switch-option key="text">Text</switch-option>
                            <switch-option key="icon">Icon</switch-option>
                            <switch-option key="both">Both</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Link</span>
                    <span class="module-create-option">
                        <menu-item data-ng-model="item.menu"></menu-item>
                    </span>
                </li>
                <li data-ng-hide="item.menu.menu_type === 'custom'">
                    <span class="module-create-title">Name Overwrite</span>
                    <span class="module-create-option">
                        <switch data-ng-model="item.name_overwrite">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="item.name_overwrite === '1' || item.menu.menu_type === 'custom'">
                    <span class="module-create-title">Name</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="item.name"></j-opt-text-lang>
                    </span>
                </li>
                <li>
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
            <accordion close-others="false">
                <accordion-group data-ng-repeat="subitem in item.items" is-open="subitem.is_open">
                    <accordion-heading>
                        <div class="accordion-bar bar-level-2">{{getItemName($index, subitem)}} <a href="javascript:;" class="accordion-remove slide-remove" data-ng-click="removeSubItem(item, $index)"><b></b>Remove</a></div>
                    </accordion-heading>
                    <ul class="module-create-options">
                        <li>
                            <span class="module-create-title">Item Name</span>
                            <span class="module-create-option">
                                <input type="text" class="journal-input journal-name-field" data-ng-model="subitem.item_name" required />
                            </span>
                        </li>
                        <li>
                            <span class="module-create-title">Icon</span>
                            <span class="module-create-option">
                                <icon-select data-ng-model="subitem.icon"></icon-select>
                            </span>
                        </li>
                        <li>
                            <span class="module-create-title">Icon Position</span>
                            <span class="module-create-option">
                                <switch data-ng-model="subitem.icon_position">
                                    <switch-option key="left">Left</switch-option>
                                    <switch-option key="right">Right</switch-option>
                                </switch>
                            </span>
                        </li>
                        <li>
                            <span class="module-create-title">Enable on Phone</span>
                            <span class="module-create-option">
                                <switch data-ng-model="subitem.enable_on_phone">
                                    <switch-option key="1">ON</switch-option>
                                    <switch-option key="0">OFF</switch-option>
                                </switch>
                            </span>
                        </li>
                        <li>
                            <span class="module-create-title">Enable on Tablet</span>
                            <span class="module-create-option">
                                <switch data-ng-model="subitem.enable_on_tablet">
                                    <switch-option key="1">ON</switch-option>
                                    <switch-option key="0">OFF</switch-option>
                                </switch>
                            </span>
                        </li>
                        <li>
                            <span class="module-create-title">Enable on Desktop</span>
                            <span class="module-create-option">
                                <switch data-ng-model="subitem.enable_on_desktop">
                                    <switch-option key="1">ON</switch-option>
                                    <switch-option key="0">OFF</switch-option>
                                </switch>
                            </span>
                        </li>
                        <li data-ng-show="subitem.enable_on_phone == '1'">
                            <span class="module-create-title">Phone View</span>
                            <span class="module-create-option">
                                <switch data-ng-model="subitem.mobile_view">
                                    <switch-option key="text">Text</switch-option>
                                    <switch-option key="icon">Icon</switch-option>
                                    <switch-option key="both">Both</switch-option>
                                </switch>
                            </span>
                        </li>
                        <li>
                            <span class="module-create-title">Link</span>
                            <span class="module-create-option">
                                <menu-item data-ng-model="subitem.menu"></menu-item>
                            </span>
                        </li>
                        <li data-ng-hide="subitem.menu.menu_type === 'custom'">
                            <span class="module-create-title">Name Overwrite</span>
                            <span class="module-create-option">
                                <switch data-ng-model="subitem.name_overwrite">
                                    <switch-option key="1">ON</switch-option>
                                    <switch-option key="0">OFF</switch-option>
                                </switch>
                            </span>
                        </li>
                        <li data-ng-show="subitem.name_overwrite === '1' || subitem.menu.menu_type === 'custom'">
                            <span class="module-create-title">Name</span>
                            <span class="module-create-option">
                                <j-opt-text-lang data-ng-model="subitem.name"></j-opt-text-lang>
                            </span>
                        </li>
                        <li>
                            <span class="module-create-title">Open in New Tab</span>
                            <span class="module-create-option">
                                <switch data-ng-model="subitem.target">
                                    <switch-option key="1">ON</switch-option>
                                    <switch-option key="0">OFF</switch-option>
                                </switch>
                            </span>
                        </li>
                        <li>
                            <span class="module-create-title">Sort Order</span>
                            <span class="module-create-option">
                                <input type="text" data-ng-model="subitem.sort_order" class="journal-input journal-sort" />
                            </span>
                        </li>
                    </ul>
                </accordion-group>
            </accordion>
            <div class="add-level add-level-2" data-ng-click="addSubItem(item)">Add Sub Item +</div>
        </accordion-group>
    </accordion>
    <div class="add-level add-level-1" data-ng-click="addItem()">Add Item +</div>
</div>
