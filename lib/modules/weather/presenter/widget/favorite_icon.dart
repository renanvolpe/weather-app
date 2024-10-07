import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/style/app_color.dart';
import '../../data/model/weather_model/weather_model.dart';
import '../state/bloc/delete_weather_local/delete_weather_local_bloc.dart';
import '../state/bloc/get_list_weather_local/get_list_weather_information_local_bloc.dart';
import '../state/bloc/post_weather_local/post_weather_local_bloc.dart';

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({
    super.key,
    required this.weatherModel,
  });

  final WeatherModel weatherModel;

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  @override
  Widget build(BuildContext context) {
    bool isFavorite = widget.weatherModel.id != null;
    PostWeatherLocalBloc postWeatherLocalBloc = Modular.get<PostWeatherLocalBloc>();
    DeleteWeatherLocalBloc deleteWeatherLocalBloc = Modular.get<DeleteWeatherLocalBloc>();
    return MultiBlocListener(
      listeners: [
        BlocListener<PostWeatherLocalBloc, PostWeatherLocalState>(
          bloc: postWeatherLocalBloc,
          listener: (context, state) {
            if (state is PostWeatherLocalSuccess) {
              Modular.get<GetListWeatherLocalBloc>().add(GetListWeatherLocalStarted());
              widget.weatherModel.id = state.id;
            }
          },
        ),
        BlocListener<DeleteWeatherLocalBloc, DeleteWeatherLocalState>(
          bloc: deleteWeatherLocalBloc,
          listener: (context, state) {
            if (state is DeleteWeatherLocalSuccess) {
              Modular.get<GetListWeatherLocalBloc>().add(GetListWeatherLocalStarted());
              widget.weatherModel.id = null;
            }
          },
        ),
      ],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          StatefulBuilder(builder: (context, setState) {
            return IconButton(
                onPressed: () {
                  if (!isFavorite) {
                    postWeatherLocalBloc.add(PostWeatherLocalStarted(widget.weatherModel));
                    setState(() => isFavorite = !isFavorite);
                  } else {
                    //just will has id when it from local value
                    deleteWeatherLocalBloc.add(DeleteWeatherLocalStarted(widget.weatherModel.id!));
                    setState(() => isFavorite = !isFavorite);
                  }
                },
                icon: isFavorite
                    ? const Icon(Icons.favorite, color: Colors.red)
                    : const Icon(Icons.favorite_border, color: AppColor.kPrimaryDark));
          })
        ],
      ),
    );
  }
}
