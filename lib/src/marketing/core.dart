import 'package:flutter/material.dart';
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
        await repositories.getRoot(getFields, getExcludedFields);
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
        getFields, getExcludedFields, count, offset);
    return data.map((value) => AuthorizedApp.fromJson(value)).toList();
  }

  Future<AuthorizedApp> getAuthorizedApp(
      {List<String> fields, List<String> excludeFields, int appId}) async {
    String getFields = convertListToString(fields);
    String getExcludedFields = convertListToString(excludeFields);
    Map<String, dynamic> data = await repositories.getAuthorizedApp(
        getFields, getExcludedFields, appId);
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
        getFields,
        getExcludedFields,
        beforeCreateTime,
        sinceCreateTime,
        beforeStartTime,
        sinceStartTime,
        automationStatus);
    return data.map((value) => Automation.fromJson(value)).toList();
  }

  Future<Automation> postAutomations(
      {@required Map<String, dynamic> recipients,
      @required Map<String, dynamic> triggerSettings,
      Map<String, dynamic> settings}) async {
    return Automation.fromJson(await repositories.postAutomations(
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
        await repositories.getAutomationInfo(id, getFields, getExcludedFields));
  }

  Future<void> startAutomationEmails({@required String id}) async {
    await repositories.startAutomationEmails(id);
    return;
  }

  Future<void> pauseAutomationEmails({@required String id}) async {
    await repositories.pauseAutomationEmails(id);
    return;
  }

  Future<void> archiveAutomation({@required String id}) async {
    await repositories.archiveAutomation(id);
    return;
  }

  Future<List<Map<String,dynamic>>> listAutomatedEmails({@required String id}) async {
    return await repositories.listAutomatedEmails(id);
  }

  Future<Map<String, dynamic>> getWorkflowEmailInfo({@required String id, @required String emailId}) async {
    return await repositories.getWorkflowEmailInfo(id, emailId);
  }

  Future<void> deleteWorkflowEmail({@required String id, @required String emailId}) async {
    return await repositories.deleteWorkflowEmail(id, emailId);
  }
}
