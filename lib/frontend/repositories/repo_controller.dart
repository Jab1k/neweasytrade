// ignore_for_file: unused_local_variable, avoid_print

import 'dart:convert';

import 'package:easytrade/frontend/model/model.dart';
import 'package:http/http.dart' as http;

Membermodel? members;

List memberlogin = [];
List memberpass = [];
List ids = [];
MainModel? models;
http.Response? response;
getAlldata(String name) async {
  print('$name salokm');
  var res = await http.post(
    Uri.parse('https://easymobile.uz/postdata?hostname=$name'),
  );
  print(res.body);
  models = MainModel(data: jsonDecode(res.body));
  print(models?.data);

  var a = await http.get(
    Uri.parse('https://easymobile.uz/getmembers'),
  );
  print(a.body);
  members = Membermodel(member: jsonDecode(a.body));
  print(members?.member);
  members?.member.forEach((key, value) {
    memberlogin.add(key);
    memberpass.add(value);
  });
  response = await http
      .post(Uri.parse('https://easymobile.uz/postimage?hostname=$name'));
  print('$name ${response!.bodyBytes} aaa');
  var s = await http.get(
    Uri.parse('https://easymobile.uz/'),
  );
}
