import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mailchimp/src/marketing/enums/api_request_enum.dart';
import 'package:mailchimp/src/marketing/enums/campaign_enum.dart';
import 'package:mailchimp/src/marketing/enums/delay.dart';
import 'package:mailchimp/src/marketing/models/automated_email.dart';
import 'package:mailchimp/src/marketing/models/batch_operation.dart';
import 'package:mailchimp/src/marketing/models/batch_webhook.dart';
import 'package:mailchimp/src/marketing/models/campaign.dart';
import 'package:mailchimp/src/marketing/models/campaign_folder.dart';
import 'package:mailchimp/src/marketing/models/email_subscriber.dart';
import 'package:mailchimp/src/marketing/repository.dart';

import '../functions.dart';
import 'enums/automation_status_enum.dart';
import 'models/authorized_app_model.dart';
import 'models/automation_model.dart';
import 'models/root_model.dart';

class MailChimpMarketingCore {
  MarketingRepositories repositories;

  MailChimpMarketingCore.setConfigs({apiKey, server}) {
    repositories = MarketingRepositories(apiKey, server);
  }

  Future<Root> getRoot(
      {List<String> fields, List<String> excludeFields}) async {
    String getFields = convertListToString(fields);
    String getExcludedFields = convertListToString(excludeFields);
    Map<String, dynamic> data =
        await repositories.getRoot(fields, excludeFields);
    return Root.fromJson(data);
  }

  Future<List<AuthorizedApp>> getAuthorizedApps(
      {List<String> fields,
      List<String> excludeFields,
      int count,
      int offset}) async {
    String getFields = convertListToString(fields);
    String getExcludedFields = convertListToString(excludeFields);
    List<Map<String, dynamic>> data = await repositories.getAuthorizedApps(
        fields, excludeFields, count, offset);
    return data.map((value) => AuthorizedApp.fromJson(value)).toList();
  }

  Future<AuthorizedApp> getAuthorizedApp(
      {List<String> fields, List<String> excludeFields, String appId}) async {
    String getFields = convertListToString(fields);
    String getExcludedFields = convertListToString(excludeFields);
    Map<String, dynamic> data =
        await repositories.getAuthorizedAppInfo(fields, excludeFields, appId);
    return AuthorizedApp.fromJson(data);
  }

  Future<List<Automation>> getAutomations(
      {int count,
      int offset,
      List<String> fields,
      List<String> excludeFields,
      String beforeCreateTime,
      String sinceCreateTime,
      String beforeStartTime,
      String sinceStartTime,
      AutomationStatus status}) async {
    String getFields = convertListToString(fields);
    String getExcludedFields = convertListToString(excludeFields);
    String automationStatus = fetchStringOfEnum(status);
    List<Map<String, dynamic>> data = await repositories.getAutomations(
        count,
        offset,
        fields,
        excludeFields,
        beforeCreateTime,
        sinceCreateTime,
        beforeStartTime,
        sinceStartTime,
        automationStatus);
    return data.map((value) => Automation.fromJson(value)).toList();
  }

  Future<Automation> addAutomation(
      {@required String listId,
      @required String storeId,
      String fromName,
      String replyTo}) async {
    Map<String, String> recipients = {"list_id": listId, "store_id": storeId};
    Map<String, String> triggerSettings = {"workflow_type": "abandonedCart"};
    Map<String, String> settings = {
      "from_name": fromName ?? '',
      "reply_to": replyTo ?? ''
    };
    return Automation.fromJson(await repositories.addAutomation(
        recipients, triggerSettings, settings));
  }

  Future<Automation> getAutomationInfo({
    @required id,
    List<String> fields,
    List<String> excludeFields,
  }) async {
    String getFields = convertListToString(fields);
    String getExcludedFields = convertListToString(excludeFields);
    return Automation.fromJson(
        await repositories.getAutomationInfo(id, fields, excludeFields));
  }

  Future<void> startAutomationEmails({@required String id}) async {
    return await repositories.startAutomationEmails(id);
  }

  Future<void> pauseAutomationEmails({@required String id}) async {
    return await repositories.pauseAutomationEmails(id);
  }

  Future<void> archiveAutomation({@required String id}) async {
    return await repositories.archiveAutomation(id);
  }

  Future<List<AutomatedEmail>> listAutomatedEmails(
      {@required String id}) async {
    var res = await repositories.listAutomatedEmails(id);
    return (res['emails'] as List)
        .map((e) => AutomatedEmail.fromMap(e))
        .toList();
  }

  Future<AutomatedEmail> getWorkflowEmailInfo(
      {@required String id, @required String emailId}) async {
    return AutomatedEmail.fromMap(
        await repositories.getWorkflowEmailInfo(id, emailId));
  }

  Future<void> deleteWorkflowEmail(
      {@required String id, @required String emailId}) async {
    return await repositories.deleteWorkflowEmail(id, emailId);
  }

  Future<AutomatedEmail> updateWorkflowEmail(
      {@required String workflowId,
      @required String workflowEmailId,
      int delayAmount,
      DelayType delayType,
      DelayDirection delayDirection,
      DelayAction delayAction,
      String subjectLine,
      String previewText,
      String title,
      String fromName,
      String replyTo}) async {
    String delayTypeText = fetchStringOfEnum(delayType);
    String delayDirectionText = fetchStringOfEnum(delayDirection);
    String delayActionText = fetchStringOfEnum(delayAction);
    Map<String, dynamic> delay = {
      "amount": delayAmount ?? 0,
      "type": delayTypeText,
      "direction": delayDirectionText,
      "action": delayActionText
    };
    Map<String, String> settings = {
      "subject_line": subjectLine ?? '',
      "preview_text": previewText ?? '',
      "title": title ?? '',
      "from_name": fromName ?? '',
      "reply_to": replyTo ?? ''
    };
    return AutomatedEmail.fromMap(await repositories.updateWorkflowEmail(
        workflowId, workflowEmailId, delay, settings));
  }

  Future<void> pauseAutomatedEmail(
      {@required String id, @required String emailId}) async {
    return await repositories.pauseAutomatedEmail(id, emailId);
  }

  Future<void> startAutomatedEmail(
      {@required String id, @required String emailId}) async {
    return await repositories.startAutomatedEmail(id, emailId);
  }

  Future<List<EmailSubscriber>> getAutomatedEmailSubscribers(
      {@required String id, @required String emailId}) async {
    var res = await repositories.getAutomatedEmailSubscribers(id, emailId);
    return (res['queue'] as List)
        .map((e) => EmailSubscriber.fromMap(e))
        .toList();
  }

  Future<EmailSubscriber> addEmailSubscriber(
      {@required String id,
      @required String emailId,
      @required emailAddress}) async {
    return EmailSubscriber.fromMap(
        await repositories.addEmailSubscriber(id, emailId, emailAddress));
  }

  Future<EmailSubscriber> getEmailSubscriber(
      {@required String id,
      @required String emailId,
      @required subscriberHash}) async {
    return EmailSubscriber.fromMap(
        await repositories.getEmailSubscriber(id, emailId, subscriberHash));
  }

  Future<List<EmailSubscriber>> getRemovedSubscribers(
      {@required String id}) async {
    var res = await repositories.getRemovedSubscribers(id);
    return (res['subscribers'] as List)
        .map((e) => EmailSubscriber.fromMap(e))
        .toList();
  }

  Future<EmailSubscriber> removeSubscriber(
      {@required String id, @required String emailAddress}) async {
    return EmailSubscriber.fromMap(
        await repositories.removeSubscriber(id, emailAddress));
  }

  Future<EmailSubscriber> getRemovedSubscriber(
      {@required String id, @required String subscriberHash}) async {
    return EmailSubscriber.fromMap(
        await repositories.getRemovedSubscriber(id, subscriberHash));
  }

  Future<List<BatchOperation>> getBatchRequests(
      {List<String> fields,
      List<String> excludeFields,
      int count,
      int offset}) async {
    var res = await repositories.getBatchRequests(
        fields, excludeFields, count, offset);
    return (res['batches'] as List)
        .map((e) => BatchOperation.fromMap(e))
        .toList();
  }

  Future<BatchOperation> startBatchOperations({
    @required RequestType requestMethod,
    @required String path,
    @required Map<String, dynamic> jsonBody,
    @required String operationId,
    int count,
    int offset,
  }) async {
    String requestMethodString = fetchStringOfEnum(requestMethod);
    String jsonBodyString = jsonEncode(jsonBody);
    return BatchOperation.fromMap(await repositories.startBatchOperations(
        requestMethodString, path, count, offset, jsonBodyString, operationId));
  }

  Future<BatchOperation> getBatchOperationStatus({
    @required String batchId,
    List<String> fields,
    List<String> excludeFields,
  }) async {
    return BatchOperation.fromMap(await repositories.getBatchOperationStatus(
        batchId, fields, excludeFields));
  }

  Future<void> deleteBatchRequest(String batchId) async {
    return await repositories.deleteBatchRequest(batchId);
  }

  Future<List<BatchWebhook>> getBatchWebhooks(
      {List<String> fields,
      List<String> excludedFields,
      int count,
      int offset}) async {
    var res = await repositories.getBatchWebhooks(
        fields, excludedFields, count, offset);
    return (res['webhooks'] as List)
        .map((e) => BatchWebhook.fromMap(e))
        .toList();
  }

  Future<BatchWebhook> addBatchWebhook(String url) async {
    return BatchWebhook.fromMap(await repositories.addBatchWebhook(url));
  }

  Future<BatchWebhook> getBatchWebhookInfo(
      {String batchWebhookId,
      List<String> fields,
      List<String> excludedFields}) async {
    return BatchWebhook.fromMap(await repositories.getBatchWebhookInfo(
        batchWebhookId, fields, excludedFields));
  }

  Future<BatchWebhook> updateBatchWebhook(
      {String batchWebhookId, String url}) async {
    return BatchWebhook.fromMap(
        await repositories.updateBatchWebhook(batchWebhookId, url));
  }

  Future<void> deleteBatchWebhook(String batchWebhookId) async {
    return await repositories.deleteBatchWebhook(batchWebhookId);
  }

  Future<List<CampaignFolder>> getCampaignFolders(
      {List<String> fields,
      List<String> excludedFields,
      int count,
      int offset}) async {
    var res = await repositories.getCampaignFolders(
        fields, excludedFields, count, offset);
    return (res['folders'] as List)
        .map((e) => CampaignFolder.fromMap(e))
        .toList();
  }

  Future<CampaignFolder> addCampaignFolder(String name) async {
    return CampaignFolder.fromMap(await repositories.addCampaignFolder(name));
  }

  Future<CampaignFolder> getCampaignFolderInfo(
      {String folderId,
      List<String> fields,
      List<String> excludedFields}) async {
    return CampaignFolder.fromMap(await repositories.getCampaignFolderInfo(
        folderId, fields, excludedFields));
  }

  Future<CampaignFolder> updateCampaignFolder(
      {String folderId, String name}) async {
    return CampaignFolder.fromMap(
        await repositories.updateCampaignFolder(folderId, name));
  }

  Future<void> deleteCampaignFolder(String folderId) async {
    return await repositories.deleteCampaignFolder(folderId);
  }

  Future<List<Campaign>> getCampaigns(
      List<String> fields,
      List<String> excludedFields,
      int count,
      int offset,
      CampaignType type,
      CampaignStatus status,
      String beforeSendTime,
      String sinceSendTime,
      String beforeCreateTime,
      String sinceCreateTime,
      String listId,
      String folderId,
      String memberId,
      CampaignSortField sortField,
      CampaignSortDir sortDir) async {
    var res = await repositories.getCampaigns(
        fields,
        excludedFields,
        count,
        offset,
        fetchStringOfEnum(type),
        fetchStringOfEnum(status),
        beforeSendTime,
        sinceSendTime,
        beforeCreateTime,
        sinceCreateTime,
        listId,
        folderId,
        memberId,
        fetchStringOfEnum(sortField),
        fetchStringOfEnum(sortDir));

    return (res['campaigns'] as List).map((e) => Campaign.fromMap(e)).toList();
  }

  Future<Campaign> addCampaign(
      CampaignType type,
      int hour,
      bool sunday,
      bool monday,
      bool tuesday,
      bool wednesday,
      bool thursday,
      bool friday,
      bool saturday,
      CampaignWeekDay weeklySendDay,
      int monthlySendDate,
      bool constrainRssImg,
      String feedUrl,
      CampaignFrequency frequency,
      int savedSegmentId,
      String prebuiltSegmentId,
      CampaignSegmentType match,
      List<dynamic> conditions,
      String listId,
      int waitTime,
      int testSize,
      List<String> subjectLines,
      List<String> sendTimes,
      List<String> fromNames,
      List<String> replyToAddresses,
      CampaignWinnerCriteria winnerCriteria,
      String subjectLine,
      String previewText,
      String title,
      String fromName,
      String replyTo,
      bool useConversation,
      String toName,
      String folderId,
      bool authenticate,
      bool autoFooter,
      bool inlineCss,
      bool autoTweet,
      List<String> autoFbPost,
      bool fbComments,
      int templateId,
      bool opens,
      bool htmlClicks,
      bool textClicks,
      bool ecomm360,
      String googleAnalytics,
      String clicktale,
      String imageUrl,
      String description,
      String socialCardTitle,
      CampaignContentType campaignContentType) async {
    Map<String, dynamic> socialCard = {
      "image_url": imageUrl,
      "description": description,
      "title": socialCardTitle
    };
    Map<String, dynamic> settings = {
      "subject_line": subjectLine,
      "preview_text": previewText,
      "title": title,
      "from_name": fromName,
      "reply_to": replyTo,
      "use_conversation": useConversation,
      "to_name": toName,
      "folder_id": folderId,
      "authenticate": authenticate,
      "auto_footer": autoFooter,
      "inline_css": inlineCss,
      "auto_tweet": autoTweet,
      "auto_fb_post": autoFbPost,
      "fb_comments": fbComments,
      "template_id": templateId,
    };
    Map<String, dynamic> tracking = {
      "opens": opens,
      "html_clicks": htmlClicks,
      "text_clicks": textClicks,
      "ecomm360": ecomm360,
      "google_analytics": googleAnalytics,
      "clicktale": clicktale,
    };
    Map<String, dynamic> variateSettings = {
      "winner_criteria": fetchStringOfEnum(winnerCriteria),
      "wait_time": waitTime,
      "test_size": testSize,
      "subject_lines": subjectLines,
      "send_times": sendTimes,
      "from_names": fromNames,
      "reply_to_addresses": replyToAddresses
    };
    Map<String, dynamic> rssOpts = {
      "feed_url": feedUrl,
      "frequency": fetchStringOfEnum(frequency),
      "schedule": {
        "hour": hour,
        "daily_send": {
          "sunday": sunday,
          "monday": monday,
          "tuesday": tuesday,
          "wednesday": wednesday,
          "thursday": thursday,
          "friday": friday,
          "saturday": saturday
        },
        "weekly_send_day": fetchStringOfEnum(weeklySendDay),
        "monthly_send_date": monthlySendDate
      },
      "constrain_rss_img": constrainRssImg
    };

    Map<String, dynamic> recipients = {
      "list_id": listId,
      "segment_opts": {
        "saved_segment_id": savedSegmentId,
        "prebuilt_segment_id": prebuiltSegmentId,
        "match": fetchStringOfEnum(match),
        "conditions": conditions
      }
    };
  return Campaign.fromMap(await repositories.addCampaign(fetchStringOfEnum(type), rssOpts, recipients, variateSettings, settings, tracking, socialCard, fetchStringOfEnum(campaignContentType)));
  }

  Future<Campaign> getCampaignInfo(
      String campaignId,
        List<String> fields,
        List<String> excludedFields) async {
    return Campaign.fromMap(await repositories.getCampaignInfo(
        campaignId, fields, excludedFields));
  }

  Future<Campaign> updateCampaign(
      String campaignId,
      int hour,
      bool sunday,
      bool monday,
      bool tuesday,
      bool wednesday,
      bool thursday,
      bool friday,
      bool saturday,
      CampaignWeekDay weeklySendDay,
      int monthlySendDate,
      bool constrainRssImg,
      String feedUrl,
      CampaignFrequency frequency,
      int savedSegmentId,
      String prebuiltSegmentId,
      CampaignSegmentType match,
      List<dynamic> conditions,
      String listId,
      int waitTime,
      int testSize,
      List<String> subjectLines,
      List<String> sendTimes,
      List<String> fromNames,
      List<String> replyToAddresses,
      CampaignWinnerCriteria winnerCriteria,
      String subjectLine,
      String previewText,
      String title,
      String fromName,
      String replyTo,
      bool useConversation,
      String toName,
      String folderId,
      bool authenticate,
      bool autoFooter,
      bool inlineCss,
      bool autoTweet,
      List<String> autoFbPost,
      bool fbComments,
      int templateId,
      bool opens,
      bool htmlClicks,
      bool textClicks,
      bool ecomm360,
      String googleAnalytics,
      String clicktale,
      String imageUrl,
      String description,
      String socialCardTitle) async {
    Map<String, dynamic> socialCard = {
      "image_url": imageUrl,
      "description": description,
      "title": socialCardTitle
    };
    Map<String, dynamic> settings = {
      "subject_line": subjectLine,
      "preview_text": previewText,
      "title": title,
      "from_name": fromName,
      "reply_to": replyTo,
      "use_conversation": useConversation,
      "to_name": toName,
      "folder_id": folderId,
      "authenticate": authenticate,
      "auto_footer": autoFooter,
      "inline_css": inlineCss,
      "auto_tweet": autoTweet,
      "auto_fb_post": autoFbPost,
      "fb_comments": fbComments,
      "template_id": templateId,
    };
    Map<String, dynamic> tracking = {
      "opens": opens,
      "html_clicks": htmlClicks,
      "text_clicks": textClicks,
      "ecomm360": ecomm360,
      "google_analytics": googleAnalytics,
      "clicktale": clicktale,
    };
    Map<String, dynamic> variateSettings = {
      "winner_criteria": fetchStringOfEnum(winnerCriteria),
      "wait_time": waitTime,
      "test_size": testSize,
      "subject_lines": subjectLines,
      "send_times": sendTimes,
      "from_names": fromNames,
      "reply_to_addresses": replyToAddresses
    };
    Map<String, dynamic> rssOpts = {
      "feed_url": feedUrl,
      "frequency": fetchStringOfEnum(frequency),
      "schedule": {
        "hour": hour,
        "daily_send": {
          "sunday": sunday,
          "monday": monday,
          "tuesday": tuesday,
          "wednesday": wednesday,
          "thursday": thursday,
          "friday": friday,
          "saturday": saturday
        },
        "weekly_send_day": fetchStringOfEnum(weeklySendDay),
        "monthly_send_date": monthlySendDate
      },
      "constrain_rss_img": constrainRssImg
    };

    Map<String, dynamic> recipients = {
      "list_id": listId,
      "segment_opts": {
        "saved_segment_id": savedSegmentId,
        "prebuilt_segment_id": prebuiltSegmentId,
        "match": fetchStringOfEnum(match),
        "conditions": conditions
      }
    };
    return Campaign.fromMap(await repositories.updateCampaign(campaignId, rssOpts, recipients, variateSettings, settings, tracking, socialCard));
  }

  Future<void> deleteCampaign(String campaignId) async {
    return await repositories.deleteCampaign(campaignId);
  }

  Future<void> cancelCampaign(String campaignId) async {
    return await repositories.cancelCampaign(campaignId);
  }

  Future<void> sendCampaign(String campaignId) async {
    return await repositories.sendCampaign(campaignId);
  }

  Future<void> scheduleCampaign(String campaignId, String scheduleTime,
      int batchDelay, int batchCount, bool timewarp) async {
    var batchDelivery = {"batch_delay":batchDelay,"batch_count":batchCount};
    return await repositories.scheduleCampaign(campaignId, scheduleTime, batchDelivery, timewarp);
  }

  Future<void> unscheduleCampaign(String campaignId) async {
    return await repositories.unscheduleCampaign(campaignId);
  }

  Future<void> pauseRssCampaign(String campaignId) async {
    return await repositories.pauseRssCampaign(campaignId);
  }

  Future<void> resumeRssCampaign(String campaignId) async {
    return await repositories.resumeRssCampaign(campaignId);
  }

  Future<Campaign> replicateCampaign(String campaignId) async {
    return Campaign.fromMap(await repositories.replicateCampaign(campaignId));
  }

  Future<void> sendTestEmail(String campaignId,List<String> testEmails, CampaignTestEmailSendType sendType) async {
    return await repositories.sendTestEmail(campaignId, testEmails, fetchStringOfEnum(sendType));
  }

  Future<Campaign> resendCampaign(String campaignId) async {
    return Campaign.fromMap(await repositories.resendCampaign(campaignId));
  }
}
