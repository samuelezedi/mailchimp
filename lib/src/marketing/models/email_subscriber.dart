class EmailSubscriber{
  String id;
  String workflow_id;
  String email_id;
  String list_id;
  String email_address;
  String next_send;
  List<Map<String,String>> _links;
  bool list_is_active;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  EmailSubscriber({
     this.id,
     this.workflow_id,
     this.email_id,
     this.list_id,
     this.email_address,
     this.next_send,
     this.list_is_active,
     List<Map<String, String>> links,
  }) : _links = links;

  EmailSubscriber copyWith({
    String id,
    String workflow_id,
    String email_id,
    String list_id,
    String email_address,
    String next_send,
    List<Map<String, String>> links,
    bool list_is_active,
  }) {
    return new EmailSubscriber(
      id: id ?? this.id,
      workflow_id: workflow_id ?? this.workflow_id,
      email_id: email_id ?? this.email_id,
      list_id: list_id ?? this.list_id,
      email_address: email_address ?? this.email_address,
      next_send: next_send ?? this.next_send,
      links: links ?? this._links,
      list_is_active: list_is_active ?? this.list_is_active,
    );
  }

  @override
  String toString() {
    return 'EmailSubscriber{id: $id, workflow_id: $workflow_id, email_id: $email_id, list_id: $list_id, email_address: $email_address, next_send: $next_send, _links: $_links, list_is_active: $list_is_active}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EmailSubscriber &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          workflow_id == other.workflow_id &&
          email_id == other.email_id &&
          list_id == other.list_id &&
          email_address == other.email_address &&
          next_send == other.next_send &&
          _links == other._links &&
          list_is_active == other.list_is_active);

  @override
  int get hashCode =>
      id.hashCode ^
      workflow_id.hashCode ^
      email_id.hashCode ^
      list_id.hashCode ^
      email_address.hashCode ^
      next_send.hashCode ^
      _links.hashCode ^
      list_is_active.hashCode;

  factory EmailSubscriber.fromMap(Map<String, dynamic> map) {
    return new EmailSubscriber(
      id: map['id'] as String,
      workflow_id: map['workflow_id'] as String,
      email_id: map['email_id'] as String,
      list_id: map['list_id'] as String,
      email_address: map['email_address'] as String,
      next_send: map['next_send'] as String,
      links: map['_links'] as List<Map<String, String>>,
      list_is_active: map['list_is_active'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'workflow_id': this.workflow_id,
      'email_id': this.email_id,
      'list_id': this.list_id,
      'email_address': this.email_address,
      'next_send': this.next_send,
      '_links': this._links,
      'list_is_active': this.list_is_active,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
