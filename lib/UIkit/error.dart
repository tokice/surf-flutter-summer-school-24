import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
    ),
    body: Center(
      child: Container(
        child: Column(
       children:  <Widget>[
         SizedBox(height: 200),
        Text('🤬',style: TextStyle(fontSize: 64 )),
       Text('Упс!', style: TextStyle(fontSize: 54, fontWeight: FontWeight.bold)),
         Text('Произошла ошибка.', style: TextStyle(fontSize: 20,color: Colors.black.withOpacity(0.5))),
         Text('Попробуйте снова.', style: TextStyle(fontSize: 20,color: Colors.black.withOpacity(0.5))),
        ],
        ),
        ),
    ),
    );
}
}