import 'package:api_service/projects/project_bean.dart';
import 'package:api_service/projects/provider/req_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProjectSidebar extends StatefulWidget {
  @override
  _ProjectSidebarState createState() => _ProjectSidebarState();
}

class _ProjectSidebarState extends State<ProjectSidebar> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(context) {
    return Container(
      color: Theme.of(context).accentColor,
      child: Scrollbar(
        showTrackOnHover: true,
        thickness: 5.0,
        controller: _scrollController,
        child: Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: ListView.builder(
            controller: _scrollController,
            itemBuilder: (BuildContext context, int index) =>
                _buildCollectionItem(data[index]),
            itemCount: data.length,
          ),
        ),
      ),
    );
  }

  Widget _buildCollectionItem(Collection collection) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
            padding: EdgeInsets.all(10.0),
            color: Theme.of(context).accentColor.withAlpha(90),
            child: Column(
              children: [
                _buildCollectionContent(collection),
                Visibility(
                  visible: collection.expand,
                  child: _buildReq(collection),
                ),
              ],
            )),
      ),
    );
  }

  Widget _buildCollectionContent(Collection collection) {
    return Row(
      children: <Widget>[
        Icon(Icons.folder),
        SizedBox(width: 20.0),
        Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  collection.name,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 10),
                Text(
                  collection.desc == "" ? collection.desc : "暂无描述",
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Colors.grey,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ]),
        ),
        IconButton(
          icon: collection.run
              ? Icon(Icons.pause_circle_filled_outlined)
              : Icon(Icons.play_circle_fill_outlined),
          onPressed: () {
            setState(() {
              collection.run = !collection.run;
            });
          },
        ),
        SizedBox(width: 10.0),
        IconButton(
          icon: collection.expand
              ? Icon(Icons.expand_more)
              : Icon(Icons.expand_less),
          onPressed: () {
            setState(() {
              collection.expand = !collection.expand;
            });
          },
        ),
      ],
    );
  }

  /// 构建请求主模块
  Widget _buildReq(Collection collection) {
    return collection.children.length > 0
        ? Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) =>
                  _buildReqItem(collection.children[index]),
              itemCount: collection.children.length,
              separatorBuilder: (BuildContext context, int index) => Divider(
                color: Colors.black,
              ),
            ),
          )
        : Text("暂无数据");
  }

  /// 构建请求单记录模块
  Widget _buildReqItem(Req req) {
    return GestureDetector(
      key: PageStorageKey<Req>(req),
      child: Row(
        children: [
          SizedBox(width: 50.0, child: Text(req.method)),
          SizedBox(width: 20.0),
          Expanded(child: Text(req.name))
        ],
      ),
      onTap: () {
        context.read<ReqProvider>().add(req);
      },
    );
  }
}
