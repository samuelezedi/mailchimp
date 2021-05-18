import 'package:flutter/material.dart';
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

  MailChimpMarketing({@required apiKey, @required server}) : assert(apiKey!=null), assert(server!=null){
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
      {List<String> fields, List<String> excludeFields, int appId}) async {
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
}
