<div class="sticky">
<div class="module-header">
    <div class='module-name'>Modules<span>Newsletter</span></div>

    <skin-manager data-url="settings/modulenewsletter"></skin-manager>

    <div class="module-buttons">
        <?php if (defined('J2ENV')): ?>
        <a class="btn blue" data-ng-show="skin_id < 100" data-ng-click="saveDefault($event)">Export</a>
        <?php endif; ?>
        <!--<a class="btn blue" data-ng-click="multiStore($event)">MultiStore</a>-->
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


        <!--Language-->
        <accordion-group is-open="true">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Language</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Subscribe Message</span>
                    <span class="module-create-option extra-long">
                        <j-opt-text-lang data-ng-model="settings.newsletter_subscribed_message"></j-opt-text-lang>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                    <span class="module-create-title">Confirm Unsubscribe?</span>
                    <span class="module-create-option extra-long">
                        <j-opt-text-lang data-ng-model="settings.newsletter_confirm_unsubscribe_message"></j-opt-text-lang>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Unsubscribe Message</span>
                    <span class="module-create-option extra-long">
                        <j-opt-text-lang data-ng-model="settings.newsletter_unsubscribed_message"></j-opt-text-lang>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Invalid Email Message</span>
                    <span class="module-create-option extra-long">
                        <j-opt-text-lang data-ng-model="settings.newsletter_invalid_email_message"></j-opt-text-lang>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li>
                  <span class="module-create-title">Agree to Terms <small>Adds checkbox and forces user to agree to terms in order to subscribe.</small></span>
                  <span class="module-create-option">
                      <switch data-ng-model="settings.newsletter_privacy">
                          <switch-option key="1">ON</switch-option>
                          <switch-option key="0">OFF</switch-option>
                      </switch>
                  </span>
                  <a href="#" target="_blank" class="journal-tip"></a>
                </li>

                <li data-ng-show="settings.newsletter_privacy != 0">
                  <span class="module-create-title">Terms to Agree to <small>Select the information page with your terms or privacy policy.</small></span>
                  <span class="module-create-option extra-long">
                      <information-search model="settings.newsletter_privacy_information"></information-search>
                  </span>
                  <a href="#" target="_blank" class="journal-tip"></a>
                </li>


            </ul>
        </accordion-group>
        <accordion-group is-open="true">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Subscribers List<a href="javascript:;" class="accordion-remove slide-remove news-export" data-ng-click="exportCSV($event)"><b></b>Export CSV</a></div>
            </accordion-heading>
            <div class="news-table">
                <a href="<?php echo $export_csv; ?>" id="export-link" style="display: none">Export</a>
                <table ng-table="tableParams">
                    <tr data-ng-repeat="subscriber in $data">
                        <td data-title="'Email'">{{ subscriber.email }}</td>
                        <td data-title="'Customer'">{{ subscriber.status == 1 ? 'Yes':'No' }}</td>
                        <td data-title="'Store'">{{ subscriber.store }}</td>
                        <td data-title="'Action'"><a class="btn blue" data-ng-click="unsubscribe(subscriber.email)">Unsubscribe</a></td>
                    </tr>
                </table>
            </div>
        </accordion-group>
    </accordion>
</div>
