import 'package:advanced_datatable/advanced_datatable_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:upkeep_client/controllers/dashboard_controller.dart';
import '../constants.dart';
import '../models/user_response.dart';
import '../responsive.dart';

class UsersDataSource extends AdvancedDataTableSource<User> {
  final BuildContext context;
  UsersDataSource(this.context);
  DashboardController controller = Get.find();

  @override
  bool get isRowCountApproximate => false;
  // @override
  // int get rowCount => dataMockup.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    if (lastDetails == null) {
      return DataRow(
          cells: List.generate(4, (index) => const DataCell(Text('Nothing'))));
    }
    var currentUser = lastDetails!.rows[index];

    String image;
    switch (currentUser.type.toLowerCase()) {
      case 'user':
        image = 'assets/icons/regular.svg';
        break;
      case 'admin':
        image = 'assets/icons/admin.svg';
        break;
      case 'banned':
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
                child: Text(
                  currentUser.name,
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
            child: Text(
              currentUser.email,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        DataCell(
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: context.width / 5),
            child: Text(
              currentUser.phone,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        if (!Responsive.isMobile(context))
          DataCell(
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: context.width / 4),
              child: Text(
                currentUser.type,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
      ],
      onSelectChanged: (b) => controller.openEditUser(currentUser),
    );
  }

  @override
  Future<RemoteDataSourceDetails<User>> getNextPage(
      NextPageRequest pageRequest) async {
    await Future.delayed(const Duration(milliseconds: 1400));
    var userResponse =
        await controller.fetchUsers(pageRequest.offset, pageRequest.pageSize);

    return RemoteDataSourceDetails(
      userResponse.count,
      userResponse.users,
    );
  }
}
