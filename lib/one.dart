import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'first.dart';

class one extends StatefulWidget {
  const one({Key? key}) : super(key: key);

  @override
  State<one> createState() => _oneState();
}
//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
class _oneState extends State<one> {
  TextEditingController wght = TextEditingController();
  TextEditingController hght = TextEditingController();
  Duration duration= Duration();
  double mit = 0;
  double bmi = 0;
  String blanck = "";
  String interpretation = "";
//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
  @override
  Widget build(BuildContext context) {
    // double ststusbar  = MediaQuery.of(context).padding.top;
    return Container(
      // margin: EdgeInsets.only(top: ststusbar),
      child: DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.teal,
            title: Text("BMI Calculator"),
            bottom: TabBar(
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 3,
                tabs: [
              Tab(icon: Icon(Icons.accessibility_new_outlined)),
              Tab(icon: Icon(Icons.timer_sharp)),
            ]),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: 250,
                        margin: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 100,
                              color: Color(0xfff0e8d2),
                              margin: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 10, left: 10),
                                    height: 50,
                                    alignment: Alignment.topLeft,
                                    child: Text("Input Weight :",
                                        style: TextStyle(height: 1, fontSize: 18)),
                                  ),
                                  Container(
                                    child: TextField(
                                      keyboardType: TextInputType.numberWithOptions(
                                          decimal: true),
                                      decoration: InputDecoration(
                                        hintText: "Enter value (weight in kg)",
                                        filled: true,
                                      ),
                                      controller: wght,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // SizedBox(height: 30,),
                            Container(
                              height: 100,
                              color: Color(0xfff0e8d2),
                              margin: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Container(
                                    color: Color(0xfff0e8d2),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(top: 10, left: 10),
                                          height: 50,
                                          alignment: Alignment.topLeft,
                                          child: Text("Input Height :",
                                              style:
                                              TextStyle(height: 1, fontSize: 18)),
                                        ),
                                        Container(
                                          child: TextField(
                                            keyboardType:
                                            TextInputType.numberWithOptions(
                                                decimal: true),
                                            decoration: InputDecoration(
                                              hintText: "Enter value (height in fit)",
                                              filled: true,
                                            ),
                                            controller: hght,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                String wght1 = wght.text;
                                String hght1 = hght.text;
                                //TODO Convert String to int.
                                double kg = double.parse(wght1);
                                double ft = double.parse(hght1);
                                // print(ft);
                                mit = ft / 3.2808; //height
                                // print("miter = ${mit}");
                                double m2 = mit * mit; //
                                // print("m2 = ${m2}");
                                bmi = kg / m2;
                                // print("bmi = ${bmi}");
                                if (bmi <= 18.4) {
                                  print("UnderWeight");
                                  setState(() {
                                    blanck = bmi.toString();
                                    interpretation = "UnderWeight (BMI <= 18.4 kg/m2)";
                                  });
                                } else if (bmi >= 18.5 && bmi <= 27.9) {
                                  setState(() {
                                    blanck = bmi.toString();
                                    interpretation = "UnderWeight (BMI >= 18.5 To BMI <= 27.9 kg/m2)";
                                  });
                                  print("Normal");
                                } else if (bmi >= 28) {
                                  setState(() {
                                    blanck = bmi.toString();
                                    interpretation = "UnderWeight (BMI >= 28 kg/m2)";
                                  });
                                  print("OverWeight");
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Calculate",
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                  Icon(Icons.accessibility, color: Colors.white),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(0))),
                                fixedSize: Size(130, 100),
                                primary: Colors.teal,
                                onPrimary: Color(0xfff0e8d2),
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                wght.clear();
                                hght.clear();
                                setState(() {
                                  interpretation ="";
                                  blanck = "";
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Clear",
                                    style: TextStyle(color: Colors.black45),
                                    textAlign: TextAlign.center,
                                  ),
                                  Icon(
                                    Icons.close,
                                    color: Colors.black45,
                                  ),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(0))),
                                fixedSize: Size(130, 100),
                                primary: Color(0xCBF68005),
                                onPrimary: Color(0xfff0e8d2),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 180,
                        margin: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 10,bottom: 5),
                                alignment: Alignment.topLeft,
                                child: Text("Result :",
                                    style: TextStyle(
                                      height: 2,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                    ))),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Text("Boby Mass Index is ${blanck} kg/m2",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: 15)),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Text("Interpretation : ${interpretation}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: 15)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              first(),
            ],
          ),
        ),
      ),
    );
  }
}
