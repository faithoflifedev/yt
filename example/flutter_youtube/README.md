# flutter_youtube

An example Flutter project that shows how the `yt` package can be used to display data through the Youtube Data API

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our [online documentation](https://flutter.dev/docs), which offers tutorials, samples, guidance on mobile development, and a full API reference.

## The `yt` Package

The `yt` package does not include any Flutter dependencies but it can be easily integrated with Flutter code using any of the authentication mechanisms documented with the package. In addition, for some applications there may be a desire to use the user's own YouTube credentials for authentication. The `yt` library uses the concept of a [TokenGenerator](https://pub.dev/documentation/yt/latest/yt/util_tokenGenerator/TokenGenerator-class.html) to allow for this. [TokenGenerator](https://pub.dev/documentation/yt/latest/yt/util_tokenGenerator/TokenGenerator-class.html) is an abstract class that is extended within the library through the [JwtGenerator](https://pub.dev/documentation/yt/latest/yt/util_tokenGenerator/JwtGenerator-class.html) and [OAuthGenerator](https://pub.dev/documentation/yt/latest/yt/util_tokenGenerator//OAuthGenerator-class.html) classes, and generates the authentication token used in API calls to YouTube.

For a Flutter app the [TokenGenerator](https://pub.dev/documentation/yt/latest/yt/util_tokenGenerator/TokenGenerator-class.html) can be extended to allow for auth tokens to be generated through the [google_sign_in](https://pub.dev/packages/google_sign_in) package provided by the [flutter.dev](https://pub.dev/publishers/flutter.dev/packages) team. Keep in mind that you must fulfill all of the requirements for the [google_sign_in](https://pub.dev/packages/google_sign_in) package provided by the [flutter.dev](https://pub.dev/publishers/flutter.dev/packages) package before attempting to this example code.
