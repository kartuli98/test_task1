import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_to_do/config/theme/colors.dart';
import 'package:test_to_do/core/constants/constants.dart';
import 'package:test_to_do/presentation/pages/base_page.dart';
import 'package:test_to_do/presentation/pages/login_screen/login_cubit.dart';
import 'package:test_to_do/presentation/widgets/common_widgets/screen_button.dart';

import '../../../config/routes/app_route.dart';
import '../../../core/di/dependency_provider.dart';
import '../../../core/navigation/app_navigator.dart';
import '../../../domain/entities/todo_model.dart';
import 'login_state.dart';

class LoginScreen extends BasePage<LoginState, LoginCubit> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginCubit createBloc() => DependencyProvider.get<LoginCubit>();

  @override
  initBloc(LoginCubit bloc) {
    bloc.init();
  }

  @override
  Widget buildPage(BuildContext context, LoginCubit bloc, LoginState state) {
    final appNavigator = DependencyProvider.get<AppNavigator>();
    return Scaffold(
      body: Center(
        child: Container(
          decoration: mainGradient,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: 250,
                child: ScreenButton(
                  onTap:  bloc.navigateMainScreen,
                  color: AppColorScheme.colorGold,
                  width: 108,
                  height: 50,
                  radius: 15.0,
                  text: 'Вхід',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

