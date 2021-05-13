import 'package:flutter/material.dart';
import 'package:login_bloc/loginBloc.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Bloc();
    return Scaffold(
      appBar: AppBar(
        title: Text("login hehe"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              StreamBuilder<String>(
                stream: bloc.email,
                builder:(context, snapshot) => TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "email",
                    labelText: "email hehehe",
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              StreamBuilder<String>(
                stream: bloc.pass,
                builder:(context, snapshot)=> TextField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "password",
                    labelText: "give password",
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              SizedBox(
                height : 20.0,
              ),
              StreamBuilder<bool>(
                stream: bloc.subCheck,
                  builder:(context, snapshot) => ElevatedButton(
                  onPressed: null, 
                  child: Text("login")
                ),
              )
            ],
          ),
        )
      )
    );
  }
}