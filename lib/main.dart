import 'package:Tourism_app/view/screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'model/cubit/bloc.dart';
import 'model/itemProvider.dart';



void main() {
  // debugPaintSizeEnabled = true; // تفعيل حدود العناصر

  runApp(
    ChangeNotifierProvider(
      create: (context) => ItemProvider(),
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RecipeCubit>(
          create: (context) => RecipeCubit()..loadData(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFF5F5F5),
          appBarTheme: const AppBarTheme(
            color: Color(0xFFF5F5F5),
            elevation: 0.0,
            titleTextStyle: TextStyle(
              fontFamily: 'FontFamily1', // الخط الأول
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          textTheme: TextTheme(
            headlineLarge: TextStyle(
              fontFamily: 'FontFamily1', // الخط الأول للعناوين
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            bodyLarge: TextStyle(
              fontFamily: 'FontFamily2', // الخط الثاني للنصوص الكبيرة
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
            bodyMedium: TextStyle(
              fontFamily: 'FontFamily3', // الخط الثالث للنصوص المتوسطة
              fontSize: 16,
            ),
          ),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
