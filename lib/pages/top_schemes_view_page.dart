import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class TopSchemesViewPage extends StatefulWidget {
  final data;
  TopSchemesViewPage(this.data);
  @override
  _TopSchemesViewPageState createState() => _TopSchemesViewPageState();
}

class _TopSchemesViewPageState extends State<TopSchemesViewPage> {

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
          padding: const EdgeInsets.fromLTRB(18.0,7.0,18.0,18.0),
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
                      child: Text(widget.data["title"],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18.0,),
              Text('Benefits:', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0
                ),),
              SizedBox(height: 10.0,),
              Text('\t\t\t\t\t\t ${widget.data["Benefits"]}',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 16.0
                ),),
              SizedBox(height: 18.0,),
              Text('Eligibility:',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0
                ),),
              SizedBox(height: 10.0,),
              Text('\t\t\t Description:', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0
                ),),
              SizedBox(height: 10.0,),
              Text('         ${widget.data["Eligibility"]["Description"]}',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 16.0
                ),),
              SizedBox(height: 10.0,),
              Text('\t\t\t Minimum Age:',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0
                ),),
              SizedBox(height: 10.0,),
              Text('         ${widget.data["Eligibility"]["minage"]}'),
              SizedBox(height: 10.0,),
              Text('\t\t\t Maximum Age:',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0
                ),),
              SizedBox(height: 10.0,),
              Text('         ${widget.data["Eligibility"]["maxage"]}'),
              SizedBox(height: 10.0,),
              Text('Application Process:',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0
                ),),
              SizedBox(height: 10.0,),
              Text('         ${widget.data["applicationprocess"]}',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 16.0
                ),
              ),
              SizedBox(height: 10.0,),
              Text('Timeline:', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0
                ),),
              SizedBox(height: 10.0,),
              Text('         ${widget.data["timeline"]}',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 16.0
                ),),
              SizedBox(height: 10.0,),
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
                        _launchURL(widget.data["schemeapplicationlink"]);
                        //Navigator.of(context).pop();
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
                ),)
            ],),),),);
  }
}


// Text('Scheme Application Link:',
//   style: TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 18.0
//   ),),
//
// Text('         ${widget.data["schemeapplicationlink"]}',
//   textAlign: TextAlign.justify,
//   style: TextStyle(
//       fontSize: 16.0
//   ),
// ),
// SizedBox(height: 30.0,),