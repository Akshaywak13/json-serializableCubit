part of 'homepage_cubit.dart';

@immutable
sealed class HomepageState {
  List<HomeModel>? homeModel;
  HomepageState({this.homeModel});
}

final class HomepageInitial extends HomepageState {
  HomepageInitial({super.homeModel});
}
final class HomepageLoading extends HomepageState {
  HomepageLoading({super.homeModel});
}
class HomepageLoaded extends HomepageState {
  final List<HomeModel> homeData;
  HomepageLoaded({required this.homeData});
}
final class HomepageError extends HomepageState {
  final String? error;
  HomepageError({this.error});
}


