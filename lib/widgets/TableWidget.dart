import 'package:flutter/material.dart';
import 'package:so34ngo122/models/User.dart';
import 'package:so34ngo122/services/DatabaseService.dart';

class TableWidget extends StatelessWidget {
  List<User> listUser = List<User>();
  TableWidget({Key key, @required this.listUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: Text(
              'Con nợ',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'Số tiền hiện tại nợ quỹ',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ],
        rows: listUser
            .map((e) => DataRow(cells: <DataCell>[
                  DataCell(Text(e.name)),
                  DataCell(Text(e.wallet.toString()))
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
        );
  }
}
