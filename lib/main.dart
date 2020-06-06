import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweather/src/blocs/blocs.dart';

import './src/ui/app.dart';

void main() => runApp(BlocProvider<WeatherBloc>(
//  usually, i think, this is where you inject dependencies. so maybe refactor this later.
      create: (context) => WeatherBloc(),
      child: App(),
    ));
