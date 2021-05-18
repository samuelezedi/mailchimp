class Automation {
  String id;
  String createTime;
  String startTime;
  String status;
  int emailSent;
  Map<String, dynamic> recipients;
  Map<String, dynamic> settings;
  Map<String, dynamic> tracking;
  Map<String, dynamic> triggerSettings;
  Map<String, dynamic> reportSummary;
  List<Map<String, dynamic>> links;

  Automation(
      {this.id,
      this.createTime,
      this.startTime,
      this.status,
      this.emailSent,
      this.recipients,
      this.settings,
      this.tracking,
      this.triggerSettings,
      this.reportSummary,
      this.links});

  static Automation fromJson(Map<String, dynamic> data) {
    return Automation(
        id: data['id'],
        createTime: data['createTime'],
        startTime: data['startTime'],
        status: data['status'],
        emailSent: data['emailSent'],
        recipients: data['recipients'],
        settings: data['settings'],
        tracking: data['tracking'],
        triggerSettings: data['triggerSettings'],
        reportSummary: data['reportSummary'],
        links: data['links']);
  }
}
