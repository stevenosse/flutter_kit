import 'package:dio/dio.dart';

class ExampleApi {
  final Dio dio;

  ExampleApi({required this.dio});

  Future<String> getExample() async {
    await Future.delayed(const Duration(seconds: 2));
    return 'Example';
  }
}
