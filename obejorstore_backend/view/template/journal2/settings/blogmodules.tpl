<div class="sticky">
    <div class="module-header">
        <div class='module-name'>Settings<span>Blog Modules</span></div>

        <skin-manager data-url="settings/blogmodules"></skin-manager>

        <div class="module-buttons">
            <?php if (defined('J2ENV')): ?>
            <a class="btn blue" data-ng-show="skin_id < 100" data-ng-click="saveDefault($event)">Export</a>
            <?php endif; ?>
            <a class="btn blue" data-ng-click="saveAs($event)">Save As</a>
            <a class="btn green" data-ng-click="save($event)">Save</a>
            <a class="btn red" data-ng-show="skin_id < 100" data-ng-click="reset($event)">Reset</a>
            <a class="btn red" data-ng-show="skin_id >= 100" data-ng-click="delete($event)">Delete</a>
        </div>
    </div>
</div>

<div class="module-body">
    <div class="accordion-bar bar-level-0 bar-expand" >
        <a data-ng-click="toggleAccordion(true)" class="hint--top" data-hint="Expand All"><i class="expand-icon"></i></a>  <a data-ng-click="toggleAccordion(false)" class="hint--top" data-hint="Collapse All"><i class="collapse-icon"></i></a>
        <label class="close-others hint--top" data-hint="Close Others"><input type="checkbox" data-ng-model="accordion.close_others" /></label>
    </div>

    <accordion id="main-accordion" close-others="accordion.close_others">
    <!--BLOG MODULES-->
    <accordion-group is-open="accordion.accordions[3]">
    <accordion-heading>
        <div class="accordion-bar bar-level-0">Posts Module</div>
    </accordion-heading>
    <ul class="module-create-options">

    <li>
        <span class="module-create-title">Background Color</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.posts_grid_bg"></j-opt-color>
                                </span>
        <a href="#" target="_blank" class="journal-tip"></a>
    </li>
    <li>
        <span class="module-create-title">Background Hover Color</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.posts_grid_bg_hover"></j-opt-color>
                                </span>
        <a href="#" target="_blank" class="journal-tip"></a>
    </li>
    <li>
        <span class="module-create-title">Padding</span>
                                <span class="module-create-option">
                                      <j-opt-text data-ng-model="settings.posts_grid_padding" class="journal-number-field"></j-opt-text>
                                </span>
        <a href="#" target="_blank" class="journal-tip"></a>
    </li>

    <li>
        <span class="module-create-title">Post Border Settings</span>
                                <span class="module-create-option">
                                    <j-opt-border data-ng-model="settings.posts_grid_border"></j-opt-border>
                                </span>
        <a href="#" target="_blank" class="journal-tip"></a>
    </li>

    <li>
        <span class="module-create-title">Hover Border Color</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.posts_grid_hover_border"></j-opt-color>
                                </span>
        <a href="#" target="_blank" class="journal-tip"></a>
    </li>

    <li>
        <span class="module-create-title">Featured Image Border</span>
                                <span class="module-create-option">
                                    <j-opt-border data-ng-model="settings.posts_grid_image_border"></j-opt-border>
                                </span>
        <a href="#" target="_blank" class="journal-tip"></a>
    </li>

        <li>
            <span class="module-create-title">Shadow <small data-ng-show="settings.posts_grid_box_shadow === 'inherit'">Inherits from Post Grid Shadow</small></span>
            <span class="module-create-option">
                            <switch data-ng-model="settings.posts_grid_box_shadow">
                                <switch-option key="inherit">Inherit</switch-option>
                                <switch-option key="none">None</switch-option>
                                <switch-option key="default">Default</switch-option>
                                <switch-option key="custom">Custom</switch-option>
                            </switch>
                        </span>
            <a href="#" target="_blank" class="journal-tip"></a>
        </li>
        <li data-ng-show="settings.posts_grid_box_shadow === 'custom'">
            <span class="module-create-title">Custom Shadow</span>
            <span class="module-create-option">
                        <j-opt-shadow data-ng-model="settings.posts_grid_shadow_custom"></j-opt-shadow>
                    </span>
            <a href="#" target="_blank" class="journal-tip"></a>
        </li>
        <li data-ng-hide="settings.posts_grid_box_shadow === 'none' || settings.posts_grid_box_shadow === 'inherit'">
            <span class="module-create-title">Shadow Behavior</span>
            <span class="module-create-option">
                            <switch data-ng-model="settings.posts_grid_shadow_2">
                                <switch-option key="hover">Hover</switch-option>
                                <switch-option key="always">Always &nbsp; &nbsp;</switch-option>
                            </switch>
                        </span>
            <a href="#" target="_blank" class="journal-tip"></a>
        </li>

    <!--MODULE TITLE-->

    <accordion close-others="false">
        <accordion-group is-open="false">
        <accordion-heading>
            <div class="accordion-bar bar-level-1">Module Title</div>
        </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Title Font</span>
                        <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.posts_module_title_font"></j-opt-font>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Title Background Color</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.posts_module_title_bg"></j-opt-color>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Title Border Settings</span>
                        <span class="module-create-option">
                            <j-opt-border data-ng-model="settings.posts_module_title_border"></j-opt-border>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Title Align</span>
                            <span class="module-create-option">
                                <switch data-ng-model="settings.posts_module_title_align">
                                    <switch-option key="left">Left</switch-option>
                                    <switch-option key="center">Center</switch-option>
                                    <switch-option key="right">Right</switch-option>
                                </switch>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Title Overflow <small>Keeps long titles on <br/> the same line.</small></span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.module_title_overflow">
                                <switch-option key="on">ON</switch-option>
                                <switch-option key="off">OFF</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
            </ul>
        </accordion-group>
    </accordion>

    <!--POST DETAILS-->
    <accordion close-others="false">
        <accordion-group is-open="false">
            <accordion-heading>
                <div class="accordion-bar bar-level-1">Post Details</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Post Title Font</span>
                                        <span class="module-create-option">
                                            <j-opt-font data-ng-model="settings.posts_grid_title_font"></j-opt-font>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Post Title Hover</span>
                                        <span class="module-create-option">
                                            <j-opt-color data-ng-model="settings.posts_grid_title_font_hover"></j-opt-color>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Post Title Overflow <small>Keeps long titles on <br/> the same line.</small></span>
                                        <span class="module-create-option">
                                            <switch data-ng-model="settings.posts_grid_title_overflow">
                                                <switch-option key="nowrap">ON</switch-option>
                                                <switch-option key="normal">OFF</switch-option>
                                            </switch>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Post Description Font</span>
                                        <span class="module-create-option">
                                            <j-opt-font data-ng-model="settings.posts_grid_desc_font"></j-opt-font>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Padding <small>Top - Right - Bottom - Left</small></span>
                                    <span class="module-create-option">
                                        <j-opt-text data-ng-model="settings.posts_grid_details_padding_top" class="journal-sort"></j-opt-text> -
                                        <j-opt-text data-ng-model="settings.posts_grid_details_padding_right" class="journal-sort"></j-opt-text> -
                                        <j-opt-text data-ng-model="settings.posts_grid_details_padding_bottom" class="journal-sort"></j-opt-text> -
                                        <j-opt-text data-ng-model="settings.posts_grid_details_padding_left" class="journal-sort"></j-opt-text>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

            </ul>
        </accordion-group>
    </accordion>

    <!--POST STATS-->
    <accordion close-others="false">
        <accordion-group is-open="false">
            <accordion-heading>
                <div class="accordion-bar bar-level-1">Post Stats</div>
            </accordion-heading>
            <ul class="module-create-options">

                <li>
                    <span class="module-create-title">Font</span>
                                        <span class="module-create-option">
                                            <j-opt-font data-ng-model="settings.posts_grid_author_date_font"></j-opt-font>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Padding</span>
                                        <span class="module-create-option">
                                              <j-opt-text data-ng-model="settings.posts_grid_author_date_padding" class="journal-number-field"></j-opt-text>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Border Settings</span>
                                        <span class="module-create-option">
                                            <j-opt-border data-ng-model="settings.posts_grid_author_date_border"></j-opt-border>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Background Color</span>
                                        <span class="module-create-option">
                                            <j-opt-color data-ng-model="settings.posts_grid_author_date_bg"></j-opt-color>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Author Icon</span>
                                        <span class="module-create-option">
                                            <j-opt-icon data-ng-model="settings.posts_grid_author_icon"></j-opt-icon>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Date Icon</span>
                                        <span class="module-create-option">
                                            <j-opt-icon data-ng-model="settings.posts_grid_date_icon"></j-opt-icon>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Comments Icon</span>
                                        <span class="module-create-option">
                                            <j-opt-icon data-ng-model="settings.posts_grid_comments_icon"></j-opt-icon>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

            </ul>
        </accordion-group>
    </accordion>

    <!--READ MORE BUTTON-->
    <accordion>
        <accordion-group is-open="false">
            <accordion-heading>
                <div class="accordion-bar bar-level-1">Read More Button</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Button Font</span>
                                        <span class="module-create-option">
                                            <j-opt-font data-ng-model="settings.posts_grid_button_font"></j-opt-font>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Font Hover Color</span>
                                        <span class="module-create-option">
                                            <j-opt-color data-ng-model="settings.posts_grid_button_font_hover"></j-opt-color>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Background Color</span>
                                        <span class="module-create-option">
                                            <j-opt-color data-ng-model="settings.posts_grid_button_bg"></j-opt-color>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Background Hover Color</span>
                                        <span class="module-create-option">
                                            <j-opt-color data-ng-model="settings.posts_grid_button_bg_hover"></j-opt-color>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Border Settings</span>
                                        <span class="module-create-option">
                                            <j-opt-border data-ng-model="settings.posts_grid_button_border"></j-opt-border>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Border Hover Color</span>
                                        <span class="module-create-option">
                                            <j-opt-color data-ng-model="settings.posts_grid_button_border_hover"></j-opt-color>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Button Icon</span>
                                        <span class="module-create-option">
                                            <j-opt-icon data-ng-model="settings.posts_grid_button_icon"></j-opt-icon>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Icon Position</span>
                                        <span class="module-create-option">
                                            <switch data-ng-model="settings.posts_grid_button_icon_position">
                                                <switch-option key="left">Left</switch-option>
                                                <switch-option key="right">Right</switch-option>
                                            </switch>
                                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Button Padding <small>Top - Right - Bottom - Left</small></span>
                                            <span class="module-create-option">
                                                <j-opt-text data-ng-model="settings.posts_grid_button_padding_top" class="journal-sort"></j-opt-text> -
                                                <j-opt-text data-ng-model="settings.posts_grid_button_padding_right" class="journal-sort"></j-opt-text> -
                                                <j-opt-text data-ng-model="settings.posts_grid_button_padding_bottom" class="journal-sort"></j-opt-text> -
                                                <j-opt-text data-ng-model="settings.posts_grid_button_padding_left" class="journal-sort"></j-opt-text>
                                            </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Button Align</span>
                    <span class="module-create-option">
                                    <switch data-ng-model="settings.post_module_button_align">
                                        <switch-option key="flex-start">Left</switch-option>
                                        <switch-option key="center">Center</switch-option>
                                        <switch-option key="flex-end">Right</switch-option>
                                    </switch>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
            </ul>
        </accordion-group>
    </accordion>
    </ul>
    </accordion-group>

    <!--Side Modules-->
    <accordion-group is-open="accordion.accordions[4]">
        <accordion-heading>
            <div class="accordion-bar bar-level-0">Side Column</div>
        </accordion-heading>
        <ul class="module-create-options">
            <li>
                <span class="module-create-title">Side Post Image Dimensions</span>
                            <span class="module-create-option">
                                <j-opt-text data-ng-model="settings.side_post_image_width" class="journal-number-field"></j-opt-text> x
                                <j-opt-text data-ng-model="settings.side_post_image_height" class="journal-number-field"></j-opt-text>
                            </span>
                <a href="#" target="_blank" class="journal-tip"> </a>
            </li>
            <li>
                <span class="module-create-title">Modules Background Color</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.side_posts_grid_bg"></j-opt-color>
                        </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>
            <li>
                <span class="module-create-title">Module Padding <small>Top - Right - Bottom - Left</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.side_posts_grid_button_padding_top" class="journal-sort"></j-opt-text> -
                        <j-opt-text data-ng-model="settings.side_posts_grid_button_padding_right" class="journal-sort"></j-opt-text> -
                        <j-opt-text data-ng-model="settings.side_posts_grid_button_padding_bottom" class="journal-sort"></j-opt-text> -
                        <j-opt-text data-ng-model="settings.side_posts_grid_button_padding_left" class="journal-sort"></j-opt-text>
                    </span>
                <a href="#" target="_blank" class="journal-tip"> </a>
            </li>

            <li>
                <span class="module-create-title">Module Bottom Spacing</span>
                        <span class="module-create-option">
                              <j-opt-text data-ng-model="settings.side_posts_grid_spacing" class="journal-sort"></j-opt-text>
                        </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>

            <li>
                <span class="module-create-title">Module Border Settings</span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="settings.side_posts_grid_button_border"></j-opt-border>
                    </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>
            <li>
                <span class="module-create-title">Item Bottom Spacing</span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.side_posts_grid_item_spacing_bottom" class="journal-sort"></j-opt-text>
                    </span>
                <a href="#" target="_blank" class="journal-tip"> </a>
            </li>

            <li>
                <span class="module-create-title">Item Divider Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.side_posts_divider"></j-opt-color>
                    </span>
                <a href="#" target="_blank" class="journal-tip"> </a>
            </li>

            <li>
                <span class="module-create-title">Item Divider Type</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.side_posts_divider_type">
                            <switch-option key="solid">Solid</switch-option>
                            <switch-option key="dashed">Dashed</switch-option>
                            <switch-option key="dotted">Dotted</switch-option>
                        </switch>
                    </span>
                <a href="#" target="_blank" class="journal-tip"> </a>
            </li>
            <li>
                <span class="module-create-title">Post Title Font</span>
                        <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.side_posts_grid_title_font"></j-opt-font>
                        </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>

            <li>
                <span class="module-create-title">Post Title Hover</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.side_posts_grid_title_font_hover"></j-opt-color>
                        </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>
            <li>
                <span class="module-create-title">Author / Date Font</span>
                        <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.side_posts_grid_author_date_font"></j-opt-font>
                        </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>
            <li>
                <span class="module-create-title">Date Icon Color</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.side_posts_date_icon_color"></j-opt-color>
                        </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>
            <li>
                <span class="module-create-title">Comments Icon Color</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.side_posts_comments_icon_color"></j-opt-color>
                        </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>
            <li>
                <span class="module-create-title">User Icon Color</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.side_posts_user_icon_color"></j-opt-color>
                        </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>
            <li>
                <span class="module-create-title">Image Border Settings</span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="settings.side_posts_grid_image_border"></j-opt-border>
                    </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>

        </ul>
    </accordion-group>

    </accordion>
</div>
