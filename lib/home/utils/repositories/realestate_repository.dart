import 'dart:developer';
import 'package:baity_app/common/utils/global.dart';
import 'package:baity_app/common/utils/interfaces/http_request_interface.dart';
import 'package:baity_app/home/utils/interfaces/realestate_interface.dart';
import 'package:dio/dio.dart';

class RealestateRepository implements RealestateInterface {

  HttpRequestInterFace httpRequest = locator.get<HttpRequestInterFace>();
  
  @override
  Future<Response?> getRealestateList(
    int pageKey,
    int pageSize,
    String? cityId,
    String? subCategoryId,
    String? offerType
  ) async {
    try {
      return await httpRequest.get(path: "/client/Realestate?PageNumber=$pageKey&PageSize=$pageSize&CityId=${cityId??""}&SubCategoryId=${subCategoryId??""}&OfferType=${offerType??""}");
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
  
  @override
  Future<Response?> getRealestateDetails(String id) async {
    try {
      return await httpRequest.get(path: "/client/Realestate/$id");
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
  
}