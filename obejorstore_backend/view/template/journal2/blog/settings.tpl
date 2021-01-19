<div class="sticky">
    <div class="module-header">
        <div class='module-name'>Blog <span>Settings</span></div>

        <store-picker data-url="blog/settings"></store-picker>

        <div class="module-buttons">
            <a class="btn green" data-ng-click="save($event)">Save</a>
        </div>
    </div>
</div>
<div class="module-body">
    <div class="accordion-bar bar-level-0 bar-expand" >
        <a data-ng-click="toggleAccordion(true)" class="hint--top" data-hint="Expand All"><i class="expand-icon"></i></a>  <a data-ng-click="toggleAccordion(false)" class="hint--top" data-hint="Collapse All"><i class="collapse-icon"></i></a>
        <label class="close-others hint--top" data-hint="Close Others"><input type="checkbox" data-ng-model="accordion.close_others" /></label>
    </div>
    <accordion id="main-accordion" close-others="accordion.close_others">
        <accordion-group is-open="accordion.accordions[0]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">General</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Blog Status</span>
                    <span class="module-create-option">
                        <switch data-ng-model="blog_settings.status">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="blog_settings.status == 1">
                    <span class="module-create-title">Blog Feed Status</span>
                    <span class="module-create-option">
                        <switch data-ng-model="blog_settings.feed">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="blog_settings.status == 1">
                    <span class="module-create-title">Blog Page Title</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="blog_settings.title"></j-opt-text-lang>
                    </span>
                </li>
                <li data-ng-show="blog_settings.status == 1">
                    <span class="module-create-title">Blog Seo Keyword</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="blog_settings.keyword"></j-opt-text-lang>
                    </span>
                </li>
                <li data-ng-show="blog_settings.status == 1">
                    <span class="module-create-title">Author Name</span>
                    <span class="module-create-option">
                        <switch data-ng-model="blog_settings.author_name">
                            <switch-option key="username">User Name</switch-option>
                            <switch-option key="firstname">First Name</switch-option>
                            <switch-option key="full">Full Name</switch-option>
                        </switch>
                    </span>
                </li>
            </ul>
        </accordion-group>

        <accordion-group is-open="accordion.accordions[1]" data-ng-show="blog_settings.status == 1">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Posts Display</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Posts Display</span>
                    <span class="module-create-option">
                        <switch data-ng-model="blog_settings.posts_display">
                            <switch-option key="grid">Grid</switch-option>
                            <switch-option key="list">List</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Posts Sort</span>
                    <span class="module-create-option">
                        <switch data-ng-model="blog_settings.posts_sort">
                            <switch-option key="newest">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Latest&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</switch-option>
                            <switch-option key="comments">Most Commented&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</switch-option>
                            <switch-option key="views">Most Viewed</switch-option>
                            <switch-option key="related">Related</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Posts per Page</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input journal-number-field" data-ng-model="blog_settings.posts_limit" />
                    </span>
                </li>
                <li data-ng-show="blog_settings.status == 1 && blog_settings.posts_display == 'grid'">
                    <span class="module-create-title">Posts per Row</span>
                    <span class="module-create-option">
                        <j-opt-items-per-row data-range="1,10" data-step="1" data-ng-model="blog_settings.posts_per_row"></j-opt-items-per-row>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Posts Featured Image Size</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-number-field" data-ng-model="blog_settings.posts_image_width" placeholder="Width" /> x <input type="text" class="journal-number-field" data-ng-model="blog_settings.posts_image_height" placeholder="Height" />
                        <switch data-ng-model="blog_settings.posts_image_type">
                            <switch-option key="fit">Fit</switch-option>
                            <switch-option key="crop">Crop&nbsp;&nbsp;&nbsp;</switch-option>
                        </switch>
                    </span>
                </li>

                <li>
                    <span class="module-create-title">Description Character Limit</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input journal-number-field" data-ng-model="blog_settings.description_char_limit" />
                    </span>
                </li>
            </ul>
        </accordion-group>

        <accordion-group is-open="accordion.accordions[2]" data-ng-show="blog_settings.status == 1">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Post Page</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Enable Share This</span>
                    <span class="module-create-option">
                        <switch data-ng-model="blog_settings.share_this">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Comments</span>
                    <span class="module-create-option">
                        <switch data-ng-model="blog_settings.comments">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="blog_settings.status == 1 && blog_settings.comments == 1">
                    <span class="module-create-title">Auto Approve Comments</span>
                    <span class="module-create-option">
                        <switch data-ng-model="blog_settings.auto_approve_comments">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
            </ul>
            <accordion>
                <accordion-group is-open="false">
                    <accordion-heading>
                        <div class="accordion-bar bar-level-1">Related Products</div>
                    </accordion-heading>
                    <ul class="module-create-options">
                        <li>
                            <span class="module-create-title">Related Products</span>
                            <span class="module-create-option">
                                <switch data-ng-model="blog_settings.related_products">
                                    <switch-option key="1">ON</switch-option>
                                    <switch-option key="0">OFF</switch-option>
                                </switch>
                            </span>
                        </li>
                        <li>
                            <span class="module-create-title">Related Products per Row</span>
                            <span class="module-create-option">
                                <j-opt-items-per-row data-range="1,10" data-step="1" data-ng-model="blog_settings.related_products_per_row"></j-opt-items-per-row>
                            </span>
                        </li>
                        <li>
                            <span class="module-create-title">Related Products Carousel</span>
                            <span class="module-create-option">
                                <switch data-ng-model="blog_settings.related_products_carousel">
                                    <switch-option key="1">ON</switch-option>
                                    <switch-option key="0">OFF</switch-option>
                                </switch>
                            </span>
                        </li>
                    </ul>
                </accordion-group>
            </accordion>
        </accordion-group>
        <accordion-group is-open="accordion.accordions[3]" data-ng-show="blog_settings.status == 1">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Page Meta Data</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Blog Meta Title</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="blog_settings.meta_title"></j-opt-text-lang>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Blog Meta Keywords</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="blog_settings.meta_keywords"></j-opt-text-lang>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Blog Meta Description</span>
                    <span class="module-create-option">
                        <j-opt-textarea-lang data-ng-model="blog_settings.meta_description"></j-opt-textarea-lang>
                    </span>
                </li>
            </ul>
        </accordion-group>
    </accordion>
</div>
