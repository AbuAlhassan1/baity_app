import 'dart:convert';
import 'package:baity_app/home/models/realestate_list_model.dart';
import 'package:bloc/bloc.dart';
import 'package:baity_app/common/utils/global.dart';
import 'package:baity_app/home/utils/interfaces/realestate_interface.dart';
import 'package:dio/dio.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final RealestateInterface realestateRepository = locator.get<RealestateInterface>();
  RealestateListModel? realestateList;

  Future<List<RealestateItemModel>?> getRealestateList(
    int pageKey,
    int pageSize,
    String? cityId,
    String? subCategoryId,
    String? offerType
  ) async {
    emit(HomeLoading());
    
    Response? response;

    try {
      response = await realestateRepository.getRealestateList(pageKey, pageSize, cityId, subCategoryId, offerType);
    } catch (e) {
      emit(HomeError(e.toString()));
      return null;
    }

    if( response != null && response.statusCode == 200) {
      realestateList = realestateListModelFromJson(jsonEncode(response.data));
      emit(HomeLoaded());
      return realestateList!.payload;
    } else {
      emit(HomeError("Failed to load data"));
      return null;
    }
  }

}
