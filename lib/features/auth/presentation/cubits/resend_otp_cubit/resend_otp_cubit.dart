import 'package:buy_buddy_user_app/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'resend_otp_state.dart';

class ResendVerifyOtpCubit extends Cubit<ResendVerifyOtpState> {
  ResendVerifyOtpCubit({required this.authRepo})
    : super(ResendVerifyOtpInitial());

  final AuthRepo authRepo;

  Future<void> resendOtp({required String email}) async {
    emit(ResendVerifyOtpLoadingState());
    final result = await authRepo.resendVerifyOtp(email: email);
    result.fold((failure) {
      emit(ResendVerifyOtpFailureState(message: failure.message));
    }, (_) => emit(ResendVerifyOtpLoadedState()));
  }
}
