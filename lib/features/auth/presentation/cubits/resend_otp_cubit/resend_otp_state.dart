part of 'resend_otp_cubit.dart';

abstract class ResendVerifyOtpState {}

final class ResendVerifyOtpInitial extends ResendVerifyOtpState {}

final class ResendVerifyOtpLoadingState extends ResendVerifyOtpState {}

final class ResendVerifyOtpLoadedState extends ResendVerifyOtpState {}

final class ResendVerifyOtpFailureState extends ResendVerifyOtpState {
  final String message;
  ResendVerifyOtpFailureState({required this.message});
}
