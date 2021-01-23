import 'package:api_service/projects/project_page.dart';
import 'package:api_service/sidebar/sidebar_nav.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _stackIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: Row(
              children: [
                _buildBodyLeft(),
                Expanded(
                  child: _buildBodyContent(),
                ),
                _buildBodyRight()
              ],
            ),
          ),
          _buildBottom(),
        ],
      ),
    );
  }

  /// 构建 header
  Widget _buildHeader() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 0.0,
      decoration: BoxDecoration(color: Theme.of(context).accentColor,border: Border.all(width: 2.0)),
      child: Column(
        children: [],
      ),
    );
  }

  /// 构建 bottom
  Widget _buildBottom() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 30.0,
      decoration: BoxDecoration(
          // color: Colors.grey[500],
          border: Border.all(width: 2.0),
          borderRadius: BorderRadius.circular(4)),
      child: Column(
        children: [],
      ),
    );
  }

  /// 构建 bodyLeft
  Widget _buildBodyLeft() {
    return new Container(
      alignment: Alignment.center,
      width: 80,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: SidebarNav(
        changeIndex: (index) => {
          setState(() {
            _stackIndex = index;
          })
        },
      ),
    );
  }

  /// 构建主体
  Widget _buildBodyContent() {
    return IndexedStack(
      index: _stackIndex,
      children: <Widget>[
        ProjectPage(),
        Center(
          child: Container(
            height: 300,
            width: 300,
            // color: Colors.red,
            alignment: Alignment.center,
            child: Icon(
              Icons.fastfood,
              size: 60,
              // color: Colors.blue,
            ),
          ),
        ),
        Center(
          child: Container(
            height: 300,
            width: 300,
            // color: Colors.green,
            alignment: Alignment.center,
            child: Icon(
              Icons.cake,
              size: 60,
              // color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBodyRight() {
    return Container(
      width: 0.0,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(4)),
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
