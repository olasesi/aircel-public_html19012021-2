<div class="sticky">
<div class="module-header">
    <div class='module-name'>Settings<span>Import / Export</span></div>

    <div class="module-buttons">

    </div>
</div>
</div>
<div class="module-body">
    <div class="accordion-bar bar-level-0 bar-expand" >
    </div>
    <accordion close-others="false">
        <accordion-group is-open="true">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Export</div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Export for OpenCart</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.opencart_version">
                            <switch-option key="1">1.5.x</switch-option>
                            <switch-option key="2">2.x / 3.x</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Include Store Data<small>Categories, Products, Brands, Information Pages and Seo Keywords</small></span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.include_store_data">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Add Dummy Images</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.add_dummy_images">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Include Blog Data</span>
                    <span class="module-create-option">
                        <switch data-ng-model="settings.include_blog_data">
                            <switch-option key="1">ON</switch-option>
                            <switch-option key="0">OFF</switch-option>
                        </switch>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
                <li>
                    <span class="module-create-title">Action</span>
                    <span class="module-create-option">
                        <a class="btn blue" data-ng-click="confirmation($event)" href="<?php echo $export_href;?>">Export</a>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
            </ul>
        </accordion-group>
        <accordion-group is-open="true">
            <accordion-heading>
                <div class="accordion-bar bar-level-0">Import</div>
            </accordion-heading>
            <ul class="module-create-options">
                <!--<li>-->
                    <!--<span class="module-create-title">Choose File</span>-->
                    <!--<span class="module-create-option">-->
                        <!--<input type="file" />-->
                    <!--</span>-->
                    <!--<a href="#" target="_blank" class="journal-tip"></a>-->
                <!--</li>-->
                <li>
                    <span class="module-create-title">Action</span>
                    <span class="module-create-option">
                        <a class="btn blue" href="<?php echo $import_href; ?>">Import</a>
                    </span>
                    <a href="#" target="_blank" class="journal-tip"></a>
                </li>
            </ul>
        </accordion-group>
    </accordion>
</div>
