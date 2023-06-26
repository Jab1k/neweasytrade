// ignore_for_file: must_be_immutable, use_build_context_synchronously, library_private_types_in_public_api, prefer_final_fields

import 'package:easytrade/frontend/Pages/homepage.dart';
import 'package:flutter/material.dart';

class CodePage extends StatefulWidget {
  final List values;

  const CodePage({super.key, 
    required this.values,
  });

  @override
  _CodePageState createState() => _CodePageState();
}

class _CodePageState extends State<CodePage> {
  List<String> _searchResult = [];
  List _searchnarx = [];
  _searchItem(String searchText) {
    _searchResult.clear();
    _searchnarx.clear();

    if (searchText.isEmpty) {
      setState(() {});
      return;
    }

    for (int i = 0; i < widget.values.length; i++) {
      for (var item in widget.values[i]) {
        if (item[2].toString().contains(searchText.toLowerCase())) {
          _searchResult.add(item[0]);
          _searchnarx.add(item[1].toString());
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: TextFormField(
                onChanged: (value) {
                  _searchItem(value);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  labelText: 'Maxsulot Kodini Kiriting',
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResult.length,
              itemBuilder: (context, index) {
                final item = _searchResult[index];
                final items = _searchnarx[index];
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () async {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return HomePage(
                            Nomi: item,
                            Narxi: items.toString(),
                          );
                        },
                      ));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: Colors.blue,
                      ),
                      child: Center(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Maxsulot Nomi: $item',
                            style: const TextStyle(color: Colors.black, fontSize: 26),
                          ),
                          Text(
                            'Maxsulot Narxi: $items',
                            style: const TextStyle(color: Colors.black, fontSize: 26),
                          ),
                        ],
                      )),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
