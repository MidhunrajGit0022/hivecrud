import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hivecrud/database/model/data_model.dart';

ValueNotifier<List<Studentmodel>> datalist = ValueNotifier([]);

Future<void> adddata(Studentmodel value) async {
  final studentdb = await Hive.openBox<Studentmodel>('student_db');
  await studentdb.add(value);
  datalist.value.add(value);
  datalist.notifyListeners();
}

Future<void> getalldata() async {
  final studentdb = await Hive.openBox<Studentmodel>('student_db');
  datalist.value.clear();
  datalist.value.addAll(studentdb.values);
  datalist.notifyListeners();
}

Future<void> deletedata(int index) async {
  final studentdb = await Hive.openBox<Studentmodel>('student_db');
  await studentdb.deleteAt(index);
  getalldata();
}

Future<void> updatedata(int index, Studentmodel newStudent) async {
  final studentdb = await Hive.openBox<Studentmodel>('student_db');
  studentdb.putAt(index, newStudent);
  getalldata();
}

