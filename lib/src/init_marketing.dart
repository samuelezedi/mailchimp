import 'package:flutter/material.dart';
import 'package:mailchimp/src/marketing/enums/delay.dart';
import 'package:mailchimp/src/transaction/core.dart';

import 'marketing/core.dart';
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

  Future<List<Map<String, dynamic>>> listAutomatedEmails(
      {@required String id}) async {
    return await _mailChimpMarketingCore.listAutomatedEmails(id: id);
  }

  Future<Map<String, dynamic>> getWorkflowEmailInfo(
      {@required String id, @required String emailId}) async {
    return await _mailChimpMarketingCore.getWorkflowEmailInfo(
        id: id, emailId: emailId);
  }

  Future<void> deleteWorkflowEmail(
      {@required String id, @required String emailId}) async {
    return await _mailChimpMarketingCore.deleteWorkflowEmail(
        id: id, emailId: emailId);
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
}
