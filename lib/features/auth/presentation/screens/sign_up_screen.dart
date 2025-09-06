import 'dart:developer';

import 'package:buy_buddy_user_app/core/custom/custom_modal_progress_hud.dart';
import 'package:buy_buddy_user_app/core/helpers/show_custom_snack_bar.dart';
import 'package:buy_buddy_user_app/core/services/get_it_service.dart';
import 'package:buy_buddy_user_app/core/utils/app_routes.dart';
import 'package:buy_buddy_user_app/features/auth/domain/repos/auth_repo.dart';
import 'package:buy_buddy_user_app/features/auth/presentation/cubits/signup_cubits/sign_up_cubit.dart';
import 'package:buy_buddy_user_app/features/auth/presentation/widgets/sign_up_body.dart';
import 'package:buy_buddy_user_app/translations/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(authRepo: getIt<AuthRepo>()),
      child: Scaffold(body: const SignUpBlocConsumerBody()),
    );
  }
}

class SignUpBlocConsumerBody extends StatelessWidget {
  const SignUpBlocConsumerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpFailureState) {
          showCustomSnackBar(context, state.message.tr());
        } else if (state is SignUpLoadedState) {
          log("account successfully created");
          showCustomSnackBar(context, LocaleKeys.messagesSuccessVerificationCodeSent.tr());
          Navigator.pushNamed(context, Routes.verifyOtpScreen);
        }
      },
      builder: (context, state) {
        return CustomModalProgressHUD(
          inAsyncCall: state is SignUpLoadingState,
          child: const SignUpBody(),
        );
      },
    );
  }
}
