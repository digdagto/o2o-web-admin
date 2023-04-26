// member_management_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:o2o_point_configuration/domain/entities/member.dart';
import 'package:o2o_point_configuration/domain/services/auth_service.dart';
import 'package:o2o_point_configuration/presentation/add_member_page.dart';
import 'package:o2o_point_configuration/presentation/controllers/member_controller.dart';
import 'package:o2o_point_configuration/presentation/edit_member_page.dart';

class MemberManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MemberController>();
    final auth = Get.find<AuthService>();
    return Scaffold(
      appBar: AppBar(title: Text('Member Management')),
      body: Obx(() =>
      ListView.builder(
        itemCount: controller.members?.length,
        itemBuilder: (context, index) {
          final member = controller.members?[index];
          return ListTile(
            title: Text(member?.name ?? ""),
            subtitle: Text(member?.phone ?? ""),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () async {
                    // Navigate to the edit member screen and update the member
                    final updatedMember = await Get.to(() =>
                        EditMemberPage(member: member!));
                    if (updatedMember != null) {
                      controller.updateMember(updatedMember);
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // Delete the member
                    controller.deleteMember(
                        member?.name ?? "", member?.phone ?? "");
                  },
                ),
              ],
            ),
          );
        },
      ),),
          floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
        onPressed: () async {
          // Navigate to the add member screen and add a new member
          final newMember = await Get.to(() => AddMemberPage());
          if (newMember != null) {
            controller.addMember(newMember);
          }
        },
      ),
    );


    //   Obx(
    //         () => ListView.builder(
    //       itemCount: controller.members?.length,
    //       itemBuilder: (context, index) {
    //         final member = controller.members?[index];
    //         return ListTile(
    //           title: Text(member?.name ?? ""),
    //           subtitle: Text(member?.phone ?? ""),
    //           trailing: Row(
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               IconButton(
    //                 icon: Icon(Icons.edit),
    //                 onPressed: () async {
    //                   // Navigate to the edit member screen and update the member
    //                   final updatedMember = await Get.to(() => EditMemberPage(member: member!));
    //                   if (updatedMember != null) {
    //                     controller.updateMember(updatedMember);
    //                   }
    //                 },
    //               ),
    //               IconButton(
    //                 icon: Icon(Icons.delete),
    //                 onPressed: () {
    //                   // Delete the member
    //                   controller.deleteMember(member?.name ?? "", member?.phone ?? "");
    //                 },
    //               ),
    //             ],
    //           ),
    //         );
    //       },
    //     ),
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     child: Icon(Icons.add),
    //     onPressed: () async {
    //       // Navigate to the add member screen and add a new member
    //       final newMember = await Get.to(() => AddMemberPage());
    //       if (newMember != null) {
    //         controller.addMember(newMember);
    //       }
    //     },
    //   ),
    // );
  }
}
