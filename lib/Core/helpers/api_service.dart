import 'package:alzilzal/core/errors/failures.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static Dio _dio = Dio(
    BaseOptions(
        //connectTimeout: 6000,
        //receiveTimeout: 6000,

        ),
  );

  // Singleton pattern to ensure a single instance of DioHelper
  static Dio get instance {
    _dio ??= Dio();
    return _dio;
  }

  // Function to perform GET request
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await instance.get(
        url,
        queryParameters: queryParameters,
        options: options,
      );
      addInterceptors();

      return response;
    } catch (error) {
      print(error);
      throw Failure(error.toString());
    }
  }

  // Function to perform POST request
  static Future<Response> postData({
    required String url,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final response = await instance.post(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
    addInterceptors();
    print(response.statusCode);
    print(response.data);
    return response;
  }

  // Function to perform PUT request
  static Future<Response> putData({
    required String url,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await instance.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      addInterceptors();

      return response;
    } catch (error) {
      print(error);
      throw Failure(error.toString());
    }
  }

  // Function to perform PATCH/UPDATE request
  static Future<Response> updateData({
    required String url,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await instance.patch(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      addInterceptors();

      return response;
    } catch (error) {
      print(error);
      throw Failure(error.toString());
    }
  }

  // Function to perform PATCH request
  static Future<Response> patchData({
    required String url,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await instance.patch(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      print(response.statusCode);
      print(response.data);
      addInterceptors();

      return response;
    } catch (error) {
      print(error);
      throw Failure(error.toString());
    }
  }

  static void addInterceptors() {
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
      ),
    );
  }
}
