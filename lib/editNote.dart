import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditNote extends StatelessWidget {
  var controller = TextEditingController();

  String? note;

  EditNote({this.note});

  @override
  Widget build(BuildContext context) {
    controller.text = note ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text("Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(hintText: "Enter note"),
              ),
            ),
            ElevatedButton(
              onPressed: () => onPressed(context),
              child: Text("Save"),
            )
          ],
        ),
      ),
    );
  }

  void onPressed(context) {
    final note = controller.text;
    Navigator.pop(context, controller.text);
  }
}
