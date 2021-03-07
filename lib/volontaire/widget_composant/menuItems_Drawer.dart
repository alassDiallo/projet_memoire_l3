import 'package:flutter/material.dart';

class MenuItemsDrawer extends StatelessWidget {
  String menuTitle;
  IconData menuIcon;
  Function contexte;
  MenuItemsDrawer(this.menuTitle, this.menuIcon, this.contexte);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(menuTitle),
        leading: Icon(menuIcon),
        trailing: Icon(Icons.arrow_right_rounded),
        onTap: () {
          this.contexte(context);
        });
  }
}
