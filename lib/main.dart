import 'package:covid19app/providers/countries_provider.dart';
import 'package:covid19app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CountriesProvider()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            // inputDecorationTheme: const InputDecorationTheme(
            //   border: OutlineInputBorder(
            //     borderSide: BorderSide(color: Colors.grey, width: 1.0),
            //   ),
            //   enabledBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.all(Radius.circular(4)),
            //       borderSide: BorderSide(width: 1, color: Colors.black)),
            //   helperStyle: TextStyle(
            //     fontFamily: 'Roboto',
            //     fontSize: 16,
            //     color: Color(0xff8d8d8d),
            //   ),
            //   prefixIconColor: Colors.black,
            // )
          ),
          home: HomeScreen(),
        ));
  }
}
