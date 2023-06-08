import 'package:flutter/material.dart';
import 'package:flutterworkshop/Views/product_view.dart';

// import 'loginpage.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: ProductScreen(),
    );
  }
}
