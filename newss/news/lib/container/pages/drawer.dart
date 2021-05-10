import 'package:flutter/material.dart';
import 'package:news/container/pages/bitcoinNews.dart';
import 'package:news/container/pages/businessNews.dart';
import 'package:news/container/pages/technews.dart';

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
            trailing: Icon(Icons.car_repair),
            title: Text(
              "Tech News",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ), 
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TechPageApp())
              );
            },
          ),

          ListTile(
            trailing: Icon(Icons.business),
            title: Text(
              "Business News",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ), 
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BusinessPageApp())
              );
            },
          ),

          ListTile(
            trailing: Icon(Icons.money),
            title: Text(
              "BItcoid News",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ), 
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BitcoinPageApp())
              );
            },
          )
        ],
      )
    );
  }
}