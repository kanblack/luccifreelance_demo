/// id : 0

class RequestIdDto {
  RequestIdDto({
    int? id,
  }) {
    _id = id;
  }

  RequestIdDto.fromJson(dynamic json) {
    _id = json['id'];
  }
  int? _id;

  int? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    return map;
  }
}
