class CampaignFeedback{
  int feedback_id;
  int parent_id;
  int block_id;
  String message;
  bool is_complete;
  String created_at;
  String created_by;
  String updated_at;
  String source;
  String campaign_id;
  List<Map<String,dynamic>> _links;


//<editor-fold desc="Data Methods" defaultstate="collapsed">


  CampaignFeedback({
     this.feedback_id,
     this.parent_id,
     this.block_id,
     this.message,
     this.is_complete,
     this.created_at,
     this.created_by,
     this.updated_at,
     this.source,
     this.campaign_id,
     List<Map<String, dynamic>> links,
  }) : _links = links;


  CampaignFeedback copyWith({
    int feedback_id,
    int parent_id,
    int block_id,
    String message,
    bool is_complete,
    String created_at,
    String created_by,
    String updated_at,
    String source,
    String campaign_id,
    List<Map<String, dynamic>> links,
  }) {
    return new CampaignFeedback(
      feedback_id: feedback_id ?? this.feedback_id,
      parent_id: parent_id ?? this.parent_id,
      block_id: block_id ?? this.block_id,
      message: message ?? this.message,
      is_complete: is_complete ?? this.is_complete,
      created_at: created_at ?? this.created_at,
      created_by: created_by ?? this.created_by,
      updated_at: updated_at ?? this.updated_at,
      source: source ?? this.source,
      campaign_id: campaign_id ?? this.campaign_id,
      links: links ?? this._links,
    );
  }


  @override
  String toString() {
    return 'CampaignFeedback{feedback_id: $feedback_id, parent_id: $parent_id, block_id: $block_id, message: $message, is_complete: $is_complete, created_at: $created_at, created_by: $created_by, updated_at: $updated_at, source: $source, campaign_id: $campaign_id, _links: $_links}';
  }


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is CampaignFeedback &&
              runtimeType == other.runtimeType &&
              feedback_id == other.feedback_id &&
              parent_id == other.parent_id &&
              block_id == other.block_id &&
              message == other.message &&
              is_complete == other.is_complete &&
              created_at == other.created_at &&
              created_by == other.created_by &&
              updated_at == other.updated_at &&
              source == other.source &&
              campaign_id == other.campaign_id &&
              _links == other._links
          );


  @override
  int get hashCode =>
      feedback_id.hashCode ^
      parent_id.hashCode ^
      block_id.hashCode ^
      message.hashCode ^
      is_complete.hashCode ^
      created_at.hashCode ^
      created_by.hashCode ^
      updated_at.hashCode ^
      source.hashCode ^
      campaign_id.hashCode ^
      _links.hashCode;


  factory CampaignFeedback.fromMap(Map<String, dynamic> map) {
    return new CampaignFeedback(
      feedback_id: map['feedback_id'] as int,
      parent_id: map['parent_id'] as int,
      block_id: map['block_id'] as int,
      message: map['message'] as String,
      is_complete: map['is_complete'] as bool,
      created_at: map['created_at'] as String,
      created_by: map['created_by'] as String,
      updated_at: map['updated_at'] as String,
      source: map['source'] as String,
      campaign_id: map['campaign_id'] as String,
      links: map['_links'] as List<Map<String, dynamic>>,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'feedback_id': this.feedback_id,
      'parent_id': this.parent_id,
      'block_id': this.block_id,
      'message': this.message,
      'is_complete': this.is_complete,
      'created_at': this.created_at,
      'created_by': this.created_by,
      'updated_at': this.updated_at,
      'source': this.source,
      'campaign_id': this.campaign_id,
      '_links': this._links,
    } as Map<String, dynamic>;
  }


//</editor-fold>


}
