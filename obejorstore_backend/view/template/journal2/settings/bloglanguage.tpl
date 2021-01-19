<div class="sticky">
    <div class="module-header">
        <div class='module-name'>Settings<span>Blog Language</span></div>

        <skin-manager data-url="settings/bloglanguage"></skin-manager>

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

        <!--LANGUAGE-->
        <accordion-group is-open="accordion.accordions[4]">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Language</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Read More Button</span>
                        <span class="module-create-option">
                            <j-opt-text-lang data-ng-model="settings.blog_button_read_more"></j-opt-text-lang>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Posted by</span>
                        <span class="module-create-option">
                            <j-opt-text-lang data-ng-model="settings.blog_posted_by_text"></j-opt-text-lang>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Comment(s)</span>
                        <span class="module-create-option">
                            <j-opt-text-lang data-ng-model="settings.blog_comment_text"></j-opt-text-lang>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Reply Button</span>
                        <span class="module-create-option">
                            <j-opt-text-lang data-ng-model="settings.blog_reply_button"></j-opt-text-lang>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Leave a Reply Text</span>
                        <span class="module-create-option">
                            <j-opt-text-lang data-ng-model="settings.blog_leave_reply_text"></j-opt-text-lang>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Leave a Comment Text</span>
                        <span class="module-create-option">
                            <j-opt-text-lang data-ng-model="settings.blog_leave_comment_text"></j-opt-text-lang>
                        </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
            </ul>
            <accordion close-others="accordion.close_others">
                <accordion-group is-open="accordion.accordions[11]">
                    <accordion-heading>
                        <div class="accordion-bar bar-level-1">Comment Form</div>
                    </accordion-heading>
                    <ul class="module-create-options">
                        <li>
                            <span class="module-create-title">Name</span>
                            <span class="module-create-option">
                                <j-opt-text-lang data-ng-model="settings.blog_form_name"></j-opt-text-lang>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Email</span>
                            <span class="module-create-option">
                                <j-opt-text-lang data-ng-model="settings.blog_form_email"></j-opt-text-lang>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Website</span>
                            <span class="module-create-option">
                                <j-opt-text-lang data-ng-model="settings.blog_form_website"></j-opt-text-lang>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Comment</span>
                            <span class="module-create-option">
                                <j-opt-text-lang data-ng-model="settings.blog_form_comment"></j-opt-text-lang>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Submit Button</span>
                            <span class="module-create-option">
                                <j-opt-text-lang data-ng-model="settings.blog_form_submit"></j-opt-text-lang>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Comment Submitted Alert</span>
                            <span class="module-create-option">
                                <j-opt-text-lang data-ng-model="settings.blog_form_comment_submitted"></j-opt-text-lang>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                        <li>
                            <span class="module-create-title">Comment Awaiting Approval Alert</span>
                            <span class="module-create-option">
                                <j-opt-text-lang data-ng-model="settings.blog_form_comment_awaiting_approval"></j-opt-text-lang>
                            </span>
                            <a href="#" target="_blank" class="journal-tip"></a>
                        </li>
                    </ul>
                </accordion-group>
            </accordion>
        </accordion-group>
    </accordion>
</div>
