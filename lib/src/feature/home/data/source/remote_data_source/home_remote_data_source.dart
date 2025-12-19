import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopper_app/src/core/service/dio_api_service/api_service.dart';
import 'package:shopper_app/src/core/service/dio_api_service/interface/api_service_interface.dart';
import 'package:shopper_app/src/core/service/dio_api_service/status_code.dart';
import 'package:shopper_app/src/core/service/endpoints/endpoints.dart';
import 'package:shopper_app/src/feature/home/data/model/product_model.dart';

import 'package:shopper_app/src/feature/home/data/source/remote_data_source/i_home_remote_data_source.dart';

final homeRemoteDataSourceProvider =
    Provider.autoDispose<IHomeRemoteDataSource>(
  (ref) => HomeRemoteDataSource(api: ref.read(dioApiService)),
);

class HomeRemoteDataSource implements IHomeRemoteDataSource {
  HomeRemoteDataSource({required this.api});
  IApiService api;

  @override
  Future<List<Product>?> getProducts() async {
    try {
      final response = await api.get(Endpoints.products);

      final rawProducts = response.data['products'];
      final List<Product> products = [];

      if (response.statusCode == StatusCodes.success) {
        for (var item in rawProducts) {
          products.add(Product.fromJson(item));
        }
        return products;
      }
    } on DioException catch (e) {
      if (kDebugMode) print(e.response?.data);
      return null;
    }
    return null;
  }

  @override
  Future<void> updateProduct(Product product) async {
    try {
      final data = {
        "title": "Eyeshadow Palette with Mirror - Updated",
        "price": 29.99,
        "description": "Updated description",
      };

      final response = await api.put(
        Endpoints.productDetails('1'),
        data: data,
      );

      if (kDebugMode) {
        print('STATUS: ${response.statusCode}');
        print('RESPONSE: ${response.data}');
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print('DIO ERROR');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('MESSAGE: ${e.message}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('UNKNOWN ERROR: $e');
      }
    }
  }
}
