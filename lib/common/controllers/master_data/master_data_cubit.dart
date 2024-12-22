import 'dart:convert';

import 'package:baity_app/common/models/master_data/categories_model.dart';
import 'package:baity_app/common/models/master_data/cities_model.dart';
import 'package:baity_app/common/utils/global.dart';
import 'package:baity_app/common/utils/interfaces/master_data_interface.dart';
import 'package:baity_app/common/utils/interfaces/storage_interface.dart';
import 'package:baity_app/constants/secure_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

part 'master_data_state.dart';

class MasterDataCubit extends Cubit<MasterDataState> {
  MasterDataCubit() : super(MasterDataInitial());

  final MasterDataInterface masterDataRepository = locator.get<MasterDataInterface>();
  final CachingInterFace storage = locator.get<CachingInterFace>();
  CategoriesModel? categoriesModel;
  CitiesModel? citiesModel;

  Future<void> getCategories() async {
    String? categoriesJson = await storage.read(secureStorageCategories);

    if( categoriesJson != null ){
      categoriesModel = categoriesModelFromJson(categoriesJson);
      emit(MasterDataDone());
      return;
    }

    Response? response;
    try {
      emit(MasterDataLoading());
      response = await masterDataRepository.getCategories();
      if (response == null) {
        emit(MasterDataError());
        return;
      }
      emit(MasterDataDone());
    } catch (e) {
      emit(MasterDataError());
    }

    if (response != null && response.statusCode == 200) {
      categoriesModel = categoriesModelFromJson(jsonEncode(response.data));
      await storage.store(secureStorageCategories, jsonEncode(response.data));
    }
    emit(MasterDataDone());

  }

  Future<void> getCities() async {
    String? citiesJson = await storage.read(secureStorageCities);

    if( citiesJson != null ){
      citiesModel = citiesModelFromJson(citiesJson);
      emit(MasterDataDone());
      return;
    }

    Response? response;
    try {
      emit(MasterDataLoading());
      response = await masterDataRepository.getCities();
      if (response == null) {
        emit(MasterDataError());
        return;
      }
      emit(MasterDataDone());
    } catch (e) {
      emit(MasterDataError());
    }

    if (response != null && response.statusCode == 200) {
      citiesModel = citiesModelFromJson(jsonEncode(response.data));
      await storage.store(secureStorageCities, jsonEncode(response.data));
    }
    emit(MasterDataDone());

  }

}
