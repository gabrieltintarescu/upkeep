import 'package:advanced_datatable/datatable.dart';
import 'package:flutter/material.dart';
import 'package:upkeep_client/components/loading_table.dart';
import 'package:upkeep_client/controllers/users_data_source.dart';
import 'package:upkeep_client/responsive.dart';

import '../constants.dart';

class RegisteredUsersTable extends StatelessWidget {
  const RegisteredUsersTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Theme(
          data: Theme.of(context).copyWith(
            cardColor: secondaryColor,
            textTheme: const TextTheme(
              caption: TextStyle(color: Colors.white),
            ),
          ),
          child: AdvancedPaginatedDataTable(
            addEmptyRows: false,
            showCheckboxColumn: false,
            source: UsersDataSource(context),
            columnSpacing: defaultPadding,
            dataRowHeight: 60,
            horizontalMargin: 0,
            rowsPerPage: 8,
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
            loadingWidget: () => const LoadingTable(),
          ),
        ));
  }
}
