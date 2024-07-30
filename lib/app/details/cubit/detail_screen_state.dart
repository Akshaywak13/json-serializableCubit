part of 'detail_screen_cubit.dart';

@immutable
sealed class DetailScreenState {
  final HomeModel? homeModel;
  DetailScreenState({this.homeModel});
}

final class DetailScreenInitial extends DetailScreenState {
  DetailScreenInitial({super.homeModel});
}

final class DetailScreenLoading extends DetailScreenState {
  DetailScreenLoading({super.homeModel});
}

final class DetailScreenLoaded extends DetailScreenState {
  DetailScreenLoaded({super.homeModel});
}

final class DetailScreenError extends DetailScreenState {
  final String? errorMessage;
  DetailScreenError({this.errorMessage});
}

final class DetailScreenSuccess extends DetailScreenState {
  DetailScreenSuccess();
}
