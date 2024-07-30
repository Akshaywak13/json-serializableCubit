import 'package:erp_demo/app/home/model/home_model.dart';
import 'package:erp_demo/utils/api/api_base.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_post_state.dart';

class NewPostCubit extends Cubit<NewPostState> {
  NewPostCubit() : super(NewPostInitial());
  ApiBase _apiBase = ApiBase();

  void newPostData({
    required String id,
    required String name,
    required String address,
    required String city,
  }) async {
    try {
      final parameters = {
        "id": id,
        "name": name,
        "address": address,
        "city": city,
      };
      emit(NewPostLoadding());
      await _apiBase.post(
          'https://6621f6e427fcd16fa6c85955.mockapi.io/MockAPi/$id', parameters,
          (data) {
        emit(NewPostSuccess());
      }, (error) {
        emit(NewPostError(errorMessage: error));
      });
    } catch (e) {
      emit(NewPostError(errorMessage: e.toString()));
    }
  }
}
