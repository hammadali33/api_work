import 'dart:convert';

import 'package:api_work/covid19/covid19_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Covid19 extends StatefulWidget {
  const Covid19({Key? key}) : super(key: key);

  @override
  State<Covid19> createState() => _Covid19State();
}

class _Covid19State extends State<Covid19> {
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
                  child: Row(
                    children: [
                      Expanded(
                        child: mycard(
                            "Total Cases", snapshot.data!.cases!, Colors.blue),
                      ),
                      Expanded(
                        child: mycard("Total todayCases",
                            snapshot.data!.todayCases!, Colors.green),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: mycard(
                            "Total deaths", snapshot.data!.deaths!, Colors.red),
                      ),
                      Expanded(
                        child: mycard("Total todayDeaths",
                            snapshot.data!.todayDeaths!, Colors.orange),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: mycard("Total recovered",
                            snapshot.data!.recovered!, Colors.pink),
                      ),
                      Expanded(
                        child: mycard("Total active", snapshot.data!.active!,
                            Colors.purple),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: mycard("Total critical",
                            snapshot.data!.critical!, Colors.blueAccent),
                      ),
                      Expanded(
                        child: mycard(
                            "Total casesPerOneMill",
                            snapshot.data!.casesPerOneMillion!,
                            Colors.blueGrey),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: mycard(
                            "Total deathsPerOnMill",
                            snapshot.data!.deathsPerOneMillion!,
                            Colors.purpleAccent),
                      ),
                      Expanded(
                        child: mycard("Total totalTest",
                            snapshot.data!.totalTests!, Colors.pink),
                      ),
                    ],
                  ),
                ),
              ]);
            }));
  }

  Card mycard(String total, int num, Color c) {
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
              total,
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
