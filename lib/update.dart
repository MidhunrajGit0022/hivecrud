import 'package:flutter/material.dart';
import 'package:hivecrud/database/controller/data_controller.dart';
import 'package:hivecrud/database/model/data_model.dart';

class Updatedata extends StatefulWidget {
  final Studentmodel data;
  const Updatedata({required this.data, super.key});

  @override
  State<Updatedata> createState() => _UpdatedataState();
}

class _UpdatedataState extends State<Updatedata> {
  final namecontroller = TextEditingController();
  final agecontroller = TextEditingController();
  final contactcontroller = TextEditingController();

  bool isLoading = false;

  @override
  void initState() {
    namecontroller.text = widget.data.name;
    agecontroller.text = widget.data.age.toString();
    contactcontroller.text = widget.data.contact;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                          updateedata(context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                isLoading ? Colors.amber : Colors.grey),
                        child: const Text("Update"),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void updateedata(BuildContext context) {
    final newStudent = Studentmodel(
      name: namecontroller.text,
      age: agecontroller.text,
      contact: contactcontroller.text,
    );
    updatedata(datalist.value.indexOf(widget.data), newStudent);
    Navigator.pop(context);
  }
}
