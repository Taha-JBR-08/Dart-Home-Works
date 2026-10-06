import "package:flutter/material.dart";
import "package:flutter_application_4/logic.dart";
import "package:provider/provider.dart";



class FirstProject extends StatefulWidget {
  FirstProject({super.key});

  @override
  State<FirstProject> createState() => _FirstProjectState();
}

class _FirstProjectState extends State<FirstProject> {
  TextEditingController todoCtr = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    var x = context.watch<TodoProject>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: .start,
              spacing: 10,
              children: [
                SizedBox(height: 50),
                Text(
                  "My Todo",
                  style: TextStyle(fontSize: 30, fontWeight: .bold),
                ),
                Text(
                  "Small steps, big progress",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                SizedBox(height: 10),
    
                Row(
                  spacing: 15,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: todoCtr,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hint: Text(
                            "Add a new todo",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    MaterialButton(
                      minWidth: 50,
                      onPressed: () {
                      context.read<TodoProject>().addtodo(todoCtr.text);
                      todoCtr.clear();
                      },
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: .circular(10),
                      ),
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      "Tasks",
                      style: TextStyle(fontSize: 20, fontWeight: .bold),
                    ),
                    Card(
                      color: Colors.green[100],
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          "${x.todoList.length} tasks",
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ),
                  ],
                ),
                ...x.todoList.asMap().entries.map((entry) {
                  int index = entry.key;
                  return Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: .circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Checkbox(
                            value: x.todoCheck[index],
                            onChanged: (value) {
                           context.read<TodoProject>().checkbox(index);
    
                            },
                          ),
                          Text(x.todoList[index]),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              
                              context.read<TodoProject>().delete(index);
                            },
                            child: Container(
                              width: 50,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.red[50],
                                borderRadius: .circular(10),
                              ),
                              child: Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
