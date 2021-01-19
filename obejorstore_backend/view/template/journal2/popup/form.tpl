<div class="sticky">
    <div class="module-header">
        <div class='module-name'>Popup <span data-ng-show="module_id == null">New Module</span><span data-ng-show="module_id != null">Edit Module</span></div>
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
                        <input type="text" class="journal-input" style="width:210px" data-ng-model="module_data.module_name" />
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Popup Type</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.type">
                            <switch-option key="text">Custom</switch-option>
                            <switch-option key="contact">Contact Form  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="module_data.type == 'text'">
                    <span class="module-create-title">Content Dimensions</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-number-field" data-ng-model="module_data.width" placeholder="Width" /> x <input type="text" class="journal-number-field" data-ng-model="module_data.height" placeholder="Height" />
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Generate Custom URL <small>For use in CMS Blocks, Tabs, Description, etc.</small></span>
                    <span class="module-create-option" data-ng-init="custom_url = 0">
                        <switch data-ng-model="custom_url">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="custom_url == 1">
                    <span class="module-create-title">Custom URL</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input" style="width:210px" value="javascript:Journal.openPopup('{{ module_id }}')" onclick="$(this).select()" />
                    </span>
                </li>

                <li>
                    <span class="module-create-title">Background Settings</span>
                    <span class="module-create-option">
                        <j-opt-background data-ng-model="module_data.background" data-bgcolor="true"></j-opt-background>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Close Button</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.close_button">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Show After <small>In Milliseconds</small></span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input journal-number-field" data-ng-model="module_data.open_after" />
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Auto Close After <small>In Milliseconds</small></span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input journal-number-field" data-ng-model="module_data.close_after" />
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Reset Cookie</span>
                    <span class="module-create-option">
                        <a class="btn blue" data-ng-click="resetCookie()">Reset</a>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Show Only Once</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.show_only_once">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
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
                <li data-ng-show="module_data.type == 'text'">
                    <span class="module-create-title">Content Padding</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input journal-number-field" data-ng-model="module_data.padding" />
                    </span>
                </li>
                <li data-ng-show="module_data.type == 'text'">
                    <span class="module-create-title">Content Overflow</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.content_overflow">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="module_data.type == 'text'">
                    <span class="module-create-title">Content</span>
                    <span class="module-create-option">
                        <ck-editor data-ng-model="module_data.text"></ck-editor>
                    </span>
                </li>
            </ul>
        </accordion-group>
        <accordion-group is-open="module_data.header_is_open">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Header</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Title</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="module_data.title"></j-opt-text-lang>
                    </span>
                </li>
				<li>
					<span class="module-create-title">Title Align</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.title_align">
							<switch-option key="left">Left</switch-option>
							<switch-option key="center">Center</switch-option>
							<switch-option key="right">Right</switch-option>
						</switch>
                    </span>
				</li>
                <li>
                    <span class="module-create-title">Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="module_data.title_font"></j-opt-font>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Background Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="module_data.title_bg_color"></j-opt-color>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Height</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input journal-number-field" data-ng-model="module_data.title_height" />
                    </span>
                </li>
            </ul>
        </accordion-group>
        <accordion-group is-open="module_data.newsletter_is_open" data-ng-show="module_data.type == 'text'">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Newsletter</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Status</span>
                    <span class="module-create-option">
                        <switch data-ng-model="module_data.newsletter">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                </li>
                <li data-ng-show="module_data.newsletter == 1">
                    <span class="module-create-title">Background Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="module_data.newsletter_bg_color"></j-opt-color>
                    </span>
                </li>
                <li data-ng-show="module_data.newsletter == 1">
                    <span class="module-create-title">Height</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input journal-number-field" data-ng-model="module_data.newsletter_height" />
                    </span>
                </li>
                <li data-ng-show="module_data.newsletter == 1">
                    <span class="module-create-title">Choose Module</span>
                    <span class="module-create-option">
                        <select data-ng-model="module_data.newsletter_id" ui-select2="{width: 50, minimumResultsForSearch: -1, placeholder: 'Choose Module'}">
                            <option value=""></option>
                            <option data-ng-repeat="module in newsletter_modules" value="{{module.module_id}}">{{module.module_data.module_name}}</option>
                        </select>
                    </span>
                </li>
            </ul>
        </accordion-group>
        <accordion-group is-open="module_data.footer_is_open">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Footer</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Height</span>
                    <span class="module-create-option">
                        <input type="text" class="journal-input journal-number-field" data-ng-model="module_data.footer_height" />
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Background Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="module_data.footer_bg_color"></j-opt-color>
                    </span>
                </li>
                <accordion-group is-open="false" data-ng-show="module_data.type == 'contact'">
                    <accordion-heading>
                        <div class="accordion-bar bar-level-1">Button Submit</div>
                    </accordion-heading>
                    <ul class="module-create-options">
                        <li>
                            <span class="module-create-title">Button Submit Text</span>
                            <span class="module-create-option">
                                <j-opt-text-lang data-ng-model="module_data.button_submit_text"></j-opt-text-lang>
                            </span>
                        </li>
                        <li>
                            <span class="module-create-title">Button Submit Position</span>
                            <span class="module-create-option">
                                <switch data-ng-model="module_data.button_submit_position">
                                    <switch-option key="left">Left</switch-option>
                                    <switch-option key="center">Center</switch-option>
                                    <switch-option key="right">Right</switch-option>
                                </switch>
                            </span>
                        </li>
                        <li>
                            <span class="module-create-title">Button Submit Font</span>
                            <span class="module-create-option">
                                <j-opt-font data-ng-model="module_data.button_submit_font"></j-opt-font>
                            </span>
                        </li>
                        <li>
                            <span class="module-create-title">Button Submit Background</span>
                            <span class="module-create-option">
                                <j-opt-color data-ng-model="module_data.button_submit_bgcolor"></j-opt-color>
                            </span>
                        </li>
                        <li>
                            <span class="module-create-title">Button Submit Hover Background</span>
                            <span class="module-create-option">
                                <j-opt-color data-ng-model="module_data.button_submit_hover_bgcolor"></j-opt-color>
                            </span>
                        </li>
                        <li>
                            <span class="module-create-title">Button Submit Icon</span>
                            <span class="module-create-option">
                                <icon-select data-ng-model="module_data.button_submit_icon"></icon-select>
                            </span>
                        </li>
                        <li>
                            <span class="module-create-title">Button Submit Icon Position</span>
                            <span class="module-create-option">
                                <switch data-ng-model="module_data.button_submit_icon_position">
                                    <switch-option key="left">Left</switch-option>
                                    <switch-option key="right">Right</switch-option>
                                </switch>
                            </span>
                        </li>
                    </ul>
                </accordion-group>
                <accordion-group is-open="false" data-ng-show="module_data.type == 'text'">
                    <accordion-heading>
                        <div class="accordion-bar bar-level-1">Button 1</div>
                    </accordion-heading>
                    <ul class="module-create-options">
                        <li>
                            <span class="module-create-title">Button 1</span>
                            <span class="module-create-option">
                                <switch data-ng-model="module_data.button_1">
                                    <switch-option key="1">ON</switch-option>
                                    <switch-option key="0">OFF</switch-option>
                                </switch>
                            </span>
                        </li>
                        <li data-ng-show="module_data.button_1 == '1'">
                            <span class="module-create-title">Button 1 Text</span>
                            <span class="module-create-option">
                                <j-opt-text-lang data-ng-model="module_data.button_1_text"></j-opt-text-lang>
                            </span>
                        </li>
                        <li data-ng-show="module_data.button_1 == '1'">
                            <span class="module-create-title">Button 1 Font</span>
                            <span class="module-create-option">
                                <j-opt-font data-ng-model="module_data.button_1_font"></j-opt-font>
                            </span>
                        </li>
                        <li data-ng-show="module_data.button_1 == '1'">
                            <span class="module-create-title">Button 1 Background</span>
                            <span class="module-create-option">
                                <j-opt-color data-ng-model="module_data.button_1_bgcolor"></j-opt-color>
                            </span>
                        </li>
                        <li data-ng-show="module_data.button_1 == '1'">
                            <span class="module-create-title">Button 1 Hover Background</span>
                            <span class="module-create-option">
                                <j-opt-color data-ng-model="module_data.button_1_hover_bgcolor"></j-opt-color>
                            </span>
                        </li>
                        <li data-ng-show="module_data.button_1 == '1'">
                            <span class="module-create-title">Button 1 Icon</span>
                            <span class="module-create-option">
                                <icon-select data-ng-model="module_data.button_1_icon"></icon-select>
                            </span>
                        </li>
                        <li data-ng-show="module_data.button_1 == '1'">
                            <span class="module-create-title">Button 1 Icon Position</span>
                            <span class="module-create-option">
                                <switch data-ng-model="module_data.button_1_icon_position">
                                    <switch-option key="left">Left</switch-option>
                                    <switch-option key="right">Right</switch-option>
                                </switch>
                            </span>
                        </li>
                        <li data-ng-show="module_data.button_1 == '1'">
                            <span class="module-create-title">Button 1 Link</span>
                            <span class="module-create-option">
                                <menu-item data-ng-model="module_data.button_1_link"></menu-item>
                            </span>
                        </li>
                        <li data-ng-show="module_data.button_1 == '1'">
                            <span class="module-create-title">Button 1 New Tab</span>
                            <span class="module-create-option">
                                <switch data-ng-model="module_data.button_1_new_window">
                                    <switch-option key="1">ON</switch-option>
                                    <switch-option key="0">OFF</switch-option>
                                </switch>
                            </span>
                        </li>
                    </ul>
                </accordion-group>
                <accordion-group is-open="false" data-ng-show="module_data.type == 'text'">
                    <accordion-heading>
                        <div class="accordion-bar bar-level-1">Button 2</div>
                    </accordion-heading>
                    <ul class="module-create-options">
                        <li>
                            <span class="module-create-title">Button 2</span>
                            <span class="module-create-option">
                                <switch data-ng-model="module_data.button_2">
                                    <switch-option key="1">ON</switch-option>
                                    <switch-option key="0">OFF</switch-option>
                                </switch>
                            </span>
                        </li>
                        <li data-ng-show="module_data.button_2 == '1'">
                            <span class="module-create-title">Button 2 Text</span>
                            <span class="module-create-option">
                                <j-opt-text-lang data-ng-model="module_data.button_2_text"></j-opt-text-lang>
                            </span>
                        </li>
                        <li data-ng-show="module_data.button_2 == '1'">
                            <span class="module-create-title">Button 2 Font</span>
                            <span class="module-create-option">
                                <j-opt-font data-ng-model="module_data.button_2_font"></j-opt-font>
                            </span>
                        </li>
                        <li data-ng-show="module_data.button_2 == '1'">
                            <span class="module-create-title">Button 2 Background</span>
                            <span class="module-create-option">
                                <j-opt-color data-ng-model="module_data.button_2_bgcolor"></j-opt-color>
                            </span>
                        </li>
                        <li data-ng-show="module_data.button_2 == '1'">
                            <span class="module-create-title">Button 2 Hover Background</span>
                            <span class="module-create-option">
                                <j-opt-color data-ng-model="module_data.button_2_hover_bgcolor"></j-opt-color>
                            </span>
                        </li>
                        <li data-ng-show="module_data.button_2 == '1'">
                            <span class="module-create-title">Button 2 Icon</span>
                            <span class="module-create-option">
                                <icon-select data-ng-model="module_data.button_2_icon"></icon-select>
                            </span>
                        </li>
                        <li data-ng-show="module_data.button_2 == '1'">
                            <span class="module-create-title">Button 2 Icon Position</span>
                            <span class="module-create-option">
                                <switch data-ng-model="module_data.button_2_icon_position">
                                    <switch-option key="left">Left</switch-option>
                                    <switch-option key="right">Right</switch-option>
                                </switch>
                            </span>
                        </li>
                        <li data-ng-show="module_data.button_2 == '1'">
                            <span class="module-create-title">Button 2 Link</span>
                            <span class="module-create-option">
                                <menu-item data-ng-model="module_data.button_2_link"></menu-item>
                            </span>
                        </li>
                        <li data-ng-show="module_data.button_2 == '1'">
                            <span class="module-create-title">Button 2 New Tab</span>
                            <span class="module-create-option">
                                <switch data-ng-model="module_data.button_2_new_window">
                                    <switch-option key="1">ON</switch-option>
                                    <switch-option key="0">OFF</switch-option>
                                </switch>
                            </span>
                        </li>
                    </ul>
                </accordion-group>
                <accordion-group is-open="false" data-ng-show="module_data.type == 'text'">
                    <accordion-heading>
                        <div class="accordion-bar bar-level-1">Don't Show Again Notice</div>
                    </accordion-heading>
                    <ul class="module-create-options">
                        <li>
                            <span class="module-create-title">Status</span>
                            <span class="module-create-option">
                                <switch data-ng-model="module_data.do_not_show_again">
                                    <switch-option key="1">ON</switch-option>
                                    <switch-option key="0">OFF</switch-option>
                                </switch>
                            </span>
                        </li>
                        <li data-ng-show="module_data.do_not_show_again == '1'">
                            <span class="module-create-title">Notice Text</span>
                            <span class="module-create-option">
                                <j-opt-text-lang data-ng-model="module_data.do_not_show_again_text"></j-opt-text-lang>
                            </span>
                        </li>
                        <li data-ng-show="module_data.do_not_show_again == '1'">
                            <span class="module-create-title">Notice Font</span>
                            <span class="module-create-option">
                                <j-opt-font data-ng-model="module_data.do_not_show_again_font"></j-opt-font>
                            </span>
                        </li>
                    </ul>
                </accordion-group>
            </ul>
        </accordion-group>
    </accordion>
</div>


