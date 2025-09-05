import 'package:buy_buddy_user_app/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.authRepo}) : super(SignUpInitial());
  final AuthRepo authRepo;

  Future<void> signUp({
    required Map<String, dynamic> data,
  }) async {
    emit(SignUpLoadingState());
    final result = await authRepo.signUp(data: data);
    result.fold(
      (failure) {
        emit(SignUpFailureState(message: failure.message));
      },
      (userEntity) => emit(SignUpLoadedState()),
    );
  }
}
