<div class="module-header">
    <div class='module-name'>Blog Categories</div>
    <div class="module-buttons">
        <a href="javascript:;" class="btn green" data-ng-click="saveModules($event)" data-ng-show="modules.length > 0">Save</a>
        <a href="<?php echo $base_href;?>#/blog/categories/form" class="btn blue">Create New</a>
    </div>
</div>
<form>
    <div class="module-body module-all p-tabs">
        <div class="accordion-bar bar-level-0 bar-expand" >
        </div>
        <accordion close-others="false">
            <accordion-group data-ng-repeat="category in categories" is-open="false">
                <accordion-heading>
                    <div class="accordion-bar bar-level-0 bar-pt">
                        {{category.name}}
                        <span class="module-options">
                             <a href="<?php echo $base_href;?>#/blog/categories/form/{{category.category_id}}" data-ng-click="$event.stopPropagation()" class="accordion-remove edit-module"><b></b>Edit </a>
                        </span>
                    </div>
                </accordion-heading>
            </accordion-group>
        </accordion>
        <pagination ng-show="paginationTotalItems > paginationItemsPerPage" total-items="paginationTotalItems" page="paginationCurrentPage" max-size="16" items-per-page="paginationItemsPerPage" class="pagination-sm" boundary-links="true"></pagination>
    </div>
</form>