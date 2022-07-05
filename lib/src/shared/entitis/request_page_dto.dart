import 'dart:convert';

/// limit : 0
/// page : 0

class RequestPageDto {
  RequestPageDto(
      {int? limit,
      int? page,
      String? keySort,
      bool? isASC,
      String? keyWhere,
      String? valueWhere}) {
    _limit = limit;
    _page = page;
    _isASC = isASC;
    _keySort = keySort;
    _keyWhere = keyWhere;
    _valueWhere = valueWhere;
  }

  RequestPageDto.fromJson(dynamic json) {
    _limit = json['limit'];
    _page = json['page'];
  }
  int? _limit;
  int? _page;
  String? _keySort;
  String? _keyWhere;
  String? _valueWhere;
  bool? _isASC;

  int? get limit => _limit;
  int? get page => _page;
  bool? get isASC => _isASC;
  String? get keySort => _keySort;
  String? get keyWhere => _keyWhere;
  String? get valueWhere => _valueWhere;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['limit'] = _limit;
    map['page'] = _page;
    return map;
  }

  getSortArgs() {
    String sortType = _isASC ?? false ? "ASC" : "DESC";
    return json.encode({"key": _keySort, "value": sortType});
  }

  getWhereArgs() {
    return json.encode({"key": _keyWhere, "value": _valueWhere});
  }
}
