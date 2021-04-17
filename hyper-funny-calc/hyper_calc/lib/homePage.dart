import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  var n1=0, n2=0, res=0;
  final TextEditingController t1 = new TextEditingController(text: "0");
  final TextEditingController t2 = new TextEditingController(text: "0");

  void callAdd() {
    setState(() {
      n1 = int.parse(t1.text);
      n2 = int.parse(t2.text);
      res = n1 + n2;

    });
  }
  void callSub() {
    setState(() {
      n1 = int.parse(t1.text);
      n2 = int.parse(t2.text);
      res = n1 - n2;

    });
  }
  void callPro() {
    setState(() {
      n1 = int.parse(t1.text);
      n2 = int.parse(t2.text);
      res = n1 * n2;

    });
  }
  void callDiv() {
    setState(() {
      n1 = int.parse(t1.text);
      n2 = int.parse(t2.text);
      res = n1~/n2;

    });
  }
  @override 
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Hyper Mega Calc"),
      ),
      body: Container (
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column (
            
            mainAxisAlignment: MainAxisAlignment.center,
            children : [
              new Text(
                "Result : $res",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple[900],
                ),
              ), 
              TextField(
                controller: t1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter  Number"
                ),
              ),
              TextField(
                controller: t2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter  Number"
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(
                  top: 20.0
                ),
              ),
              Row (
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                
                children: [
                  new MaterialButton(
                    child: Text("+"),
                    color: Colors.purple[300],
                    onPressed: () => {
                      callAdd()
                    },
                  ),
                  new MaterialButton(
                    child: Text("-"),
                    color: Colors.purple[300],
                    onPressed: () => {
                      callSub()
                    },
                  ),

                ]
              ),
              Row (mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                   new MaterialButton(
                    child: Text("x"),
                    color: Colors.purple[300],
                    onPressed: () => {
                      callPro()
                    },
                  ),
                  new MaterialButton(
                    child: Text("/"),
                    color: Colors.purple[300],
                    onPressed: () => {
                      callDiv()
                    },
                  ),
                ],
              )
            ]
          ),
        )
      ),
    );
  }
}