import 'package:dio/dio.dart';

Options dioOption({
  Map<String, dynamic>? headers,
}) {
  return Options(
    followRedirects: false,
    validateStatus: (status) => true,
    headers: headers ??
        {
          "Access-Control-Allow-Origin": "*",
        },
    responseType: ResponseType.json,
    sendTimeout: 5000,
  );
}
