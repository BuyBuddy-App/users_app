import 'package:buy_buddy_user_app/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  VerifyOtpCubit({required this.authRepo}) : super(VerifyOtpInitial());
  final AuthRepo authRepo;

  Future<void> verifyOtp({required String email, required String code}) async {
    emit(VerifyOtpLoadingState());
    final result = await authRepo.verifyOtp(email: email, code: code);
    result.fold((failure) {
      emit(VerifyOtpFailureState(message: failure.message));
    }, (userEntity) => emit(VerifyOtpLoadedState()));
  }
}
