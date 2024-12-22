import 'package:dio/dio.dart';

abstract class MasterDataInterface {
  Future<Response?> getCategories();
  Future<Response?> getCities();
}