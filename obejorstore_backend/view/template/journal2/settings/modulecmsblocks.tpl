<div class="sticky">
<div class="module-header">
    <div class='module-name'>Modules<span>CMS Blocks</span></div>

    <skin-manager data-url="settings/modulecmsblocks"></skin-manager>

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
                    <span class="module-create-title">Headings Font <small>H1 - H3 tags</small></span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.cms_heading_font"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Block Font <small>p tag</small></span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.cms_font_color"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Block Text Line Height <small>Pixels</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.cms_block_line_height" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Headings Spacing <small>Padding Bottom</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.cms_heading_padding" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>


                <li>
                    <span class="module-create-title">Paragraph  Spacing <small>Padding Bottom</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.cms_block_p_padding" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Block Background Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.cms_bg"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>


                <li>
                    <span class="module-create-title">Block Border Settings</span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="settings.cms_border"></j-opt-border>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Block Container Padding</span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.cms_padding" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>


            </ul>
        </accordion-group>
        <accordion-group is-open="accordion.accordions[0]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Side Columns</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Headings Font <small>H1 - H3 tags</small></span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.side_cms_heading_font"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Block Font <small>p tag</small></span>
                    <span class="module-create-option">
                        <j-opt-font data-ng-model="settings.side_cms_font"></j-opt-font>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Block Text Line Height <small>Pixels</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.side_cms_block_line_height" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>
                <li>
                    <span class="module-create-title">Headings Spacing <small>Padding Bottom</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.side_cms_heading_padding" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>


                <li>
                    <span class="module-create-title">Paragraph  Spacing <small>Padding Bottom</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.side_cms_block_p_padding" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Block Background Color</span>
                    <span class="module-create-option">
                        <j-opt-color data-ng-model="settings.side_cms_bg"></j-opt-color>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>


                <li>
                    <span class="module-create-title">Block Border Settings</span>
                    <span class="module-create-option">
                        <j-opt-border data-ng-model="settings.side_cms_border"></j-opt-border>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Block Container Padding</span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.side_cms_padding" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>

                <li>
                    <span class="module-create-title">Block Margin <small>Vertical Spacing</small></span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="settings.side_cms_margin" class="journal-number-field"></j-opt-text>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"> </a>
                </li>


            </ul>
        </accordion-group>

    </accordion>
</div>
