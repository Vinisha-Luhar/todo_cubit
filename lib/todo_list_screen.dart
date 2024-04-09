import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/add_todo_screen.dart';
import 'package:todo_bloc/cubit/todo_cubit.dart';
import 'package:todo_bloc/model/todo_model.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("TODO LIST",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w500)),
        centerTitle: true,
      ),
      body: BlocBuilder<TodoCubit,List<TodoModel>>(
        builder: (context,snapshot) {
          return ListView.builder(
            itemCount: snapshot.length,
              itemBuilder: (context, index) {
              final todo = snapshot[index];
              return ListTile(
                title: Text("${todo.name}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 23,color: Colors.indigo),),
               );
              },
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddTodoScreen()));
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
