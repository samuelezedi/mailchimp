
import 'dart:convert';

import 'package:http/http.dart';
import 'package:mailchimp/src/marketing/constants.dart';

class MarketingRepositories {
  String apiKey;
  String server;
  String authString;
  String encoded;
  Map<String, String> headers;

  MarketingRepositories(this.apiKey, this.server) {
    String authString = "apikey:$apiKey";
    String encoded = base64.encode(utf8.encode(authString));
    headers = {
      "content-type": "application/json",
      "Authorization": "Basic $encoded",
    };
  }

  Future <Map<String,dynamic>> getRoot(String fields, String excludedFields) async  {
    String base =  baseUrl.replaceAll("<dc>", "$server");
    var queryParameters = {
      'fields': '$fields',
      'exclude_fields': '$excludedFields',
    };
    var uri = Uri.https('$base', '/3.0$get_root', queryParameters);
    try{
      final response = await get(uri,headers: headers);
      print(response.body);
      return jsonDecode(response.body);
    }catch(e) {
      print("Error: "+e.toString());
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getAuthorizedApps(String fields, String excludedFields, int count, int offset) async  {

  }

  Future <Map<String,dynamic>> getAuthorizedApp(String fields, String excludedFields, int appId) async  {

  }

  Future<List<Map<String, dynamic>>> getAutomations(int count,
    int offset,
    String fields,
    String excludeFields,
    String beforeCreateTime,
    String sinceCreateTime,
    String beforeStartTime,
    String sinceStartTime,
    String status) async {

  }

  Future<Map<String, dynamic>> postAutomations(
      Map<String, dynamic> recipients,
      Map<String, dynamic> triggerSettings,
        Map<String, dynamic> settings) async {

  }

  Future<Map<String, dynamic>> getAutomationInfo(String id, String fields, String excludedFields) async {

  }

  Future<void> startAutomationEmails(String id) {

  }

  Future<void> pauseAutomationEmails(String id) {

  }

  Future<void> archiveAutomation(String id) {

  }

  Future<List<Map<String,dynamic>>> listAutomatedEmails(String id) async {

  }

  Future<Map<String,dynamic>> getWorkflowEmailInfo(String id, String emailId) async {

  }

  Future<void> deleteWorkflowEmail(String id, String emailId) async {

  }

}