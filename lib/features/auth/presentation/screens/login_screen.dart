import 'dart:developer';

import 'package:buy_buddy_user_app/core/custom/custom_modal_progress_hud.dart';
import 'package:buy_buddy_user_app/core/helpers/show_custom_snack_bar.dart';
import 'package:buy_buddy_user_app/core/services/get_it_service.dart';
import 'package:buy_buddy_user_app/core/utils/app_routes.dart';
import 'package:buy_buddy_user_app/features/auth/domain/repos/auth_repo.dart';
import 'package:buy_buddy_user_app/features/auth/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:buy_buddy_user_app/features/auth/presentation/widgets/login_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(authRepo: getIt<AuthRepo>()),
      child: Scaffold(body: const LoginBlocConsumerBody()),
    );
  }
}

class LoginBlocConsumerBody extends StatelessWidget {
  const LoginBlocConsumerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInFailureState) {
          if (state.message !=
              "user is not active. Please go and verify your email") {
            showCustomSnackBar(context, state.message);
          } else {
            Navigator.pushNamed(context, Routes.verifyOtpScreen);
          }
        } else if (state is SignInLoadedState) {
          log("account successfully logged in");
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.homeScreen,
            (Route<dynamic> route) => false,
          );
        }
      },
      builder: (context, state) {
        return CustomModalProgressHUD(
          inAsyncCall: state is SignInLoadingState,
          child: const LoginBody(),
        );
      },
    );
  }
}
