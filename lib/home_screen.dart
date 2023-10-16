import 'package:flutter/material.dart';
import 'add_todo.dart';
import 'update_todo.dart';
import 'class.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> tasks = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: const [
          Icon(
            Icons.search,
            color: Colors.blue,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            AddTodo(
              onAddTodo: (Todo todo) {
                addTodo(todo);
              },
            ),
            const SizedBox(
              height: 38,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: tasks.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                  height: 12,
                ),
                itemBuilder: (context, index) {
                  return ListTile(
                    tileColor: Colors.grey.shade300,
                    onLongPress: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                title: const Text("Alert"),
                                content: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          showModalBottomSheet(
                                              context: context,
                                              builder: (context) {
                                                return UpdateTodo(
                                                  todos: tasks[index],
                                                  index: index,
                                                  todoUpdate:
                                                      (String updateTitle,
                                                          String updateDetails,
                                                          int index) {
                                                    updateTodo(
                                                        index,
                                                        updateTitle,
                                                        updateDetails);
                                                  },
                                                );
                                              });
                                        },
                                        child: const Text(
                                          "Edit",
                                          style: TextStyle(color: Colors.cyan),
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          deleteTodo(index);
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          "Delete",
                                          style: TextStyle(color: Colors.cyan),
                                        ))
                                  ],
                                ));
                          });
                    },
                    title: Text(
                      tasks[index].title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(tasks[index].details),
                    leading: const CircleAvatar(
                      backgroundColor: Colors.red,
                    ),
                    trailing: const Icon(Icons.arrow_forward),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void addTodo(Todo todo) {
    tasks.add(todo);
    setState(() {});
  }

  void deleteTodo(int index) {
    tasks.removeAt(index);
    setState(() {});
  }

  void updateTodo(int index, String updateTitle, String updateDetails) {
    tasks[index].title = updateTitle;
    tasks[index].details = updateDetails;
    setState(() {});
  }
}
