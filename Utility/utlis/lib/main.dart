import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    // primarySwatch: Colors.purple[700],
  ),
  home: HomePage(),
));


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int curr_step = 0;
  List<Step> steps = [
    Step(
      title: Text("Hello"),
      content: Text("this is step 1"),
      isActive: true      
    ),
    Step(
      title: Text("Hello x 2"),
      content: Text("this is step 2"),
      isActive: true      
    ),    
    Step(
      title: Text("Hello x 3"),
      content: Text("this is step 3"),
      isActive: true      
    ),            
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // child: Text("Hello")
      appBar: AppBar(
        title: Text("Utils App"),
      ),
      body: Container(
        child: Stepper(
          steps : steps,
          currentStep: this.curr_step,
          type: StepperType.horizontal,
          
        )
      )
    );
  }
}



// class MyBody extends StatelessWidget {

//   AlertDialog dialog = new AlertDialog(
//     content: Text(
//       "No Horny!", 
//       style: TextStyle(
//         fontSize: 20,
//       ),
//     ),
//     title: Center(child: Text("Bread Mohan")),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: Center(
//           child: ElevatedButton(
//             child: Text(
//               "Gib Horny",
//               style: TextStyle(
//                 fontSize: 20,
//               ),
//               // color: Colors.redAccent,
//             ),
//             // onPressed: () => Scaffold.of(context).showSnackBar(
//             //   SnackBar(
//             //     content: Text("You pressed the button"),
//             //     duration: Duration(seconds: 3),   
//             //   )
//             onPressed: ()=> showDialog(
//               builder: (context) => dialog, 
//               context: context,
//             ),
//           ),
//         ),
//     );
//   }
// }