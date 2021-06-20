import 'package:yt/yt.dart';

void main() async {
  final yt = Yt.withJwt('example/skc-live-decbd0969cbb.json',
      'https://www.googleapis.com/auth/cloud-vision');

  final vision = await yt.vision;

  final image = Image.fromFilePath('example/no-mask.jpg');

  final cropped = image.copyCrop(1060, 410, 460, 340);

  // await cropped.writeAsJpeg('example/cropped.jpg');

  final requests = AnnotationRequests(requests: [
    AnnotationRequest(image: cropped, features: [
      Feature(maxResults: 10, type: DetectionType.FACE_DETECTION.value),
      Feature(maxResults: 10, type: DetectionType.OBJECT_LOCALIZATION.value)
    ])
  ]);

  print('checking...');

  AnnotatedResponses annotatedResponses =
      await vision.annotate(requests: requests);

  print('done.\n');

  annotatedResponses.responses.forEach((annotatedResponse) =>
      annotatedResponse.faceAnnotations?.forEach((faceAnnotation) {
        Vision.drawText(
            cropped,
            faceAnnotation.boundingPoly.vertices.first.x + 2,
            faceAnnotation.boundingPoly.vertices.first.y + 2,
            'Face - ${faceAnnotation.detectionConfidence}');

        Vision.drawAnnotations(cropped, faceAnnotation.boundingPoly.vertices);
        // print('confidence: ${faceAnnotation.detectionConfidence}')
      }));

  annotatedResponses.responses.forEach((annotatedResponse) => annotatedResponse
          .localizedObjectAnnotations
          ?.where((localizedObjectAnnotation) =>
              localizedObjectAnnotation.name == 'Person')
          .toList()
          .forEach((localizedObjectAnnotation) {
        Vision.drawText(
            cropped,
            (localizedObjectAnnotation.boundingPoly.normalizedVertices.first.x *
                    cropped.width)
                .toInt(),
            (localizedObjectAnnotation.boundingPoly.normalizedVertices.first.y *
                        cropped.height)
                    .toInt() -
                16,
            'Person - ${localizedObjectAnnotation.score}');
        Vision.drawAnnotationsNormalized(
            cropped, localizedObjectAnnotation.boundingPoly.normalizedVertices);
        // print(
        //     'name: ${localizedObjectAnnotation.name}, score: ${localizedObjectAnnotation.score}')
      }));

  await cropped.writeAsJpeg('example/debugImage.jpg');
}
