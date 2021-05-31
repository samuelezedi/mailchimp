import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mailchimp/src/marketing/constants.dart';
import 'package:mailchimp/src/marketing/enums/api_request_enum.dart';

import 'constants.dart';
import 'constants.dart';
import 'constants.dart';

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

  Future<dynamic> apiRequest(
      RequestType type, String endpoint, Map<String, dynamic> queryParameters,
      {int successCode = 200}) async {
    try {
      String base = baseUrl.replaceAll("<dc>", "$server");
      var uri = Uri.https('$base', endpoint, queryParameters);

      final response = type == RequestType.GET
          ? await get(uri, headers: headers)
          : type == RequestType.POST
              ? await post(uri, headers: headers)
              : type == RequestType.DELETE
                  ? await delete(uri, headers: headers)
                  : await patch(uri, headers: headers);

      print(response.body);
      if (response.statusCode == successCode) {
        return jsonDecode(response.body);
      }
    } catch (e) {
      print("Error: " + e.toString());
    }

    return null;
  }

  Future<Map<String, dynamic>> getRoot(
      List<String> fields, List<String> excludedFields) async {
    var queryParameters = {
      'fields': fields,
      'exclude_fields': excludedFields,
    };

    return apiRequest(
        RequestType.GET, '/3.0${Endpoint.get_root}', queryParameters);
  }

  Future<List<Map<String, dynamic>>> getAuthorizedApps(List<String> fields,
      List<String> excludedFields, int count, int offset) async {
    var queryParameters = {
      'fields': fields,
      'exclude_fields': excludedFields,
      'count': count,
      'offset': offset
    };

    return apiRequest(
        RequestType.GET, '/3.0${Endpoint.authorizedApps}', queryParameters);
  }

  Future<Map<String, dynamic>> getAuthorizedAppInfo(
      List<String> fields, List<String> excludedFields, String appId) async {
    var queryParameters = {
      'fields': fields,
      'exclude_fields': excludedFields,
    };

    return apiRequest(RequestType.GET,
        '/3.0${Endpoint.getAuthorizedAppInfo(appId)}', queryParameters);
  }

  Future<List<Map<String, dynamic>>> getAutomations(
      int count,
      int offset,
      List<String> fields,
      List<String> excludedFields,
      String beforeCreateTime,
      String sinceCreateTime,
      String beforeStartTime,
      String sinceStartTime,
      String status) async {
    var queryParameters = {
      'fields': fields,
      'count': count,
      'offset': offset,
      'exclude_fields': excludedFields,
      'before_create_time': beforeCreateTime,
      'since_create_time': sinceCreateTime,
      'before_start_time': beforeStartTime,
      'since_start_time': sinceStartTime,
      'status': status
    };

    return apiRequest(
        RequestType.GET, '/3.0${Endpoint.automations}', queryParameters);
  }

  Future<Map<String, dynamic>> addAutomation(Map<String, String> recipients,
      Map<String, String> triggerSettings, Map<String, String> settings) async {
    var queryParameters = {
      'recipients': recipients,
      'trigger_settings': triggerSettings,
      'settings': settings,
    };
    return apiRequest(
        RequestType.POST, '/3.0${Endpoint.automations}', queryParameters);
  }

  Future<Map<String, dynamic>> getAutomationInfo(
      String id, List<String> fields, List<String> excludedFields) async {
    var queryParameters = {
      'fields': fields,
      'exclude_fields': excludedFields,
    };
    return apiRequest(RequestType.GET, '/3.0${Endpoint.getAutomationInfo(id)}',
        queryParameters);
  }

  Future<void> startAutomationEmails(String id) {
    return apiRequest(
        RequestType.POST, '/3.0${Endpoint.startAutomationEmails(id)}', {},
        successCode: 204);
  }

  Future<void> pauseAutomationEmails(String id) {
    return apiRequest(
        RequestType.POST, '/3.0${Endpoint.pauseAutomationEmails(id)}', {},
        successCode: 204);
  }

  Future<void> archiveAutomation(String id) {
    return apiRequest(
        RequestType.POST, '/3.0${Endpoint.archiveAutomation(id)}', {},
        successCode: 204);
  }

  Future<Map<String, dynamic>> listAutomatedEmails(String id) async {
    return apiRequest(
        RequestType.GET, '/3.0${Endpoint.listAutomationEmails(id)}', {});
  }

  Future<Map<String, dynamic>> getWorkflowEmailInfo(
      String id, String emailId) async {
    return apiRequest(
        RequestType.GET, '/3.0${Endpoint.workflowEmail(id, emailId)}', {});
  }

  Future<void> deleteWorkflowEmail(String id, String emailId) async {
    return apiRequest(
        RequestType.DELETE, '/3.0${Endpoint.workflowEmail(id, emailId)}', {},
        successCode: 204);
  }

  Future<Map<String, dynamic>> updateWorkflowEmail(String id, String emailId,
      Map<String, dynamic> delay, Map<String, String> settings) async {
    var queryParameters = {
      'delay': delay,
      'settings': settings,
    };
    return apiRequest(RequestType.PATCH,
        '/3.0${Endpoint.workflowEmail(id, emailId)}', queryParameters);
  }

  Future<void> pauseAutomatedEmail(String id, String emailId) async {
    return apiRequest(RequestType.POST,
        '/3.0${Endpoint.pauseAutomatedEmail(id, emailId)}', {},
        successCode: 204);
  }

  Future<void> startAutomatedEmail(String id, String emailId) async {
    return apiRequest(RequestType.POST,
        '/3.0${Endpoint.startAutomatedEmail(id, emailId)}', {},
        successCode: 204);
  }

  Future<Map<String, dynamic>> getAutomatedEmailSubscribers(
      String id, String emailId) async {
    return apiRequest(
        RequestType.GET, '/3.0${Endpoint.emailSubscribers(id, emailId)}', {},
        successCode: 200);
  }

  Future<Map<String, dynamic>> addEmailSubscriber(
      String id, String emailId, String emailAddress) async {
    var queryParameters = {'email_address': emailAddress};
    return apiRequest(RequestType.POST,
        '/3.0${Endpoint.emailSubscribers(id, emailId)}', queryParameters,
        successCode: 200);
  }

  Future<Map<String, dynamic>> getEmailSubscriber(
      String id, String emailId, String subscriberHash) async {
    return apiRequest(RequestType.GET,
        '/3.0${Endpoint.getEmailSubscriber(id, emailId, subscriberHash)}', {},
        successCode: 200);
  }

  Future<Map<String, dynamic>> getRemovedSubscribers(String id) async {
    return apiRequest(
        RequestType.GET, '/3.0${Endpoint.removedSubscribers(id)}', {},
        successCode: 200);
  }

  Future<Map<String, dynamic>> removeSubscriber(
      String id, String emailAddress) async {
    var queryParameters = {'email_address': emailAddress};
    return apiRequest(RequestType.POST,
        '/3.0${Endpoint.removedSubscribers(id)}', queryParameters,
        successCode: 200);
  }

  Future<Map<String, dynamic>> getRemovedSubscriber(
      String id, String subscriberHash) async {
    return apiRequest(RequestType.GET,
        '/3.0${Endpoint.getRemovedSubscriber(id, subscriberHash)}', {},
        successCode: 200);
  }

  Future<Map<String, dynamic>> getBatchRequests(List<String> fields,
      List<String> excludedFields, int count, int offset) async {
    var queryParameters = {
      'fields': fields,
      'exclude_fields': excludedFields,
      'count': count,
      'offset': offset
    };
    return apiRequest(
        RequestType.GET, '/3.0${Endpoint.batches}', queryParameters);
  }

  Future<Map<String, dynamic>> startBatchOperations(
      String requestMethod,
      String path,
      int count,
      int offset,
      String jsonBody,
      String operationId) async {
    var queryParameters = {
      'operations': [
        {'method': requestMethod},
        {'path': path},
        {
          'params': {'count': count, 'offset': offset}
        },
        {'body': jsonBody},
        {'operation_id': operationId}
      ],
    };
    return apiRequest(
        RequestType.POST, '/3.0${Endpoint.batches}', queryParameters);
  }

  Future<Map<String, dynamic>> getBatchOperationStatus(
      String batchId, List<String> fields, List<String> excludedFields) async {
    var queryParameters = {
      'fields': fields,
      'exclude_fields': excludedFields,
    };
    return apiRequest(RequestType.GET,
        '/3.0${Endpoint.batchOperation(batchId)}', queryParameters);
  }

  Future<Map<String, dynamic>> deleteBatchRequest(String batchId) async {
    return apiRequest(
        RequestType.DELETE, '/3.0${Endpoint.batchOperation(batchId)}', {},
        successCode: 204);
  }

  Future<Map<String, dynamic>> getBatchWebhooks(List<String> fields,
      List<String> excludedFields, int count, int offset) async {
    var queryParameters = {
      'fields': fields,
      'exclude_fields': excludedFields,
      'count': count,
      'offset': offset
    };
    return apiRequest(
        RequestType.GET, '/3.0${Endpoint.batchWebhooks}', queryParameters);
  }

  Future<Map<String, dynamic>> addBatchWebhook(String url) async {
    var queryParameters = {'url': url};
    return apiRequest(
        RequestType.POST, '/3.0${Endpoint.batchWebhooks}', queryParameters);
  }

  Future<Map<String, dynamic>> getBatchWebhookInfo(String batchWebhookId,
      List<String> fields, List<String> excludedFields) async {
    var queryParameters = {
      'fields': fields,
      'exclude_fields': excludedFields,
    };
    return apiRequest(RequestType.GET,
        '/3.0${Endpoint.batchWebhookInfo(batchWebhookId)}', queryParameters);
  }

  Future<Map<String, dynamic>> updateBatchWebhook(
      String batchWebhookId, String url) async {
    var queryParameters = {'url': url};
    return apiRequest(RequestType.PATCH,
        '/3.0${Endpoint.batchWebhookInfo(batchWebhookId)}', queryParameters);
  }

  Future<void> deleteBatchWebhook(String batchWebhookId) async {
    return apiRequest(RequestType.DELETE,
        '/3.0${Endpoint.batchWebhookInfo(batchWebhookId)}', {},successCode: 204);
  }

  Future<Map<String, dynamic>> getCampaignFolders(List<String> fields,
      List<String> excludedFields, int count, int offset) async {
    var queryParameters = {
      'fields': fields,
      'exclude_fields': excludedFields,
      'count': count,
      'offset': offset
    };
    return apiRequest(
        RequestType.GET, '/3.0${Endpoint.campaignFolders}', queryParameters);
  }

  Future<Map<String, dynamic>> addCampaignFolder(String name) async {
    var queryParameters = {'name': name};
    return apiRequest(
        RequestType.POST, '/3.0${Endpoint.campaignFolders}', queryParameters);
  }

  Future<Map<String, dynamic>> getCampaignFolderInfo(String folderId,
      List<String> fields, List<String> excludedFields) async {
    var queryParameters = {
      'fields': fields,
      'exclude_fields': excludedFields,
    };
    return apiRequest(RequestType.GET,
        '/3.0${Endpoint.campaignFolderInfo(folderId)}', queryParameters);
  }

  Future<Map<String, dynamic>> updateCampaignFolder(
      String folderId, String name) async {
    var queryParameters = {'name': name};
    return apiRequest(RequestType.PATCH,
        '/3.0${Endpoint.campaignFolderInfo(folderId)}', queryParameters);
  }

  Future<void> deleteCampaignFolder(String folderId) async {
    return apiRequest(RequestType.DELETE,
        '/3.0${Endpoint.campaignFolderInfo(folderId)}', {},successCode: 204);
  }
}
