class CampaignFolder{
  String name;
  String id;
  int count;
  List<Map<String,String>> _links;


//<editor-fold desc="Data Methods" defaultstate="collapsed">


  CampaignFolder({
     this.name,
     this.id,
     this.count,
     List<Map<String, String>> links,
  }) : _links = links;


  CampaignFolder copyWith({
    String name,
    String id,
    int count,
    List<Map<String, String>> links,
  }) {
    return new CampaignFolder(
      name: name ?? this.name,
      id: id ?? this.id,
      count: count ?? this.count,
      links: links ?? this._links,
    );
  }


  @override
  String toString() {
    return 'CampaignFolder{name: $name, id: $id, count: $count, _links: $_links}';
  }


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is CampaignFolder &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              id == other.id &&
              count == other.count &&
              _links == other._links
          );


  @override
  int get hashCode =>
      name.hashCode ^
      id.hashCode ^
      count.hashCode ^
      _links.hashCode;


  factory CampaignFolder.fromMap(Map<String, dynamic> map) {
    return new CampaignFolder(
      name: map['name'] as String,
      id: map['id'] as String,
      count: map['count'] as int,
      links: map['_links'] as List<Map<String, String>>,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'name': this.name,
      'id': this.id,
      'count': this.count,
      '_links': this._links,
    } as Map<String, dynamic>;
  }


//</editor-fold>


}
