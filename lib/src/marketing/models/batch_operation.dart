class BatchOperation {
  String id;
  String status;
  int total_operations;
  int finished_operations;
  int errored_operations;
  String submitted_at;
  String completed_at;
  String response_body_url;
  List<Map<String, String>> _links;


//<editor-fold desc="Data Methods" defaultstate="collapsed">


  BatchOperation({
    this.id,
    this.status,
    this.total_operations,
    this.finished_operations,
    this.errored_operations,
    this.submitted_at,
    this.completed_at,
    this.response_body_url,
    List<Map<String, String>> links,
  }) : _links = links;


  BatchOperation copyWith({
    String id,
    String status,
    int total_operations,
    int finished_operations,
    int errored_operations,
    String submitted_at,
    String completed_at,
    String response_body_url,
    List<Map<String, String>> links,
  }) {
    return new BatchOperation(
      id: id ?? this.id,
      status: status ?? this.status,
      total_operations: total_operations ?? this.total_operations,
      finished_operations: finished_operations ?? this.finished_operations,
      errored_operations: errored_operations ?? this.errored_operations,
      submitted_at: submitted_at ?? this.submitted_at,
      completed_at: completed_at ?? this.completed_at,
      response_body_url: response_body_url ?? this.response_body_url,
      links: links ?? this._links,
    );
  }


  @override
  String toString() {
    return 'BatchOperation{id: $id, status: $status, total_operations: $total_operations, finished_operations: $finished_operations, errored_operations: $errored_operations, submitted_at: $submitted_at, completed_at: $completed_at, response_body_url: $response_body_url, _links: $_links}';
  }


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is BatchOperation &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              status == other.status &&
              total_operations == other.total_operations &&
              finished_operations == other.finished_operations &&
              errored_operations == other.errored_operations &&
              submitted_at == other.submitted_at &&
              completed_at == other.completed_at &&
              response_body_url == other.response_body_url &&
              _links == other._links
          );


  @override
  int get hashCode =>
      id.hashCode ^
      status.hashCode ^
      total_operations.hashCode ^
      finished_operations.hashCode ^
      errored_operations.hashCode ^
      submitted_at.hashCode ^
      completed_at.hashCode ^
      response_body_url.hashCode ^
      _links.hashCode;


  factory BatchOperation.fromMap(Map<String, dynamic> map) {
    return new BatchOperation(
      id: map['id'] as String,
      status: map['status'] as String,
      total_operations: map['total_operations'] as int,
      finished_operations: map['finished_operations'] as int,
      errored_operations: map['errored_operations'] as int,
      submitted_at: map['submitted_at'] as String,
      completed_at: map['completed_at'] as String,
      response_body_url: map['response_body_url'] as String,
      links: map['_links'] as List<Map<String, String>>,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'status': this.status,
      'total_operations': this.total_operations,
      'finished_operations': this.finished_operations,
      'errored_operations': this.errored_operations,
      'submitted_at': this.submitted_at,
      'completed_at': this.completed_at,
      'response_body_url': this.response_body_url,
      '_links': this._links,
    } as Map<String, dynamic>;
  }


//</editor-fold>


}
