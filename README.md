# websafe_network_image

![Dart Publisher](https://github.com/peiffer-innovations/websafe_network_image/workflows/Dart%20Publisher/badge.svg)

A Flutter compatible library to handle cached network images for Android, iOS
while falling back to the built in image for Web.

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