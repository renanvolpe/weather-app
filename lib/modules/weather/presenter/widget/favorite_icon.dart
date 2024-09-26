import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/style/app_color.dart';
import '../../data/model/weather_model/weather_model.dart';
import '../state/bloc/get_list_weather_local/get_list_weather_information_local_bloc.dart';
import '../state/bloc/post_weather_local/post_weather_local_bloc.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({
    super.key,
    required this.weatherModel,
  });

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    bool isFavorite = false;
    PostWeatherLocalBloc postWeatherLocalBloc = Modular.get<PostWeatherLocalBloc>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        StatefulBuilder(builder: (context, setState) {
          return IconButton(
              onPressed: () {
                if (!isFavorite) {
                  postWeatherLocalBloc.add(PostWeatherLocalStarted(weatherModel));
                  Modular.get<GetListWeatherLocalBloc>().add(GetListWeatherLocalStarted());
                  setState(() => isFavorite = !isFavorite);
                }
              },
              icon: isFavorite
                  ? const Icon(Icons.favorite, color: Colors.red)
                  : const Icon(Icons.favorite_border, color: AppColor.kPrimaryDark));
        })
      ],
    );
  }
}
