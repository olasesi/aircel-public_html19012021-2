<div class="sticky">
    <div class="module-header">
        <div class='module-name'>Dashboard<span>Welcome</span></div>
        <div class="module-buttons">
            <a href="http://journal.digital-atelier.com" class="btn blue j-demos" target="_blank" data-ng-click="save($event)">Demos</a>
            <a href="http://docs.digital-atelier.com/opencart/journal" class="btn blue j-docs" target="_blank" data-ng-click="save($event)">Documentation</a>
            <a href="http://support.digital-atelier.com/" target="_blank" class="btn blue j-sup" data-ng-click="save($event)">Support</a>
        </div>
    </div>
</div>
<div class="module-body admin-home">
    <div class="divider bar-expand" >
        <div data-ng-show="upgrade" style="padding-left: 12px;"><span style="color:#27ae60">Update Available ({{new_version}})</span> &nbsp;|&nbsp;
            <a href="http://themeforest.net/downloads" target="_blank">Download</a> &nbsp;|&nbsp; <a href="http://docs.digital-atelier.com/opencart/journal/#/settings/update" target="_blank">Update Instructions</a></div>
    </div>
<accordion close-others="false">
    <accordion-group is-open="true">
        <accordion-heading>
            <div class="accordion-bar bar-level-0">Recently Accessed Pages</div>
        </accordion-heading>
        <ul>
            <li data-ng-repeat="link in history track by $index"><a href="<?php echo $base_href;?>#{{link}}">{{link|linkName}}</a></li>
        </ul>
    </accordion-group>
</accordion>
</div>