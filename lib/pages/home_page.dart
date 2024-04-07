import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_tracker_app/components/my_buttons.dart';
import 'package:task_tracker_app/models/task_model.dart';
import 'package:task_tracker_app/pages/add_task.dart';
import 'package:task_tracker_app/services/task_services.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TaskServices taskServices = TaskServices();

  @override
  Widget build(BuildContext context) {
    void showDialogBox(TaskModel task) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(task.title.toString(), textAlign: TextAlign.center),
            content:
                Text(task.description.toString(), textAlign: TextAlign.center),
            actions: [
              CustomFilledButton(
                onTap: () => Navigator.pop(context),
                text: 'OK',
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        title: const Text("Task  Tracker"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddTask()));
          }),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: FutureBuilder(
          future: taskServices.getTasks(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        showDialogBox(snapshot.data![index]);
                      },
                      tileColor: Colors.grey[200],
                      title: Text(snapshot.data![index].title.toString()),
                      subtitle:
                          Text(snapshot.data![index].description.toString()),
                      trailing: IconButton(
                        onPressed: () async {
                          await taskServices.DeletTask(index: index);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Task delted Successfully!"),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                          setState(() {});
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
