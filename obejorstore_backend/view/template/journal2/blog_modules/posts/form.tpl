<div class="sticky">
<div class="module-header">
    <div class='module-name'>Blog Posts<span data-ng-show="module_id == null">New Module</span><span data-ng-show="module_id != null">Edit Module</span></div>
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
                <li>
                    <span class="module-create-title">Featured Image Size</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-number-field" data-ng-model="module_data.image_width" placeholder="Width" /> x <input type="text" class="journal-number-field" data-ng-model="module_data.image_height" placeholder="Height" />
                        <switch data-ng-model="module_data.image_type">
                            <switch-option key="fit">Fit</switch-option>
                            <switch-option key="crop">Crop&nbsp;&nbsp;&nbsp;</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Display</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.display">
                            <switch-option key="grid">Grid</switch-option>
                            <switch-option key="list">List</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="module_data.display === 'grid'">
                    <span class="module-create-title">Items per Row</span>
                    <span class="module-create-option">
                        <j-opt-items-per-row data-ng-model="module_data.items_per_row"></j-opt-items-per-row>
                    </span>
                </li>
                <li data-ng-show="module_data.display === 'grid'">
                    <span class="module-create-title">Content Align</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.content_align">
                            <switch-option key="left">Left</switch-option>
                            <switch-option key="center">Center</switch-option>
                            <switch-option key="right">Right</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Show Description</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.description">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Description Characters Limit</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input journal-number-field" data-ng-model="module_data.description_limit" />
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Carousel Mode</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.carousel">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <!--<li data-ng-show="module_data.carousel == '0'">-->
                    <!--<span class="module-create-title">Thumbs Limit</span>-->
                    <!--<span class="module-create-option">-->
                        <!--<input type="text" class="journal-input journal-sort" data-ng-model="module_data.thumbs_limit" />-->
                    <!--</span>-->
                <!--</li>-->
                <li data-ng-show="module_data.carousel == '1'">
                    <span class="module-create-title">Carousel Arrows</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.carousel_arrows">
                            <switch-option key="none">None</switch-option>
                            <switch-option key="top">Top</switch-option>
                            <switch-option key="side">Side</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="module_data.carousel == '1'">
                    <span class="module-create-title">Carousel Bullets</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.carousel_bullets">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="module_data.carousel == '1'">
                    <span class="module-create-title">Carousel Autoplay</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.autoplay">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="module_data.carousel == '1' && module_data.autoplay == '1'">
                    <span class="module-create-title">Pause on Hover</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.pause_on_hover">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="module_data.carousel == '1' && module_data.autoplay == '1'">
                    <span class="module-create-title">Transition Delay</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-number-field" data-ng-model="module_data.transition_delay" />
                    </span>
                </li>
                <li data-ng-show="module_data.carousel == '1'">
                    <span class="module-create-title">Transition Speed</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-number-field" data-ng-model="module_data.transition_speed" />
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
                <li data-ng-show="(module_data.enable_on_phone == '1' || module_data.enable_on_tablet == '1') && module_data.carousel == '1'">
                    <span class="module-create-title">Touch Drag</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.touch_drag">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
            </ul>
        </accordion-group>
        <accordion-group is-open="module_data.top_bottom_is_open">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Top or Bottom Position Settings</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Background</span>
                        <span class="module-create-option">
                            <j-opt-background data-ng-model="module_data.background" data-bgcolor="true"></j-opt-background>
                        </span>
                </li>
<!--                <li>-->
<!--                    <span class="module-create-title">Video Background</span>-->
<!--                    <span class="module-create-option">-->
<!--                        <j-opt-text data-ng-model="module_data.video_background"></j-opt-text>-->
<!--                    </span>-->
<!--                </li>-->
                <li>
                    <span class="module-create-title">Fullwidth Module</span>
                        <span class="module-create-option">
                            <switch data-ng-model="module_data.fullwidth">
                                <switch-option key="1">ON</switch-option>
                                <switch-option key="0">OFF</switch-option>
                            </switch>
                        </span>
                </li>
                <li>
                    <span class="module-create-title">Margin<small>Top/Bottom</small></span>
                    <span class="module-create-option">
                        <input type="text" class="journal-number-field" data-ng-model="module_data.margin_top" /> x <input type="text" class="journal-number-field" data-ng-model="module_data.margin_bottom" />
                    </span>
                </li>
                <li data-ng-show="module_data.fullwidth == 0">
                    <span class="module-create-title">Module Background</span>
                    <span class="module-create-option">
                        <j-opt-background data-ng-model="module_data.module_background" data-bgcolor="true"></j-opt-background>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Module Shadow</span>
                    <span class="module-create-option">
                        <j-opt-shadow data-ng-model="module_data.module_shadow"></j-opt-shadow>
                    </span>
                </li>
                <li data-ng-show="module_data.fullwidth == 0">
                    <span class="module-create-title">Gutter</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.module_padding">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
            </ul>
        </accordion-group>
    </accordion>
</div>
