import 'package:e_seva/pages/home_grid.dart';
import 'package:e_seva/pages/mainSchemes/scheme_list.dart';
import 'package:e_seva/pages/mainServices/services_list.dart';
import 'package:e_seva/pages/reusable_widget.dart';
import 'package:flutter/material.dart';

import 'input_content.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
              child: Row(
                children: <Widget>[
                  Expanded(child: InkWell(
                      splashColor: Colors.white,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainSchemeList()));
                        print("StateScheme");
                      },
                      child: ReusableCard( InputContent(Image.asset('Images/main_scheme.png',fit: BoxFit.contain,color: Color(0xFF8D8E98),),"State Scheme")))),
                  Expanded(child: InkWell(
                      splashColor: Colors.white,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainServiceList()));
                        print("Services");
                      },
                      child: ReusableCard( InputContent(Image.asset('Images/service_icon.png',fit: BoxFit.contain,color: Color(0xFF8D8E98),),"Services")))),
                ],
              ),
          ),
          Expanded(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
              child: Text('Top Schemes',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
              ),),
            ),
          ),
          Expanded(
            flex: 4,
            child: HomeGrid(),
          )
        ],
      ),
    );
  }
}

//color: Color(0xFF8D8E98),