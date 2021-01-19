<div class="module-header">
    <div class='module-name'>Header Notice <span>Add to Layout</span></div>
    <div class="module-buttons">
        <a href="javascript:;" class="btn green" data-ng-click="saveModules($event)" data-ng-show="modules.length > 0">Save</a>
        <a href="<?php echo $base_href;?>#/module/{{module_type}}/form" class="btn blue">Create New</a>
    </div>
</div>
<form>
    <div class="module-body module-all">
        <div class="accordion-bar bar-level-0 bar-expand" >
            <a data-ng-click="toggleAccordion(true)" class="hint--top" data-hint="Expand All"><i class="expand-icon"></i></a>  <a data-ng-click="toggleAccordion(false)" class="hint--top" data-hint="Collapse All"><i class="collapse-icon"></i></a>
            <label class="close-others hint--top" data-hint="Close Others"><input type="checkbox" data-ng-model="close_others" /></label>
        </div>
        <accordion close-others="close_others">
            <accordion-group data-ng-repeat="module in filterModules(modules, paginationCurrentPage)" is-open="opened_modules[module.module_id]">
                <accordion-heading>
                    <div class="accordion-bar bar-level-0" data-ng-class="{'no-placements': module.module_placements.length == 0}">
                        {{module.module_data.module_name}}
                    <span class="module-options">
                         <a href="javascript:;" class="accordion-remove add-module" data-ng-click="addModule(module, $event); $event.stopPropagation()"><b></b>Add </a>
                         <a href="javascript:;" class="accordion-remove duplicate-module {{duplicating ? 'is-loading' : ''}}" data-ng-click="duplicateModule(module, $event); $event.stopPropagation()"><b></b>Duplicate </a>
                         <a href="<?php echo $base_href;?>#/module/{{module_type}}/form/{{module.module_id}}" data-ng-click="$event.stopPropagation()" class="accordion-remove edit-module"><b></b>Edit </a>
                    </span>
                    </div>
                </accordion-heading>
                <!-- options heading -->
                <ul class="module-place-title" data-ng-show="module.module_placements.length > 0">
                    <li>Layout</li>
                    <li>Status</li>
                    <li>Sort Order</li>
                    <li>Remove</li>
                </ul>
                <!-- active modules -->
                <ul class="module-place-row" data-ng-repeat="m in module.module_placements">
                    <li>
                        <select class="journal-select" data-ng-model="m.layout_id" ui-select2="{width: 400, minimumResultsForSearch: -1, placeholder: 'Choose Layout'}" required>
                            <option value=""></option>
                            <option data-ng-repeat="l in layouts" value="{{l.layout_id}}">{{l.name}}</option>
                        </select>
                    </li>
                    <li>
                        <switch data-ng-model="m.status">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </li>
                    <li>
                        <input type="text" class="journal-sort journal-input" data-ng-model="m.sort_order" />
                    </li>
                    <li>
                        <a href="javascript:;" class="btn red delete" data-ng-click="removeModule($index, module)">x</a>
                    </li>
                </ul>
            </accordion-group>
        </accordion>
        <pagination ng-show="paginationTotalItems > paginationItemsPerPage" total-items="paginationTotalItems" page="paginationCurrentPage" max-size="16" items-per-page="paginationItemsPerPage" class="pagination-sm" boundary-links="true"></pagination>
    </div>
</form>