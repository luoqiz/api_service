import 'package:flutter/material.dart';

import 'name_bean.dart';

class ProjectSidebar extends StatefulWidget {
  @override
  _ProjectSidebarState createState() => _ProjectSidebarState();
}

class _ProjectSidebarState extends State<ProjectSidebar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) => buildi(data[index]),
        itemCount: data.length,
      ),
    );
  }

  @override
  Widget buildi(NameBean bean) {
    return ListTile(
      title: _buildItem(bean),
    );
  }

  Widget _buildItem(NameBean bean) {
    if (bean.children.isEmpty) {
      return ListTile(
        title: Text(bean.name),
        onTap: () {
          _showSeletedName(bean.name);
        },
      );
    }
    return ExpansionTile(
      key: PageStorageKey<NameBean>(bean),
      title: Text(bean.name),
      children: bean.children.map<Widget>(_buildItem).toList(),
      leading: CircleAvatar(
        backgroundColor: Colors.green,
        child: Text(
          bean.name.substring(0, 1),
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  _showSeletedName(String name) {
    print(name);
    // Scaffold.of(context).showSnackBar(SnackBar(content: Text("选择的是：" + name)));
  }
}
