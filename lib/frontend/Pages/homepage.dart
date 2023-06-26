// ignore_for_file: must_be_immutable, non_constant_identifier_names, avoid_print

import 'package:easytrade/frontend/Pages/codepage.dart';
import 'package:easytrade/frontend/newpage.dart';
import 'package:easytrade/frontend/repositories/repo_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class HomePage extends StatefulWidget {
  String? Nomi = '';
  String Narxi = 'a';
  String Market;
  String rasm;
  HomePage(
      {super.key,
      this.Nomi,
      this.Narxi = '',
      this.Market = '',
      this.rasm = ''});

  @override
  State<HomePage> createState() => _HomePageState();
}

String name = '';

class _HomePageState extends State<HomePage> {
  Future<void> startBarcodeScanStream() async {
    await FlutterBarcodeScanner.scanBarcode(
            '#000000', 'Cancel', true, ScanMode.BARCODE)
        .then((value) {
      name = value;
    });
  }

  List keys = [];

  List values = [];
  @override
  void initState() {
    keys.add(models?.data.keys.toList() ?? 0);
    values.add(models?.data.values.toList() ?? 0);
    print(keys);
    print(values);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 77,
              ),
              Image.memory(response!.bodyBytes),
              const SizedBox(
                height: 150,
              ),
              Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.Nomi == null
                        ? const SizedBox(
                            width: 0,
                          )
                        : const SizedBox.shrink(),
                    const Center(
                      child: Text(
                        'Nomi: ',
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.red,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        widget.Nomi == null
                            ? const Text('')
                            : SizedBox(
                                width: 300,
                                child: Text(
                                  ' ${widget.Nomi ?? ''}',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 32),
                                ),
                              )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Narxi: ',
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    widget.Narxi.toString(),
                    style: const TextStyle(fontSize: 32),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Qidiruvlar',
                style: TextStyle(color: Colors.black, fontSize: 35),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchPage(
                              values: values,
                            ),
                          ));
                    },
                    child: Container(
                      height: 55,
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border.all(
                        width: 5.5,
                        color: Colors.blue,
                      )),
                      child: const Center(
                        child: Text(
                          'Nomi Bilan',
                          style: TextStyle(fontSize: 22, color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CodePage(
                              values: values,
                            ),
                          ));
                    },
                    child: Container(
                      height: 55,
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border.all(
                        width: 5.5,
                        color: Colors.blue,
                      )),
                      child: const Center(
                        child: Text(
                          'Code Orqali',
                          style: TextStyle(fontSize: 22, color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  startBarcodeScanStream().then((value) {
                    models?.data.forEach((key, value) {
                      if (key == name) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(
                                Nomi: value[0].toString(),
                                Narxi: value[1].toString(),
                              ),
                            ));
                      } else {
                        print('Topilmadi');
                      }
                    });
                  });
                },
                child: Container(
                  height: 77,
                  width: 200,
                  decoration: BoxDecoration(
                      border: Border.all(
                    width: 5.5,
                    color: Colors.blue,
                  )),
                  child: const Center(
                    child: Text(
                      'Shtrix Code orqali tekshirish',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25, color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
