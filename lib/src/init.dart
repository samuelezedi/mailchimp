import 'package:flutter/material.dart';

import 'marketing/core.dart';
import 'marketing/models/authorized_app.dart';
import 'marketing/models/authorized_apps.dart';
import 'marketing/models/root.dart';


class MailChimp {
  String _apiKey;
  String _server;
  MailchimpMarketing _mailchimpMarketing;

  MailChimp.marketing({@required apiKey, @required server}) {
    _apiKey = apiKey;
    _server = server;
    _mailchimpMarketing =
        MailchimpMarketing.setConfigs(apiKey: _apiKey, server: _server);
  }

  Future<Root> getRoot(
      {List<String> fields, List<String> excludeFields}) async {
    return await _mailchimpMarketing.getRoot(
        fields: fields, excludeFields: excludeFields);
  }

  Future<AuthorizedApps> getAuthorizationApps(
      {List<String> fields,
      List<String> excludeFields,
      int count = 0,
      int offset = 0}) async {
    return await _mailchimpMarketing.getAuthorizedApps(
        fields: fields,
        excludeFields: excludeFields,
        count: count,
        offset: offset);
  }

  Future<AuthorizedApp> getAuthorizationApp(
      {List<String> fields, List<String> excludeFields, int appId}) async {
    return await _mailchimpMarketing.getAuthorizedApp(
        fields: fields, excludeFields: excludeFields, appId: appId);
  }
}
