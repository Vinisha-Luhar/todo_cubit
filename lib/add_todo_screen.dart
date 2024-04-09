import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/cubit/todo_cubit.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({Key? key}) : super(key: key);

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {

  final todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("ADD TODO",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w500)),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: TextFormField(
          controller: todoController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            hintText: 'Title'
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          BlocProvider.of<TodoCubit>(context).addTodo(todoController.text.trim());
          // context.read<TodoCubit>().addTodo(todoController.text.trim());
          todoController.clear();
          Navigator.of(context).pop();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
