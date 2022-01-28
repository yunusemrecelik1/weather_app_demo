import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app_demo/core/base/view/base_widget.dart';
import 'package:weather_app_demo/core/constants/image/svg_constants.dart';
import 'package:weather_app_demo/core/extension/context_extension.dart';
import 'package:weather_app_demo/core/init/theme/color_palette.dart';
import 'package:weather_app_demo/view/auth/onboard/viewmodel/onboard_view_model.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
      viewModel: OnBoardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, OnBoardViewModel value) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  flex: 7,
                  child: Padding(
                    padding: context.paddingNormal,
                    child: SvgPicture.asset(SvgConstants.instance.onBoardBackground),
                  )),
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: context.paddingMediumHorizontal,
                    child: Column(
                      children: [
                        Padding(
                          padding: context.paddingNormal,
                          child: Container(
                            width: context.width,
                            decoration: BoxDecoration(
                              color: ColorPalette.instance.mainColor,
                              borderRadius: context.borderLowAll,
                            ),
                            child: TextButton(
                              child: const Text(
                                "Üye ol",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: value.navigateRegister,
                            ),
                          ),
                        ),
                        Padding(
                          padding: context.paddingNormal,
                          child: Container(
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
                              onPressed: value.navigateLogin,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
