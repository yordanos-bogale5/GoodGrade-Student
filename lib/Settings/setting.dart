// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'la_screen.dart';

const kWhiteColor = Colors.white;
const kDarkColor = Colors.black;
const kPrimaryColor = Colors.blue;
const kRadius = 8.0;
const kSmallDivider = Divider(height: 8.0);

List<String> settingLabel = [
  'Language',
  'Backup and Accout',
  'Notification reminder',
  'Course related Notifications',
  'Privacy And terms',
  'Help And Support',
  'FAQ',
  'Logout',
];

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: kWhiteColor,
     appBar: AppBar(
          title: const Text('Setting'),
            backgroundColor:Colors.blue[900],
            foregroundColor:Colors.white,
            elevation: 0,
            leading: IconButton(
          icon: const Icon(Icons.arrow_back, color:Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
          ),
      body: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: settingLabel.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              settingLabel[index],
              style: TextStyle(
                fontSize: 16.0,
                color: index % 4 == 0 ? kDarkColor : kDarkColor.withOpacity(0.6),
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20.0,
              color: index % 4 == 0 ? kDarkColor : kDarkColor.withOpacity(0.6),
            ),
            enabled: settingLabel[index] == 'Account' || settingLabel[index] == 'Setting'
                ? false
                : true,
            onTap: () => setState(() {
              switch (settingLabel[index]) {
                case 'Language':
                Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LanguageScreen()),
        );
                  break;
                case 'Backup and Accout':
                  snackBarMsg(context, 'Backup and Account functionality');
                  break;
                case 'Notification reminder':
                  snackBarMsg(context, 'Notification reminder functionality');
                  break;
                case 'Course related Notifications':
                  snackBarMsg(context, 'Course related Notifications functionality');
                  break;
                case 'Privacy And terms':
                  snackBarMsg(context, 'Privacy And terms functionality');
                  break;
                case 'Help And Support':
                  snackBarMsg(context, 'Help And Support functionality');
                  break;
                case 'FAQ':
                  snackBarMsg(context, 'FAQ functionality');
                  break;
                case 'Logout':
                  signOutDrawer(context);
                  break;
              }
            }),
          );
        },
        separatorBuilder: (context, index) {
          return settingLabel[index] == 'Email' || settingLabel[index] == 'Credit Card'
              ? kSmallDivider
              : const Divider();
        },
      ),
    );
  }

  void snackBarMsg(BuildContext context, String text) {
    var sb = SnackBar(
      elevation: kRadius,
      content: Text(text),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(sb);
  }
}

void signOutDrawer(BuildContext context) {
  showModalBottomSheet(
    isDismissible: false,
    context: context,
    builder: (context) {
      return Container(
        color: kPrimaryColor,
        height: 150.0,
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              'Are you sure you want to logout?',
              style: TextStyle(
                color: kWhiteColor,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    color: kWhiteColor,
                    child: const Text(
                      'Logout',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: kPrimaryColor,
                      side: const BorderSide(color: kWhiteColor),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
