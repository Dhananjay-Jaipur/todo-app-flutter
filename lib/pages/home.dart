import 'package:flutter/material.dart';

import 'package:todo_project/pages/todo.dart';

main(){
  runApp(home());
}

class home extends StatefulWidget {

  final controller;


  home({super.key, this.controller,});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  // to take input of text
  final c = TextEditingController();

  List to = [
    ["paypal", true],
    ["gym", false],
  ];

  void cheak(bool? value, int index){
    setState(() {
      to[index][1] = !to[index][1];
    });
  }

  void save()
  {
    controller: c;
    setState(() {
      to.add([c.text, false]);
    });
    // to go back to lists - todolists
    Navigator.pop(context);
  }

  void del(int index)
  {
    setState(() {
      to.removeAt(index);
    });
  }

  void create(){
    showDialog(
        context: context,
        builder: (context)
        {
      return AlertDialog(
        backgroundColor: Colors.grey,
        content: Container(
          height: 140,
          child: Column(
            children: [
              TextField(
                // to access the text::::::
                controller: c,

                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  hintText: "add task....",
                ),
              ),

              SizedBox(height: 20),

              Row(
               // mainAxisAlignment: MainAxisAlignment.end,
               // crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  MaterialButton(
                    color: Colors.black45,
                    child: Text(
                        "save",
                      style: TextStyle(
                        color: Colors.white54,
                      ),
                    ),
                      onPressed: save,
                  ),

                  SizedBox(width: 8),

                  MaterialButton(
                      color: Colors.black45,
                      child: Text(
                        "cancel",
                        style: TextStyle(
                          color: Colors.white54,
                        ),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8E88C),
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("                       TO DO",
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.w600,
            color: Colors.black45,
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: create,
        child: Icon(Icons.add),
        backgroundColor: Colors.yellow,
      ),

      body: ListView.builder(
        itemCount: to.length,
        itemBuilder: (context, index){
          return todo(name: to[index][0], done: to[index][1], onChanged: (value) => cheak(value, index), delete: (context) => del(index),);
        },
      ),
    );

  }
}
