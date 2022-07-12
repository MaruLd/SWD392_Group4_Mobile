import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/material.dart';



class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white.withOpacity(.94),
        /*body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ListView(
            children: [
              *//*  BigUserCard(
                cardColor: Colors.green,
                userName: "Trần Gia Hoàng",
                userProfilePic: AssetImage("assets/images/hoangtran.jpg"),
                cardActionWidget: SettingsItem(
                  icons: Icons.edit,
                  iconStyle: IconStyle(
                    withBackground: true,
                    borderRadius: 50,
                    backgroundColor: Colors.yellow[600],
                  ),
                  title: "Chỉnh sửa hồ sơ",
                  subtitle: "Xem chi tiết",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserScreen()));
                  },
                ),
              ),*//*
              SettingsGroup(
                settingsGroupTitle: "Utilities",
                iconItemSize: 24.0,
                items: [
                  SettingsItem(
                    onTap: () {
                    },
                    icons: Icons.favorite,
                    iconStyle: IconStyle(
                      iconsColor: Colors.red,
                      backgroundColor: Colors.white,
                      withBackground: true,
                    ),
                    title: "Favorite",
                    subtitle: "",
                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.history,
                    iconStyle: IconStyle(
                      iconsColor: Colors.blue,
                      backgroundColor: Colors.white,
                      withBackground: true,
                    ),
                    title: "History",
                    subtitle: "",
                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.feedback,
                    iconStyle: IconStyle(
                      iconsColor: Colors.yellow[400],
                      backgroundColor: Colors.white,
                      withBackground: true,
                    ),
                    title: "Feedback",
                    subtitle: "",
                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.logout,
                    iconStyle: IconStyle(
                      iconsColor: Colors.black,
                      backgroundColor: Colors.white,
                      withBackground: true,
                    ),
                    title: "Log out",
                    subtitle: "",
                  ),
                ],
              ),
              SettingsGroup(
                settingsGroupTitle: "Settings",
                items: [
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.language,
                    iconStyle: IconStyle(
                      iconsColor: Colors.blue,
                      withBackground: true,
                      backgroundColor: Colors.white,
                    ),
                    title: "Language",
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
                settingsGroupTitle: "Support & Information",
                items: [
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.info,
                    iconStyle: IconStyle(
                      iconsColor: Colors.grey,
                      withBackground: true,
                      backgroundColor: Colors.white,
                    ),
                    title: "About us",
                    subtitle: "",
                  ),

                  SettingsItem(
                    onTap: () {},
                    icons: Icons.phone,
                    iconStyle: IconStyle(
                      iconsColor: Colors.grey,
                      withBackground: true,
                      backgroundColor: Colors.white,
                    ),
                    title: "Contact us" ,
                    subtitle: "",
                  ),
                ],
              ),
            ],
          ),
        ),*/
      ),
    );
  }
}
