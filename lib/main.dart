import 'package:catfacts/network/dio_helper.dart';
import 'package:catfacts/screens/home_cubit.dart';
import 'package:catfacts/screens/home_screen.dart';
import 'package:catfacts/screens/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => HomeCubit()..getFacts())],
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.brown,
            ),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
