import 'dart:convert';
import 'dart:math';

import 'package:api_work/Covid19/Covid19_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Covid2 extends StatefulWidget {
  const Covid2({Key? key}) : super(key: key);

  @override
  State<Covid2> createState() => _Covid2State();
}

class _Covid2State extends State<Covid2> {
  Future<Covid19Model> fetchdata() async {
    Covid19Model cm;
    String url = "https://coronavirus-19-api.herokuapp.com/countries/Pakistan";
    http.Response response = await http.get(Uri.parse(url));
    var jsonresponse = json.decode(response.body);
    cm = Covid19Model.fromJson(jsonresponse);
    return cm;
  }

  @override
  void initState() {
    fetchdata();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var txtlist = [
      "Total Cases",
      "Total todayCases",
      "Total deaths",
      "Total todayDeaths",
      "Total recovered",
      "Total active",
      "Total critical",
      "Total casesPerOneMill",
      "Total deathsPerOnMill",
      "Total totalTest"
    ];
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "PAKISTAN CASES",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          leading: Icon(
            Icons.menu,
            color: Colors.green,
          ),
        ),
        body: FutureBuilder<Covid19Model>(
            future: fetchdata(),
            builder: (context, AsyncSnapshot<Covid19Model> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              var data = snapshot.data!;
              var numlist = [
                data.cases!,
                data.todayCases,
                data.deaths!,
                data.todayDeaths!,
                data.recovered!,
                data.active!,
                data.critical!,
                data.casesPerOneMillion!,
                data.deathsPerOneMillion!,
                data.totalTests!,
              ];
              return Column(children: [
                Center(
                  child: Container(
                      height: 100,
                      width: 200,
                      child: Image.asset("assets/1.jpg")),
                ),
                Text(
                  "PAKISTAN",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: txtlist.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (e, i) => mycard(
                          txtlist[i],
                          numlist[i],
                          Colors.primaries[
                              Random().nextInt(Colors.primaries.length)])),
                )
              ]);
            }));
  }

  Card mycard(var total, var num, Color c) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: c,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "COVID-19",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "$total",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "$num",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
