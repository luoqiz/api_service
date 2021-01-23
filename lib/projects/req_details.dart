import 'package:flutter/material.dart';

import 'project_bean.dart';

class ReqDetails extends StatefulWidget {
  Req req;

  ReqDetails({Key key, @required this.req}) : super(key: key);

  @override
  _ReqDetailsState createState() => _ReqDetailsState();
}

class _ReqDetailsState extends State<ReqDetails> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          _buildNote(),
          _buildTitle(),
        ],
      ),
    );
  }

  Widget _buildNote() {
    return SizedBox(
      height: 100.0,
      child: Row(
        children: [
          Text(widget.req.desc),
          Expanded(child: SizedBox(width: 100, height: 80)),
          Text("unkown"),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      children: [
        Text(widget.req.method),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              //  文本内容的内边距
              contentPadding: EdgeInsets.all(10.0),
              // 圆角矩形的输入框样式
              border: OutlineInputBorder(
                // 圆角半径 10
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: widget.req.addr,
            ),
            onChanged: (value) => {widget.req.addr = value},
          ),
        ),
        ElevatedButton.icon(
            icon: Icon(Icons.send),
            label: Text("发送"),
            onPressed: () => {print(widget.req.addr)}),
      ],
    );
  }
}
