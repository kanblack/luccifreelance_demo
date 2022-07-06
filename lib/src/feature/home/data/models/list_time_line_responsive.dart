import 'package:demo_luci_web/src/feature/home/data/models/time_line_responsive.dart';

/// id : "10"
/// actionType : "DELETE_BDS_INFO"
/// createdAt : "2022-07-05T18:08:28.884Z"

class ListTimeLineResponsive {
  ListTimeLineResponsive({List<TimeLineResponsive>? listTimeLine}) {
    _listTimeLine = listTimeLine;
  }

  ListTimeLineResponsive.fromJson(dynamic json) {
    if (json['data'] != null) {
      _listTimeLine = [];
      json['data'].forEach((v) {
        _listTimeLine?.add(TimeLineResponsive.fromJson(v));
      });
    }
  }
  List<TimeLineResponsive>? _listTimeLine;
  ListTimeLineResponsive copyWith({List<TimeLineResponsive>? listTimeLine}) =>
      ListTimeLineResponsive(
        listTimeLine: listTimeLine ?? _listTimeLine,
      );

  List<TimeLineResponsive>? get listTimeLine => _listTimeLine;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['data'] = _listTimeLine;
    return map;
  }
}
