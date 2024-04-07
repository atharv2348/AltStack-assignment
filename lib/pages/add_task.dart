import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_tracker_app/models/task_model.dart';
import 'package:task_tracker_app/services/task_services.dart';

import '../components/my_buttons.dart';
import '../components/my_text_field.dart';

class AddTask extends StatefulWidget {
  AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Task",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                CustomTextField(
                  controller: titleController,
                  hintText: "Task Title",
                  prefixIcon: const Icon(Icons.task_alt_rounded),
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  controller: descriptionController,
                  hintText: "Task Description",
                  prefixIcon: const Icon(Icons.description),
                ),
                SizedBox(height: 40.h),
                CustomFilledButton(
                  text: "Add Task",
                  onTap: () => addTask(context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addTask(BuildContext context) async {
    TaskModel task = TaskModel(
      title: titleController.text,
      description: descriptionController.text,
      isComplete: false,
    );

    TaskServices taskServices = TaskServices();
    await taskServices.AddTask(task: task);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Icon(
            Icons.task_alt_rounded,
            color: Colors.green,
            size: 100,
          ),
          content:
              const Text("Task Added Succesfully", textAlign: TextAlign.center),
          actions: [
            CustomFilledButton(text: "OK", onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
            })
          ],
        );
      },
    );
  }
}
