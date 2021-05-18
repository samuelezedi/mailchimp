

import 'package:mailchimp/src/marketing/repository.dart';

import '../functions.dart';
import 'models/authorized_app_model.dart';
import 'models/automation_model.dart';
import 'models/root_model.dart';

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
      {List<String> fields,
        List<String> excludeFields,
        int appId}) async {
    String getFields = convertListToString(fields);
    String getExcludedFields = convertListToString(excludeFields);
    Map<String, dynamic> data = await repositories.getAuthorizedApp(
        getFields, getExcludedFields, appId);
    return AuthorizedApp.fromJson(data);
  }

  Future<List<Automation>> getAuthomations() async {

  }
}
