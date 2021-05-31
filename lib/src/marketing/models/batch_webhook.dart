class BatchWebhook{
  String id;
  String url;
  List<Map<String,String>> _links;


//<editor-fold desc="Data Methods" defaultstate="collapsed">


  BatchWebhook({
     this.id,
     this.url,
     List<Map<String, String>> links,
  }) : _links = links;


  BatchWebhook copyWith({
    String id,
    String url,
    List<Map<String, String>> links,
  }) {
    return new BatchWebhook(
      id: id ?? this.id,
      url: url ?? this.url,
      links: links ?? this._links,
    );
  }


  @override
  String toString() {
    return 'BatchWebhook{id: $id, url: $url, _links: $_links}';
  }


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is BatchWebhook &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              url == other.url &&
              _links == other._links
          );


  @override
  int get hashCode =>
      id.hashCode ^
      url.hashCode ^
      _links.hashCode;


  factory BatchWebhook.fromMap(Map<String, dynamic> map) {
    return new BatchWebhook(
      id: map['id'] as String,
      url: map['url'] as String,
      links: map['_links'] as List<Map<String, String>>,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'url': this.url,
      '_links': this._links,
    } as Map<String, dynamic>;
  }


//</editor-fold>


}
