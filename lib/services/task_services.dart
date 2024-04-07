import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_tracker_app/models/task_model.dart';

class TaskServices {
  // Add Task

  Future<void> AddTask({required TaskModel task}) async {
    debugPrint("Add Task function is called!");

    SharedPreferences pref = await SharedPreferences.getInstance();

    try {
      List<String> taskList = pref.getStringList("taskList")!;

      List<TaskModel> list =
          taskList.map((e) => TaskModel.fromJson(jsonDecode(e))).toList();

      list.add(task);

      taskList = list.map((item) => jsonEncode(item.toJson())).toList();

      pref.setStringList("taskList", taskList);

      debugPrint("Sucessfully added the task!");
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }

  // delete task

  Future<void> DeletTask({required int index}) async {
    debugPrint("Delete Task function is called!");

    SharedPreferences pref = await SharedPreferences.getInstance();

    try {
      List<String> taskList = pref.getStringList("taskList")!;

      taskList.removeAt(index);

      pref.setStringList("taskList", taskList);

      debugPrint("Task deleted successfully!");
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }

  // get all tasks

  Future<List<TaskModel>> getTasks() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      List<String> taskList = pref.getStringList("taskList")!;

      List<TaskModel> list =
          taskList.map((e) => TaskModel.fromJson(jsonDecode(e))).toList();
      return list;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }
}
