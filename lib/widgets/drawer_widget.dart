import 'package:flutter/material.dart';
import '../screens/login_screen.dart';

class DrawerWidget extends StatelessWidget {
  final Function onTap;

  const DrawerWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("Oki Firdaus"),
              accountEmail: const Text("E41211524"),
              currentAccountPicture: const CircleAvatar(
                backgroundImage:
                    AssetImage("assets/images/user_profiles/foto.png"),
              ),
              otherAccountsPictures: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings,
                    color: ThemeData().colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () => onTap(context, 0),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () => onTap(context, 1),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () => onTap(context, 2),
            ),
            Divider(
              height: 1,
              color: Colors.black45,
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
