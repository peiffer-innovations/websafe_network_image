import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
  PlaceholderWidgetBuilder placeholder,
  Duration placeholderFadeInDuration,
  ImageRepeat repeat = ImageRepeat.noRepeat,
  double width,
}) =>
    _NetworkImage(
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

class _NetworkImage extends StatefulWidget {
  _NetworkImage({
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
  _NetworkImageState createState() => _NetworkImageState();
}

class _NetworkImageState extends State<_NetworkImage> {
  Widget _image;
  bool _loaded = false;

  @override
  void initState() {
    super.initState();

    _initialize();
  }

  Future<void> _initialize() async {
    var response = await http.get(
      widget.imageUrl,
      headers: widget.httpHeaders,
    );

    var body = response.bodyBytes;
    _image = Image.memory(
      body,
      alignment: widget.alignment,
      color: widget.color,
      colorBlendMode: widget.colorBlendMode,
      filterQuality: widget.filterQuality,
      fit: widget.fit,
      height: widget.height,
      matchTextDirection: widget.matchTextDirection,
      repeat: widget.repeat,
      width: widget.width,
    );
    _loaded = true;

    if (mounted == true) {
      setState(() {});
    }
  }

  Widget _buildNoHeaders(BuildContext context) {
    Widget result = Image.network(
      widget.imageUrl,
      color: widget.color,
      colorBlendMode: widget.colorBlendMode,

      // Uncomment when the next Flutter Stable releases
      // errorBuilder: widget.errorWidget == null
      //     ? null
      //     : (
      //         BuildContext context,
      //         Object exception,
      //         _,
      //       ) =>
      //         widget.errorWidget(
      //           context,
      //           widget.imageUrl,
      //           exception,
      //         ),
      filterQuality: widget.filterQuality,
      fit: widget.fit,
      frameBuilder: (BuildContext context, Widget child, __, ___) {
        _loaded = true;
        if (mounted == true) {
          setState(() {});
        }

        return child;
      },
      height: widget.height,
      matchTextDirection: widget.matchTextDirection,
      repeat: widget.repeat,
      width: widget.width,
    );
    result = _buildWithPlaceholder(
      context,
      result,
    );

    return result;
  }

  Widget _buildWithHeaders(BuildContext context) {
    var result = _image ?? SizedBox();
    result = _buildWithPlaceholder(
      context,
      result,
    );

    return result;
  }

  Widget _buildWithPlaceholder(
    BuildContext context,
    Widget child,
  ) {
    Widget result;

    if (widget.placeholder != null) {
      var placeholder = widget.placeholder(context, widget.imageUrl);
      if (widget.fadeInCurve != null && widget.fadeInDuration != null) {
        placeholder = AnimatedOpacity(
          curve: widget.fadeInCurve,
          duration: widget.fadeInDuration,
          opacity: _loaded == true ? 0.0 : 1.0,
          child: placeholder,
        );
      }
      result = Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          child,
          placeholder,
        ],
      );
    } else {
      result = child;
    }

    return result;
  }

  @override
  Widget build(BuildContext context) => widget.httpHeaders?.isNotEmpty == true
      ? _buildWithHeaders(context)
      : _buildNoHeaders(context);
}
