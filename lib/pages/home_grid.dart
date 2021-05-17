import 'package:e_seva/pages/reusable_widget.dart';
import 'package:e_seva/pages/top_schemes_view_page.dart';
import 'package:e_seva/services/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'input_content.dart';

class HomeGrid extends StatefulWidget {
  @override
  _HomeGridState createState() => _HomeGridState();
}

class _HomeGridState extends State<HomeGrid> {
  Future data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    data = getPlanData();

  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      child: FutureBuilder(
        future: getPlanData(),
        builder: (context, AsyncSnapshot snapshot) {
          if(snapshot.hasData){
            return createGridView(snapshot.data, context);
          }else{
            return CircularProgressIndicator();
          }
        },
      ),
    ));
  }

  Future getPlanData() {
    String url = "https://esevaapi.herokuapp.com/api/plans";
    ApiManager apiManager = ApiManager(url);
    var data =  apiManager.getNews();
    // data.then((value){
    //   print('title: ${value["articles"][0]["title"]}');
    // });
    return data;
  }

  Widget createGridView(data, BuildContext context) {
    return Container(
      child: GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 350,
          childAspectRatio: 4/5,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2),
          itemCount: data.length,
          itemBuilder: (BuildContext context, index) {
            var dataValue = data[index];
            return InkWell(
              splashColor: Colors.white,
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => TopSchemesViewPage(dataValue))
                  );
                print("topSchemes");
                },
                child: ReusableCard( InputContent(Image.network(dataValue["urlToImage"], fit: BoxFit.contain,color: Color(0xFF8D8E98),),dataValue["title"])));
          }),
    );
  }
}
//color: Color(0xFF8D8E98),




// Container(
// child: ListView.builder(
// // scrollDirection: Axis.vertical,
// itemCount: data.length,
// itemBuilder: (context, index) {
// var dataValue = data[index];
// return Container(
// child: GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
// maxCrossAxisExtent: 350,
// childAspectRatio: 4/5,
// crossAxisSpacing: 2,
// mainAxisSpacing: 2),
// itemCount: 10,
// itemBuilder: (BuildContext context, index) {
// return ReusableCard( InputContent(Image.network(dataValue["urlToImage"], fit: BoxFit.cover,),dataValue["title"]));
// }),
// );



// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children:<Widget>[
// Divider(height: 5.0),
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Text(dataValue["title"],
// style: TextStyle(
// fontSize: 15,
// fontWeight: FontWeight.bold),
// ),
// ),
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Html(data :dataValue["desc"]),
// ),
// ]
// );