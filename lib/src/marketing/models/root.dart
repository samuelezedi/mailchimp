
import 'dart:core';

class Root {
  String accountId;
  String loginId;
  String accountName;
  String email;
  String firstName;
  String lastName;
  String userName;
  String avatarUrl;
  String role;
  String memberSince;
  String pricingPlanType;
  String firstPayment;
  String accountTimezone;
  String accountIndustry;
  Map<String, dynamic> contact;
  bool proEnabled;
  String lastLogin;
  int totalSubscribers;
  Map<String, int> industryStats;
  List<Map<String, dynamic>> links;

  Root({this.accountId, this.loginId, this.accountName, this.email, this.firstName, this.lastName, this.userName, this.avatarUrl, this.role, this.memberSince, this.pricingPlanType, this.firstPayment, this.accountTimezone, this.accountIndustry, this.contact, this.proEnabled, this.lastLogin, this.totalSubscribers, this.industryStats, this.links});

  static Root fromJson(Map<String, dynamic> data) {
    return Root(
      accountId: data['account_id'],
      loginId: data['login_id'],
      accountName: data['account_name'],
      email: data['email'],
      firstName: data['first_name'],
      lastName: data['last_name'],
      userName: data['user_name'],
      avatarUrl: data['avatar_url'],
      role: data['role'],
      memberSince: data['member_since'],
      pricingPlanType: data['pricing_plan_type'],
      firstPayment: data['first_payment'],
      accountTimezone: data['account_timezone'],
      accountIndustry: data['account_industry'],
      contact: data['contact'],
      proEnabled: data['pro_enabled'],
      lastLogin: data['last_login'],
      totalSubscribers: data['total_subscribers'],
      industryStats: data['industry_stats'],
      links: data['_links']
    );
  }
}

class RootErrors {

}