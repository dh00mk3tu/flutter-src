import 'package:flutter/material.dart';

Widget loginError(BuildContext context, String err) {
  return SnackBar(
    duration: Duration(seconds:2),
    content: Text("$err")

  );
}


Widget loginSuccess(dynamic res) {
  // return SnackBar(
  //   duration: Duration(seconds:2),
  //   content: Text("$res"),
  //   width: double.infinity,
  //   behavior: SnackBarBehavior.floating,
  //   // shape: Shape(),

  // );

  return Container(
    child: Center(
      child: Padding(
        padding: const EdgeInsets.only(top:50.0),
        child: Column(
          children: [
            Text(
              "assume this is a very imp. app",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              )
            ),
            Text(
              "and this is very imp. information"
            ),
            SizedBox(
              height:20,
            ),
            Text(
              "also anirudh is very cool hehe"
            ),
          ],
        ),
      )
    ),
  );

  // return AlertDialog(
  //   content: Text("Success!"),
  // );
}


// class LoginSuccess extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SnackBar(

//       duration : Duration(seconds:1),
//       content: Text("Success")
//     );
//   }
// }