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
  Future<List<ProductsResponse>?> getProducts() async {
    try {
      final response = await api.get(Endpoints.products);
      print('Product response $response');
      final rawProducts = response.data['products'];
      final products = [] as List<ProductsResponse>;
      if (response.statusCode == StatusCodes.success) {
        for (var item in rawProducts) {
          products.add(ProductsResponse.fromJson(item));
        }
        print('Product list $products');
        return products;
      }
    } on DioException catch (e) {
      if (kDebugMode) print(e.response?.data);
      return null;
    }
    return null;
  }
}
