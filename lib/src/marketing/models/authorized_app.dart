class AuthorizedApp {
  int id;
  String name;
  String description;
  List<String> users;
  List links;

  AuthorizedApp({this.id, this.name, this.description, this.users, this.links});

  static AuthorizedApp fromJson(Map<String, dynamic> data) {
    return AuthorizedApp(
        id: data['id'],
        name: data['name'],
        description: data['description'],
        users: data['users'],
        links: data['_links']);
  }
}
