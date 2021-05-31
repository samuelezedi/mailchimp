class AutomatedEmail{
  String id;
  int web_id;
  String workflow_id;
  int position;
  Map<String,String> delay;
  String create_time;
  String start_time;
  String archive_url;
  String status;
  int emails_sent;
  String send_time;
  String content_type;
  bool needs_block_refresh;
  bool has_logo_merge_tag;
  Map<String,dynamic> recipients;
  Map<String,dynamic> settings;
  Map<String,dynamic> tracking;
  Map<String,String> social_card;
  Map<String,dynamic> trigger_settings;
  Map<String,dynamic> report_summary;
  List<Map<String,dynamic>> _links;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  AutomatedEmail({
    this.id,
    this.web_id,
    this.workflow_id,
    this.position,
    this.delay,
    this.create_time,
    this.start_time,
    this.archive_url,
    this.status,
    this.emails_sent,
    this.send_time,
    this.content_type,
    this.needs_block_refresh,
    this.has_logo_merge_tag,
    this.recipients,
    this.settings,
    this.tracking,
    this.social_card,
    this.trigger_settings,
    this.report_summary,
    List<Map<String, dynamic>> links,
  }) : _links = links;

  AutomatedEmail copyWith({
    String id,
    int web_id,
    String workflow_id,
    int position,
    Map<String, String> delay,
    String create_time,
    String start_time,
    String archive_url,
    String status,
    int emails_sent,
    String send_time,
    String content_type,
    bool needs_block_refresh,
    bool has_logo_merge_tag,
    Map<String, dynamic> recipients,
    Map<String, dynamic> settings,
    Map<String, dynamic> tracking,
    Map<String, String> social_card,
    Map<String, dynamic> trigger_settings,
    Map<String, dynamic> report_summary,
    List<Map<String, dynamic>> links,
  }) {
    return new AutomatedEmail(
      id: id ?? this.id,
      web_id: web_id ?? this.web_id,
      workflow_id: workflow_id ?? this.workflow_id,
      position: position ?? this.position,
      delay: delay ?? this.delay,
      create_time: create_time ?? this.create_time,
      start_time: start_time ?? this.start_time,
      archive_url: archive_url ?? this.archive_url,
      status: status ?? this.status,
      emails_sent: emails_sent ?? this.emails_sent,
      send_time: send_time ?? this.send_time,
      content_type: content_type ?? this.content_type,
      needs_block_refresh: needs_block_refresh ?? this.needs_block_refresh,
      has_logo_merge_tag: has_logo_merge_tag ?? this.has_logo_merge_tag,
      recipients: recipients ?? this.recipients,
      settings: settings ?? this.settings,
      tracking: tracking ?? this.tracking,
      social_card: social_card ?? this.social_card,
      trigger_settings: trigger_settings ?? this.trigger_settings,
      report_summary: report_summary ?? this.report_summary,
      links: links ?? this._links,
    );
  }

  @override
  String toString() {
    return 'AutomatedEmail{id: $id, web_id: $web_id, workflow_id: $workflow_id, position: $position, delay: $delay, create_time: $create_time, start_time: $start_time, archive_url: $archive_url, status: $status, emails_sent: $emails_sent, send_time: $send_time, content_type: $content_type, needs_block_refresh: $needs_block_refresh, has_logo_merge_tag: $has_logo_merge_tag, recipients: $recipients, settings: $settings, tracking: $tracking, social_card: $social_card, trigger_settings: $trigger_settings, report_summary: $report_summary, _links: $_links}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AutomatedEmail &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          web_id == other.web_id &&
          workflow_id == other.workflow_id &&
          position == other.position &&
          delay == other.delay &&
          create_time == other.create_time &&
          start_time == other.start_time &&
          archive_url == other.archive_url &&
          status == other.status &&
          emails_sent == other.emails_sent &&
          send_time == other.send_time &&
          content_type == other.content_type &&
          needs_block_refresh == other.needs_block_refresh &&
          has_logo_merge_tag == other.has_logo_merge_tag &&
          recipients == other.recipients &&
          settings == other.settings &&
          tracking == other.tracking &&
          social_card == other.social_card &&
          trigger_settings == other.trigger_settings &&
          report_summary == other.report_summary &&
          _links == other._links);

  @override
  int get hashCode =>
      id.hashCode ^
      web_id.hashCode ^
      workflow_id.hashCode ^
      position.hashCode ^
      delay.hashCode ^
      create_time.hashCode ^
      start_time.hashCode ^
      archive_url.hashCode ^
      status.hashCode ^
      emails_sent.hashCode ^
      send_time.hashCode ^
      content_type.hashCode ^
      needs_block_refresh.hashCode ^
      has_logo_merge_tag.hashCode ^
      recipients.hashCode ^
      settings.hashCode ^
      tracking.hashCode ^
      social_card.hashCode ^
      trigger_settings.hashCode ^
      report_summary.hashCode ^
      _links.hashCode;

  factory AutomatedEmail.fromMap(Map<String, dynamic> map) {
    return new AutomatedEmail(
      id: map['id'] as String,
      web_id: map['web_id'] as int,
      workflow_id: map['workflow_id'] as String,
      position: map['position'] as int,
      delay: map['delay'] as Map<String, String>,
      create_time: map['create_time'] as String,
      start_time: map['start_time'] as String,
      archive_url: map['archive_url'] as String,
      status: map['status'] as String,
      emails_sent: map['emails_sent'] as int,
      send_time: map['send_time'] as String,
      content_type: map['content_type'] as String,
      needs_block_refresh: map['needs_block_refresh'] as bool,
      has_logo_merge_tag: map['has_logo_merge_tag'] as bool,
      recipients: map['recipients'] as Map<String, dynamic>,
      settings: map['settings'] as Map<String, dynamic>,
      tracking: map['tracking'] as Map<String, dynamic>,
      social_card: map['social_card'] as Map<String, String>,
      trigger_settings: map['trigger_settings'] as Map<String, dynamic>,
      report_summary: map['report_summary'] as Map<String, dynamic>,
      links: map['_links'] as List<Map<String, dynamic>>,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'web_id': this.web_id,
      'workflow_id': this.workflow_id,
      'position': this.position,
      'delay': this.delay,
      'create_time': this.create_time,
      'start_time': this.start_time,
      'archive_url': this.archive_url,
      'status': this.status,
      'emails_sent': this.emails_sent,
      'send_time': this.send_time,
      'content_type': this.content_type,
      'needs_block_refresh': this.needs_block_refresh,
      'has_logo_merge_tag': this.has_logo_merge_tag,
      'recipients': this.recipients,
      'settings': this.settings,
      'tracking': this.tracking,
      'social_card': this.social_card,
      'trigger_settings': this.trigger_settings,
      'report_summary': this.report_summary,
      '_links': this._links,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
