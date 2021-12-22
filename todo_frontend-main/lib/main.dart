import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/views/todo_homeView.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:device_preview/device_preview.dart';
//import 'package:todo_app/views/todo_homeView.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            //textStyle: MaterialStateProperty.all<TextStyle>(),
          ),
        ),
        dividerTheme: DividerThemeData(
          color: Colors.black,
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
            size: 25,
          ),
          backgroundColor: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme.copyWith(
                bodyText1: TextStyle(color: Colors.black, fontSize: 20),
                bodyText2: TextStyle(color: Colors.grey[600], fontSize: 15),
                headline1: TextStyle(color: Colors.black, fontSize: 15),
                headline2: TextStyle(fontSize: 20, color: Colors.black),
              ),
        ),
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Colors.blue),
      ),
      darkTheme: ThemeData.dark().copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
          // style: ButtonStyle(backgroundColor: Colors.white)
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
        ),
        // textButtonTheme: const TextButtonThemeData(
        //   style: ButtonStyle(
        //    // backgroundColor: MaterialStateProperty.all(Color(0xFFFFFFFF)),
        //   )
        // ),
        dividerTheme: const DividerThemeData(
          color: Colors.white,
        ),
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Colors.white),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white,
            size: 25,
          ),
          backgroundColor: Colors.black,
        ),
        scaffoldBackgroundColor: Colors.black,
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme.copyWith(
                bodyText1: TextStyle(color: Colors.white, fontSize: 20),
                bodyText2: TextStyle(color: Colors.grey, fontSize: 15),
                headline1: TextStyle(color: Colors.white, fontSize: 15),
                headline2: TextStyle(fontSize: 20, color: Colors.white),
              ),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const HomeView(),
    );
  }
}
