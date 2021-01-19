<div class="sticky">
<div class="module-header">
    <div class='module-name'>Blog Side Posts<span data-ng-show="module_id == null">New Module</span><span data-ng-show="module_id != null">Edit Module</span></div>
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
                    <span class="module-create-title">Title</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="module_data.title"></j-opt-text-lang>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Module Type <small data-ng-show="module_data.module_type == 'related'">For Product Pages</small></span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.module_type">
                            <switch-option key="newest">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Latest&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</switch-option>
                            <switch-option key="comments">Most Commented&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</switch-option>
                            <switch-option key="views">Most Viewed</switch-option>
                            <switch-option key="related">Related</switch-option>
                            <switch-option key="category">Category</switch-option>
                            <switch-option key="custom">Custom</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="module_data.module_type === 'category'">
                    <span class="module-create-title">Category</span>
                    <span class="module-create-option">
                        <blog-category-search model="module_data.category"></blog-category-search>
                    </span>
                </li>
                <li data-ng-show="module_data.module_type === 'custom'">
                    <span class="module-create-title">Posts</span>
                    <span class="module-create-option">
                        <ul class="simple-list">
                            <li data-ng-repeat="post in module_data.posts">
                                <blog-post-search model="post.data"></blog-post-search>
                                <a class="btn red delete" href="javascript:;" data-ng-click="removePost($index)">X</a>
                            </li>
                        </ul>
                        <a href="javascript:;" data-ng-click="addPost()" class="btn blue add-product">Add</a>
                    </span>
                </li>
                <li data-ng-show="module_data.module_type !== 'custom'">
                    <span class="module-create-title">Posts Limit</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input journal-sort" data-ng-model="module_data.limit" />
                    </span>
                </li>
            </ul>
        </accordion-group>
    </accordion>
</div>
