
class MarketingRepositories {
  String apiKey;
  String server;

  MarketingRepositories(this.apiKey, this.server);

  Future <Map<String,dynamic>> getRoot(String fields, String excludedFields) async  {

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