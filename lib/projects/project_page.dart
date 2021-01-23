import 'package:api_service/common/horizontal_drag.dart';
import 'package:api_service/projects/project_sidebar.dart';
import 'package:api_service/projects/provider/req_provider.dart';
import 'package:api_service/projects/req_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  double leftWidth = 350.0;
  double originLeftWidth = 0.0;

  @override
  Widget build(BuildContext context) {
    return _buildProject();
  }

  Widget _buildProject() {
    return Row(
      children: <Widget>[
        _buildProjectSidebar(),
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
          child: _buildContent(context),
          // 中间用Expanded控件
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
              buildExtendItem(context, "message", TextDirection.rtl, () {
                print("messge");
              }),
              SizedBox(
                height: 5,
              ),
              buildExtendItem(context, "header", TextDirection.rtl, () {
                print("header");
              }),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProjectSidebar() {
    return Container(
      alignment: Alignment.centerLeft,
      width: leftWidth,
      padding: EdgeInsets.only(left: 5.0, top: 10.0, bottom: 10.0),
      color: Theme.of(context).accentColor,
      child: ProjectSidebar(),
    );
  }

  /// 构建扩展功能模块
  Widget buildExtendItem(BuildContext context, String msg,
      TextDirection textDirection, VoidCallback callback) {
    return RotatedBox(
      quarterTurns: 1,
      child: OutlinedButton(
        // padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Text(
          msg,
          textDirection: textDirection,
          overflow: TextOverflow.fade,
          style: TextStyle(fontSize: 14, color: Colors.indigoAccent),
        ),
        onPressed: callback,
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Consumer<ReqProvider>(
      builder: (context, model, child) => ListView.builder(
        itemCount: model.activeReqList.length,
        itemBuilder: (context, index) {
          return ReqDetails(
              key: ValueKey(model.activeReqList[index].id),
              req: model.activeReqList[index]);
        },
      ),
    );
  }
}
