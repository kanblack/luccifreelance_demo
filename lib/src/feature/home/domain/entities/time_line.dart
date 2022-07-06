import 'package:demo_luci_web/src/shared/constants/enums_constants.dart';
import 'package:intl/intl.dart';

class TimeLine {
  final String id;
  final String createdAt;
  final ActionTypeEnum actionType;

  TimeLine(this.id, this.createdAt, this.actionType);
  String getTime() {
    DateTime tempDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(createdAt);
    String time = DateFormat("hh:mm:ss, dd/MM/yyyy ").format(tempDate);
    return time;
  }
}
