import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app_demo/core/base/view/base_widget.dart';
import 'package:weather_app_demo/core/constants/image/svg_constants.dart';
import 'package:weather_app_demo/core/extension/context_extension.dart';
import 'package:weather_app_demo/core/init/theme/color_palette.dart';
import 'package:weather_app_demo/view/auth/login/viewmodel/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, LoginViewModel value) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [buildWeatherImage(context), buildBody(context, value)],
          ),
        ),
      ),
    );
  }

  Expanded buildWeatherImage(BuildContext context) {
    return Expanded(
        flex: 3,
        child: Padding(
          padding: context.paddingNormal,
          child: SvgPicture.asset(SvgConstants.instance.loginBackground),
        ));
  }

  Expanded buildBody(BuildContext context, LoginViewModel model) {
    return Expanded(
      flex: 7,
      child: Padding(
        padding: context.paddingNormalTop,
        child: Container(
          width: context.width,
          decoration: BoxDecoration(
            borderRadius: context.borderMediumTopLeftRight,
            color: ColorPalette.instance.appGray.withOpacity(0.4),
          ),
          child: Padding(
            padding: context.paddingMediumHorizontal,
            child: Column(
              children: [
                const Spacer(flex: 2),
                buildLoginHeaderText(context),
                const Spacer(flex: 2),
                buildMailFormField(context, model),
                const Spacer(flex: 1),
                buildPasswordFormField(context, model),
                const Spacer(flex: 3),
                buildLoginButton(context, model),
                const Spacer(flex: 3),
                buildNewUserText(model),
                const Spacer(flex: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text buildLoginHeaderText(BuildContext context) {
    return Text(
      "Giriş Yap",
      style: context.textTheme.headline5?.copyWith(fontWeight: FontWeight.w700),
    );
  }

  TextFormField buildMailFormField(BuildContext context, LoginViewModel model) {
    return TextFormField(
      cursorColor: ColorPalette.instance.appDarkGray,
      controller: model.emailController,
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(color: ColorPalette.instance.appDarkGray),
        fillColor: Colors.white,
        filled: true,
        prefixIcon: Icon(
          Icons.email,
          color: ColorPalette.instance.appDarkGray,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: context.borderLowAll,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: context.borderLowAll,
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField(BuildContext context, LoginViewModel model) {
    return TextFormField(
      obscureText: model.isLockOpen,
      cursorColor: ColorPalette.instance.appDarkGray,
      controller: model.passwordController,
      decoration: InputDecoration(
        labelText: 'Şifre',
        labelStyle: TextStyle(color: ColorPalette.instance.appDarkGray),
        fillColor: Colors.white,
        filled: true,
        suffixIcon: IconButton(
          onPressed: () {
            model.changeLock();
          },
          icon: Icon(
            Icons.visibility_off_outlined,
            color: ColorPalette.instance.appDarkGray,
          ),
        ),
        prefixIcon: Icon(
          Icons.lock,
          color: ColorPalette.instance.appDarkGray,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: context.borderLowAll,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: context.borderLowAll,
        ),
      ),
    );
  }

  Container buildLoginButton(BuildContext context, LoginViewModel model) {
    return Container(
      width: context.width,
      decoration: BoxDecoration(
        color: ColorPalette.instance.mainColor,
        borderRadius: context.borderLowAll,
      ),
      child: TextButton(
          child: const Text(
            "Giriş yap",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: model.isLoading
              ? null
              : () {
                  model.fetchLoginService();
                }),
    );
  }

  Widget buildNewUserText(LoginViewModel model) => InkWell(
        onTap: model.navigateRegister,
        child: const Text("Kayıt Ol"),
      );
}
