import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_store/app/modules/login/controller/login_controller.dart';
import 'package:whatsapp_store/app/modules/profile/controller/profile_controller.dart';

import '../../../routes/app_pages.dart';

class ProfilePage extends GetView<ProfileController> {
  ProfilePage({super.key});

  final loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black87,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => Row(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                              controller.user.value.image.toString()),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Hi"),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${controller.user.value.firstName} ${controller.user.value.lastName}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(controller.user.value.email.toString()),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text("+91 9595952152")
                          ],
                        )
                      ],
                    )),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ElevatedButton(
                      onPressed: () => Get.toNamed(Routes.productPage),
                      style: ElevatedButton.styleFrom(
                          disabledBackgroundColor: Colors.black,
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13))),
                      child: const Text(
                        "List of Products",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "Your Informations",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                const SizedBox(
                  height: 20,
                ),
                const ListTile(
                  leading: Icon(
                    Icons.file_present,
                    size: 28,
                  ),
                  title: Text(
                    "Order History",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.contact_mail,
                    size: 28,
                  ),
                  title: Text(
                    "Address Book",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.edit_outlined,
                    size: 28,
                  ),
                  title: Text(
                    "Edit Profile",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.notifications,
                    size: 28,
                  ),
                  title: Text(
                    "Notification",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Others",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                const SizedBox(
                  height: 20,
                ),
                const ListTile(
                  leading: Icon(
                    Icons.support_agent,
                    size: 28,
                  ),
                  title: Text(
                    "Support",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.compare_arrows_outlined,
                    size: 28,
                  ),
                  title: Text(
                    "share",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.info_outline,
                    size: 28,
                  ),
                  title: Text(
                    "About us",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.lock_open_outlined,
                    size: 28,
                  ),
                  title: Text(
                    "Change password",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    loginController.logout();
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.login,
                      size: 28,
                    ),
                    title: Text(
                      "Logout",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
