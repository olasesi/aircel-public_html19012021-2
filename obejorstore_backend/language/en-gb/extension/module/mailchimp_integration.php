<?php
//==============================================================================
// MailChimp Integration v303.1
// 
// Author: Clear Thinking, LLC
// E-mail: johnathan@getclearthinking.com
// Website: http://www.getclearthinking.com
// 
// All code within this file is copyright Clear Thinking, LLC.
// You may not copy or reuse code within this file without written permission.
//==============================================================================

$version = 'v303.1';

//------------------------------------------------------------------------------
// Heading
//------------------------------------------------------------------------------
$_['heading_title']						= 'MailChimp Integration';

//------------------------------------------------------------------------------
// Extension Settings
//------------------------------------------------------------------------------
$_['tab_extension_settings']			= 'Extension Settings';
$_['help_extension_settings']			= 'When enabled, MailChimp Integration will automatically sync customers between OpenCart and MailChimp when customers create or edit their account in the front-end, and administrators create, edit, or delete customers in the back-end.';
$_['heading_extension_settings']		= 'Extension Settings';

$_['entry_status']						= 'MailChimp Integration Status: <div class="help-text">Set the status for the extension as a whole.</div>';
$_['entry_apikey']						= 'API Key: <div class="help-text">You can find your API Key in MailChimp under:<br>(Your Account Name) > Account Settings > Extras > API Keys</div>';
$_['entry_double_optin']				= 'Double Opt-In Confirmation E-mails: <div class="help-text">Choose whether to send a confirmation e-mail to the customer before they are fully subscribed to your list. Note: if enabled, confirmation e-mails will be sent for customer-initiated changes, but will NEVER be sent for administrator-initiated changes.</div>';

$_['entry_webhooks']					= 'Webhooks: <div class="help-text">Select the type of actions that cause MailChimp to send information back to OpenCart. Note that Profile Updates can change the customer\'s log-in e-mail address, name, phone number, and default address, so use with caution.</div>';
$_['text_subscribes']					= 'Subscribes';
$_['text_unsubscribes']					= 'Unsubscribes';
$_['text_profile_updates']				= 'Profile/Email Updates';
$_['text_cleaned_addresses']			= 'Cleaned Addresses';

$_['entry_subscribed_group']			= '"Subscribed" Customer Group: <div class="help-text">If desired, select a customer group to which the customer is changed when subscribing to your OpenCart newsletter. This customer group change will occur BEFORE subscribing them to the appropriate List.</div>';
$_['entry_unsubscribed_group']			= '"Unsubscribed" Customer Group: <div class="help-text">If desired, select a customer group to which the customer is changed when unsubscribing from your OpenCart newsletter.</div>';
$_['text_no_change']					= '--- No Change ---';

$_['entry_manual_sync']					= 'Manually Sync Subscribers: <div class="help-text">You should only need to manually sync subscribers once, when you first install this extension. After that, all syncing should happen automatically in the background.<br><br>If an e-mail exists in both OpenCart and MailChimp, the information associated with it in OpenCart will be used for the sync. Confirmation e-mails are NOT sent when manually syncing, so be sure to have approval from your customers to add them to your mailing list.<br><br>Fill in the "Starting Customer ID" and "Ending Customer ID" fields to sync a partial list of your customers. The starting and ending ids are inclusive. Leave blank to sync all customers.</div>';
$_['text_starting_customer_id']			= 'Starting Customer ID:';
$_['text_ending_customer_id']			= 'Ending Customer ID:';
$_['button_sync_subscribers']			= 'Sync Subscribers';

$_['text_sync_error']					= 'Sync Error: The API Key and List ID fields must be filled in before syncing!';
$_['text_sync_note']					= 'Note: If you have a large database, this may take some time. Continue?';
$_['text_syncing']						= 'Syncing...';

//------------------------------------------------------------------------------
// Customer Creation Settings
//------------------------------------------------------------------------------
$_['heading_customer_creation_settings']= 'Customer Creation Settings';

$_['entry_autocreate']					= 'Auto-Create Customers: <div class="help-text">If set to "Yes" and an e-mail exists in MailChimp but not OpenCart, a new customer will be created for that e-mail, with a randomly generated password. Only customers associated with the list chosen in List Settings will be auto-created.</div>';
$_['text_yes_disabled']					= 'Yes, disabled by default';
$_['text_yes_enabled']					= 'Yes, enabled by default';

$_['entry_email_password']				= 'E-mail Customers Their Password: <div class="help-text">If "Auto-Create Customers" is enabled, choose whether to e-mail new customers their randomly generated password.</div>';

$_['entry_emailtext_subject']			= 'E-mail Subject: <div class="help-text">Set the subject of the e-mail sent to customers. Use [store] in place of the store name.</div>';
$_['entry_emailtext_body']				= 'E-mail Body: <div class="help-text">Set the body of the e-mail sent to customers. Use [store] in place of the store name, [email] in place of the customer\'s e-mail address, and [password] in place of the customer\'s new password. HTML is supported.</div>';

//------------------------------------------------------------------------------
// List Settings
//------------------------------------------------------------------------------
$_['tab_list_settings']					= 'List Settings';
$_['heading_list_settings']				= 'List Settings';

$_['entry_listid']						= 'MailChimp List: <div class="help-text">Select the MailChimp list used to sync with.</div>';
$_['text_enter_an_api_key']				= 'Enter an API Key and reload the page';

//------------------------------------------------------------------------------
// List Mapping
//------------------------------------------------------------------------------
$_['heading_list_mapping']				= 'List Mapping';
$_['help_list_mapping']					= 'For more advanced functionality in subscribing customers to lists based on address, currency, customer group, language, and/or store, upgrade to <a target="_blank" href="http://www.opencartx.com/mailchimp-integration-pro">MailChimp Integration Pro</a>.<br><br>The Pro version also includes the ability to choose which customer fields are mapped to which Merge Tags, allows customers to choose and edit Interest Groups, gives you the ability to send cart and order data to MailChimp, and gives the option to display address fields in the module box.';

$_['text_guests']						= 'Guests';

//------------------------------------------------------------------------------
// Merge Tags
//------------------------------------------------------------------------------
$_['tab_merge_tags']					= 'Merge Tags';
$_['heading_merge_tags']				= 'Merge Tags';

$_['help_merge_tags']					= 'You can find your MailChimp list\'s merge tags under Lists > Settings > List Fields and MERGE Tags. Your merge tags need to be set in MailChimp to the following values:
<ul style="margin: 10px 0">
	<li>"First Name" Merge Tag: <b>FNAME</b></li>
	<li>"Last Name" Merge Tag: <b>LNAME</b></li>
	<li>"Address" Merge Tag: <b>ADDRESS</b></li>
	<li>"Phone Number" Merge Tag: <b>PHONE</b></li>
</ul>
The customer\'s MailChimp language (the <b>MC_LANGUAGE</b> merge tag value) will be set using the customer\'s language selection in OpenCart. If this fails, it will attempt to use their browser language, and if that fails, it will use the store\'s default language.';

//------------------------------------------------------------------------------
// Module Settings
//------------------------------------------------------------------------------
$_['tab_module_settings']				= 'Module Settings';
$_['help_module_settings']				= 'Select whether each field below is displayed in the module, and whether it is optional or required. If the customer is logged in, only the E-mail Address field will be shown. Other information will be pulled from their OpenCart account.';
$_['heading_module_settings']			= 'Module Settings';

$_['entry_modules_firstname']			= 'First Name Field:';
$_['entry_modules_lastname']			= 'Last Name Field:';

$_['text_hide']							= 'Hide';
$_['text_optional']						= 'Optional';
$_['text_required']						= 'Required';
$_['text_show']							= 'Show';

$_['entry_modules_redirect']			= 'Redirect URL: <div class="help-text">Optionally enter a URL to redirect the customer to after they are successfully subscribed. Leave blank to have them stay on the same page.</div>';
$_['entry_modules_popup']				= 'Display as Pop-up: <div class="help-text">If set to "Yes", you can paste a link somewhere in this format to trigger the pop-up:<br><br><code>&lt;a href="javascript:showMailchimpPopup()"&gt;LINK TEXT&lt;/a&gt;</code>' . (version_compare(VERSION, '2.0', '<') ? '<br><br>Note: for OpenCart 1.5.x installations, the pop-up will not trigger if there is already a module instance on the page, due to limitations in 1.5.x versions.' : '') . '</div>';

$_['text_yes_trigger_manually']			= 'Yes, trigger manually only';
$_['text_yes_trigger_automatically']	= 'Yes, trigger manually + automatically on first visit';

// Module Text
$_['heading_module_text']				= 'Module Text';

$_['entry_moduletext_heading']			= 'Module Heading: <div class="help-text">HTML is supported.</div>';
$_['entry_moduletext_top']				= 'Top Text: <div class="help-text">Optionally enter text to go at the top of the module. HTML is supported.</div>';
$_['entry_moduletext_button']			= 'Subscribe Button:';
$_['entry_moduletext_emptyfield']		= 'Empty Field Error:';
$_['entry_moduletext_invalidemail']		= 'Invalid E-mail Error:';
$_['entry_moduletext_success']			= 'Success Text:';
$_['entry_moduletext_error']			= 'General Error Text: <div class="help-text">Leave this field blank to display the error message passed back from MailChimp.</div>';
$_['entry_moduletext_subscribed']		= 'Already Subscribed Text: <div class="help-text">Enter the message displayed in the module when the customer is already subscribed. Use [email] in place of the customer\'s e-mail address. HTML is supported.</div>';

// Module Locations
$_['heading_module_locations']			= 'Module Locations';
$_['entry_module_locations']			= 'Module Locations:';
$_['help_module_locations']				= 'You can set your module locations in';
$_['help_assigned_layouts']				= 'This module is currently assigned to these layout(s):';

//------------------------------------------------------------------------------
// Testing Mode
//------------------------------------------------------------------------------
$_['tab_testing_mode']					= 'Testing Mode';
$_['testing_mode_help']					= 'Enable testing mode if things are not working as expected on the front end. Messages logged during testing can be viewed below.';
$_['heading_testing_mode']				= 'Testing Mode';

$_['entry_testing_mode']				= 'Testing Mode: <div class="help-text">Enabling this will record errors and webhook calls to this log. If you choose "Enabled with full logging" then all API requests and responses will also be recorded.</div>';
$_['text_enabled_with_full_logging']	= 'Enabled with full logging';
$_['entry_testing_messages']			= 'Messages:';
$_['button_refresh_log']				= 'Refresh Log';
$_['button_download_log']				= 'Download Log';
$_['button_clear_log']					= 'Clear Log';

//------------------------------------------------------------------------------
// Standard Text
//------------------------------------------------------------------------------
$_['copyright']							= '<hr /><div class="text-center" style="margin: 15px">' . $_['heading_title'] . ' (' . $version . ') &copy; <a target="_blank" href="http://www.getclearthinking.com/contact">Clear Thinking, LLC</a></div>';

$_['standard_autosaving_enabled']		= 'Auto-Saving Enabled';
$_['standard_confirm']					= 'This operation cannot be undone. Continue?';
$_['standard_error']					= '<strong>Error:</strong> You do not have permission to modify ' . $_['heading_title'] . '!';
$_['standard_max_input_vars']			= '<strong>Warning:</strong> The number of settings is close to your <code>max_input_vars</code> server value. You should enable auto-saving to avoid losing any data.';
$_['standard_please_wait']				= 'Please wait...';
$_['standard_saved']					= 'Saved!';
$_['standard_saving']					= 'Saving...';
$_['standard_select']					= '--- Select ---';
$_['standard_success']					= 'Success!';
$_['standard_testing_mode']				= "Your log is too large to open! If you need to archive it, you can download it using the button above.\n\nTo start a new log, (1) click the Clear Log button, (2) reload the admin panel page, then (3) run your test again.";

$_['standard_module']					= 'Modules';
$_['standard_shipping']					= 'Shipping';
$_['standard_payment']					= 'Payments';
$_['standard_total']					= 'Order Totals';
$_['standard_feed']						= 'Feeds';
?>