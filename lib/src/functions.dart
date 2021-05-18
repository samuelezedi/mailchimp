
import 'package:mailchimp/src/marketing/enums/automation_status_enum.dart';

String convertListToString(List data, {String separator = ","}) {
  return data.join(separator);
}

String fetchAutomationStatus(AutomationStatus value) {
  if(value == AutomationStatus.PAUSED){
    return "paused";
  } else if(value == AutomationStatus.SAVED) {
    return "saved";
  } else if(value == AutomationStatus.SENDING) {
    return "sending";
  }
  return "";
}