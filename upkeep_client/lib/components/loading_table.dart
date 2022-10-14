import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../constants.dart';
import '../responsive.dart';

class LoadingTable extends StatelessWidget {
  const LoadingTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      showCheckboxColumn: false,
      columnSpacing: defaultPadding,
      dataRowHeight: 60,
      horizontalMargin: 0,
      columns: [
        const DataColumn(
          label: Text('Name'),
        ),
        const DataColumn(
          label: Text('Email'),
        ),
        const DataColumn(
          label: Text('Phone'),
        ),
        if (!Responsive.isMobile(context))
          const DataColumn(
            label: Text('Type'),
          ),
      ],
      rows: [...List.generate(8, (index) => createLoadingRow(context))],
    );
  }

  DataRow createLoadingRow(BuildContext context) {
    return DataRow(
      cells: [
        DataCell(
          Shimmer.fromColors(
            baseColor: Colors.grey[400] as Color,
            highlightColor: Colors.white,
            child: Row(children: [
              Container(
                width: 17,
                height: 17,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: defaultPadding / 2),
              Container(
                width: 100,
                height: 13,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ]),
          ),
        ),
        DataCell(
          Shimmer.fromColors(
            baseColor: Colors.grey[400] as Color,
            highlightColor: Colors.white,
            child: Container(
              width: 150,
              height: 13,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ),
        DataCell(
          Shimmer.fromColors(
            baseColor: Colors.grey[400] as Color,
            highlightColor: Colors.white,
            child: Container(
              width: 90,
              height: 13,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ),
        if (!Responsive.isMobile(context))
          DataCell(
            Shimmer.fromColors(
              baseColor: Colors.grey[400] as Color,
              highlightColor: Colors.white,
              child: Container(
                width: 50,
                height: 13,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
