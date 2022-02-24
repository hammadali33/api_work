import 'dart:convert';

import 'package:api_work/api_work2/bit_coin_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiWork2 extends StatefulWidget {
  const ApiWork2({Key? key}) : super(key: key);

  @override
  State<ApiWork2> createState() => _ApiWork2State();
}

class _ApiWork2State extends State<ApiWork2> {
  Future<BitCoinModel> fetchdata() async {
    BitCoinModel cm;
    String url = "https://api.coindesk.com/v1/bpi/currentprice.json";
    http.Response response = await http.get(Uri.parse(url));
    var jsonresponse = json.decode(response.body);
    print(response.statusCode);
    cm = BitCoinModel.fromJson(jsonresponse);
    print(jsonresponse);
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<BitCoinModel>(
              future: fetchdata(),
              builder: (context, AsyncSnapshot<BitCoinModel> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                return Card(
                  child: Text("${snapshot.data!.time!.updated}"),
                );
              })
        ],
      ),
    );
  }
}
