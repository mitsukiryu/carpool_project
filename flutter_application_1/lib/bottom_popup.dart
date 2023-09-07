import 'package:flutter/material.dart';

void bottom_popup(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 20,
        );
      });
}
