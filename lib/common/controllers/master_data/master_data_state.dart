part of 'master_data_cubit.dart';

sealed class MasterDataState {}

final class MasterDataInitial extends MasterDataState {}
final class MasterDataLoading extends MasterDataState {}
final class MasterDataDone extends MasterDataState {}
final class MasterDataError extends MasterDataState {}
