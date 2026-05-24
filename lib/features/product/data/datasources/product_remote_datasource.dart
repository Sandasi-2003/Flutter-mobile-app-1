import 'package:dio/dio.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_endpoints.dart';

class ProductRemoteDataSource {
  const ProductRemoteDataSource({required this.apiClient});

  static const int initialLimit = 30;

  final ApiClient apiClient;

  Future<Map<String, dynamic>> getProducts() async {
    final Response<dynamic> response = await apiClient.get<dynamic>(
      ApiEndpoints.products,
      queryParameters: const {'limit': initialLimit},
    );

    return Map<String, dynamic>.from(response.data as Map<dynamic, dynamic>);
  }
}
