import 'package:bloc/bloc.dart';
import 'package:erp_demo/app/home/model/home_model.dart';
import 'package:erp_demo/utils/api/api_base.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'homepage_state.dart';

class HomepageCubit extends Cubit<HomepageState> {
  HomepageCubit() : super(HomepageInitial());
  ApiBase _apiBase = ApiBase();
  List<HomeModel> _allHomeData = [];
  
  void getHomepage() async {
    try {
      emit(HomepageLoading());
      _apiBase.get('https://6621f6e427fcd16fa6c85955.mockapi.io/MockAPi',
        (data) {
          try {
            _allHomeData = (data as List)
                .map((item) => HomeModel.fromJson(item))
                .toList();
            emit(HomepageLoaded(homeData: _allHomeData));
          } catch (jsonError) {
            emit(HomepageError(error: jsonError.toString()));
          }
        },
        (error) {
          emit(HomepageError(error: error.toString()));
        });
    } catch (e) {
      emit(HomepageError(error: e.toString()));
    }
  }

  void searchHomepage(String query) {
    if (query.isEmpty) {
      emit(HomepageLoaded(homeData: _allHomeData));
    } else {
      List<HomeModel> filteredData = _allHomeData
          .where((element) => element.name!.toLowerCase().contains(query.toLowerCase()) ||
                              element.address!.toLowerCase().contains(query.toLowerCase()) ||
                              element.city!.toLowerCase().contains(query.toLowerCase()))
          .toList();
      emit(HomepageLoaded(homeData: filteredData));
    }
  }
}
