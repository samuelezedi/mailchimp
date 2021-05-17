class AuthorizedApps {
  List apps;
  int totalItems;
  List links;

  AuthorizedApps({this.apps, this.links, this.totalItems});

  static AuthorizedApps fromJson(Map<String, dynamic> data) {
    return AuthorizedApps(
        apps: data['apps'],
        links: data['_links'],
        totalItems: data['total_items']);
  }
}
