import 'package:flutter/material.dart';
import 'package:hivecrud/database/controller/data_controller.dart';
import 'package:hivecrud/database/model/data_model.dart';

class AddWidget extends StatefulWidget {
  const AddWidget({super.key});

  @override
  State<AddWidget> createState() => _AddWidgetState();
}

class _AddWidgetState extends State<AddWidget> {
  final namecontroller = TextEditingController();
  final agecontroller = TextEditingController();
  final contactcontroller = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: namecontroller,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Name'),
            onChanged: (value) {
              setState(() {
                isLoading = value.isNotEmpty;
              });
            },
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            controller: agecontroller,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Age'),
            onChanged: (value) {
              setState(() {
                isLoading = value.isNotEmpty;
              });
            },
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            controller: contactcontroller,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Contact'),
            onChanged: (value) {
              setState(() {
                isLoading = value.isNotEmpty;
              });
            },
          ),
          const SizedBox(
            height: 5,
          ),
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      isLoading ? addbutton() : null;
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: isLoading ? Colors.blue : Colors.grey),
                    child: const Text("Add"),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Future<void> addbutton() async {
    final name = namecontroller.text.trim();
    final age = agecontroller.text.trim();
    final contact = contactcontroller.text.trim();
    if (name.isEmpty || age.isEmpty || contact.isEmpty) {
      return;
    }
    final data = Studentmodel(name: name, age: age, contact: contact);
    adddata(data);
    namecontroller.clear();
    agecontroller.clear();
    contactcontroller.clear();
  }
}
