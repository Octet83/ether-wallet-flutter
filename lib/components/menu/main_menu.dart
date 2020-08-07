import 'package:ambwallet/utils/wallet_icons.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MainMenu extends StatelessWidget {
  MainMenu({this.address, this.onReset});

  final String address;
  final Function onReset;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
              title: Text("My masternode"),
              subtitle: Text("My masternode"),
              trailing: Icon(
                Icons.graphic_eq,
                color: Colors.black,
              ),
              onTap: () => {
                Navigator.pushNamed(context, '/node')
              }
              
              ),
          ListTile(
              title: Text("Reset wallet"),
              subtitle: Text("Wipe all wallet data"),
              trailing: Icon(
                WalletIcons.skull,
                color: Colors.red,
              ),
              onTap: this.onReset),
        ],
      ),
    );
  }
}
