import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:so34ngo122/models/Expense.dart';
import 'package:provider/provider.dart';
import 'package:so34ngo122/models/WhoUse.dart';

class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Expense.
  final Expense expense;
  // Map<String, bool> listResult = new Map<String, bool>();
  List<String> listName = new List<String>();
  List<WhoUse> listWhoUse = new List<WhoUse>();
  // In the constructor, require a Expense.
  DetailScreen({Key key, @required this.expense}) {
    var tagsJson = jsonDecode(expense.whoUse)['whoUse'];
    List<dynamic> tags = tagsJson != null ? List.from(tagsJson) : null;
    tags.forEach((e) {
      listWhoUse.add(WhoUse(e['name'], e['isUse']));
    });
    print(listWhoUse.length);
    listWhoUse.forEach((key) {
      listName.add(key.name);
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // Use the Expense to create the UI.
    return Scaffold(
        appBar: AppBar(
          title: Text(expense.title),
        ),
        body: Container(
          width: size.width,
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Mặt Hàng: ' + expense.title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Giá Tiền: ' + expense.price.toString(),
                    style: Theme.of(context).textTheme.headline5),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Ngày Thêm: ' + expense.date,
                    style:
                        TextStyle(fontStyle: FontStyle.italic, fontSize: 14)),
              ),
              Consumer<String>(
                //                    <--- Consumer
                builder: (context, name, child) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Người Thêm: ' + name,
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 14)),
                  );
                },
              ),
              DataTable(
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text(
                        'Những người sử dụng item này',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                  rows: listName
                      .map((e) => DataRow(cells: <DataCell>[
                            DataCell(Text(e)),
                            // DataCell(Text(e.wallet.toString()))
                          ]))
                      .toList()
                  // rows:  <DataRow>[
                  //   listUser
                  //       .map((e) => DataRow(
                  //             cells: <DataCell>[
                  //               DataCell(Text('Sarah')),
                  //               DataCell(Text('19')),
                  //             ],
                  //           ))
                  //       .toList()
                  // ],
                  ),
              expense.description.length != 0
                  ? Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text('Ghi Chú: ' + expense.description,
                          style: TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 14)),
                    )
                  : Text(''),
            ]),
          ),
        ));
  }
}
