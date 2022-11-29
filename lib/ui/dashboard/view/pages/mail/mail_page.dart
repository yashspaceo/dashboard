import 'package:dashboard/ui/dashboard/view/pages/mail/mail_controller.dart';
import 'package:dashboard/ui/dashboard/view/pages/mail/tabs/mail_one.dart';
import 'package:dashboard/ui/dashboard/view/pages/mail/tabs/mail_two.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MailPage extends GetView<MailController> {
  const MailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: TabBar(
            labelColor: const Color.fromRGBO(4, 2, 46, 1),
            indicatorColor: const Color.fromRGBO(4, 2, 46, 1),
            unselectedLabelColor: Colors.grey,
            controller: controller.tabController,
            tabs: const [
              Text('MailOne'),
              Text('MainTwo'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: controller.tabController,
            children: [MailOne(), MailTwo()],
          ),
        ),
      ],
    );
  }
}
