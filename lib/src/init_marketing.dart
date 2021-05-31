import 'package:flutter/material.dart';
import 'package:mailchimp/src/marketing/enums/delay.dart';
import 'package:mailchimp/src/marketing/models/automated_email.dart';
import 'package:mailchimp/src/marketing/models/batch_operation.dart';
import 'package:mailchimp/src/marketing/models/batch_webhook.dart';
import 'package:mailchimp/src/marketing/models/campaign_folder.dart';
import 'package:mailchimp/src/marketing/models/email_subscriber.dart';
import 'package:mailchimp/src/transaction/core.dart';

import 'marketing/core.dart';
import 'marketing/enums/api_request_enum.dart';
import 'marketing/enums/automation_status_enum.dart';
import 'marketing/models/authorized_app_model.dart';
import 'marketing/models/automation_model.dart';
import 'marketing/models/root_model.dart';

class MailChimpMarketing {
  String _apiKey;
  String _server;
  MailChimpMarketingCore _mailChimpMarketingCore;

  MailChimpMarketing({@required apiKey, @required server})
      : assert(apiKey != null),
        assert(server != null) {
    _apiKey = apiKey;
    _server = server;
    _mailChimpMarketingCore =
        MailChimpMarketingCore.setConfigs(apiKey: _apiKey, server: _server);
  }

  Future<Root> getRoot(
      {List<String> fields, List<String> excludeFields}) async {
    return await _mailChimpMarketingCore.getRoot(
        fields: fields, excludeFields: excludeFields);
  }

  Future<List<AuthorizedApp>> getAuthorizationApps(
      {List<String> fields,
      List<String> excludeFields,
      int count = 0,
      int offset = 0}) async {
    return await _mailChimpMarketingCore.getAuthorizedApps(
        fields: fields,
        excludeFields: excludeFields,
        count: count,
        offset: offset);
  }

  Future<AuthorizedApp> getAuthorizationApp(
      {List<String> fields, List<String> excludeFields, String appId}) async {
    return await _mailChimpMarketingCore.getAuthorizedApp(
        fields: fields, excludeFields: excludeFields, appId: appId);
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
    return await _mailChimpMarketingCore.getAutomations();
  }

  Future<Automation> addAutomation(
      {@required String listId,
      @required String storeId,
      String fromName,
      String replyTo}) async {
    return await _mailChimpMarketingCore.addAutomation(
        listId: listId, storeId: storeId, fromName: fromName, replyTo: replyTo);
  }

  Future<void> startAutomationEmails({@required String id}) async {
    return await _mailChimpMarketingCore.startAutomationEmails(id: id);
  }

  Future<void> pauseAutomationEmails({@required String id}) async {
    return await _mailChimpMarketingCore.pauseAutomationEmails(id: id);
  }

  Future<void> archiveAutomation({@required String id}) async {
    return await _mailChimpMarketingCore.archiveAutomation(id: id);
  }

  Future<List<AutomatedEmail>> listAutomatedEmails(
      {@required String id}) async {
    return await _mailChimpMarketingCore.listAutomatedEmails(id: id);
  }

  Future<AutomatedEmail> getWorkflowEmailInfo(
      {@required String id, @required String emailId}) async {
    return await _mailChimpMarketingCore.getWorkflowEmailInfo(
        id: id, emailId: emailId);
  }

  Future<void> deleteWorkflowEmail(
      {@required String id, @required String emailId}) async {
    return await _mailChimpMarketingCore.deleteWorkflowEmail(
        id: id, emailId: emailId);
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
    return await _mailChimpMarketingCore.updateWorkflowEmail(
        workflowId: workflowId,
        workflowEmailId: workflowEmailId,
        delayAmount: delayAmount,
        delayType: delayType,
        delayDirection: delayDirection,
        delayAction: delayAction,
        subjectLine: subjectLine,
        previewText: previewText,
        title: title,
        fromName: fromName,
        replyTo: replyTo);
  }

  Future<void> pauseAutomatedEmail(
      {@required String id, @required String emailId}) async {
    return await _mailChimpMarketingCore.pauseAutomatedEmail(
        id: id, emailId: emailId);
  }

  Future<void> startAutomatedEmail(
      {@required String id, @required String emailId}) async {
    return await _mailChimpMarketingCore.startAutomatedEmail(
        id: id, emailId: emailId);
  }

  Future<List<EmailSubscriber>> getAutomatedEmailSubscribers(
      {@required String id, @required String emailId}) async {
    return await _mailChimpMarketingCore.getAutomatedEmailSubscribers(
        id: id, emailId: emailId);
  }

  Future<EmailSubscriber> addEmailSubscriber(
      {@required String id,
      @required String emailId,
      @required emailAddress}) async {
    return await _mailChimpMarketingCore.addEmailSubscriber(
        id: id, emailId: emailId, emailAddress: emailAddress);
  }

  Future<EmailSubscriber> getEmailSubscriber(
      {@required String id,
      @required String emailId,
      @required subscriberHash}) async {
    return await _mailChimpMarketingCore.getEmailSubscriber(
        id: id, emailId: emailId, subscriberHash: subscriberHash);
  }

  Future<List<EmailSubscriber>> getRemovedSubscribers(
      {@required String id}) async {
    return await _mailChimpMarketingCore.getRemovedSubscribers(id: id);
  }

  Future<EmailSubscriber> removeSubscriber(
      {@required String id, @required emailAddress}) async {
    return await _mailChimpMarketingCore.removeSubscriber(
        id: id, emailAddress: emailAddress);
  }

  Future<EmailSubscriber> getRemovedSubscriber(
      {@required String id, @required subscriberHash}) async {
    return await _mailChimpMarketingCore.getRemovedSubscriber(
        id: id, subscriberHash: subscriberHash);
  }

  Future<List<BatchOperation>> getBatchRequests(
      {List<String> fields = const [],
      List<String> excludeFields = const [],
      int count = 10,
      int offset = 0}) async {
    return await _mailChimpMarketingCore.getBatchRequests(
        fields: fields,
        excludeFields: excludeFields,
        count: count,
        offset: offset);
  }

  Future<BatchOperation> startBatchOperations({
    @required RequestType requestMethod,
    @required String path,
    @required Map<String, dynamic> jsonBody,
    @required String operationId,
    int count = 10,
    int offset = 0,
  }) async {
    return await _mailChimpMarketingCore.startBatchOperations(
      requestMethod: requestMethod,
      path: path,
      jsonBody: jsonBody,
      operationId: operationId,
      count: count,
      offset: offset,
    );
  }

  Future<BatchOperation> getBatchOperationStatus({
    @required String batchId,
    List<String> fields = const [],
    List<String> excludeFields = const [],
  }) async {
    return await _mailChimpMarketingCore.getBatchOperationStatus(
        batchId: batchId, fields: fields, excludeFields: excludeFields);
  }

  Future<void> deleteBatchRequest(String batchId) async {
    return await _mailChimpMarketingCore.deleteBatchRequest(batchId);
  }

  Future<List<BatchWebhook>> getBatchWebhooks(
      {List<String> fields = const [],
      List<String> excludedFields = const [],
      int count = 10,
      int offset = 0}) async {
    return await _mailChimpMarketingCore.getBatchWebhooks(
        fields: fields,
        excludedFields: excludedFields,
        count: count,
        offset: offset);
  }

  Future<BatchWebhook> addBatchWebhook(String url) async {
    return await _mailChimpMarketingCore.addBatchWebhook(url);
  }

  Future<BatchWebhook> getBatchWebhookInfo(
      {@required String batchWebhookId,
      List<String> fields = const [],
      List<String> excludedFields = const []}) async {
    return await _mailChimpMarketingCore.getBatchWebhookInfo(
        batchWebhookId: batchWebhookId,
        fields: fields,
        excludedFields: excludedFields);
  }

  Future<BatchWebhook> updateBatchWebhook(
      {@required String batchWebhookId, @required String url}) async {
    return await _mailChimpMarketingCore.updateBatchWebhook(
        batchWebhookId: batchWebhookId, url: url);
  }

  Future<void> deleteBatchWebhook(String batchWebhookId) async {
    return await _mailChimpMarketingCore.deleteBatchWebhook(batchWebhookId);
  }

  Future<List<CampaignFolder>> getCampaignFolders(
      {List<String> fields = const [],
      List<String> excludedFields = const [],
      int count = 10,
      int offset = 0}) async {
    return await _mailChimpMarketingCore.getCampaignFolders(
        fields: fields,
        excludedFields: excludedFields,
        count: count,
        offset: offset);
  }

  Future<CampaignFolder> addCampaignFolder(String name) async {
    return await _mailChimpMarketingCore.addCampaignFolder(name);
  }

  Future<CampaignFolder> getCampaignFolderInfo(
      {@required String folderId,
      List<String> fields = const [],
      List<String> excludedFields = const []}) async {
    return await _mailChimpMarketingCore.getCampaignFolderInfo(
        folderId: folderId, fields: fields, excludedFields: excludedFields);
  }

  Future<CampaignFolder> updateCampaignFolder(
      {@required String folderId, @required String name}) async {
    return await _mailChimpMarketingCore.updateCampaignFolder(
        folderId: folderId, name: name);
  }

  Future<void> deleteCampaignFolder(String folderId) async {
    return await _mailChimpMarketingCore.deleteCampaignFolder(folderId);
  }
}
