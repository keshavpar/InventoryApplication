import 'package:flutter/material.dart';
import 'package:inventorymanagement/screens/addItems.dart';

class Home extends StatefulWidget {
  static const String routeName = '/home';
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

var details = {

  0xe74c:'DashBoard',
  0xe905: 'Add Items',
  0xe93c: 'Items Lists',
  0xebce: 'Dummy Bill',
  0xe10b: 'Gst Bill',  

};
var index = 0;
var cst = Colors.white;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var value = 0;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Row(
          children: [
            Container(
              color: Colors.black,
              height: double.infinity,
              width: width * 6 / 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: height * 0.02,
                  ),
                  for (var i = 0; i < details.length; i++)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = i;
                        });
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Icon(
                            IconData(details.keys.elementAt(i),
                                fontFamily: 'MaterialIcons'),
                            color: cst,
                            size: 40,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            details.values.elementAt(i),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ),
            Container(height: double.infinity,width: width*0.90,)
          ],
        ),
      ),
    );
  }
}
