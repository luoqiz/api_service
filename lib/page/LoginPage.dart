import 'package:flutter/material.dart';

/// 登录页面
class LoginPage extends StatelessWidget {
  @override
  Widget build(context) =>
      Scaffold(body: LayoutBuilder(builder: (context, constraints) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 500),
          color: Theme.of(context).primaryColor.withAlpha(200),
          padding: constraints.maxWidth < 500
              ? EdgeInsets.zero
              : const EdgeInsets.all(30.0),
          child: Center(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
              constraints: BoxConstraints(
                maxWidth: 500,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("用户名密码登录"),
                    TextField(
                        decoration: InputDecoration(labelText: "username")),
                    TextField(
                        obscureText: true,
                        decoration: InputDecoration(labelText: "password")),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).buttonColor.withAlpha(200),
                      ),
                      child: Text(
                        "登录",
                        style: TextStyle(
                          color: Theme.of(context).accentColor.withAlpha(200),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "/home");
                      },
                    ),
                  ]),
            ),
          ),
        );
      }));
}
