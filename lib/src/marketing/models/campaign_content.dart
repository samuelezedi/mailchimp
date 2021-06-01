class CampaignContent{
  List<Map<String,dynamic>> variate_contents;
  String plain_text;
  String html;
  String archive_html;
  List<Map<String,dynamic>> _links;


//<editor-fold desc="Data Methods" defaultstate="collapsed">


  CampaignContent({
     this.variate_contents,
     this.plain_text,
     this.html,
     this.archive_html,
     List<Map<String, dynamic>> links,
  }) : _links = links;


  CampaignContent copyWith({
    List<Map<String, dynamic>> variate_contents,
    String plain_text,
    String html,
    String archive_html,
    List<Map<String, dynamic>> links,
  }) {
    return new CampaignContent(
      variate_contents: variate_contents ?? this.variate_contents,
      plain_text: plain_text ?? this.plain_text,
      html: html ?? this.html,
      archive_html: archive_html ?? this.archive_html,
      links: links ?? this._links,
    );
  }


  @override
  String toString() {
    return 'CampaignContent{variate_contents: $variate_contents, plain_text: $plain_text, html: $html, archive_html: $archive_html, _links: $_links}';
  }


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is CampaignContent &&
              runtimeType == other.runtimeType &&
              variate_contents == other.variate_contents &&
              plain_text == other.plain_text &&
              html == other.html &&
              archive_html == other.archive_html &&
              _links == other._links
          );


  @override
  int get hashCode =>
      variate_contents.hashCode ^
      plain_text.hashCode ^
      html.hashCode ^
      archive_html.hashCode ^
      _links.hashCode;


  factory CampaignContent.fromMap(Map<String, dynamic> map) {
    return new CampaignContent(
      variate_contents: map['variate_contents'] as List<Map<String, dynamic>>,
      plain_text: map['plain_text'] as String,
      html: map['html'] as String,
      archive_html: map['archive_html'] as String,
      links: map['_links'] as List<Map<String, dynamic>>,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'variate_contents': this.variate_contents,
      'plain_text': this.plain_text,
      'html': this.html,
      'archive_html': this.archive_html,
      '_links': this._links,
    } as Map<String, dynamic>;
  }


//</editor-fold>


}
