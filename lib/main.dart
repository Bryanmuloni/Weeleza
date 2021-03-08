import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:weeleza/constants/constants.dart';
import 'package:weeleza/models/category.dart';
import 'package:weeleza/models/delivery.dart';
import 'package:weeleza/screens/home.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DeliveryAdapter());
  Hive.registerAdapter(ItemCategoryAdapter());
  await Hive.openBox<Delivery>(Constants.deliveryBox);
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
