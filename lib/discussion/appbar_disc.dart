import 'package:flutter/material.dart';

class AppB extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: Row(
        children: [
          Icon(Icons.arrow_back),
          CircleAvatar(
              backgroundImage: AssetImage("images/ophtalmologie.png"),
              maxRadius: 20),
        ],
      ),
      /* backgroundColor: Colors.white,
      flexibleSpace: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          SizedBox(width: 12),
          CircleAvatar(
              backgroundImage: AssetImage("images/ophtalmologie.png"),
              maxRadius: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Assane diallo",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 6),
                Text("En ligne",
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
                Icon(Icons.more_vert)
              ],
            ),
          )
        ],
      ),*/
    );
  }

  @override
  Size get preferredSize => throw UnimplementedError();
}
