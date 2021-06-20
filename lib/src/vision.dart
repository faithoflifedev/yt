import 'package:color/color.dart';
import 'package:dio/dio.dart';
import 'package:yt/provider/vision/vision.dart';
import 'package:yt/src/help.dart';
import 'package:yt/src/model/vision/normalizedVertex.dart';
import 'package:yt/src/model/vision/vertex.dart';
import 'package:yt/yt.dart';

///Integrates Google Vision features, including image labeling, face, logo, and landmark detection, optical character recognition (OCR), and detection of explicit content, into applications.
class Vision with YouTubeHelper {
  final String token;
  final Dio dio;

  final VisionClient _rest;

  final String _authHeader;

  Vision(this.token, this.dio)
      : _authHeader = 'Bearer $token',
        _rest = VisionClient(dio);

  ///Run image detection and annotation for a batch of images.
  Future<AnnotatedResponses> annotate(
      {required AnnotationRequests requests}) async {
    return await _rest.annotate(_authHeader, contentType, requests.toJson());
  }

  ///draw a box on the supplied [Image] around detected object using [NormalizedVertex] values
  static void drawAnnotationsNormalized(
      Image image, List<NormalizedVertex> vertices,
      {String color = 'red', int thickness = 3}) {
    for (var index = 0; index < vertices.length - 1; index++) {
      final vStart = vertices[index];

      final vStop = vertices[index + 1];

      image.drawLine(
          (vStart.x * image.width).toInt(),
          (vStart.y * image.height).toInt(),
          (vStop.x * image.width).toInt(),
          (vStop.y * image.height).toInt(),
          RgbColor.name(color),
          thickness: thickness);
    }

    image.drawLine(
        (vertices.last.x * image.width).toInt(),
        (vertices.last.y * image.height).toInt(),
        (vertices.first.x * image.width).toInt(),
        (vertices.first.y * image.height).toInt(),
        RgbColor.name(color),
        thickness: thickness);
  }

  ///draw a box on the supplied [Image] around the detected object using [Vertex] values
  static void drawAnnotations(Image image, List<Vertex> vertices,
      {String color = 'red', int thickness = 3}) {
    for (var index = 0; index < vertices.length - 1; index++) {
      final vStart = vertices[index];

      final vStop = vertices[index + 1];

      image.drawLine(vStart.x, vStart.y, vStop.x, vStop.y, RgbColor.name(color),
          thickness: thickness);
    }

    image.drawLine(vertices.last.x, vertices.last.y, vertices.first.x,
        vertices.first.y, RgbColor.name(color),
        thickness: thickness);
  }

  ///draw [text] on the [Image] at the [x] and [y] position
  static void drawText(Image image, int x, int y, String text) {
    image.drawString(x, y, text);
  }
}
