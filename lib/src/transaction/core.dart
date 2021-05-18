
import 'package:mailchimp/src/transaction/repository.dart';

class MailChimpTransactionCore {
  TransactionsRepository repositories;

  MailChimpTransactionCore.setConfigs({apiKey, server}) {
    repositories = TransactionsRepository(apiKey, server);
  }

}