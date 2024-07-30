
part of 'new_post_cubit.dart';

abstract class NewPostState{
  final HomeModel? homeModel;
  NewPostState({this.homeModel});
}
final class NewPostInitial extends NewPostState {}

final class NewPostSuccess extends NewPostState {}

final class NewPostLoadding extends NewPostState {}

final class NewPostError extends NewPostState {
  final String? errorMessage;
  NewPostError({this.errorMessage});
}