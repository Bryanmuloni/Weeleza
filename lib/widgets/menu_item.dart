import 'package:flutter/material.dart';

class MenuItem extends StatefulWidget {
  final Text text;
  final Widget icon;
  MenuItem({Key key, this.text,this.icon}) : super(key: key);


  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return  Padding(padding: EdgeInsets.all(10),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              widget.text,
              SizedBox(width: 5,),
              widget.icon,
            ]
        ));
  }
}