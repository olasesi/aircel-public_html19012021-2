<div class="sticky">
<div class="module-header">
    <div class='module-name'>Settings<span>Header</span></div>

    <div class="active-skin">
        <span>Active Skin:</span>
        <select name="layout" class="journal-select">
            <option value="Account">Account</option>
            <option value="Contact">Contact</option>
            <option value="Category">Category</option>
            <option value="Home">Home</option>
            <option value="Product">Product</option>
        </select>
        <a href="">Skin Manager</a>
    </div>

    <div class="module-buttons">
        <a href="javascript:;" class="btn green" data-ng-click="save()">Save</a>
    </div>
</div>
</div>

<div class="module-body module-form">
    <div class="accordion-bar bar-level-0 bar-expand" >
        <a data-ng-click="toggleAccordion(items, true)">Expand</a> / <a data-ng-click="toggleAccordion(items, false)">Collapse</a>
    </div>
    <accordion close-others="false">
        <accordion-group data-ng-repeat="(k, v) in settings" is-open="true" ng-if="hasSubcategs">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">{{k}}</div>
            </accordion-heading>
            <j-options data-ng-model="v"></j-options>
        </accordion-group>

        <accordion-group is-open="true" ng-if="!hasSubcategs">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">General</div>
            </accordion-heading>
            <j-options data-ng-model="settings"></j-options>
        </accordion-group>
    </accordion>
</div>
