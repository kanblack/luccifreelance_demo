import 'package:demo_luci_web/src/feature/home/domain/entities/time_line.dart';

class GroupTimeLine {
  final DateTime createdAt;
  List<TimeLine> timeLine;

  GroupTimeLine(this.createdAt, this.timeLine);
}
