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

  static String workflowEmail(String workflow_id,String workflow_email_id) =>
      "/automations/$workflow_id/emails/$workflow_email_id";


  static String pauseAutomatedEmail(String workflow_id,String workflow_email_id) =>
      "/automations/$workflow_id/emails/$workflow_email_id/actions/pause";

  static String startAutomatedEmail(String workflow_id,String workflow_email_id) =>
      "/automations/$workflow_id/emails/$workflow_email_id/actions/start";

  static String emailSubscribers(String workflow_id,String workflow_email_id) =>
      "/automations/$workflow_id/emails/$workflow_email_id/queue";

  static String getEmailSubscriber(String workflow_id,String workflow_email_id,String subscriber_hash) =>
      "/automations/$workflow_id/emails/$workflow_email_id/queue/$subscriber_hash";

  static String removedSubscribers(String workflow_id) =>
      "/automations/$workflow_id/removed-subscribers";

  static String getRemovedSubscriber(String workflow_id,String subscriber_hash) =>
      "/automations/$workflow_id/removed-subscribers/$subscriber_hash";
}
