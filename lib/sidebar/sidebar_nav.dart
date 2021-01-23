import 'package:flutter/material.dart';

/// 主页左侧导航栏
class SidebarNav extends StatefulWidget {
  final Function changeIndex;

  const SidebarNav({Key key, @required this.changeIndex}) : super(key: key);

  @override
  _SidebarNavState createState() => _SidebarNavState();
}

class _SidebarNavState extends State<SidebarNav> {
  Widget buildItem(String title, Function() onpresssed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.purple,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        // textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              Icons.camera,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      onPressed: onpresssed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildItem(
            "最近",
            () => {
                  if (widget.changeIndex != null) {widget.changeIndex(0)}
                }),
        SizedBox(height: 10),
        buildItem(
            "项目",
            () => {
                  if (widget.changeIndex != null) {widget.changeIndex(1)}
                }),
        SizedBox(height: 10),
        buildItem(
            "团队",
            () => {
                  if (widget.changeIndex != null) {widget.changeIndex(2)}
                }),
      ],
    );
  }
}
