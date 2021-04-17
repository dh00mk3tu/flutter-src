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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("ghassi app"),
      ),
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
                "Change me",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
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
        onPressed: () {},
        child: Icon(Icons.ac_unit),
      ),
    );
  }
}
