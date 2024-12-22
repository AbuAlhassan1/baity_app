import 'dart:developer';
import 'package:baity_app/common/utils/global.dart';
import 'package:baity_app/common/utils/interfaces/http_request_interface.dart';
import 'package:baity_app/common/utils/interfaces/master_data_interface.dart';
import 'package:dio/dio.dart';

class MasterDataRepository implements MasterDataInterface {
  final HttpRequestInterFace httpRequest = locator.get<HttpRequestInterFace>();

  @override
  Future<Response?> getCategories() async {
    try {
      return await httpRequest.get(path: "/dashboard/Category");
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<Response?> getCities() async {
    try {
      return await httpRequest.get(path: "/v1/dashboard/City");
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
  
}