import 'package:flutter/material.dart';

typedef ImageWidgetBuilder = Widget Function(
  BuildContext context,
  ImageProvider imageProvider,
);

typedef LoadingErrorWidgetBuilder = Widget Function(
  BuildContext context,
  String url,
  dynamic error,
);

typedef PlaceholderWidgetBuilder = Widget Function(
  BuildContext context,
  String url,
);
