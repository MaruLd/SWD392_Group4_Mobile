import 'dart:developer';

import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:evsmart/mainComponent/custom_bottom_nav_bar.dart';
import 'package:evsmart/screens/constraint.dart';
import 'package:evsmart/screens/enums.dart';
import 'package:evsmart/viewModel/account_viewModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scoped_model/scoped_model.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);
  static String routeName = "/setting";

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late User user;
  late Future<void> account;
  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser!;

    FirebaseAuth.instance.userChanges().listen((event) {
      if (event != null && mounted) {
        setState(() {
          user = event;
        });
      }
    });
    log(user.toString());

    account = Get.find<AccountViewModel>().fetchUser();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white.withOpacity(.94),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: kPrimaryColor,
            ),
          ),
          title: const Text(
            "Settings",
            style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: buildBody(),
        bottomNavigationBar:
            const CustomBottomNavBar(selectedMenu: MenuState.setting),
      ),
    );
  }

  Widget buildBody() {
    return ScopedModel(
      model: Get.find<AccountViewModel>(),
      child: ScopedModelDescendant<AccountViewModel>(
          builder: (context, child, model) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ListView(
            children: [
              SimpleUserCard(
                onTap: () {},
                userName: user.displayName ?? "User Name",
                userProfilePic: NetworkImage('${user.photoURL}'),
                imageRadius: 100.0,
                // cardActionWidget: SettingsItem(
                //   icons: Icons.edit,
                //   iconStyle: IconStyle(
                //     withBackground: true,
                //     borderRadius: 50,
                //     backgroundColor: Colors.yellow[600],
                //   ),
                //   title: "Edit Profile",
                //   subtitle: "more detail",
                //   onTap: () {},
                // ),
              ),
              SettingsGroup(
                iconItemSize: 24.0,
                items: [
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.favorite,
                    iconStyle: IconStyle(
                      iconsColor: Colors.red,
                      backgroundColor: Colors.white,
                      withBackground: true,
                    ),
                    title: "Favorite",
                    subtitle: "Your favorite Tickets",
                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.history,
                    iconStyle: IconStyle(
                      iconsColor: Colors.blue,
                      backgroundColor: Colors.white,
                      withBackground: true,
                    ),
                    title: "Lịch sử",
                    subtitle: "Xem lại lịch sử sân",
                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.feedback,
                    iconStyle: IconStyle(
                      iconsColor: Colors.yellow[400],
                      backgroundColor: Colors.white,
                      withBackground: true,
                    ),
                    title: "Gửi feedback",
                    subtitle: "Gửi đánh giá dịch vụ sản phẩm",
                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.logout,
                    iconStyle: IconStyle(
                      iconsColor: Colors.black,
                      backgroundColor: Colors.white,
                      withBackground: true,
                    ),
                    title: "Đăng xuất",
                    subtitle: "Log out",
                  ),
                ],
              ),
              SettingsGroup(
                settingsGroupTitle: "Tùy chọn",
                items: [
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.language,
                    iconStyle: IconStyle(
                      iconsColor: Colors.blue,
                      withBackground: true,
                      backgroundColor: Colors.white,
                    ),
                    title: "Ngôn ngữ",
                    subtitle: "Tiếng Việt",
                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.dark_mode_rounded,
                    iconStyle: IconStyle(
                      iconsColor: Colors.black,
                      withBackground: true,
                      backgroundColor: Colors.white,
                    ),
                    title: 'Dark mode',
                    subtitle: "Automatic",
                    trailing: Switch.adaptive(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
              SettingsGroup(
                settingsGroupTitle: "Thông tin và Hỗ trợ",
                items: [
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.info,
                    iconStyle: IconStyle(
                      iconsColor: Colors.grey,
                      withBackground: true,
                      backgroundColor: Colors.white,
                    ),
                    title: "Về chúng tôi",
                    subtitle: "Xem chi tiết",
                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.question_mark,
                    iconStyle: IconStyle(
                      iconsColor: Colors.grey,
                      withBackground: true,
                      backgroundColor: Colors.white,
                    ),
                    title: "Câu hỏi thường gặp",
                    subtitle: "Xem chi tiết",
                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.phone,
                    iconStyle: IconStyle(
                      iconsColor: Colors.grey,
                      withBackground: true,
                      backgroundColor: Colors.white,
                    ),
                    title: "Liên hệ với chúng tôi",
                    subtitle: "Xem chi tiết",
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
