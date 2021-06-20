import 'package:color/color.dart';
import 'package:dio/dio.dart';
import 'package:yt/src/help.dart';
import 'package:yt/src/model/vision/normalizedVertex.dart';
import 'package:yt/src/model/vision/vertex.dart';
import 'package:yt/yt.dart';

import 'provider/vision/vision.dart';

class Vision with YouTubeHelper {
  final String token;
  final Dio dio;

  final VisionClient _rest;

  final String _authHeader;

  Vision(this.token, this.dio)
      : _authHeader = 'Bearer $token',
        _rest = VisionClient(dio);

  Future<AnnotatedResponses> annotate(
      {required AnnotationRequests requests}) async {
    return await _rest.annotate(_authHeader, contentType, requests.toJson());
  }

  static void drawAnnotationsNormalized(
      Image image, List<NormalizedVertex> vertices) {
    for (var index = 0; index < vertices.length - 1; index++) {
      final vStart = vertices[index];

      final vStop = vertices[index + 1];

      image.drawLine(
          (vStart.x * image.width).toInt(),
          (vStart.y * image.height).toInt(),
          (vStop.x * image.width).toInt(),
          (vStop.y * image.height).toInt(),
          RgbColor.name('red'),
          thickness: 3);
    }

    image.drawLine(
        (vertices.last.x * image.width).toInt(),
        (vertices.last.y * image.height).toInt(),
        (vertices.first.x * image.width).toInt(),
        (vertices.first.y * image.height).toInt(),
        RgbColor.name('red'),
        thickness: 3);
  }

  static void drawAnnotations(Image image, List<Vertex> vertices) {
    for (var index = 0; index < vertices.length - 1; index++) {
      final vStart = vertices[index];

      final vStop = vertices[index + 1];

      image.drawLine(vStart.x, vStart.y, vStop.x, vStop.y, RgbColor.name('red'),
          thickness: 3);
    }

    image.drawLine(vertices.last.x, vertices.last.y, vertices.first.x,
        vertices.first.y, RgbColor.name('red'),
        thickness: 3);
  }

  static void drawText(Image image, int x, int y, String text) {
    image.drawString(x, y, text);
  }
}
