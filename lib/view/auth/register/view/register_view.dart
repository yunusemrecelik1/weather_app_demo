import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app_demo/core/base/view/base_widget.dart';
import 'package:weather_app_demo/core/constants/image/svg_constants.dart';
import 'package:weather_app_demo/core/extension/context_extension.dart';
import 'package:weather_app_demo/core/init/theme/color_palette.dart';
import 'package:weather_app_demo/view/auth/register/viewmodel/register_view_model.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterViewModel>(
      viewModel: RegisterViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, RegisterViewModel value) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              buildWeatherImage(context),
              buildBody(context, value),
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildWeatherImage(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Padding(
          padding: context.paddingNormal,
          child: SvgPicture.asset(SvgConstants.instance.registerBackground),
        ));
  }

  Widget buildBody(BuildContext context, RegisterViewModel model) {
    return Expanded(
      flex: 8,
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
            child: Form(
              key: model.formState,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  buildLoginHeaderText(context),
                  const Spacer(flex: 2),
                  buildFullNameFormField(context, model),
                  const Spacer(flex: 1),
                  buildMailFormField(context, model),
                  const Spacer(flex: 1),
                  buildPasswordFormField(context, model),
                  const Spacer(flex: 1),
                  buildPasswordAgainFormField(context, model),
                  const Spacer(flex: 2),
                  buildRegisterButton(context, model),
                  const Spacer(flex: 3),
                  buildLoginText(model),
                  const Spacer(flex: 3),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Text buildLoginHeaderText(BuildContext context) {
    return Text(
      "Kayıt Ol",
      style: context.textTheme.headline5?.copyWith(fontWeight: FontWeight.w700),
    );
  }

  TextFormField buildFullNameFormField(BuildContext context, RegisterViewModel model) {
    return TextFormField(
      cursorColor: ColorPalette.instance.appDarkGray,
      controller: model.fullNameController,
      decoration: InputDecoration(
        labelText: 'İsim Soyisim',
        labelStyle: TextStyle(color: ColorPalette.instance.appDarkGray),
        fillColor: Colors.white,
        filled: true,
        prefixIcon: Icon(
          Icons.person,
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

  TextFormField buildMailFormField(BuildContext context, RegisterViewModel model) {
    return TextFormField(
      cursorColor: ColorPalette.instance.appDarkGray,
      controller: model.emailController,
      validator: (val) => val!.isEmpty || !val.contains("@")
          ? "geçerli email adresi giriniz"
          : null,
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

  TextFormField buildPasswordFormField(BuildContext context, RegisterViewModel model) {
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
            model.isLockOpen ? Icons.visibility_off_outlined : Icons.visibility,
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

  TextFormField buildPasswordAgainFormField(BuildContext context, RegisterViewModel model) {
    return TextFormField(
      obscureText: model.isSecondLockOpen,
      cursorColor: ColorPalette.instance.appDarkGray,
      controller: model.passwordAgainController,
      decoration: InputDecoration(
        labelText: 'Şifre Tekrar',
        labelStyle: TextStyle(color: ColorPalette.instance.appDarkGray),
        fillColor: Colors.white,
        filled: true,
        suffixIcon: IconButton(
          onPressed: () {
            model.changeSecondPasswordLock();
          },
          icon: Icon(
            model.isSecondLockOpen ? Icons.visibility_off_outlined : Icons.visibility,
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

  Container buildRegisterButton(BuildContext context, RegisterViewModel model) {
    return Container(
      width: context.width,
      decoration: BoxDecoration(
        color: ColorPalette.instance.mainColor,
        borderRadius: context.borderLowAll,
      ),
      child: TextButton(
        child: const Text(
          "Üye Ol",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: model.isLoading
            ? null
            : () {
                model.fetchRegisterService();
              },
      ),
    );
  }

  Widget buildLoginText(RegisterViewModel model) => InkWell(
        onTap: model.navigateLogin,
        child: const Text("Zaten üyeyim"),
      );
}
