 import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  UserModel _user
  final TextEditingController nameControl = TextEditingController(); 
  final TextEditingController jobControl = TextEditingController(); 

  Future<UserModel> createUser(String name, String jobTitle) async {
    final String apiUrl = "https://reqres.in/api/users";

    final response = await http.post(apiUrl, body: {
      "name": name,
      "job ": jobTitle,
    });

    if(response.statusCode == 201) {
      final String resString = response.body;
      return userModelFromJson(resString);
    }
    else  {
      return null;
    }
  } 
  @override
  Widget build(BuildContext context) {

      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: Container(
        padding : EdgeInsets.all(32),
        child : Column(
          children: [
            TextField(
              controller : nameControl
            ),

            TextField(
              controller : jobControl
            ),
          ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          final String name = nameControl.text;
          final String jobTitle = jobControl.text;

          final userModel user = await createUser(name, jobTitle); 

          setState((){
            _user = user;
          });         
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
  }
}
