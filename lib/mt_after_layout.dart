library mt_after_layout;

import 'dart:async';

import 'package:flutter/widgets.dart';

mixin MtAfterLayoutMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.endOfFrame.then(
      (_) {
        if (mounted) mtAfterFirstLayout(context);
      },
    );
  }

  FutureOr<void> mtAfterFirstLayout(BuildContext context);
}
