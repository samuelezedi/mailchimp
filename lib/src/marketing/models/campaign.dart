class Campaign{
  String id;
  int web_id;
  String parent_campaign_id;
  String type;
  String create_time;
  String archive_url;
  String long_archive_url;
  String status;
  int emails_sent;
  String send_time;
  String content_type;
  String needs_block_refresh;
  String resendable;
  Map<String,dynamic> recipients;
  Map<String,dynamic> settings;
  Map<String,dynamic> variate_settings;
  Map<String,dynamic> tracking;
  Map<String,dynamic> rss_opts;
  Map<String,dynamic> ab_split_opts;
  Map<String,String> social_card;
  Map<String,dynamic> report_summary;
  Map<String,dynamic> delivery_status;
  List<Map<String,dynamic>> _links;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  Campaign({
     this.id,
     this.web_id,
     this.parent_campaign_id,
     this.type,
     this.create_time,
     this.archive_url,
     this.long_archive_url,
     this.status,
     this.emails_sent,
     this.send_time,
     this.content_type,
     this.needs_block_refresh,
     this.resendable,
     this.recipients,
     this.settings,
     this.variate_settings,
     this.tracking,
     this.rss_opts,
     this.ab_split_opts,
     this.social_card,
     this.report_summary,
     this.delivery_status,
     List<Map<String, dynamic>> links,
  }) : _links = links;

  Campaign copyWith({
    String id,
    int web_id,
    String parent_campaign_id,
    String type,
    String create_time,
    String archive_url,
    String long_archive_url,
    String status,
    int emails_sent,
    String send_time,
    String content_type,
    String needs_block_refresh,
    String resendable,
    Map<String, dynamic> recipients,
    Map<String, dynamic> settings,
    Map<String, dynamic> variate_settings,
    Map<String, dynamic> tracking,
    Map<String, dynamic> rss_opts,
    Map<String, dynamic> ab_split_opts,
    Map<String, String> social_card,
    Map<String, dynamic> report_summary,
    Map<String, dynamic> delivery_status,
    List<Map<String, dynamic>> links,
  }) {
    return new Campaign(
      id: id ?? this.id,
      web_id: web_id ?? this.web_id,
      parent_campaign_id: parent_campaign_id ?? this.parent_campaign_id,
      type: type ?? this.type,
      create_time: create_time ?? this.create_time,
      archive_url: archive_url ?? this.archive_url,
      long_archive_url: long_archive_url ?? this.long_archive_url,
      status: status ?? this.status,
      emails_sent: emails_sent ?? this.emails_sent,
      send_time: send_time ?? this.send_time,
      content_type: content_type ?? this.content_type,
      needs_block_refresh: needs_block_refresh ?? this.needs_block_refresh,
      resendable: resendable ?? this.resendable,
      recipients: recipients ?? this.recipients,
      settings: settings ?? this.settings,
      variate_settings: variate_settings ?? this.variate_settings,
      tracking: tracking ?? this.tracking,
      rss_opts: rss_opts ?? this.rss_opts,
      ab_split_opts: ab_split_opts ?? this.ab_split_opts,
      social_card: social_card ?? this.social_card,
      report_summary: report_summary ?? this.report_summary,
      delivery_status: delivery_status ?? this.delivery_status,
      links: links ?? this._links,
    );
  }

  @override
  String toString() {
    return 'Campaign{id: $id, web_id: $web_id, parent_campaign_id: $parent_campaign_id, type: $type, create_time: $create_time, archive_url: $archive_url, long_archive_url: $long_archive_url, status: $status, emails_sent: $emails_sent, send_time: $send_time, content_type: $content_type, needs_block_refresh: $needs_block_refresh, resendable: $resendable, recipients: $recipients, settings: $settings, variate_settings: $variate_settings, tracking: $tracking, rss_opts: $rss_opts, ab_split_opts: $ab_split_opts, social_card: $social_card, report_summary: $report_summary, delivery_status: $delivery_status, _links: $_links}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Campaign &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          web_id == other.web_id &&
          parent_campaign_id == other.parent_campaign_id &&
          type == other.type &&
          create_time == other.create_time &&
          archive_url == other.archive_url &&
          long_archive_url == other.long_archive_url &&
          status == other.status &&
          emails_sent == other.emails_sent &&
          send_time == other.send_time &&
          content_type == other.content_type &&
          needs_block_refresh == other.needs_block_refresh &&
          resendable == other.resendable &&
          recipients == other.recipients &&
          settings == other.settings &&
          variate_settings == other.variate_settings &&
          tracking == other.tracking &&
          rss_opts == other.rss_opts &&
          ab_split_opts == other.ab_split_opts &&
          social_card == other.social_card &&
          report_summary == other.report_summary &&
          delivery_status == other.delivery_status &&
          _links == other._links);

  @override
  int get hashCode =>
      id.hashCode ^
      web_id.hashCode ^
      parent_campaign_id.hashCode ^
      type.hashCode ^
      create_time.hashCode ^
      archive_url.hashCode ^
      long_archive_url.hashCode ^
      status.hashCode ^
      emails_sent.hashCode ^
      send_time.hashCode ^
      content_type.hashCode ^
      needs_block_refresh.hashCode ^
      resendable.hashCode ^
      recipients.hashCode ^
      settings.hashCode ^
      variate_settings.hashCode ^
      tracking.hashCode ^
      rss_opts.hashCode ^
      ab_split_opts.hashCode ^
      social_card.hashCode ^
      report_summary.hashCode ^
      delivery_status.hashCode ^
      _links.hashCode;

  factory Campaign.fromMap(Map<String, dynamic> map) {
    return new Campaign(
      id: map['id'] as String,
      web_id: map['web_id'] as int,
      parent_campaign_id: map['parent_campaign_id'] as String,
      type: map['type'] as String,
      create_time: map['create_time'] as String,
      archive_url: map['archive_url'] as String,
      long_archive_url: map['long_archive_url'] as String,
      status: map['status'] as String,
      emails_sent: map['emails_sent'] as int,
      send_time: map['send_time'] as String,
      content_type: map['content_type'] as String,
      needs_block_refresh: map['needs_block_refresh'] as String,
      resendable: map['resendable'] as String,
      recipients: map['recipients'] as Map<String, dynamic>,
      settings: map['settings'] as Map<String, dynamic>,
      variate_settings: map['variate_settings'] as Map<String, dynamic>,
      tracking: map['tracking'] as Map<String, dynamic>,
      rss_opts: map['rss_opts'] as Map<String, dynamic>,
      ab_split_opts: map['ab_split_opts'] as Map<String, dynamic>,
      social_card: map['social_card'] as Map<String, String>,
      report_summary: map['report_summary'] as Map<String, dynamic>,
      delivery_status: map['delivery_status'] as Map<String, dynamic>,
      links: map['_links'] as List<Map<String, dynamic>>,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'web_id': this.web_id,
      'parent_campaign_id': this.parent_campaign_id,
      'type': this.type,
      'create_time': this.create_time,
      'archive_url': this.archive_url,
      'long_archive_url': this.long_archive_url,
      'status': this.status,
      'emails_sent': this.emails_sent,
      'send_time': this.send_time,
      'content_type': this.content_type,
      'needs_block_refresh': this.needs_block_refresh,
      'resendable': this.resendable,
      'recipients': this.recipients,
      'settings': this.settings,
      'variate_settings': this.variate_settings,
      'tracking': this.tracking,
      'rss_opts': this.rss_opts,
      'ab_split_opts': this.ab_split_opts,
      'social_card': this.social_card,
      'report_summary': this.report_summary,
      'delivery_status': this.delivery_status,
      '_links': this._links,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
