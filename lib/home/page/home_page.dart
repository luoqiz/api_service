import 'package:api_service/common/horizontal_drag.dart';
import 'package:api_service/projects/project_sidebar.dart';
import 'package:api_service/sidebar/sidebar_nav.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double leftWidth = 350.0;
  double originLeftWidth = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          new Container(
            alignment: Alignment.center,
            width: 80,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: SidebarNav(),
          ),
          new Container(
            alignment: Alignment.centerLeft,
            width: leftWidth,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            color: Colors.white,
            child: ProjectSidebar(),
          ),
          HorizontalDrag(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: 4,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(4)),
              child: VerticalDivider(
                width: 4,
                color: Colors.grey,
              ),
            ),
            onChange: (double offset) {
              setState(() {
                leftWidth = originLeftWidth + offset;
              });
            },
            onDragStart: (DragDownDetails downDetails) {
              originLeftWidth = leftWidth;
            },
          ),

          Expanded(
            child: RaisedButton(
              color: Colors.white60,
              padding: EdgeInsets.symmetric(horizontal: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              onPressed: () {
                Navigator.pushNamed(context, "/test");
                // setState(() {
                //   leftWidth = leftWidth + 50;
                // });
              },
              child: Text(
                'UPGRADE',
              ),
            ), // 中间用Expanded控件
          ),
          Container(
              width: 20,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(4)),
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  buildExtendItem(context, "message", () {
                    print("messge");
                  }),
                  SizedBox(
                    height: 5,
                  ),
                  buildExtendItem(context, "header", () {
                    print("header");
                  }),
                ],
              ))
        ],
      ),
    );
  }

  Widget buildExtendItem(
      BuildContext context, String msg, VoidCallback callback) {
    return RotatedBox(
      quarterTurns: 1,
      child: OutlineButton(
        // padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Text(
          msg,
          textDirection: TextDirection.rtl,
          overflow: TextOverflow.fade,
          style: TextStyle(fontSize: 14, color: Colors.indigoAccent),
        ),
        onPressed: callback,
      ),
    );
  }
}
