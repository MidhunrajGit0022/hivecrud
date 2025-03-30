import 'package:flutter/material.dart';
import 'package:hivecrud/database/controller/data_controller.dart';
import 'package:hivecrud/database/model/data_model.dart';
import 'package:hivecrud/update.dart';

class Listdata extends StatefulWidget {
  const Listdata({super.key});

  @override
  State<Listdata> createState() => _ListdataState();
}

class _ListdataState extends State<Listdata> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: datalist,
      builder:
          (BuildContext context, List<Studentmodel> datalist, Widget? child) {
        return ListView.separated(
          itemCount: datalist.length,
          itemBuilder: (context, index) {
            final data = datalist[index];

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name : ${data.name}"),
                      Text("Age : ${data.age}"),
                      Text("Contact : ${data.contact}"),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                deletedata(index);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Updatedata(data: data)));
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.amber,
                              )),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
        );
      },
    );
  }
}
