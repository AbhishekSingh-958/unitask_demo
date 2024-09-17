import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unitask_demo/constants/app_global_constant.dart';
import 'package:unitask_demo/core/theme/app_textstyle.dart';

String getFormattedDate(int? startDate, int? endDate) {
  final int? eventStartDate = startDate;
  final int? eventEndDate = endDate;
  if (eventStartDate != null && eventEndDate != null) {
    final DateTime startDateTime =
        DateTime.fromMillisecondsSinceEpoch(eventStartDate * 1000);
    final DateTime endDateTime =
        DateTime.fromMillisecondsSinceEpoch(eventEndDate * 1000);
    final DateFormat formatter = DateFormat('d MMM'); // Format as "26 May"
    String formattedStartDate = formatter.format(startDateTime);
    String formattedEndDate = formatter.format(endDateTime);

    return '$formattedStartDate - $formattedEndDate';
  }
  return '';
}

void showSimpleSnackbar(String title, {bool? clearPrevious}) {
  if (clearPrevious == true) {
    AppGlobalConstants.scaffoldKey.currentState!.clearSnackBars();
  }
  AppGlobalConstants.scaffoldKey.currentState?.showSnackBar(SnackBar(
      content: Text(title,
          style: AppTextStyle.f16w500black.copyWith(color: Colors.white))));
}
