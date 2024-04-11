import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sanchit_portfolio/constants.dart';
import 'package:sanchit_portfolio/modals/prov.dart';
import 'package:sanchit_portfolio/screens/home/home_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeModeProv(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final thmode = Provider.of<ThemeModeProv>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sanchit Saran Portfolio',
      theme: ThemeData(
        brightness: thmode.lightMode ? Brightness.dark : Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        canvasColor: bgColor,
        textTheme: thmode.lightMode
            ? GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                .apply(bodyColor: Colors.white)
                .copyWith(
                  bodyText1: TextStyle(color: bodyTextColor),
                  bodyText2: TextStyle(color: bodyTextColor),
                )
            : GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                .apply(bodyColor: Colors.black)
                .copyWith(
                  bodyText1: TextStyle(color: bodyTextColor),
                  bodyText2: TextStyle(color: bodyTextColor),
                ),
      ),
      home: HomeScreen(),
    );
  }
} /* return MaterialApp(ff
      debugShowCheckedModeBanner: false,
      title: 'Sanchit Saran Portfolio',
      // we are using dark theme and we modify it as our need
      theme: ThemeData.dark().copyWith(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        canvasColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white)
            .copyWith(
          bodyText1: TextStyle(color: bodyTextColor),
          bodyText2: TextStyle(color: bodyTextColor),
        ),
      ),
      home: HomeScreen(),
    );*/
