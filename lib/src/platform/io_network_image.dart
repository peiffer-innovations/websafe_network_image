import 'package:cached_network_image/cached_network_image.dart'
    show CachedNetworkImage;
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:websafe_network_image/websafe_network_image.dart';

Widget createNetworkImage({
  Alignment alignment = Alignment.center,
  Color color,
  BlendMode colorBlendMode,
  LoadingErrorWidgetBuilder errorWidget,
  Curve fadeInCurve = Curves.easeIn,
  Duration fadeInDuration = const Duration(milliseconds: 500),
  Curve fadeOutCurve = Curves.easeOut,
  Duration fadeOutDuration = const Duration(milliseconds: 1000),
  FilterQuality filterQuality = FilterQuality.low,
  BoxFit fit,
  double height,
  Map<String, String> httpHeaders,
  @required String imageUrl,
  bool matchTextDirection = false,
  ImageProvider<dynamic> placeholder,
  Duration placeholderFadeInDuration,
  ImageRepeat repeat = ImageRepeat.noRepeat,
  double width,
}) =>
    CachedNetworkImage(
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
      placeholder: placeholder == null
          ? null
          : (_, __) => Image(
                image: placeholder,
              ),
      placeholderFadeInDuration: placeholderFadeInDuration,
      repeat: repeat,
      width: width,
    );
