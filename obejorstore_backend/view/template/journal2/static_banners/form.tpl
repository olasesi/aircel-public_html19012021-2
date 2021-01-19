<div class="sticky">
<div class="module-header">
    <div class='module-name'>Banners <span data-ng-show="module_id == null">New Module</span><span data-ng-show="module_id != null">Edit Module</span></div>
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
        <a data-ng-click="toggleAccordion(module_data.sections, true)" class="hint--top" data-hint="Expand All"><i class="expand-icon"></i></a>  <a data-ng-click="toggleAccordion(module_data.sections, false)" class="hint--top" data-hint="Collapse All"><i class="collapse-icon"></i></a>
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
                    <span class="module-create-title">Module Title</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="module_data.module_title"></j-opt-text-lang>
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
                    <span class="module-create-title">Link Overlay Icon <small>Displays over linked banners</small></span>
                    <span class="module-create-option">
                        <icon-select data-ng-model="module_data.icon"></icon-select>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Link Overlay Color <small>Displays over linked banners</small></span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="module_data.bgcolor"></j-opt-color>
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
                    <span class="module-create-title">Arrows</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.arrows">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="module_data.carousel == '1'">
                    <span class="module-create-title">Bullets</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.bullets">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="module_data.carousel == '1'">
                    <span class="module-create-title">Autoplay</span>
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

        <accordion-group data-ng-repeat="section in module_data.sections" is-open="section.is_open">
            <accordion-heading>
                <div class="accordion-bar bar-level-1"> {{'Item ' + ($index + 1)}} <a href="javascript:;" class="accordion-remove slide-remove" data-ng-click="removeSection($index)"><b ></b>Remove</a> <a href="javascript:;" class="accordion-remove slide-remove" data-ng-click="duplicateSection($index); $event.stopPropagation()"><b ></b>Duplicate</a></div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Image</span>
                    <span class="module-create-option">
                        <image-select-lang image="section.image"></image-select-lang>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Image Title</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="section.image_title"></j-opt-text-lang>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Link</span>
                    <span class="module-create-option">
                        <menu-item data-ng-model="section.link"></menu-item>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Open in New Tab</span>
                    <span class="module-create-option">
                        <switch data-ng-model="section.link_new_window">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Status</span>
                    <span class="module-create-option">
                        <switch data-ng-model="section.status">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Sort Order</span>
                    <span class="module-create-option">
                         <input type="text" value="" class="journal-input journal-sort" data-ng-model="section.sort_order" />
                    </span>
                </li>
            </ul>
        </accordion-group>
    </accordion>
    <div class="add-level add-level-1" data-ng-click="addSection()">Add Banner +</div>
</div>