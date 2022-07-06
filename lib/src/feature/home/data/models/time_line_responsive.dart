/// id : "10"
/// actionType : "DELETE_BDS_INFO"
/// createdAt : "2022-07-05T18:08:28.884Z"

class TimeLineResponsive {
  TimeLineResponsive({
    String? id,
    String? actionType,
    String? createdAt,
  }) {
    _id = id;
    _actionType = actionType;
    _createdAt = createdAt;
  }

  TimeLineResponsive.fromJson(dynamic json) {
    _id = json['id'];
    _actionType = json['actionType'];
    _createdAt = json['createdAt'];
  }
  String? _id;
  String? _actionType;
  String? _createdAt;
  TimeLineResponsive copyWith({
    String? id,
    String? actionType,
    String? createdAt,
  }) =>
      TimeLineResponsive(
        id: id ?? _id,
        actionType: actionType ?? _actionType,
        createdAt: createdAt ?? _createdAt,
      );
  String? get id => _id;
  String? get actionType => _actionType;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['actionType'] = _actionType;
    map['createdAt'] = _createdAt;
    return map;
  }
}
