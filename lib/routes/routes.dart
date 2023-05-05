import 'package:flutter/material.dart';

//from going one page to another
class PageRouting {
  static goToNextPage({
    required BuildContext context,
    required Widget navigateTo,
  }) {
    return Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => navigateTo),
    );
  }
}
