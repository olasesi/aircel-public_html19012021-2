<div class="sticky">
<div class="module-header">
    <div class='module-name'>Modules<span>Photo Gallery</span></div>
    <skin-manager data-url="settings/modulephotogallery"></skin-manager>

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
<div class="module-body custom-code">
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
                    <span class="module-create-title">Thumb Overlay Color</span>
                        <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.gallery_overlay_color"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Thumb Overlay Icon</span>
                        <span class="module-create-option">
                            <j-opt-icon data-ng-model="settings.gallery_overlay_icon"></j-opt-icon>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Side Column Padding</span>
                        <span class="module-create-option">
                            <j-opt-text data-ng-model="settings.side_gallery_padding" class="journal-sort"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Side Column Images per Row</span>
                    <span class="module-create-option">
                            <j-opt-text data-ng-model="settings.side_gallery_items_row" class="journal-sort"></j-opt-text>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
            </ul>
        </accordion-group>
        <accordion-group is-open="accordion.accordions[1]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Popup Gallery</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Popup Backdrop Color</span>
                    <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.gallery_overlay_bg"></j-opt-color>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Bottom Caption Position</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.bottom_caption">
                            <switch-option key="on">ON</switch-option>
                            <switch-option key="off">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Top Bar Background <small>Color - Image</small></span>
                    <span class="module-create-option">
                            <j-opt-color data-ng-model="settings.gallery_bars_bg"></j-opt-color> -
                        <j-opt-background data-ng-model="settings.gallery_bars_bg_image"></j-opt-background>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li data-ng-hide="settings.bottom_caption === 'off'">
                    <span class="module-create-title">Caption Bar Background <small>Color - Image</small></span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.gallery_caption_bar_bg"></j-opt-color> -
                        <j-opt-background data-ng-model="settings.gallery_caption_bar_bg_image_2"></j-opt-background>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Hide Controls After <small>In milliseconds</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.hide_gallery_bars_after" class="journal-number-field" placehode="3000"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Image Caption Font</span>
                    <span class="module-create-option">
                            <j-opt-font data-ng-model="settings.gallery_name_font"></j-opt-font>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Image Counter</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.gallery_image_counter">
                            <switch-option key="block">ON</switch-option>
                            <switch-option key="none">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li data-ng-hide="settings.gallery_image_counter === 'none'">
                    <span class="module-create-title">Image Counter Font</span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.image_counter_color"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Close Button Icon Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.gallery_close_color"></j-opt-color> &nbsp; &nbsp;Hover
                        <j-opt-color data-ng-model="settings.gallery_close_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Left/Right Arrows Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.gallery_arrows_color"></j-opt-color> &nbsp; &nbsp;Hover
                        <j-opt-color data-ng-model="settings.gallery_arrows_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Left/Right Arrows Background</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.gallery_arrows_bg_color"></j-opt-color> &nbsp; &nbsp;Hover
                        <j-opt-color data-ng-model="settings.gallery_arrows_bg_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Arrows Background Border</span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="settings.gallery_arrows_bg_border"></j-opt-border> &nbsp; &nbsp;Hover
                        <j-opt-color data-ng-model="settings.gallery_arrows_bg_border_hover"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Image Border Settings</span>
                    <span class="module-create-option">
                            <j-opt-border data-ng-model="settings.gallery_image_border"></j-opt-border>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <accordion-group is-open="false">
                    <accordion-heading>
                        <div class="accordion-bar bar-level-1">Thumbnails</div>
                    </accordion-heading>
                    <ul class="module-create-options">
                        <li>
                            <span class="module-create-title">Status</span>
                            <span class="module-create-option">
                                <switch data-ng-model="settings.gallery_thumbs">
                                    <switch-option key="on">ON</switch-option>
                                    <switch-option key="off">OFF</switch-option>
                                </switch>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li data-ng-hide="settings.gallery_thumbs === 'off'">
                            <span class="module-create-title">Hidden</span>
                            <span class="module-create-option">
                                <switch data-ng-model="settings.gallery_thumbs_hide">
                                    <switch-option key="on">ON</switch-option>
                                    <switch-option key="off">OFF</switch-option>
                                </switch>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"> </a>
                        </li>
                        <li data-ng-hide="settings.gallery_thumbs === 'off'">
                            <span class="module-create-title">Image Size <small>Width x Height</small></span>
                            <span class="module-create-option">
                                <j-opt-text data-ng-model="settings.gallery_thumbs_width" class="journal-number-field"></j-opt-text> x
                                <j-opt-text data-ng-model="settings.gallery_thumbs_height" class="journal-number-field"></j-opt-text>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li data-ng-hide="settings.gallery_thumbs === 'off'">
                            <span class="module-create-title">Image Spacing</span>
                            <span class="module-create-option">
                                <j-opt-text data-ng-model="settings.gallery_thumbs_spacing" class="journal-sort"></j-opt-text>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li data-ng-hide="settings.gallery_thumbs === 'off'">
                            <span class="module-create-title">Image Border</span>
                            <span class="module-create-option">
                                <j-opt-border data-ng-model="settings.gallery_thumbs_border"></j-opt-border> &nbsp; &nbsp; Hover
                                <j-opt-color data-ng-model="settings.gallery_thumbs_border_hover"></j-opt-color>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li data-ng-hide="settings.gallery_thumbs === 'off'">
                            <span class="module-create-title">Container Background</span>
                            <span class="module-create-option">
                                <j-opt-color data-ng-model="settings.gallery_thumbs_bg"></j-opt-color>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li data-ng-hide="settings.gallery_thumbs === 'off'">
                            <span class="module-create-title">Open/Close Button Color</span>
                            <span class="module-create-option">
                                <j-opt-color data-ng-model="settings.gallery_thumbs_button_color"></j-opt-color> &nbsp; &nbsp;Hover
                                <j-opt-color data-ng-model="settings.gallery_thumbs_button_hover"></j-opt-color>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li data-ng-hide="settings.gallery_thumbs === 'off'">
                            <span class="module-create-title">Open/Close Button Background</span>
                            <span class="module-create-option">
                                <j-opt-color data-ng-model="settings.gallery_thumbs_button_bg_color"></j-opt-color> &nbsp; &nbsp;Hover
                                <j-opt-color data-ng-model="settings.gallery_thumbs_button_bg_hover"></j-opt-color>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                    </ul>
                    </accordion-group>
            </ul>
        </accordion-group>
    </accordion>
</div>
