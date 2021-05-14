import 'package:firebase1/source/pages/updateDetails.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 50.0,
            padding: EdgeInsets.all(10),
            color: Colors.red[200]
          ),
          ListTile(
            trailing: Icon(Icons.person),
            title: Text(
              "View Details",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ), 
          ),

          ListTile(
            trailing: Icon(Icons.book),
            title: Text(
              "Update Data",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => UpdateScreen()
                ),
              );
            }, 
          ),

          ListTile(
            trailing: Icon(Icons.logout),
            title: Text(
              "Logout",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ), 
          )
        ],
      )
    );
  }
}