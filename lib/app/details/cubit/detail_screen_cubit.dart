import 'package:bloc/bloc.dart';
import 'package:erp_demo/app/home/model/home_model.dart';
import 'package:erp_demo/utils/api/api_base.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'detail_screen_state.dart';

class DetailScreenCubit extends Cubit<DetailScreenState> {
  DetailScreenCubit() : super(DetailScreenInitial());

  final ApiBase _apiBase = ApiBase();

  void putDetailScreen({
    required BuildContext context,
    required String id,
    required String name,
    required String address,
    required String city,
  }) async {
    final parameters = {
      "id": id,
      "name": name,
      "address": address,
      "city": city,
    };
    try {
      emit(DetailScreenLoading());
      await _apiBase.put(
        'https://6621f6e427fcd16fa6c85955.mockapi.io/MockAPi/$id',
        parameters,
        (data) {
          emit(DetailScreenSuccess());
          var response = HomeModel.fromJson(data);
          emit(DetailScreenLoaded(homeModel: response));
        },
        (error) {
          emit(DetailScreenError(errorMessage: error));
        },
      );
    } catch (e) {
      emit(DetailScreenError(errorMessage: e.toString()));
    }
  }
}