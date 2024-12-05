import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/provider/dark_theme_provider.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressTextController =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Hi",
                  style: TextStyle(
                    color: color,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextWidget(
                  text: "klednatee@spvc.ac.th",
                  color: color,
                  textSize: 18,
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  thickness: 2,
                ),
                SizedBox(
                  height: 20,
                ),
                _listTiles(
                  title: 'Address 2',
                  subtitle: 'My subtitle',
                  icon: IconlyLight.profile,
                  onPressed: () async {
                    await _showAddressDialog();
                  },
                  color: color,
                ),
                SizedBox(
                  height: 20,
                ),
                _listTiles(
                  title: 'Orders',
                  icon: IconlyLight.bag,
                  onPressed: () {},
                  color: color,
                ),
                _listTiles(
                  title: 'Wishlist',
                  icon: IconlyLight.heart,
                  onPressed: () {},
                  color: color,
                ),
                _listTiles(
                  title: 'Viewed',
                  icon: IconlyLight.show,
                  onPressed: () {},
                  color: color,
                ),
                _listTiles(
                  title: 'Forgot Password',
                  icon: IconlyLight.unlock,
                  onPressed: () {},
                  color: color,
                ),
                SwitchListTile(
                  title: TextWidget(
                    text: themeState.getDarkTheme ? 'Dark mode' : 'Light mode',
                    color: color,
                    textSize: 22,
                    isTitle: true,
                  ),
                  secondary: Icon(themeState.getDarkTheme
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined),
                  onChanged: (bool value) {
                    setState(() {
                      themeState.setDarkTheme = value;
                    });
                  },
                  value: themeState.getDarkTheme,
                ),
                SizedBox(
                  height: 20,
                ),
                _listTiles(
                  title: 'Logout',
                  icon: IconlyLight.logout,
                  onPressed: () {
                    _showLogoutDialog();
                  },
                  color: color,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _listTiles({
    required String title,
    String? subtitle,
    required IconData icon,
    required Function onPressed,
    required Color color,
  }) {
    return ListTile(
      title: TextWidget(
        text: title,
        color: color,
        textSize: 22,
        isTitle: true,
      ),
      subtitle: TextWidget(
        text: subtitle == null ? "" : subtitle,
        color: color,
        textSize: 18,
      ),
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: () {
        onPressed();
      },
    );
  }

// Alternative code for the listTile.
  Widget listTileAsRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          const Icon(Icons.settings),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Title'),
              Text('Subtitle'),
            ],
          ),
          const Spacer(),
          const Icon(Icons.chevron_right)
        ],
      ),
    );
  }

  Future<void> _showLogoutDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Update'),
            content: TextField(
              onChanged: (value) {
                print(
                  '_addressTextController.text ${_addressTextController.text}',
                );
              },
              controller: _addressTextController,
              maxLines: 5,
              decoration: const InputDecoration(hintText: "Your address"),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  print('Updated By Klednatee');
                },
                child: const Text('Update'),
              ),
            ],
          );
        });
  }

  Future<void> _showAddressDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Update'),
            content: TextField(
              onChanged: (value) {
                print(
                  '_addressTextController.text ${_addressTextController.text}',
                );
              },
              controller: _addressTextController,
              maxLines: 5,
              decoration: const InputDecoration(hintText: "Your address"),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  print('Updated By Klednatee');
                },
                child: const Text('Update'),
              ),
            ],
          );
        });
  }
}