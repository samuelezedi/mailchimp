const String baseUrl = "<dc>.api.mailchimp.com";

class Endpoint {
  static const String get_root = "/";

  static const String authorizedApps = "/authorized-apps";

  static String getAuthorizedAppInfo(String app_id) =>
      "/authorized-apps/$app_id";

  static const String automations = "/automations";

  static const String postAutomations = "/automations";

  static String getAutomationInfo(String workflow_id) =>
      "/automations/$workflow_id";

  static String startAutomationEmails(String workflow_id) =>
      "/automations/$workflow_id/actions/start-all-emails";

  static String pauseAutomationEmails(String workflow_id) =>
      "/automations/$workflow_id/actions/pause-all-emails";

  static String archiveAutomation(String workflow_id) =>
      "/automations/$workflow_id/actions/archive";

  static String listAutomationEmails(String workflow_id) =>
      "/automations/$workflow_id/emails";

  static String workflowEmail(String workflow_id, String workflow_email_id) =>
      "/automations/$workflow_id/emails/$workflow_email_id";

  static String pauseAutomatedEmail(
          String workflow_id, String workflow_email_id) =>
      "/automations/$workflow_id/emails/$workflow_email_id/actions/pause";

  static String startAutomatedEmail(
          String workflow_id, String workflow_email_id) =>
      "/automations/$workflow_id/emails/$workflow_email_id/actions/start";

  static String emailSubscribers(
          String workflow_id, String workflow_email_id) =>
      "/automations/$workflow_id/emails/$workflow_email_id/queue";

  static String getEmailSubscriber(String workflow_id, String workflow_email_id,
          String subscriber_hash) =>
      "/automations/$workflow_id/emails/$workflow_email_id/queue/$subscriber_hash";

  static String removedSubscribers(String workflow_id) =>
      "/automations/$workflow_id/removed-subscribers";

  static String getRemovedSubscriber(
          String workflow_id, String subscriber_hash) =>
      "/automations/$workflow_id/removed-subscribers/$subscriber_hash";

  static const String batches = '/batches';

  static String batchOperation(String batchId) => '/batches/$batchId';

  static const String batchWebhooks = '/batch-webhooks';

  static String batchWebhookInfo(String batchWebhookId) => '/batch-webhooks/$batchWebhookId';

  static const String campaignFolders = '/campaign-folders';

  static String campaignFolderInfo(String folderId) => '/campaign-folders/$folderId';

  static const String campaigns = '/campaigns';

  static String campaignInfo(String campaignId) => '/campaigns/$campaignId';

  static String cancelCampaign(String campaignId) => '/campaigns/$campaignId/actions/cancel-send';
  static String sendCampaign(String campaignId) => '/campaigns/$campaignId/actions/send';
  static String scheduleCampaign(String campaignId) => '/campaigns/$campaignId/actions/schedule';
  static String unscheduleCampaign(String campaignId) => '/campaigns/$campaignId/actions/unschedule';
  static String paussRssCampaign(String campaignId) => '/campaigns/$campaignId/actions/pause';
  static String resumeRssCampaign(String campaignId) => '/campaigns/$campaignId/actions/resume';
  static String replicateCampaign(String campaignId) => '/campaigns/$campaignId/actions/replicate';
  static String sendTestCampaign(String campaignId) => '/campaigns/$campaignId/actions/test';
  static String resendCampaign(String campaignId) => '/campaigns/$campaignId/actions/create-resend';
}
