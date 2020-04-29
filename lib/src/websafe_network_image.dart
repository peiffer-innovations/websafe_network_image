import 'package:flutter/material.dart';
import 'package:websafe_network_image/websafe_network_image.dart';

// ignore: uri_does_not_exist
import 'platform/stub_network_image.dart'
    // ignore: uri_does_not_exist
    if (dart.library.io) 'platform/io_network_image.dart'
    // ignore: uri_does_not_exist
    if (dart.library.html) 'platform/browser_network_image.dart';

class WebsafeNetworkImage extends StatelessWidget {
  WebsafeNetworkImage({
    this.alignment = Alignment.center,
    this.color,
    this.colorBlendMode,
    this.errorWidget,
    this.fadeInCurve = Curves.easeIn,
    this.fadeInDuration = const Duration(milliseconds: 500),
    this.fadeOutCurve = Curves.easeOut,
    this.fadeOutDuration = const Duration(milliseconds: 1000),
    this.filterQuality = FilterQuality.low,
    this.fit,
    this.height,
    this.httpHeaders,
    @required this.imageUrl,
    Key key,
    this.matchTextDirection = false,
    this.placeholder,
    this.placeholderFadeInDuration,
    this.repeat = ImageRepeat.noRepeat,
    this.width,
  })  : assert(imageUrl?.isNotEmpty == true),
        super(key: key);

  final Alignment alignment;
  final Color color;
  final BlendMode colorBlendMode;
  final LoadingErrorWidgetBuilder errorWidget;
  final Curve fadeInCurve;
  final Duration fadeInDuration;
  final Curve fadeOutCurve;
  final Duration fadeOutDuration;
  final FilterQuality filterQuality;
  final BoxFit fit;
  final double height;
  final Map<String, String> httpHeaders;
  final String imageUrl;
  final bool matchTextDirection;
  final PlaceholderWidgetBuilder placeholder;
  final Duration placeholderFadeInDuration;
  final ImageRepeat repeat;
  final double width;

  @override
  Widget build(BuildContext context) => createNetworkImage(
        alignment: alignment,
        color: color,
        colorBlendMode: colorBlendMode,
        errorWidget: errorWidget,
        fadeInCurve: fadeInCurve,
        fadeInDuration: fadeInDuration,
        fadeOutCurve: fadeOutCurve,
        fadeOutDuration: fadeOutDuration,
        filterQuality: filterQuality,
        fit: fit,
        height: height,
        httpHeaders: httpHeaders,
        imageUrl: imageUrl,
        matchTextDirection: matchTextDirection,
        placeholder: placeholder,
        placeholderFadeInDuration: placeholderFadeInDuration,
        repeat: repeat,
        width: width,
      );
}
