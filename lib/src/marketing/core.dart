

import 'package:mailchimp/src/marketing/repository.dart';

import '../functions.dart';
import 'models/authorized_app.dart';
import 'models/authorized_apps.dart';
import 'models/root.dart';

class MailchimpMarketing {
  MarketingRepositories repositories;

  MailchimpMarketing.setConfigs({apiKey, server}) {
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

  Future<AuthorizedApps> getAuthorizedApps(
      {List<String> fields,
      List<String> excludeFields,
      int count,
      int offset}) async {
    String getFields = convertListToString(fields);
    String getExcludedFields = convertListToString(excludeFields);
    Map<String, dynamic> data = await repositories.getAuthorizedApps(
        getFields, getExcludedFields, count, offset);
    return AuthorizedApps.fromJson(data);
  }

  Future<AuthorizedApp> getAuthorizedApp(
      {List<String> fields,
        List<String> excludeFields,
        int appId}) async {
    String getFields = convertListToString(fields);
    String getExcludedFields = convertListToString(excludeFields);
    Map<String, dynamic> data = await repositories.getAuthorizedApp(
        getFields, getExcludedFields, appId);
    return AuthorizedApp.fromJson(data);
  }
}
