import 'dart:math';

import 'package:advanced_datatable/advanced_datatable_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../responsive.dart';

class RowData {
  final int index;
  final String value;
  RowData(this.index, this.value);
}

class UsersDataSource extends AdvancedDataTableSource<RowData> {
  final dataMockup = List<RowData>.generate(
      121, (index) => RowData(index, 'Value for no. $index'));
  final BuildContext context;
  UsersDataSource(this.context);

  @override
  bool get isRowCountApproximate => false;
  // @override
  // int get rowCount => dataMockup.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    String image;
    switch (Random().nextInt(3)) {
      case 0:
        image = 'assets/icons/regular.svg';
        break;
      case 1:
        image = 'assets/icons/admin.svg';
        break;
      case 2:
        image = 'assets/icons/banned.svg';
        break;
      default:
        image = 'assets/icons/regular.svg';
    }

    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              SvgPicture.asset(
                image,
                height: 18,
              ),
              const SizedBox(width: defaultPadding / 2),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: context.width / 4),
                child: const Text(
                  'Gabriel Tintarescu',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        DataCell(
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: context.width / 4),
            child: const Text(
              'gabriel_tintarescu@yahoo.com',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        DataCell(
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: context.width / 5),
            child: const Text(
              '0751954687',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        if (!Responsive.isMobile(context))
          DataCell(
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: context.width / 4),
              child: const Text(
                'Admin',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
      ],
      onSelectChanged: (b) => print("da ma $b"),
    );
  }

  @override
  Future<RemoteDataSourceDetails<RowData>> getNextPage(
      NextPageRequest pageRequest) async {
    await Future.delayed(const Duration(seconds: 2));

    //TODO Implement Server Pagination
    //? we know pageRequest.offset and pageRequest.pagesize

    return RemoteDataSourceDetails(
      dataMockup.length,
      dataMockup.skip(pageRequest.offset).take(pageRequest.pageSize).toList(),
      filteredRows: dataMockup.length,
    );
  }
}
