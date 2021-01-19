<div class="sticky">
    <div class="module-header">
        <div class='module-name'>Settings<span>Post Page</span></div>

        <skin-manager data-url="settings/blogpostpage"></skin-manager>

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

    <!--GENERAL-->
        <accordion-group is-open="accordion.accordions[0]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">General</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Content Background Color</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.post_page_bg"></j-opt-color>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Content Padding</span>
                                    <span class="module-create-option">
                                          <j-opt-text data-ng-model="settings.post_page_padding" class="journal-number-field"></j-opt-text>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>


                <li>
                    <span class="module-create-title">Share Plugin Divider Color</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.post_page_share_border_color"></j-opt-color>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Share Plugin Divider Type</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.post_page_share_border_type">
                            <switch-option key="solid">Solid</switch-option>
                            <switch-option key="dashed">Dashed</switch-option>
                            <switch-option key="dotted">Dotted</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Share Plugin Align</span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.post_page_share_align">
                                <switch-option key="left">Left</switch-option>
                                <switch-option key="center">Center</switch-option>
                                <switch-option key="right">Right</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
            </ul>
    </accordion-group>

        <!--PAGE TITLE-->
        <accordion-group is-open="accordion.accordions[1]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Post Title</div>
            </accordion-heading>
            <ul class="module-create-options">

                <li>
                    <span class="module-create-title">Post Title Bar Font</span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.post_page_title_font"></j-opt-font>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Post Title Background</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.post_page_title_bg"></j-opt-color>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Post Title Border Settings</span>
                                    <span class="module-create-option">
                                        <j-opt-border data-ng-model="settings.post_page_title_border"></j-opt-border>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Post Title Height</span>
                                    <span class="module-create-option">
                                        <j-opt-text data-ng-model="settings.post_page_title_line_height" class="journal-number-field"></j-opt-text>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Post Title Padding <small>Left - Right</small></span>
                            <span class="module-create-option">
                                <j-opt-text data-ng-model="settings.post_page_title_padding_left" class="journal-sort"></j-opt-text> -
                                <j-opt-text data-ng-model="settings.post_page_title_padding_right" class="journal-sort"></j-opt-text>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Post Title Text Align</span>
                                    <span class="module-create-option">
                                        <switch data-ng-model="settings.post_page_title_align">
                                            <switch-option key="left">Left</switch-option>
                                            <switch-option key="center">Center</switch-option>
                                            <switch-option key="right">Right</switch-option>
                                        </switch>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Post Title Overflow <small>Keeps long titles on <br/> the same line.</small></span>
                        <span class="module-create-option">
                            <switch data-ng-model="settings.post_title_overflow">
                                <switch-option key="on">ON</switch-option>
                                <switch-option key="off">OFF</switch-option>
                            </switch>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
            </ul>
        </accordion-group>

    <!--Post Stats-->
    <accordion-group is-open="accordion.accordions[2]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Post Stats &nbsp;<span>(Author, Date, Comments, Categories)</span></div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Font</span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.post_page_author_date_font"></j-opt-font>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Padding <small>Top - Right - Bottom - Left</small></span>
                                    <span class="module-create-option">
                                        <j-opt-text data-ng-model="settings.post_page_stats_padding_top" class="journal-sort"></j-opt-text> -
                                        <j-opt-text data-ng-model="settings.post_page_stats_padding_right" class="journal-sort"></j-opt-text> -
                                        <j-opt-text data-ng-model="settings.post_page_stats_padding_bottom" class="journal-sort"></j-opt-text> -
                                        <j-opt-text data-ng-model="settings.post_page_stats_padding_left" class="journal-sort"></j-opt-text>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Margin <small>Top - Bottom</small></span>
                            <span class="module-create-option">
                                <j-opt-text data-ng-model="settings.post_page_stats_margin_left" class="journal-sort"></j-opt-text> -
                                <j-opt-text data-ng-model="settings.post_page_stats_margin_right" class="journal-sort"></j-opt-text>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>


                <li>
                    <span class="module-create-title">Border Settings</span>
                                    <span class="module-create-option">
                                        <j-opt-border data-ng-model="settings.post_page_author_date_border" editor="hide-radius"></j-opt-border>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Background Color</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.post_page_author_date_bg"></j-opt-color>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Author Icon</span>
                                    <span class="module-create-option">
                                        <j-opt-icon data-ng-model="settings.post_page_author_icon"></j-opt-icon>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Date Icon</span>
                                    <span class="module-create-option">
                                        <j-opt-icon data-ng-model="settings.post_page_date_icon"></j-opt-icon>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Comments Icon</span>
                                    <span class="module-create-option">
                                        <j-opt-icon data-ng-model="settings.post_page_comments_icon"></j-opt-icon>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Categories Icon</span>
                                    <span class="module-create-option">
                                        <j-opt-icon data-ng-model="settings.post_page_category_icon"></j-opt-icon>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Category Link Font Color</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.post_page_category_font"></j-opt-color>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Category Link Font Hover</span>
                                    <span class="module-create-option">
                                        <j-opt-color data-ng-model="settings.post_page_category_font_hover"></j-opt-color>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
            </ul>
        </accordion-group>

    <!--Description-->
    <accordion-group is-open="accordion.accordions[3]">
        <accordion-heading>
            <div class="accordion-bar bar-level-0">Description Font Settings</div>
        </accordion-heading>
        <ul class="module-create-options">
            <li>
                <span class="module-create-title">H1 Font</span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.post_page_h1_font"></j-opt-font>
                                    </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>
            <li>
                <span class="module-create-title">H2 Font</span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.post_page_h2_font"></j-opt-font>
                                    </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>
            <li>
                <span class="module-create-title">H3 Font</span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.post_page_h3_font"></j-opt-font>
                                    </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>
            <li>
                <span class="module-create-title">Description Font</span>
                                    <span class="module-create-option">
                                        <j-opt-font data-ng-model="settings.post_page_desc_font"></j-opt-font>
                                    </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>

            <li>
                <span class="module-create-title">Description Line Height</span>
                        <span class="module-create-option">
                              <j-opt-text data-ng-model="settings.post_page_line_height" class="journal-number-field"></j-opt-text>
                        </span>
                <a href="#" target="_blank" class="journal-tip"></a>
            </li>
        </ul>
    </accordion-group>

        <!--Blockquote-->
    <accordion-group is-open="accordion.accordions[4]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Blockquote Styles</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Blockquote Font</span>
                                <span class="module-create-option">
                                    <j-opt-font data-ng-model="settings.post_page_q_font"></j-opt-font>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Line Height</span>
                        <span class="module-create-option">
                              <j-opt-text data-ng-model="settings.post_page_q_line_height" class="journal-number-field"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>


                <li>
                    <span class="module-create-title">Border Settings</span>
                                <span class="module-create-option">
                                    <j-opt-border data-ng-model="settings.post_page_q_border" editor="hide-radius"></j-opt-border>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Background Color</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.post_page_q_bg"></j-opt-color>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Blockquote Padding <small>Top - Right - Bottom - Left</small></span>
                                    <span class="module-create-option">
                                        <j-opt-text data-ng-model="settings.post_page_q_padding_top" class="journal-sort"></j-opt-text> -
                                        <j-opt-text data-ng-model="settings.post_page_q_padding_right" class="journal-sort"></j-opt-text> -
                                        <j-opt-text data-ng-model="settings.post_page_q_padding_bottom" class="journal-sort"></j-opt-text> -
                                        <j-opt-text data-ng-model="settings.post_page_q_padding_left" class="journal-sort"></j-opt-text>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Blockquote Margin <small>Top - Right - Bottom - Left</small></span>
                                    <span class="module-create-option">
                                        <j-opt-text data-ng-model="settings.post_page_q_margin_top" class="journal-sort"></j-opt-text> -
                                        <j-opt-text data-ng-model="settings.post_page_q_margin_right" class="journal-sort"></j-opt-text> -
                                        <j-opt-text data-ng-model="settings.post_page_q_margin_bottom" class="journal-sort"></j-opt-text> -
                                        <j-opt-text data-ng-model="settings.post_page_q_margin_left" class="journal-sort"></j-opt-text>
                                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
            </ul>
        </accordion-group>

        <!--Tags-->
    <accordion-group is-open="accordion.accordions[5]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Post Tags</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Title Font</span>
                                <span class="module-create-option">
                                    <j-opt-font data-ng-model="settings.post_tags_title_font"></j-opt-font>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Title Background</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.post_tags_title_bg"></j-opt-color>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Tag Font</span>
                                <span class="module-create-option">
                                    <j-opt-font data-ng-model="settings.post_tags_font"></j-opt-font>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Tag Background</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.post_tags_bg"></j-opt-color>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Tag Font Hover</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.post_tags_hover_font"></j-opt-color>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Tag Background Hover</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.post_tags_hover_bg"></j-opt-color>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Tag Border Radius</span>
                                <span class="module-create-option">
                                    <j-opt-border data-ng-model="settings.post_tags_border" editor="hide-style"></j-opt-border>
                                </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Tags Align</span>
                            <span class="module-create-option">
                                <switch data-ng-model="settings.post_tags_align">
                                    <switch-option key="left">Left</switch-option>
                                    <switch-option key="center">Center</switch-option>
                                    <switch-option key="right">Right</switch-option>
                                </switch>
                            </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                </ul>
            </accordion-group>

            <!--Comments-->
            <accordion-group is-open="accordion.accordions[6]">
                <accordion-heading>
                    <div class="accordion-bar bar-level-0">Comments</div>
                </accordion-heading>
                <ul class="module-create-options">
                    <li>
                        <span class="module-create-title">Title Font</span>
                            <span class="module-create-option">
                                <j-opt-font data-ng-model="settings.post_comment_title_font"></j-opt-font>
                            </span>
                        <a href="#" target="_blank" class="journal-tip"></a>
                    </li>
                    <li>
                        <span class="module-create-title">Title Background Color</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.post_comment_title_bg"></j-opt-color>
                                </span>
                        <a href="#" target="_blank" class="journal-tip"></a>
                    </li>

                    <li>
                        <span class="module-create-title">Title Padding <small>Top - Right - Bottom - Left</small></span>
                            <span class="module-create-option">
                                <j-opt-text data-ng-model="settings.post_comment_title_padding_top" class="journal-sort"></j-opt-text> -
                                <j-opt-text data-ng-model="settings.post_comment_title_padding_right" class="journal-sort"></j-opt-text> -
                                <j-opt-text data-ng-model="settings.post_comment_title_padding_bottom" class="journal-sort"></j-opt-text> -
                                <j-opt-text data-ng-model="settings.post_comment_title_padding_left" class="journal-sort"></j-opt-text>
                            </span>
                        <a href="#" target="_blank" class="journal-tip"> </a>
                    </li>
                    <li>
                        <span class="module-create-title">Title Margin <small>Top - Bottom</small></span>
                                                    <span class="module-create-option">
                                                        <j-opt-text data-ng-model="settings.post_comment_title_top_margin" class="journal-sort"></j-opt-text> -
                                                        <j-opt-text data-ng-model="settings.post_comment_title_bottom_margin" class="journal-sort"></j-opt-text>
                                                    </span>
                        <a href="#" target="_blank" class="journal-tip"> </a>
                    </li>

                    <li>
                        <span class="module-create-title">Title Border Settings</span>
                                    <span class="module-create-option">
                                        <j-opt-border data-ng-model="settings.post_comment_title_border"></j-opt-border>
                                    </span>
                        <a href="#" target="_blank" class="journal-tip"> </a>
                    </li>
                    <li>
                        <span class="module-create-title">Title Align</span>
                            <span class="module-create-option">
                                <switch data-ng-model="settings.post_comment_title_align">
                                    <switch-option key="left">Left</switch-option>
                                    <switch-option key="center">Center</switch-option>
                                    <switch-option key="right">Right</switch-option>
                                </switch>
                            </span>
                        <a href="#" target="_blank" class="journal-tip"></a>
                    </li>

                    <li>
                        <span class="module-create-title">Comment Box Background Color (EVEN)</span>
                                                <span class="module-create-option">
                                                    <j-opt-color data-ng-model="settings.post_comment_bg_even"></j-opt-color>
                                                </span>
                        <a href="#" target="_blank" class="journal-tip"></a>
                    </li>
                    <li>
                        <span class="module-create-title">Comment Box Background Color (ODD)</span>
                                                <span class="module-create-option">
                                                    <j-opt-color data-ng-model="settings.post_comment_bg_odd"></j-opt-color>
                                                </span>
                        <a href="#" target="_blank" class="journal-tip"></a>
                    </li>
                    <li>
                        <span class="module-create-title">Comment Box Border Settings</span>
                                                <span class="module-create-option">
                                                    <j-opt-border data-ng-model="settings.post_comment_border"></j-opt-border>
                                                </span>
                        <a href="#" target="_blank" class="journal-tip"></a>
                    </li>
                    <li>
                        <span class="module-create-title">Comment Box Padding</span>
                                                    <span class="module-create-option">
                                                        <j-opt-text data-ng-model="settings.post_comment_padding" class="journal-number-field"></j-opt-text>
                                                    </span>
                        <a href="#" target="_blank" class="journal-tip"> </a>
                    </li>
                    <li>
                        <span class="module-create-title">Avatar Border Settings</span>
                                                <span class="module-create-option">
                                                    <j-opt-border data-ng-model="settings.post_comment_avatar_border"></j-opt-border>
                                                </span>
                        <a href="#" target="_blank" class="journal-tip"></a>
                    </li>
                    <li>
                        <span class="module-create-title">Author Font</span>
                                                <span class="module-create-option">
                                                    <j-opt-font data-ng-model="settings.post_comment_author_font"></j-opt-font>
                                                </span>
                        <a href="#" target="_blank" class="journal-tip"></a>
                    </li>
                    <li>
                        <span class="module-create-title">Date/Time Font</span>
                                                <span class="module-create-option">
                                                    <j-opt-font data-ng-model="settings.post_comment_date_font"></j-opt-font>
                                                </span>
                        <a href="#" target="_blank" class="journal-tip"></a>
                    </li>
                    <li>
                    <span class="module-create-title">User Website Font</span>
                                                <span class="module-create-option">
                                                    <j-opt-font data-ng-model="settings.post_comment_user_site_font"></j-opt-font>
                                                </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                    <li>
                        <span class="module-create-title">User Website Font Hover</span>
                                                <span class="module-create-option">
                                                    <j-opt-color data-ng-model="settings.post_comment_user_site_hover"></j-opt-color>
                                                </span>
                        <a href="#" target="_blank" class="journal-tip"></a>
                    </li>
                    <li>
                        <span class="module-create-title">Comment Font</span>
                                                <span class="module-create-option">
                                                    <j-opt-font data-ng-model="settings.post_comment_font"></j-opt-font>
                                                </span>
                        <a href="#" target="_blank" class="journal-tip"></a>
                    </li>

                    <!--REPLY BOX-->
                    <accordion>
                    <accordion-group is-open="false">
                        <accordion-heading>
                            <div class="accordion-bar bar-level-1">Reply Box</div>
                        </accordion-heading>
                        <ul class="module-create-options">
                            <li>
                                <span class="module-create-title">Reply Box Background Color (EVEN)</span>
                                                        <span class="module-create-option">
                                                            <j-opt-color data-ng-model="settings.post_reply_bg_even"></j-opt-color>
                                                        </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Reply Box Background Color (ODD)</span>
                                                        <span class="module-create-option">
                                                            <j-opt-color data-ng-model="settings.post_reply_bg_odd"></j-opt-color>
                                                        </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Reply Box Border Settings</span>
                                                        <span class="module-create-option">
                                                            <j-opt-border data-ng-model="settings.post_reply_border"></j-opt-border>
                                                        </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Reply Box Padding</span>
                                                    <span class="module-create-option">
                                                        <j-opt-text data-ng-model="settings.post_reply_padding" class="journal-number-field"></j-opt-text>
                                                    </span>
                                <a href="#" target="_blank" class="journal-tip"> </a>
                            </li>
                            <li>
                                <span class="module-create-title">Reply Avatar Border Settings</span>
                                                        <span class="module-create-option">
                                                            <j-opt-border data-ng-model="settings.post_reply_avatar_border"></j-opt-border>
                                                        </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Reply Author Font</span>
                                                        <span class="module-create-option">
                                                            <j-opt-font data-ng-model="settings.post_reply_author_font"></j-opt-font>
                                                        </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Reply Date/Time Font</span>
                                                        <span class="module-create-option">
                                                            <j-opt-font data-ng-model="settings.post_reply_date_font"></j-opt-font>
                                                        </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <li>
                                <span class="module-create-title">Reply Comment Font</span>
                                                        <span class="module-create-option">
                                                            <j-opt-font data-ng-model="settings.post_reply_comment_font"></j-opt-font>
                                                        </span>
                                <a href="#" target="_blank" class="journal-tip"></a>
                            </li>
                            <!--REPLY FORM-->
                            <accordion>
                                <accordion-group is-open="false">
                                    <accordion-heading>
                                        <div class="accordion-bar bar-level-2">Reply Form</div>
                                    </accordion-heading>
                                    <ul class="module-create-options">
                                        <li>
                                            <span class="module-create-title">Title Font</span>
                                                                <span class="module-create-option">
                                                                    <j-opt-font data-ng-model="settings.post_form_reply_title_font"></j-opt-font>
                                                                </span>
                                            <a href="#" target="_blank" class="journal-tip"></a>
                                        </li>

                                        <li>
                                            <span class="module-create-title">Title Background Color</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.post_form_reply_title_bg"></j-opt-color>
                                </span>
                                            <a href="#" target="_blank" class="journal-tip"></a>
                                        </li>


                                        <li>
                                            <span class="module-create-title">Title Padding <small>Top - Right - Bottom - Left</small></span>
                                                <span class="module-create-option">
                                                    <j-opt-text data-ng-model="settings.post_form_reply_title_padding_top" class="journal-sort"></j-opt-text> -
                                                    <j-opt-text data-ng-model="settings.post_form_reply_title_padding_right" class="journal-sort"></j-opt-text> -
                                                    <j-opt-text data-ng-model="settings.post_form_reply_title_padding_bottom" class="journal-sort"></j-opt-text> -
                                                    <j-opt-text data-ng-model="settings.post_form_reply_title_padding_left" class="journal-sort"></j-opt-text>
                                                </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>


                                        <li>
                                            <span class="module-create-title">Title Margin <small>Top - Bottom</small></span>
                                                    <span class="module-create-option">
                                                        <j-opt-text data-ng-model="settings.post_form_reply_title_top_margin" class="journal-sort"></j-opt-text> -
                                                        <j-opt-text data-ng-model="settings.post_form_reply_title_bottom_margin" class="journal-sort"></j-opt-text>
                                                    </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>

                                        <li>
                                            <span class="module-create-title">Title Border Settings</span>
                                    <span class="module-create-option">
                                        <j-opt-border data-ng-model="settings.post_form_reply_title_border"></j-opt-border>
                                    </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>

                                        <li>
                                            <span class="module-create-title">Title Align</span>
                                                    <span class="module-create-option">
                                                        <switch data-ng-model="settings.post_form_reply_title_align">
                                                            <switch-option key="left">Left</switch-option>
                                                            <switch-option key="center">Center</switch-option>
                                                            <switch-option key="right">Right</switch-option>
                                                        </switch>
                                                    </span>
                                            <a href="#" target="_blank" class="journal-tip"></a>
                                        </li>



                                        <li>
                                            <span class="module-create-title">Form Background Color</span>
                                                        <span class="module-create-option">
                                                            <j-opt-color data-ng-model="settings.post_form_reply_bg"></j-opt-color>
                                                        </span>
                                            <a href="#" target="_blank" class="journal-tip"></a>
                                        </li>
                                        <li>
                                            <span class="module-create-title">Form Border Settings</span>
                                                        <span class="module-create-option">
                                                            <j-opt-border data-ng-model="settings.post_form_reply_border"></j-opt-border>
                                                        </span>
                                            <a href="#" target="_blank" class="journal-tip"></a>
                                        </li>
                                        <li>
                                            <span class="module-create-title">Form Padding</span>
                                                        <span class="module-create-option">
                                                            <j-opt-text data-ng-model="settings.post_form_reply_padding" class="journal-sort"></j-opt-text> -
                                                        </span>
                                            <a href="#" target="_blank" class="journal-tip"> </a>
                                        </li>

                                    </ul>
                                </accordion-group>
                            </accordion>
                        </ul>
                    </accordion-group>
                </accordion>


                <!--COMMENT FORM-->
                <accordion>
                    <accordion-group is-open="false">
                        <accordion-heading>
                            <div class="accordion-bar bar-level-1">Comment Form</div>
                        </accordion-heading>
                            <ul class="module-create-options">
                                <li>
                                    <span class="module-create-title">Email Required</span>
                                    <span class="module-create-option">
                                        <switch data-ng-model="settings.post_form_email_required">
                                            <switch-option key="1">ON</switch-option>
                                            <switch-option key="0">OFF</switch-option>
                                        </switch>
                                    </span>
                                    <a href="#" target="_blank" class="journal-tip"></a>
                                </li>
                                <li>
                                    <span class="module-create-title">Title Font</span>
                                            <span class="module-create-option">
                                                <j-opt-font data-ng-model="settings.post_form_title_font"></j-opt-font>
                                            </span>
                                    <a href="#" target="_blank" class="journal-tip"></a>
                                </li>
                                <li>
                                    <span class="module-create-title">Title Background Color</span>
                                <span class="module-create-option">
                                    <j-opt-color data-ng-model="settings.post_form_title_bg"></j-opt-color>
                                </span>
                                    <a href="#" target="_blank" class="journal-tip"></a>
                                </li>


                                <li>
                                    <span class="module-create-title">Title Padding <small>Top - Right - Bottom - Left</small></span>
                                                <span class="module-create-option">
                                                    <j-opt-text data-ng-model="settings.post_form_title_padding_top" class="journal-sort"></j-opt-text> -
                                                    <j-opt-text data-ng-model="settings.post_form_title_padding_right" class="journal-sort"></j-opt-text> -
                                                    <j-opt-text data-ng-model="settings.post_form_title_padding_bottom" class="journal-sort"></j-opt-text> -
                                                    <j-opt-text data-ng-model="settings.post_form_title_padding_left" class="journal-sort"></j-opt-text>
                                                </span>
                                    <a href="#" target="_blank" class="journal-tip"> </a>
                                </li>


                                <li>
                                    <span class="module-create-title">Title Margin <small>Top - Bottom</small></span>
                                                    <span class="module-create-option">
                                                        <j-opt-text data-ng-model="settings.post_form_title_top_margin" class="journal-sort"></j-opt-text> -
                                                        <j-opt-text data-ng-model="settings.post_form_title_bottom_margin" class="journal-sort"></j-opt-text>
                                                    </span>
                                    <a href="#" target="_blank" class="journal-tip"> </a>
                                </li>


                                <li>
                                    <span class="module-create-title">Title Border Settings</span>
                                    <span class="module-create-option">
                                        <j-opt-border data-ng-model="settings.post_form_title_border"></j-opt-border>
                                    </span>
                                    <a href="#" target="_blank" class="journal-tip"> </a>
                                </li>

                                <li>
                                    <span class="module-create-title">Title Align</span>
                                            <span class="module-create-option">
                                                <switch data-ng-model="settings.post_form_title_align">
                                                    <switch-option key="left">Left</switch-option>
                                                    <switch-option key="center">Center</switch-option>
                                                    <switch-option key="right">Right</switch-option>
                                                </switch>
                                            </span>
                                    <a href="#" target="_blank" class="journal-tip"></a>
                                </li>


                                <li>
                                    <span class="module-create-title">Form Background Color</span>
                                                            <span class="module-create-option">
                                                                <j-opt-color data-ng-model="settings.post_form_bg"></j-opt-color>
                                                            </span>
                                    <a href="#" target="_blank" class="journal-tip"></a>
                                </li>
                                <li>
                                    <span class="module-create-title">Form Border Settings</span>
                                                            <span class="module-create-option">
                                                                <j-opt-border data-ng-model="settings.post_form_border"></j-opt-border>
                                                            </span>
                                    <a href="#" target="_blank" class="journal-tip"></a>
                                </li>
                                <li>
                                    <span class="module-create-title">Form Padding</span>
                                                            <span class="module-create-option">
                                                                <j-opt-text data-ng-model="settings.post_form_padding" class="journal-number-field"></j-opt-text> -
                                                            </span>
                                    <a href="#" target="_blank" class="journal-tip"> </a>
                                </li>

                            </ul>
                        </accordion-group>
                    </accordion>
                </ul>
            </accordion-group>

        <!--COMMENT BUTTONS-->
        <accordion-group is-open="accordion.accordions[7]">
                <accordion-heading>
                    <div class="accordion-bar bar-level-0">Buttons <span>(Reply / Submit)</span></div>
                </accordion-heading>
                <ul class="module-create-options">
                    <li>
                        <span class="module-create-title">Button Font</span>
                                            <span class="module-create-option">
                                                <j-opt-font data-ng-model="settings.post_comment_button_font"></j-opt-font>
                                            </span>
                        <a href="#" target="_blank" class="journal-tip"></a>
                    </li>
                    <li>
                        <span class="module-create-title">Font Hover Color</span>
                                            <span class="module-create-option">
                                                <j-opt-color data-ng-model="settings.post_comment_button_font_hover"></j-opt-color>
                                            </span>
                        <a href="#" target="_blank" class="journal-tip"></a>
                    </li>
                    <li>
                        <span class="module-create-title">Background Color</span>
                                            <span class="module-create-option">
                                                <j-opt-color data-ng-model="settings.post_comment_button_bg"></j-opt-color>
                                            </span>
                        <a href="#" target="_blank" class="journal-tip"></a>
                    </li>
                    <li>
                        <span class="module-create-title">Background Hover Color</span>
                                            <span class="module-create-option">
                                                <j-opt-color data-ng-model="settings.post_comment_button_bg_hover"></j-opt-color>
                                            </span>
                        <a href="#" target="_blank" class="journal-tip"></a>
                    </li>

                    <li>
                        <span class="module-create-title">Border Settings</span>
                                            <span class="module-create-option">
                                                <j-opt-border data-ng-model="settings.post_comment_button_border"></j-opt-border>
                                            </span>
                        <a href="#" target="_blank" class="journal-tip"></a>
                    </li>

                    <li>
                        <span class="module-create-title">Border Hover Color</span>
                                            <span class="module-create-option">
                                                <j-opt-color data-ng-model="settings.post_comment_button_border_hover"></j-opt-color>
                                            </span>
                        <a href="#" target="_blank" class="journal-tip"></a>
                    </li>

                    <li>
                        <span class="module-create-title">Button Padding <small>Top - Right - Bottom - Left</small></span>
                                <span class="module-create-option">
                                    <j-opt-text data-ng-model="settings.post_comment_button_padding_top" class="journal-sort"></j-opt-text> -
                                    <j-opt-text data-ng-model="settings.post_comment_button_padding_right" class="journal-sort"></j-opt-text> -
                                    <j-opt-text data-ng-model="settings.post_comment_button_padding_bottom" class="journal-sort"></j-opt-text> -
                                    <j-opt-text data-ng-model="settings.post_comment_button_padding_left" class="journal-sort"></j-opt-text>
                                </span>
                        <a href="#" target="_blank" class="journal-tip"> </a>
                    </li>
                </ul>
            </accordion-group>
    </accordion>
</div>
