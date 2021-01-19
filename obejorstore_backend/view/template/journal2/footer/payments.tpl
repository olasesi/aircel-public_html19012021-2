<div class="sticky">

<div class="module-header">
    <div class='module-name'>Footer <span>Payments</span></div>

    <store-picker data-url="footer/payments"></store-picker>

    <div class="module-buttons">
        <a class="btn green" data-ng-click="save($event)">Save</a>
    </div>
</div>
</div>
<div class="module-body footer-payments">
    <div class="accordion-bar bar-level-0 bar-expand" >
        <a data-ng-click="toggleAccordion(payments, true)" class="hint--top" data-hint="Expand All"><i class="expand-icon"></i></a>  <a data-ng-click="toggleAccordion(payments, false)" class="hint--top" data-hint="Collapse All"><i class="collapse-icon"></i></a>
        <label class="close-others hint--top" data-hint="Close Others"><input type="checkbox" data-ng-model="close_others" /></label>
    </div>
    <accordion close-others="close_others">
        <accordion-group data-ng-repeat="payment in payments" is-open="payment.is_open">
            <accordion-heading>
                <div class="accordion-bar bar-level-1">{{ payment.name.value[default_language] || ('Payment ' + ($index + 1)) }} <a href="javascript:;" class="accordion-remove slide-remove" data-ng-click="removeItem($index)"><b></b>Remove</a></div>
            </accordion-heading>
            <ul class="module-create-options">
                <li>
                    <span class="module-create-title">Icon</span>
                    <span class="module-create-option">
                        <image-select image="payment.image"></image-select>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Name</span>
                    <span class="module-create-option">
                        <j-opt-text-lang data-ng-model="payment.name"></j-opt-text-lang>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Link</span>
                    <span class="module-create-option">
                        <j-opt-text data-ng-model="payment.link"></j-opt-text>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">New window</span>
                    <span class="module-create-option">
                        <switch data-ng-model="payment.new_window">
                            <switch-option key="1">On</switch-option>
                            <switch-option key="0">Off</switch-option>
                        </switch>
                    </span>
                </li>
                <li>
                    <span class="module-create-title">Sort order</span>
                    <span class="module-create-option">
                        <input class="journal-input journal-sort" type="text" data-ng-model="payment.sort_order" />
                    </span>
                </li>
            </ul>
        </accordion-group>
    </accordion>
    <div class="add-level add-level-1" data-ng-click="addItem()">Add Payment +</div>
</div>
