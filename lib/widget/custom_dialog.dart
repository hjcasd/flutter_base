import 'package:flutter/material.dart';

/// 自定义Dialog
class CustomDialog extends StatelessWidget {
  final String title;
  final String content;

  CustomDialog({
    this.title = "",
    this.content = "",
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          width: 200.0,
          height: 160.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Stack(
                  children: <Widget>[
                    Align(
                      child: Text(
                        title,
                      ),
                      alignment: Alignment.center,
                    ),
                    Align(
                      child: InkWell(
                        child: Icon(
                          Icons.close,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      alignment: Alignment.centerRight,
                    ),
                  ],
                ),
              ),
              Divider(
                height: 0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: Text(
                  content,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
