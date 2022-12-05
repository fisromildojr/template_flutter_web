import 'package:flutter/material.dart';
import 'package:template_flutter_web/app/theme/Theme.dart';
import 'package:template_flutter_web/app/utils/constants.dart';

class MyTable extends StatelessWidget {
  final String? title;
  final double? width;
  final List<DataRow> rows;
  final List<DataColumn> columns;
  final bool sortAscending;
  final int? sortColumnIndex;
  const MyTable({
    Key? key,
    this.title,
    this.width,
    required this.rows,
    required this.columns,
    this.sortAscending = false,
    this.sortColumnIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width -
            (widthDrawer + (defaultPadding * 2)),
      ),
      child: DataTable(
        showBottomBorder: true,
        headingRowColor: MaterialStateColor.resolveWith(
          (states) {
            return MyColors.headerTable;
          },
        ),
        dataRowColor: MaterialStateColor.resolveWith(
          (states) {
            return MyColors.secondary;
          },
        ),
        headingRowHeight: 30.0,
        dataRowHeight: 30.0,
        columnSpacing: defaultPadding,
        columns: columns,
        rows: rows,
        sortAscending: sortAscending,
        sortColumnIndex: sortColumnIndex,
      ),
    );
  }
}
