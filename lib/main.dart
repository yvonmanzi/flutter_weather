import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweather/src/blocs/blocs.dart';

import './src/ui/app.dart';

void main() => runApp(BlocProvider<WeatherBloc>(
      create: (context) => WeatherBloc(),
      child: App(),
    ));
