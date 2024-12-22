import 'package:dio/dio.dart';

abstract class RealestateInterface {
  Future<Response?> getRealestateList(
    int pageKey,
    int pageSize,
    String? cityId,
    String? subCategoryId,
    String? offerType
  );

  Future<Response?> getRealestateDetails(String id);
}