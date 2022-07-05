import 'package:equatable/equatable.dart';

class RefreshDTO extends Equatable {
  final String _refreshToken;

  RefreshDTO(this._refreshToken);

  String? get refreshToken => _refreshToken;

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["refreshToken"] = _refreshToken;

    return map;
  }

  @override
  List<Object?> get props => [_refreshToken];
}
