import 'package:baity_app/auth/utils/interfaces/auth_interface.dart';
import 'package:baity_app/auth/utils/repositories/auth_repository.dart';
import 'package:baity_app/common/utils/interfaces/http_request_interface.dart';
import 'package:baity_app/common/utils/interfaces/storage_interface.dart';
import 'package:baity_app/common/utils/repositories/http_request_repository.dart';
import 'package:baity_app/common/utils/repositories/secure_storage_repository.dart';
import 'package:baity_app/home/utils/interfaces/orders_interface.dart';
import 'package:baity_app/home/utils/repositories/orders_repository.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setup(){
  locator.registerLazySingleton<StorageInterFace>(() => SecureStorageRepository());
  locator.registerLazySingleton<HttpRequestInterFace>(() => HttpRequestRepository());
  locator.registerLazySingleton<AuthInterface>(() => AuthRepository());
  locator.registerLazySingleton<OrdersInterface>(() => OrdersRepository());
}