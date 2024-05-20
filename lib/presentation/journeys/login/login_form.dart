import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tb_movie_app/common/constants/enums.dart';
import 'package:tb_movie_app/common/constants/route_constants.dart';
import 'package:tb_movie_app/common/constants/translation_constants.dart';
import 'package:tb_movie_app/common/extensions/string_extension.dart';
import 'package:tb_movie_app/presentation/blocs/login/login_bloc.dart';
import 'package:tb_movie_app/presentation/journeys/login/label_field_widget.dart';
import 'package:tb_movie_app/presentation/theme/app_text.dart';
import 'package:tb_movie_app/presentation/widget/custom_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController _userNameController, _passwordController;
  bool enableSignIn = false;

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController();
    _passwordController = TextEditingController();

    _userNameController.addListener(() {
      setState(() {
        enableSignIn = _userNameController.text.isNotEmpty && _passwordController.text.isNotEmpty;
      });
    });
    _passwordController.addListener(() {
      setState(() {
        enableSignIn = _userNameController.text.isNotEmpty && _passwordController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _userNameController.clear();
    _passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: 30.w,
        vertical: 24.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: 10.h,
            ),
            child: Text(
              TranslationConstants.loginToMovieApp.langTranslate(context),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          LabelFieldWidget(
            label: TranslationConstants.username.langTranslate(context),
            hintText: TranslationConstants.enterTMDbUsername.langTranslate(context),
            controller: _userNameController,
          ),
          SizedBox(
            height: 20.h,
          ),
          LabelFieldWidget(
            label: TranslationConstants.password.langTranslate(context),
            hintText: TranslationConstants.enterPassword.langTranslate(context),
            controller: _passwordController,
            isPasswordField: true,
          ),
          SizedBox(
            height: 20.h,
          ),
          BlocConsumer<LoginBloc, LoginState>(
            buildWhen: (previous, current) => current.networkStatus == NetworkStatus.failure,
            builder: (context, state) {
              if(state.networkStatus==NetworkStatus.failure){
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      state.errorMessage.langTranslate(context),
                      style: Theme.of(context).textTheme.orangeSubtitle1,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
            listenWhen: (previous, current) => current.networkStatus == NetworkStatus.success,
            listener: (context, state){
              Navigator.of(context).pushNamedAndRemoveUntil(RouteList.home, (route) => false);
            },
          ),
          CustomButton(
            onPressed: () {
              if (enableSignIn) {
                BlocProvider.of<LoginBloc>(context).add(
                  LoginInitiateEvent(
                    _userNameController.text,
                    _passwordController.text,
                  ),
                );
              }
            },
            text: TranslationConstants.signIn,
            isEnabled: enableSignIn,
          ),
        ],
      ),
    );
  }
}
