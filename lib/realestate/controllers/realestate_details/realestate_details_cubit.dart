import 'package:baity_app/home/utils/repositories/realestate_repository.dart';
import 'package:baity_app/realestate/models/realestate_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
part 'realestate_details_state.dart';

class RealestateDetailsCubit extends Cubit<RealestateDetailsState> {
  RealestateDetailsCubit() : super(RealestateDetailsInitial());

  final RealestateRepository realestateRepository = RealestateRepository();
  RealestateDetailsModel? realestateDetailsModel;

  Future<void> getRealestateDetails(String id) async {
    emit(RealestateDetailsLoading());
    Response? response;
    try {
      response = await realestateRepository.getRealestateDetails(id);
    } catch (e) {
      emit(RealestateDetailsError());
    }

    if( response != null && response.statusCode == 200 ) {
      realestateDetailsModel = RealestateDetailsModel.fromJson(response.data);
      emit(RealestateDetailsDone());
    } else{
      emit(RealestateDetailsError());
    }

  }
}
