import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "mega funny app",
    home: HomePage(),
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _nameControl = TextEditingController();
  var muText = "please enter";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(title: Text("ghassi app")),
          body: SingleChildScrollView(
            child: Card(
              child: Column(
                children: [
                  Image.asset(
                    "assets/car.jpg",
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20),
                  Text(
                    muText,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
       
                      controller: _nameControl,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "credit car number daal be",
                        labelText: "yesss money",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          drawer: Drawer(
              child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("amnirud"),
                accountEmail: Text("funny@mega.com"),
                currentAccountPicture: Image.network(
                    "https://images.unsplash.com/photo-1614200187524-dc4b892acf16?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDV8fGZlcnJhcml8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Account"),
                subtitle: Text("Personal"),
                trailing: Icon(Icons.edit),
              )
            ],
          )),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              
              if(_nameControl.text == "") {
                setState(() {
                  
                  muText = "gib money men";
                });
              }
              else {
                setState(() {
                  var temp = _nameControl.text;
                  muText = "money gonee from $temp";
                });

              }
            },
            child: Icon(Icons.ac_unit),
          ),
          
        );
        return scaffold;
  }
}
