import 'package:bloc/bloc.dart';
import 'package:erp_demo/utils/api/api_base.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  ApiBase _apiBase = ApiBase();

  Future<void> loginData ({
    required String phoneNumber,
    // int groupId,
  }) async {
    try {
      final parameters = {
        "phoneNumber": phoneNumber,
        //"groupId":groupId
         "groupId": 1703228300417,
      };
      await _apiBase.post(
          'https://gxppcdmn7h.execute-api.ap-south-1.amazonaws.com/authgw/sendotp',
          parameters,
          (data) {}, (error) {
        emit(LoginError(errorMessage: error));
      });
    } catch (e) {
      emit(LoginError(errorMessage: e.toString()));
    }
  }
}
