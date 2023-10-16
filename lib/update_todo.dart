import 'package:flutter/material.dart';
import 'class.dart';

class UpdateTodo extends StatefulWidget {
  final Todo todos;
  final Function(String, String, int) todoUpdate;
  final int index;
  const UpdateTodo({
    super.key,
    required this.todos,
    required this.todoUpdate,
    required this.index,
  });

  @override
  State<UpdateTodo> createState() => _UpdateTodoState();
}

class _UpdateTodoState extends State<UpdateTodo> {
  final TextEditingController updateTitleController = TextEditingController();
  final TextEditingController updateDetailsController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    updateTitleController.text = widget.todos.title;
    updateDetailsController.text = widget.todos.details;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Form(
        key: _globalKey,
        child: Column(
          children: [
            TextFormField(
                controller: updateTitleController,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan, width: 3)),
                    enabledBorder: OutlineInputBorder()),
                validator: (String? value) {
                  if (value?.isEmpty ?? true) {
                    return "Enter a value";
                  }
                  return null;
                }),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
                controller: updateDetailsController,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan, width: 3)),
                    enabledBorder: OutlineInputBorder()),
                validator: (String? value) {
                  if (value?.isEmpty ?? true) {
                    return "Enter a vallue";
                  }
                  return null;
                }),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  if (_globalKey.currentState!.validate()) {
                    String updatedTitle = updateTitleController.text.trim();
                    String updatedDetails = updateDetailsController.text.trim();
                    widget.todoUpdate(
                        updatedTitle, updatedDetails, widget.index);
                    Navigator.pop(context);
                  }
                },
                child: const Text(
                  "Edit Done",
                  style: TextStyle(fontSize: 16),
                ))
          ],
        ),
      ),
    );
  }
}
