import 'package:e_seva/services/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_html/style.dart';

class SchemeView extends StatefulWidget {
  final dataValue;
  SchemeView(this.dataValue);
  @override
  _SchemeViewState createState() => _SchemeViewState();
}

class _SchemeViewState extends State<SchemeView> {

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(" "),toolbarHeight: 0.0,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    SizedBox(width: 10.0,),
                    Expanded(
                      flex:0,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back_outlined,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Expanded(
                      flex:2,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0,3.0,8.0,8.0),
                        child: Text(widget.dataValue["title"],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Html(
                  data: widget.dataValue["desc"],
                  style: {
                    "p": Style(
                      textAlign: TextAlign.justify,
                      lineHeight: LineHeight.number(1.3),
                    ),
                    "li": Style(
                      textAlign: TextAlign.justify,
                      lineHeight: LineHeight.number(1.3),
                    )
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Color(0xFF0A0E21)),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(color: Colors.white)
                                )
                            )
                        ),
                        child: Text(" Apply Now ",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        onPressed: () {
                          _launchURL(widget.dataValue["link"]);
                          // Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(width: 40,),
                      TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF0A0E21)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(color: Colors.white)
                                )
                            )
                        ),
                        child: Text(" Back ",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}