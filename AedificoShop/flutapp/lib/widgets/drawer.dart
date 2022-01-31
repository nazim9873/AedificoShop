import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "data:image/jpeg;base64,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";   return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                accountName: Text('Vaseem Durrani'),
                accountEmail: Text('vdurrani@gmail.com'),
                margin: EdgeInsets.zero,
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Email",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
