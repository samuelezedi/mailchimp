import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mailchimp/src/marketing/enums/api_request_enum.dart';
import 'package:mailchimp/src/marketing/enums/delay.dart';
import 'package:mailchimp/src/marketing/models/automated_email.dart';
import 'package:mailchimp/src/marketing/models/batch_operation.dart';
import 'package:mailchimp/src/marketing/models/batch_webhook.dart';
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
    String automationStatus = fetchAutomationStatus(status);
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
    String delayTypeText = fetchdelayType(delayType);
    String delayDirectionText = fetchdelayDirection(delayDirection);
    String delayActionText = fetchdelayAction(delayAction);
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
    return (res['queue'] as List).map((e)=>EmailSubscriber.fromMap(e)).toList();
  }

  Future<EmailSubscriber> addEmailSubscriber(
      {@required String id,
      @required String emailId,
      @required emailAddress}) async {
    return EmailSubscriber.fromMap(await repositories.addEmailSubscriber(id, emailId, emailAddress));
  }

  Future<EmailSubscriber> getEmailSubscriber(
      {@required String id,
      @required String emailId,
      @required subscriberHash}) async {
    return EmailSubscriber.fromMap(await repositories.getEmailSubscriber(id, emailId, subscriberHash));
  }

  Future<List<EmailSubscriber>> getRemovedSubscribers(
      {@required String id}) async {
    var res = await repositories.getRemovedSubscribers(id);
    return (res['subscribers'] as List).map((e) => EmailSubscriber.fromMap(e)).toList();
  }

  Future<EmailSubscriber> removeSubscriber(
      {@required String id, @required String emailAddress}) async {
    return EmailSubscriber.fromMap(await repositories.removeSubscriber(id, emailAddress));
  }

  Future<EmailSubscriber> getRemovedSubscriber(
      {@required String id, @required String subscriberHash}) async {
    return EmailSubscriber.fromMap(await repositories.getRemovedSubscriber(id, subscriberHash));
  }

  Future<List<BatchOperation>> getBatchRequests(
      {List<String> fields,
      List<String> excludeFields,
      int count,
      int offset}) async {
    var res = await repositories.getBatchRequests(
        fields, excludeFields, count, offset);
    return (res['batches'] as List).map((e) => BatchOperation.fromMap(e)).toList();
  }

  Future<BatchOperation> startBatchOperations({
    @required RequestType requestMethod,
    @required String path,
    @required Map<String, dynamic> jsonBody,
    @required String operationId,
    int count,
    int offset,
  }) async {
    String requestMethodString = fetchRequestMethod(requestMethod);
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
    var res= await repositories.getBatchWebhooks(
        fields, excludedFields, count, offset);
    return (res['webhooks'] as List).map((e)=>BatchWebhook.fromMap(e)).toList();
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
    return BatchWebhook.fromMap(await repositories.updateBatchWebhook(batchWebhookId, url));
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
    return (res['folders'] as List).map((e)=>CampaignFolder.fromMap(e)).toList();
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
    return CampaignFolder.fromMap(await repositories.updateCampaignFolder(folderId, name));
  }

  Future<void> deleteCampaignFolder(String folderId) async {
    return await repositories.deleteCampaignFolder(folderId);
  }
}
