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
      body: SingleChildScrollView(
        child: Column(
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
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 2 * SizeConfig.heightMultiplier,
                  left: 5 * SizeConfig.widthMultiplier),
              child: Row(
                children: <Widget>[
                  _category("UI/UX"),
                  SizedBox(
                    width: 2 * SizeConfig.widthMultiplier,
                  ),
                  _category("Tech"),
                  SizedBox(
                    width: 2 * SizeConfig.widthMultiplier,
                  ),
                  _category("Design"),
                ],
              ),
            ),
            SizedBox(height: 7 * SizeConfig.heightMultiplier),
            Container(
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(50.0)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 5 * SizeConfig.widthMultiplier,
                    vertical: 2 * SizeConfig.heightMultiplier),
                child: Column(
                  children: <Widget>[
                    Row(children: <Widget>[
                      Text("Popular Jobs",
                          style: GoogleFonts.nunitoSans(
                              fontSize: 2.8 * SizeConfig.textMultiplier,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5)),
                      Spacer(),
                      Text("show all",
                          style: GoogleFonts.nunitoSans(
                              fontSize: 1.5 * SizeConfig.textMultiplier,
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5)),
                    ]),
                    SizedBox(height: 2 * SizeConfig.heightMultiplier),
                    Container(
                      height: 24 * SizeConfig.heightMultiplier,
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            _job("Google engineer"),
                            SizedBox(width: 4 * SizeConfig.widthMultiplier),
                            _job("HR Manager"),
                            SizedBox(width: 4 * SizeConfig.widthMultiplier),
                            _job("Senior Engineer"),
                            SizedBox(width: 4 * SizeConfig.widthMultiplier),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 5 * SizeConfig.widthMultiplier,
                  vertical: 3 * SizeConfig.heightMultiplier),
              child: Row(children: <Widget>[
                Text("Job Categories",
                    style: GoogleFonts.nunitoSans(
                        fontSize: 2.8 * SizeConfig.textMultiplier,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5)),
                Spacer(),
                Text("show all",
                    style: GoogleFonts.nunitoSans(
                        fontSize: 1.5 * SizeConfig.textMultiplier,
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5)),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Container(
                height: 10 * SizeConfig.heightMultiplier,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    _jobCategory('Design'),
                    SizedBox(width: 2 * SizeConfig.widthMultiplier),
                    _jobCategory('Development'),
                    SizedBox(width: 2 * SizeConfig.widthMultiplier),
                    _jobCategory('Management'),
                    SizedBox(width: 2 * SizeConfig.widthMultiplier),
                    _jobCategory('Management'),
                    SizedBox(width: 2 * SizeConfig.widthMultiplier),
                    _jobCategory('Management'),
                    SizedBox(width: 2 * SizeConfig.widthMultiplier),
                    _jobCategory('Management'),
                    SizedBox(width: 2 * SizeConfig.widthMultiplier),
                    _jobCategory('Management'),
                    SizedBox(width: 2 * SizeConfig.widthMultiplier),
                    _jobCategory('Management'),
                    SizedBox(width: 2 * SizeConfig.widthMultiplier),
                    _jobCategory('Management'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _category(String categoryName) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.grey)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          categoryName,
          style: TextStyle(
              fontSize: 1.5 * SizeConfig.textMultiplier,
              color: Colors.blueGrey,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5),
        ),
      ),
    );
  }

  _job(String jobName) {
    return Container(
        height: 21 * SizeConfig.heightMultiplier,
        width: 65 * SizeConfig.widthMultiplier,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.blue.withOpacity(0.05)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/images/google.png"),
                    ),
                    height: 12 * SizeConfig.imageSizeMultiplier,
                    width: 12 * SizeConfig.imageSizeMultiplier,
                  ),
                  Spacer(),
                  Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                    size: 6 * SizeConfig.imageSizeMultiplier,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text('Google LLC',
                    style: GoogleFonts.nunitoSans(
                        fontSize: 1.6 * SizeConfig.textMultiplier,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.3)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('Flutter Developer',
                    style: GoogleFonts.nunitoSans(
                        fontSize: 2.3 * SizeConfig.textMultiplier,
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('Mountain View, California\nUSA',
                    style: GoogleFonts.nunitoSans(
                        fontSize: 1.6 * SizeConfig.textMultiplier,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.3)),
              ),
            ],
          ),
        ));
  }

  //  TODO add more colors
  _jobCategory(String category) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue[50], borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 3 * SizeConfig.widthMultiplier),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/images/google.png"),
              ),
              height: 12 * SizeConfig.imageSizeMultiplier,
              width: 12 * SizeConfig.imageSizeMultiplier,
            ),
            SizedBox(
              width: 2 * SizeConfig.widthMultiplier,
            ),
            Text(category,
                style: GoogleFonts.nunitoSans(
                    fontSize: 2 * SizeConfig.textMultiplier,
                    color: Colors.blue,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.3)),
          ],
        ),
      ),
    );
  }
}
