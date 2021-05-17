
class MarketingRepositories {
  String apiKey;
  String server;

  MarketingRepositories(this.apiKey, this.server);

  Future <Map<String,dynamic>> getRoot(String fields, String excludedFields) async  {

  }

  Future <Map<String,dynamic>> getAuthorizedApps(String fields, String excludedFields, int count, int offset) async  {

  }

  Future <Map<String,dynamic>> getAuthorizedApp(String fields, String excludedFields, int appId) async  {

  }

}