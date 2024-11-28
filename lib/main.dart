import 'package:bloc_clean_architecture/config/routes/routes.dart';
import 'package:bloc_clean_architecture/config/routes/routes_name.dart';
import 'package:bloc_clean_architecture/repository/auth/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';


GetIt getIt = GetIt.instance;

void main() {
  appBindings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: Routes.generatedRoute,
    );
  }
}

void appBindings(){
  getIt.registerLazySingleton<LoginRepository>(()=>LoginRepository());
}


