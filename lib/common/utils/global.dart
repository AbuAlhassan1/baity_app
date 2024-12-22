import 'package:baity_app/common/utils/interfaces/http_request_interface.dart';
import 'package:baity_app/common/utils/interfaces/master_data_interface.dart';
import 'package:baity_app/common/utils/interfaces/storage_interface.dart';
import 'package:baity_app/common/utils/repositories/http_request_repository.dart';
import 'package:baity_app/common/utils/repositories/master_data_repository.dart';
import 'package:baity_app/common/utils/repositories/secure_storage_repository.dart';
import 'package:baity_app/home/utils/interfaces/realestate_interface.dart';
import 'package:baity_app/home/utils/repositories/realestate_repository.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setup(){
  locator.registerLazySingleton<CachingInterFace>(() => CachingRepository());
  locator.registerLazySingleton<HttpRequestInterFace>(() => HttpRequestRepository());
  locator.registerLazySingleton<RealestateInterface>(() => RealestateRepository());
  locator.registerLazySingleton<MasterDataInterface>(() => MasterDataRepository());
}