import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'SizeConfig.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: SafeArea(
              child: MyHomePage(title: 'Flutter Demo Home Page'),
            ));
      });
    });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(
                  left: 7 * SizeConfig.widthMultiplier,
                  top: 5 * SizeConfig.heightMultiplier),
              child: Icon(
                Icons.menu,
                color: Colors.black,
                size: 6 * SizeConfig.imageSizeMultiplier,
              )),
          Padding(
              padding: EdgeInsets.only(
                  left: 7 * SizeConfig.widthMultiplier,
                  top: 2 * SizeConfig.heightMultiplier),
              child: Text(
                "Hello, find your\ndream job!",
                style: GoogleFonts.nunitoSans(
                    fontSize: 3.5 * SizeConfig.textMultiplier,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5),
              )),
          Padding(
            padding: EdgeInsets.only(
                top: 4 * SizeConfig.heightMultiplier,
                left: 5 * SizeConfig.widthMultiplier,
                right: 5 * SizeConfig.widthMultiplier),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5 * SizeConfig.widthMultiplier,
                            vertical: SizeConfig.heightMultiplier),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.search,
                              color: Colors.grey,
                              size: 5 * SizeConfig.imageSizeMultiplier,
                            ),
                            SizedBox(
                              width: 1.5 * SizeConfig.widthMultiplier,
                            ),
                            Expanded(
                              child: TextFormField(
                                  controller: searchController,
                                  keyboardType: TextInputType.text,
                                  cursorColor: Colors.blue,
                                  style: GoogleFonts.nunitoSans(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          1.6 * SizeConfig.textMultiplier),
                                  decoration: InputDecoration.collapsed(
                                      hintText: "Search",
                                      hintStyle: TextStyle(
                                          fontSize:
                                              1.7 * SizeConfig.textMultiplier,
                                          color: Colors.grey))),
                            )
                          ],
                        )),
                  ),
                ),
                SizedBox(
                  width: 2 * SizeConfig.widthMultiplier,
                ),
                Container(
                    width: 12.5 * SizeConfig.widthMultiplier,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue.withOpacity(0.05)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Icon(Icons.sort,
                          color: Colors.black,
                          size: 6 * SizeConfig.imageSizeMultiplier),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
