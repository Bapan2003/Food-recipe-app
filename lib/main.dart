import 'package:Food/blocs/dashboard/dashboard_bloc.dart';
import 'package:Food/blocs/favourites/favourites_bloc.dart';
import 'package:Food/blocs/favourites/favourites_event.dart';
import 'package:Food/blocs/home/home_bloc.dart';
import 'package:Food/blocs/search/search_bloc.dart';
import 'package:Food/pages/dashboard/dashboard.dart';
import 'package:Food/pages/splash_screen.dart';
import 'package:Food/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'api/app_env/app_env.dart';
import 'blocs/details/meal_details_bloc.dart';

void main() {
  AppEnv.init(EnvironmentType.prod);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // for app orientation
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>DashboardBloc()),
          BlocProvider(create: (context)=>HomeBloc()),
          BlocProvider(create: (context)=>SearchBloc()),
          BlocProvider(create: (context)=>FavoritesBloc()..add(InitializeFavorites())),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Routes.generateRoute,
          initialRoute: SplashScreen.rootName,
        )
    );
  }
}

