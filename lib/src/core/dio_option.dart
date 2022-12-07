import 'package:dio/dio.dart';

Options dioOption({
  Map<String, dynamic>? headers,
}) {
  return Options(
    followRedirects: false,
    validateStatus: (status) => true,
    headers: headers ?? {},
  );
}
