import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../env.dart';
import '../../../injection_container.dart';
import '../services/local_store_service.dart';

// Future<UserInfo?> getCurrentUser() async {
//   final user = await getIt<LocalStorageService>().getCurrentUser();
//   return user.fold((l) => null, (r) => r);
// }

extension FormatPrice on double {
  String price() {
    final formatPrice = NumberFormat("¥#,###", "en_US");
    return formatPrice.format(this);
  }
}

String formatTime(String dateTime) {
  DateTime inputFormat = DateTime.parse(dateTime);
  return DateFormat('yyyy/MM/dd').format(inputFormat.toLocal());
}

String formatTimeNotification(String dateTime) {
  DateTime inputFormat = DateTime.parse(dateTime);
  return DateFormat('MEd').format(inputFormat.toLocal());
}

String getImageUrl(String imageId) {
  return "${BASE_URL}$imageId";
}

extension BoolParsing on String {
  bool parseBool() {
    return this.toLowerCase() == 'true';
  }
}

class Utils {
  static List<Widget> modelBuilder<M>(
          List<M> models, Widget Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, Widget>(
              (index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();
}
