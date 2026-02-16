[I'm done](https://github.com/peiffer-innovations/peiffer-innovations.github.com)


# websafe_network_image

![Dart Publisher](https://github.com/peiffer-innovations/websafe_network_image/workflows/Dart%20Publisher/badge.svg)

A Flutter compatible library to handle cached network images for Android, iOS
while falling back to the built in image for Web.  As far as possible, this is
designed to be a drop-in replacement for the 
[CachedNetworkImage](https://pub.dev/packages/cached_network_image) package.

For web where there is headers involved, this will bypass Flutter's (and the
browser's) built in cache and attempty to load the images directly using the 
`http` package.  This is because the current `NetworkImage` does not support
headers because it uses the built in browser implementation.

## Using the library

Add the repo to your Flutter `pubspec.yaml` file.

```
dependencies:
  websafe_network_image: <<version>> 
```

Then run...
```
flutter packages get
```


## Example

```dart
import 'package:websafe_network_image/websafe_network_image.dart';

...
Widget build(BuildContext context) {
  return WebsafeNetworkImage(
    imageUrl: imageUrl,
    ...
  );
}
```
