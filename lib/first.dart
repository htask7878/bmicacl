import 'package:flutter/material.dart';

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  String str = "";
  Duration duration = Duration();

  String time ="";
  var hour = 0;
  var minuts= 0;
  var second =0;
  // @override
  //   void initState() {
  //     super.initState();
  //
  //     gete().listen((event) {});
  //   }

  Stream<String> gete() async* {
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      duration = Duration(hours: hour, minutes: minuts, seconds: second);
      if (second < 60) {
        second++;
        if (second == 60) {
          minuts++;
          second = 0;
          if (minuts == 60) {
            hour++;
            minuts = 0;
          }
        }
      }

      time = "${hour} :${minuts} : ${second}";
      print(time);
      yield time;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Timer")),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 25, left: 80, right: 80),
            alignment: Alignment.center,
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                border: Border.all(width: 3, color: Colors.teal),
                borderRadius: BorderRadius.all(Radius.circular(150))),
            child: StreamBuilder(
              stream: gete(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(
                      color: Colors.black45, strokeWidth: 3);
                } else {
                  return Text(
                    "${snapshot.data}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w400),
                  );
                }
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(1)),
                      ),
                      fixedSize: Size(105, 40),
                      primary: Colors.indigo,
                      onPrimary: Colors.purpleAccent),
                  onPressed: () {
                    String stop = "${time}";
                  },
                  child: Text(
                    "Start",
                    style: TextStyle(
                        color: Colors.white, fontSize: 18, letterSpacing: 1),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(1)),
                      ),
                      fixedSize: Size(105, 40),
                      primary: Colors.indigo,
                      onPrimary: Colors.purpleAccent),
                  onPressed: () {
                    second = 0;
                    minuts = 0;
                    hour = 0;
                  },
                  child: Text(
                    "Restart",
                    style: TextStyle(
                        color: Colors.white, fontSize: 18, letterSpacing: 1),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(1)),
                      ),
                      fixedSize: Size(105, 40),
                      primary: Colors.indigo,
                      onPrimary: Colors.purpleAccent),
                  onPressed: () {
                    String stop = "${time}";
                  },
                  child: Text(
                    "Stop",
                    style: TextStyle(
                        color: Colors.white, fontSize: 18, letterSpacing: 1),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
