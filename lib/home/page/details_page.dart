import 'package:api_service/projects/project_sidebar.dart';
import 'package:api_service/sidebar/sidebar_nav.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  double leftWidth = 350;

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
          Draggable(
            axis: Axis.horizontal,
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
            feedback: Container(
              width: 4,
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(4)),
              child: VerticalDivider(
                width: 4,
                color: Colors.grey,
              ),
            ),
            childWhenDragging: Container(
              width: 0,
              height: 0,
            ),
            onDragStarted: () {
              print('onDragStarted');
            },
            onDragEnd: (DraggableDetails details) {
              print('onDragEnd:$details');
              print("onDragEnd");
              print(" dragEndDetails.offset:" + details.offset.toString());
              setState(() {
                leftWidth = details.offset.dx;
              });
            },
            onDraggableCanceled: (Velocity velocity, Offset offset) {
              print('onDraggableCanceled velocity:$velocity,offset:$offset');
            },
            onDragCompleted: () {
              print('onDragCompleted');
            },
          ),
          Expanded(
            child: RaisedButton(
              color: Colors.white60,
              padding: EdgeInsets.symmetric(horizontal: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              onPressed: () {
                setState(() {
                  leftWidth = leftWidth + 50;
                });
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
