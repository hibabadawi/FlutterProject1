// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todaydo_app/models/task_data.dart';
import 'package:todaydo_app/screens/add_task_screen.dart';
import 'package:todaydo_app/widgets/tasks_list.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

    appBar: AppBar(title: Text('Inbox',style: TextStyle(color: Colors.black),),backgroundColor: Colors.blueGrey,),


      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen((newTaskTitle) {
                  // setState(() {
                  //   tasks.add(Task(name: newTaskTitle));
                  //   Navigator.pop(context);
                  // });
                }),
              ),
            ),
          );
        },

        child: Icon(Icons.add),
      ),

      body: Container(


        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.playlist_add_check,
                  size: 40,
                  color: Colors.white,
                ),
                SizedBox(width: 20),

              ],
            ),
            Text(
              '${Provider.of<TaskData>(context).tasks.length} Tasks',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: TasksList(),
              ),
            )
          ],
        ),
      ),
        drawer: Drawer(
          child: Container(
            color: Colors.white,
            child: ListView(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: <Color> [Colors.blue, Colors.blueAccent]
                      )
                  ),
                  child: Text("Username"),
                ),
                buildMenuItem(
                    icon: Icon(Icons.calendar_month_sharp),
                    title: "today",
                    onClick: (){
                      selectItem(context, 0);
                    }
                ),
                buildMenuItem(
                    icon: Icon(Icons.inbox),
                    title: "inbox",
                    onClick: (){
                      selectItem(context, 1);
                    }
                )
                ,
                buildMenuItem(
                    icon: Icon(Icons.close),
                    title: "won't do ",
                    onClick: (){
                      selectItem(context, 2);
                    }
                ),
                buildMenuItem(
                    icon: Icon(Icons.face),
                    title: "wellcome",
                    onClick: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Wellcome())
                      );
                    }
                )
              ],
            ),
          ),
        )
    );
  }

buildMenuItem({required Icon icon, required String title, required Function onClick}){

  return ListTile(
    leading: icon,
    title: Text(title),
    onTap: (){
      onClick();
    },
  );
}

selectItem(BuildContext context, int index){
  switch(index){
    case 0: Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Wont())
    );
    break;
    case 1: Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Wellcome())
    );
    break;
    case 2:
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Wellcome())
      );

  }
}

}

class Wont extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Won't Page"),),
      body: Text("Won't Page"),
    );
  }

}

class Wellcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("wellcome Page"),),
      body: Text("wellcome Page"),
    );
  }

}


