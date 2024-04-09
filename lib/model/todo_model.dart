import 'package:flutter/material.dart';

class TodoModel
{
  String? name;
  DateTime? createdAt;

  TodoModel({required this.name,required this.createdAt});

  @override
  String toString() {
    return 'TodoModel{name: $name, createdAt: $createdAt}';
  }
}