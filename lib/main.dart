import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weeleza/screens/home.dart';
import 'package:weeleza/widgets/menu_item.dart';

void main() {
  runApp(WeelezaApp());
}

class WeelezaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weeleza',
      theme: ThemeData(primarySwatch: Colors.deepOrange, accentColor: Colors.deepOrangeAccent),
      home: Home(),
    );
  }
}


