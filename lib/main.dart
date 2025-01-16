import 'package:Food/blocs/dashboard/dashboard_bloc.dart';
import 'package:Food/blocs/home/home_bloc.dart';
import 'package:Food/pages/dashboard/dashboard.dart';
import 'package:Food/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'api/app_env/app_env.dart';

void main() {
  AppEnv.init(EnvironmentType.prod);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>DashboardBloc()),
          BlocProvider(create: (context)=>HomeBloc()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Routes.generateRoute,
          initialRoute: DashboardPageScreen.rootName,
        )
    );
  }
}

