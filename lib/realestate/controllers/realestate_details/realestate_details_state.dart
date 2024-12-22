part of 'realestate_details_cubit.dart';

sealed class RealestateDetailsState {}

final class RealestateDetailsInitial extends RealestateDetailsState {}
final class RealestateDetailsLoading extends RealestateDetailsState {}
final class RealestateDetailsDone extends RealestateDetailsState {}
final class RealestateDetailsError extends RealestateDetailsState {}
