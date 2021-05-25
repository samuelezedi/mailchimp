const String baseUrl = "<dc>.api.mailchimp.com";

class Endpoint {

  static const String get_root = "/";

  static const String authorizedApps = "/authorized-apps";

  static String getAuthorizedAppInfo(String app_id) => "/authorized-apps/$app_id";

  static const String automations = "/automations";

  static const String postAutomations = "/automations";

  static String getAutomationInfo(String workflow_id) => "/automations/$workflow_id";

  static String startAutomationEmails(String workflow_id) =>
      "/automations/$workflow_id/actions/start-all-emails";

  static String pauseAutomationEmails(String workflow_id) =>
      "/automations/$workflow_id/actions/pause-all-emails";

  static String archiveAutomation(String workflow_id) =>
      "/automations/$workflow_id/actions/archive";

  static String listAutomationEmails(String workflow_id) =>
      "/automations/$workflow_id/emails";

  static String workflowEmailInfo(String workflow_id,String workflow_email_id) =>
      "/automations/$workflow_id/emails/$workflow_email_id";


  static const String updateWorkflowEmail =
      "/automations/{workflow_id}/emails/{workflow_email_id}";

  static const String pauseAutomatedEmail =
      "/automations/{workflow_id}/emails/{workflow_email_id}/actions/pause";
}
