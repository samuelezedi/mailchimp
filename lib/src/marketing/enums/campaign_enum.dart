enum CampaignType {regular, plaintext, absplit, rss, variate }
enum CampaignStatus { paused, schedule, sending, sent }
enum CampaignSortField { create_time, send_time }
enum CampaignSortDir { ASC, DESC }
enum CampaignContentType{template,multichannel}
enum CampaignFrequency {daily,weekly,monthly}
enum CampaignWeekDay {sunday, monday, tuesday, wednesday, thursday, friday, saturday}
enum CampaignSegmentType {any,all}
enum CampaignWinnerCriteria{ opens, clicks, manual, total_revenue}
enum CampaignTestEmailSendType {html,plaintext}