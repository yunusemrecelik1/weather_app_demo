import 'package:flutter/material.dart';
import 'package:weather_app_demo/core/base/view/base_widget.dart';
import 'package:weather_app_demo/view/home/home_screen/viewmodel/home_view_model.dart';
import 'package:weather_app_demo/core/extension/context_extension.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, HomeViewModel value) => Scaffold(
      body: Center(
        child: value.isLoading ? const CircularProgressIndicator.adaptive() :
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Lokasyon:",style: context.textTheme.headline5,),
                Text(value.geoResponseModel?.LocalizedName ?? "",style: context.textTheme.headline5,),
              ],
            ),
            ListView.builder(
              itemCount: value.model?.DailyForecasts?.length,
              shrinkWrap: true,
              itemBuilder: (context,index){
                return Center(
                  child: ListTile(
                    leading: const Icon(Icons.wb_cloudy),
                    title: Row(
                      children: [
                        const Text("Tarih -"),
                        Text(value.model?.DailyForecasts?[index].Date ?? ""),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Maksimum sıcaklık"),
                        Row(
                          children: [
                            Text(value.model?.DailyForecasts?[index].Temperature?.Maximum?.Value.toString() ?? ""),
                            const Text(" "),
                            Text(value.model?.DailyForecasts?[index].Temperature?.Maximum?.Unit.toString() ?? "")
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      ),
    );
  }
}
