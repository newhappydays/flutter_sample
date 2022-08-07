import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../model/product.dart';

Dio asdasD() {
  final dio = Dio(
    BaseOptions(baseUrl: 'http://172.30.1.10:8080/products'),
  );
  ;
  return dio;
}

class SampleApi {
  late final Dio _dio;

  SampleApi()
      : _dio = asdasD();

  Future<void> getProducts() async {
    await _dio.get('');
  }
}
