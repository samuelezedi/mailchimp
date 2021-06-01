
import 'package:mailchimp/src/marketing/enums/api_request_enum.dart';
import 'package:mailchimp/src/marketing/enums/automation_status_enum.dart';
import 'package:mailchimp/src/marketing/enums/delay.dart';

String convertListToString(List data, {String separator = ","}) {
  return data?.join(separator);
}

// String fetchAutomationStatus(AutomationStatus value) {
//   if(value == AutomationStatus.PAUSED){
//     return "paused";
//   } else if(value == AutomationStatus.SAVED) {
//     return "saved";
//   } else if(value == AutomationStatus.SENDING) {
//     return "sending";
//   }
//   return "";
// }
//
// String fetchdelayType(DelayType value) {
//   switch (value) {
//     case DelayType.HOUR:
//       return 'hour';
//     case DelayType.DAY:
//       return 'day';
//     case DelayType.WEEK:
//       return 'week';
//     default:
//       return 'now';
//   }
// }
//
//   String fetchdelayDirection(DelayDirection value) {
//     switch (value) {
//       case DelayDirection.BEFORE:
//         return 'before';
//       default:
//         return 'after';
//     }
//   }
//
// String fetchdelayAction(DelayAction value) {
//   switch (value) {
//     case DelayAction.ECOMM_ABANDONED_BROWSE:
//       return 'ecomm_abandoned_browse';
//     case DelayAction.ECOMM_ABANDONED_CART:
//       return 'ecomm_abandoned_cart';
//     default:
//       return 'signup';
//   }
// }

// String fetchRequestMethod(RequestType value) {
//   switch (value) {
//     case RequestType.GET:
//       return 'GET';
//     case RequestType.POST:
//       return 'POST';
//     case RequestType.DELETE:
//       return 'DELETE';
//     case RequestType.PATCH:
//       return 'PATCH';
//     default:
//       return '';
//   }
// }

String fetchStringOfEnum(val)=>val.toString().split('.').last;