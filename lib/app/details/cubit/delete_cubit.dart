
import 'package:erp_demo/app/home/model/home_model.dart';
import 'package:erp_demo/utils/api/api_base.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

part 'delete_state.dart';

class DeleteCubit extends Cubit<DeleteState>{
  DeleteCubit() : super(DeleteInital());
  final ApiBase _apiBase = ApiBase();
  void deleteData({required String id}) async{
    try{
      emit(DeleteLoading());
      await _apiBase.delete('https://6621f6e427fcd16fa6c85955.mockapi.io/MockAPi/$id',
       (data){
        final response = HomeModel.fromJson(data);
        emit(DeleteLoadded(homeModel: response));
        emit(DeleteSuccess());
       }, 
       (error){
        emit(DeleteError(errorMessage: error));
       });
    } catch (e){
      emit(DeleteError(errorMessage: e.toString()));
    }
  }
}