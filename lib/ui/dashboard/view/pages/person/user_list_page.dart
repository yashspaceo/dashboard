import 'package:dashboard/app/app_font_weight.dart';
import 'package:dashboard/ui/dashboard/view/pages/person/person_controller.dart';
import 'package:dashboard/ui/widgets/common_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserListPage extends GetView<PersonController> {
  const UserListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(titleText: "User List"),
      body: Obx(
        () => ListView.separated(
          itemBuilder: (_, index) {
            return Card(
              child: Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "${index+1}",
                        style: TextStyle(fontSize: 20, fontWeight: AppFontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text("Name      :->  ${controller.userList[index].name}"),
                    Text("Number  :->  ${controller.userList[index].number}"),
                    Text("Email       :->  ${controller.userList[index].email}"),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (_, index) => const SizedBox(
            height: 5,
          ),
          itemCount: controller.userList.length,
        ),
      ),
    );
  }
}
