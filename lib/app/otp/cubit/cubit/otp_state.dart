part of 'otp_cubit.dart';

@immutable
sealed class OtpState {}

final class OtpInitial extends OtpState {}

final class OtpInprogress extends OtpState {}

final class OtpSuccess extends OtpState {}

final class OtpVerifying extends OtpState {}

final class OtpError extends OtpState {
  final String? errorMessage;
  OtpError({this.errorMessage});
}
