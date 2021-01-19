<div class="sticky">
    <div class="module-header">
        <div class='module-name'>Journal Slider <span data-ng-show="module_id == null">New Module</span><span data-ng-show="module_id != null">Edit Module</span></div>
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
        <a data-ng-click="toggleAccordion(module_data.slides, true)" class="hint--top" data-hint="Expand All"><i class="expand-icon"></i></a>  <a data-ng-click="toggleAccordion(module_data.slides, false)" class="hint--top" data-hint="Collapse All"><i class="collapse-icon"></i></a>
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
                    <span class="module-create-title">Slider Height</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-number-field" data-ng-model="module_data.height" placeholder="Height" />
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Slide Transition</span>
                    <span class="module-create-option">
                        <select ui-select2="" data-ng-model="module_data.transition">
                            <option value="fade">Fade</option>
                            <option value="slide">Slide</option>
                            <option value="coverflow">Coverflow</option>
                            <option value="flip">Flip</option>
                        </select>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Transition Speed</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input journal-number-field" data-ng-model="module_data.transition_speed" />
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Autoplay</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.autoplay">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="module_data.autoplay == '1'">
                    <span class="module-create-title">Pause on Hover</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.pause_on_hover">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="module_data.autoplay == '1'">
                    <span class="module-create-title">Transition Delay</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input journal-number-field" data-ng-model="module_data.transition_delay" />
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
                <li data-ng-show="module_data.enable_on_phone == '1' || module_data.enable_on_tablet == '1'">
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

        <accordion-group is-open="module_data.navigation_is_open">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Navigation Options</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Arrows</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.arrows">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Bullets</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.bullets">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Show on Hover</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.show_on_hover">
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
                    <span class="module-create-title">Margin<small>Top/Bottom</small></span>
                    <span class="module-create-option">
                        <input type="text" class="journal-number-field" data-ng-model="module_data.margin_top" /> x <input type="text" class="journal-number-field" data-ng-model="module_data.margin_bottom" />
                    </span>
                </li>
            </ul>
        </accordion-group>

        <accordion-group data-ng-repeat="slide in module_data.slides" is-open="slide.is_open">
            <accordion-heading>
                <div class="accordion-bar bar-level-1">{{slide.slide_name || ('Slide ' + ($index + 1))}} <a class="accordion-remove slide-remove" data-ng-click="removeSlide($index)"><b ></b>Remove</a> <a class="accordion-remove slide-remove" data-ng-click="duplicateSlide($index); $event.stopPropagation()"><b ></b>Duplicate</a></div>
            </accordion-heading>
            <div class="accordion-content content-level-1">
                <ul class="module-create-options">
                    <li>
                        <span class="module-create-title">Slide Name</span>
                        <span class="module-create-option">
                            <input type="text" class="journal-input" data-ng-model="slide.slide_name" />
                        </span>
                    </li>
                    <li>
                        <span class="module-create-title">Slide Image</span>
                        <span class="module-create-option">
                            <image-select-lang image="slide.image"></image-select-lang>
                        </span>
                    </li>
                    <li>
                        <span class="module-create-title">Link</span>
                        <span class="module-create-option">
                            <menu-item data-ng-model="slide.link"></menu-item>
                        </span>
                    </li>
                    <li>
                        <span class="module-create-title">Open in New Tab</span>
                        <span class="module-create-option">
                            <switch data-ng-model="slide.link_new_window">
                                <switch-option key="1">ON</switch-option>
                                <switch-option key="0">OFF</switch-option>
                            </switch>
                        </span>
                    </li>
                    <li>
                        <span class="module-create-title">Status</span>
                        <span class="module-create-option">
                            <switch data-ng-model="slide.status">
                                <switch-option key="1">ON</switch-option>
                                <switch-option key="0">OFF</switch-option>
                            </switch>
                        </span>
                    </li>
                    <li>
                        <span class="module-create-title">Sort Order</span>
                        <span class="module-create-option">
                            <input type="text" class="journal-input journal-sort" data-ng-model="slide.sort_order" />
                        </span>
                    </li>
                </ul>
            </div>
        </accordion-group>
    </accordion>
    <div class="add-level add-level-1" data-ng-click="addSlide()">Add Slide +</div>
</div>

