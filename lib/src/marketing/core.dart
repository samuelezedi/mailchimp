import 'package:flutter/material.dart';
import 'package:mailchimp/src/marketing/enums/delay.dart';
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

  Future<List<Map<String, dynamic>>> listAutomatedEmails(
      {@required String id}) async {
    return await repositories.listAutomatedEmails(id);
  }

  Future<Map<String, dynamic>> getWorkflowEmailInfo(
      {@required String id, @required String emailId}) async {
    return await repositories.getWorkflowEmailInfo(id, emailId);
  }

  Future<void> deleteWorkflowEmail(
      {@required String id, @required String emailId}) async {
    return await repositories.deleteWorkflowEmail(id, emailId);
  }

  Future<Map<String, dynamic>> updateWorkflowEmail(
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
    return await repositories.updateWorkflowEmail(
        workflowId, workflowEmailId, delay, settings);
  }

  Future<void> pauseAutomatedEmail(
      {@required String id, @required String emailId}) async {
    return await repositories.pauseAutomatedEmail(id, emailId);
  }

  Future<void> startAutomatedEmail(
      {@required String id, @required String emailId}) async {
    return await repositories.startAutomatedEmail(id, emailId);
  }

  Future<Map<String, dynamic>> getAutomatedEmailSubscribers(
      {@required String id, @required String emailId}) async {
    return await repositories.getAutomatedEmailSubscribers(id, emailId);
  }

  Future<Map<String, dynamic>> addEmailSubscriber(
      {@required String id,
      @required String emailId,
      @required emailAddress}) async {
    return await repositories.addEmailSubscriber(id, emailId, emailAddress);
  }

  Future<Map<String, dynamic>> getEmailSubscriber(
      {@required String id,
      @required String emailId,
      @required subscriberHash}) async {
    return await repositories.getEmailSubscriber(id, emailId, subscriberHash);
  }

  Future<Map<String, dynamic>> getRemovedSubscribers(
      {@required String id}) async {
    return await repositories.getRemovedSubscribers(id);
  }

  Future<Map<String, dynamic>> removeSubscriber(
      {@required String id, @required String emailAddress}) async {
    return await repositories.removeSubscriber(id, emailAddress);
  }

  Future<Map<String, dynamic>> getRemovedSubscriber(
      {@required String id, @required String subscriberHash}) async {
    return await repositories.getRemovedSubscriber(id, subscriberHash);
  }
}
