import 'package:buy_buddy_user_app/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required this.authRepo}) : super(SignInInitial());

  final AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SignInLoadingState());
    final result = await authRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold((failure) {
      emit(SignInFailureState(message: failure.message));
    }, (_) => emit(SignInLoadedState()));
  }

  // TODO: sign in with google
}
