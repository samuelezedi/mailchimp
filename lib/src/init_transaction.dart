
import 'package:flutter/material.dart';
import 'package:mailchimp/src/transaction/core.dart';

class MailChimpTransaction {
  String _apiKey;
  String _server;
  MailChimpTransactionCore _mailChimpTransactionCore;

  MailChimpTransaction({@required apiKey, @required server}) {
    _apiKey = apiKey;
    _server = server;
    _mailChimpTransactionCore =
        MailChimpTransactionCore.setConfigs(apiKey: _apiKey, server: _server);
  }

  getUser() {

  }
}