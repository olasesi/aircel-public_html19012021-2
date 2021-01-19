<div class="sticky">
<div class="module-header">
    <div class='module-name'>Photo Gallery <span data-ng-show="module_id == null">New Module</span><span data-ng-show="module_id != null">Edit Module</span></div>
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
        <a data-ng-click="toggleAccordion(module_data.images, true)" class="hint--top" data-hint="Expand All"><i class="expand-icon"></i></a>  <a data-ng-click="toggleAccordion(module_data.images, false)" class="hint--top" data-hint="Collapse All"><i class="collapse-icon"></i></a>
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
                        <input type="text" class="journal-input" data-ng-model="module_data.module_name" />
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Gallery Title</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="module_data.gallery_name"></j-opt-text-lang>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Items per Row</span>
                    <span class="module-create-option">
                        <j-opt-items-per-row data-ng-model="module_data.items_per_row"></j-opt-items-per-row>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Image Border Settings</span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="module_data.image_border"></j-opt-border>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Thumbs Limit</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input journal-sort" data-ng-model="module_data.thumbs_limit" />
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Thumbs Dimensions</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-number-field" data-ng-model="module_data.thumbs_width" /> x <input type="text" class="journal-number-field" data-ng-model="module_data.thumbs_height" />
                        <switch data-ng-model="module_data.thumbs_type">
                            <switch-option key="fit">Fit</switch-option>
                            <switch-option key="crop">Crop &nbsp;&nbsp;</switch-option>
                        </switch>
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
                    <span class="module-create-title">Module Shadow</span>
                    <span class="module-create-option">
                        <j-opt-shadow data-ng-model="module_data.module_shadow"></j-opt-shadow>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Margin<small>Top/Bottom</small></span>
                    <span class="module-create-option">
                        <input type="text" class="journal-number-field" data-ng-model="module_data.margin_top" /> x <input type="text" class="journal-number-field" data-ng-model="module_data.margin_bottom" />
                    </span>
                </li>
            </ul>
        </accordion-group>
        <accordion-group data-ng-repeat="image in module_data.images" is-open="image.is_open">
            <accordion-heading>
                <div class="accordion-bar bar-level-1"> {{image.name.value[default_language] || ('Image ' + ($index + 1))}} <a href="javascript:;" class="accordion-remove slide-remove" data-ng-click="removeImage($index)"><b ></b>Remove</a> <a href="javascript:;" class="accordion-remove slide-remove" data-ng-click="duplicateImage($index); $event.stopPropagation()"><b ></b>Duplicate</a></div>
            </accordion-heading>
            <ul class="module-create-options">

                <li>
                    <span class="module-create-title">Image Title</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="image.name"></j-opt-text-lang>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Image</span>
                    <span class="module-create-option">
                        <image-select image="image.image"></image-select>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Status</span>
                    <span class="module-create-option">
                        <switch data-ng-model="image.status">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Sort Order</span>
                    <span class="module-create-option">
                        <input type="text" value="" class="journal-input journal-sort" data-ng-model="image.sort_order" />
                    </span>
                </li>
            </ul>
        </accordion-group>
    </accordion>
    <div class="add-level add-level-1" data-ng-click="addImage()">Add Image +</div>
</div>
