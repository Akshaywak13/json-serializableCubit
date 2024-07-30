
part of'delete_cubit.dart';
abstract class DeleteState {
  final HomeModel? homeModel;
  DeleteState({this.homeModel});
}

class DeleteInital extends DeleteState {
  DeleteInital({super.homeModel});
}

class DeleteLoading extends DeleteState {}

class DeleteSuccess extends DeleteState {}

class DeleteLoadded extends DeleteState {
  DeleteLoadded({super.homeModel});
}

class DeleteError extends DeleteState {
  final String? errorMessage;
  DeleteError({this.errorMessage});
}
