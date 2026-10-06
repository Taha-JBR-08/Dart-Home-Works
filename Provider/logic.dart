import 'package:flutter/material.dart';

class TodoProject extends ChangeNotifier{
 List<String> todoList = [];
  List<bool> todoCheck = [];

void addtodo(String text){
todoList.add(text);
todoCheck.add(false);
notifyListeners();

} 
void  checkbox(int index){
  todoCheck[index] = !todoCheck[index];
  notifyListeners();
}
void delete(int index){
  todoList.removeAt(index);
  notifyListeners();
}

}
