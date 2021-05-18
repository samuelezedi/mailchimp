
const String baseUrl = "<dc>.api.mailchimp.com";

const String get_root = "/";

const String authorizedApps = "/authorized-apps";

const String getAuthorizedApp = "/authorized-apps/{app_id}";

const String automations = "/automations";

const String postAutomations = "/automations";

const String getAutomationInfo = "/automations/{workflow_id}";

const String startAutomationEmails = "/automations/{workflow_id}/actions/start-all-emails";

const String pauseAutomationEmails = "/automations/{workflow_id}/actions/pause-all-emails";

const String archiveAutomation = "/automations/{workflow_id}/actions/pause-all-emails";

const String listAutomationEmails = "/automations/{workflow_id}/emails";

const String getWorkflowEmailInfo = "/automations/{workflow_id}/emails/{workflow_email_id}";

const String deleteWorkflowEmail = "/automations/{workflow_id}/emails/{workflow_email_id}";

const String updateWorkflowEmail = "/automations/{workflow_id}/emails/{workflow_email_id}";

const String pauseAutomatedEmail = "/automations/{workflow_id}/emails/{workflow_email_id}/actions/pause";

