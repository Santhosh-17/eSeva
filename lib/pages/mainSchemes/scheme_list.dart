import 'package:e_seva/pages/mainSchemes/scheme_view.dart';
import 'package:e_seva/services/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
class MainSchemeList extends StatefulWidget {
  @override
  _MainSchemeListState createState() => _MainSchemeListState();
}

class _MainSchemeListState extends State<MainSchemeList> {

  Future data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    data = getSchemeData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("State Schemes"),),
      body: Center(child: Container(
        child: FutureBuilder(
          future: getSchemeData(),
          builder: (context, AsyncSnapshot snapshot) {
            if(snapshot.hasData){
              return createListView(snapshot.data, context);
            }else{
              return CircularProgressIndicator();
            }
          },
        ),
      )),
    );
  }

  Future getSchemeData() {
    String url = "https://esevaapi.herokuapp.com/api/full-plans";
    ApiManager apiManager = ApiManager(url);
    var data =  apiManager.getNews();
    return data;
  }

  Widget createListView(data, BuildContext context) {
    return Container(
      child: ListView.builder(
        // scrollDirection: Axis.vertical,
        itemCount: data.length,
        itemBuilder: (context, index) {
          var dataValue = data[index];
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
                clipBehavior: Clip.antiAlias,
                color: Color(0xFF1D1E33),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              child: InkWell(
                splashColor: Colors.white,
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SchemeView(dataValue))
                  );
                },
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(dataValue["title"]),
                  ) ,
                  subtitle: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0,8.0,8.0,20.0),
                    child: Text('     ${dataValue["preview"]}',
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
