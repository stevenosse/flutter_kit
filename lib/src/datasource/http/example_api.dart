import 'package:dio/dio.dart';

class ExampleApi {
  final Dio dio;

  ExampleApi({required this.dio});

  Future<String> getExample() async {
    return 'Example';
  }
}
