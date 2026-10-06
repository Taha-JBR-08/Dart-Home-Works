import 'package:flutter/material.dart';
import 'package:flutter_application_4/logic.dart';
import 'package:flutter_application_4/todo.dart';
import 'package:provider/provider.dart';
void main(){
runApp(MyApp());

}
class MyApp extends StatefulWidget {
  const new({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=> TodoProject(),child: MaterialApp(debugShowCheckedModeBanner: false,
initialRoute: "/",
routes: {"/" : (context)=> FirstProject()},

      
    ),);
  }
}
