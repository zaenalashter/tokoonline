import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/screens/product_detail.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  final String url = 'http://127.0.0.1:8000/api/products';
  //android emulator:http://10.0.2.2

  Future getProducts() async {
    var response = await http.get(Uri.parse(url));
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jaenal Store'),
      ),
      body: FutureBuilder(
        future: getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: (snapshot.data as dynamic)['data'].length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 180,
                    child: Card(
                      elevation: 7,
                      child: Row(children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetail(
                                  product: (snapshot.data as dynamic)['data'][index],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: EdgeInsets.all(5),
                            height: 120,
                            width: 120,
                            child: Image.network(
                              (snapshot.data as dynamic)['data'][index]
                                  ['image_url'],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    (snapshot.data as dynamic)['data'][index]
                                        ['name'],
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text((snapshot.data as dynamic)['data']
                                      [index]['description']),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.edit),
                                    Text((snapshot.data as dynamic)['data']
                                        [index]['price']),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ),
                  );
                });
          } else {
            return Container(
              child: Center(
                child: Text('Data Error...'),
              ),
            );
          }
        },
      ),
    );
  }
}
