import 'package:demo_luci_web/src/feature/home/domain/entities/time_line.dart';
import 'package:intl/intl.dart';

class GroupTimeLine {
  final DateTime createdAt;
  List<TimeLine> timeLine;

  GroupTimeLine(this.createdAt, this.timeLine);
  String getTime() {
    String time = DateFormat("dd/MM/yyyy").format(createdAt);
    return time;
  }
}
