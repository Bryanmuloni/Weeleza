import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:weeleza/constants/colors.dart';
import 'package:weeleza/constants/constants.dart';
import 'package:weeleza/constants/size_constants.dart';
import 'package:weeleza/models/category.dart';
import 'package:weeleza/models/delivery.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DeliveryDrafts extends StatefulWidget {
  @override
  _DeliveryDraftsState createState() => _DeliveryDraftsState();
}

class _DeliveryDraftsState extends State<DeliveryDrafts> {
  TextEditingController _searchListController = TextEditingController();
  int _activeMeterIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0,left: 10.0),
                child: SizedBox(
                  width: SizeConstants.inputFieldWidth,
                  child: TextFormField(
                    controller: _searchListController,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                        labelText: "Search",
                        hintText: "Item name or category...",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: Hive.box<Delivery>(Constants.deliveryBox).listenable(),
                builder: (context, Box<Delivery> box, _) {
                  if (box.values.isEmpty) {
                    return Center(
                      child: Text("No items to display"),
                    );
                  }
                  return ListView.builder(
                      itemCount: box.values.length,
                      itemBuilder: (context, count) {
                        Delivery delivery = box.get(count);
                        if (_searchListController.text.isEmpty) {
                          return _renderDeliveryItem(box, count);
                        } else if (delivery.itemName.contains(_searchListController.text) ||
                            itemCategories[delivery.itemCategory]
                                .contains(_searchListController.text)) {
                          return _renderDeliveryItem(box, count);
                        } else {
                          return Container();
                        }
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderDeliveryItem(Box<Delivery> box, int count) {
    Delivery delivery = box.getAt(count);
    String name = delivery.itemName;
    String description = delivery.itemDescription;
    String category = itemCategories[delivery.itemCategory];
    String size = delivery.itemSize;
    String departure = delivery.departureTime;
    String arrival = delivery.arrivalTime;
    String destination = delivery.destination;
    return Card(
      elevation: 0,
      child: ExpansionPanelList(
        dividerColor: Colors.white70,
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _activeMeterIndex = _activeMeterIndex == count ? null : count;
          });
        },
        animationDuration: Duration(seconds: 1),
        children: [
          ExpansionPanel(
            canTapOnHeader: true,
            isExpanded: _activeMeterIndex == count,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Container(
                padding: const EdgeInsets.only(left: 15.0),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 15.0,
                      backgroundColor: WeelezaColors.accentColor,
                      child: Icon(
                        Icons.delivery_dining,
                        color: Colors.white,
                        size: 15.0,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    RichText(
                      text: TextSpan(
                        text: name,
                        style: GoogleFonts.roboto(color: WeelezaColors.accentColor),
                      ),
                    ),
                  ],
                ),
              );
            },
            body: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.category,
                        color: WeelezaColors.accentColor,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        category ?? "-",
                        style: GoogleFonts.roboto(color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.wysiwyg_rounded,
                        color: WeelezaColors.accentColor,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        size ?? "-",
                        style: GoogleFonts.roboto(color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.arrow_upward_rounded,
                        color: WeelezaColors.accentColor,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        departure ?? "-",
                        style: GoogleFonts.roboto(color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.arrow_downward_rounded,
                        color: WeelezaColors.accentColor,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        arrival ?? "-",
                        style: GoogleFonts.roboto(color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_city_rounded,
                        color: WeelezaColors.accentColor,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        destination ?? "-",
                        style: GoogleFonts.roboto(color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.description,
                        color: WeelezaColors.accentColor,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Flexible(
                        child: Text(
                          description ?? "-",
                          style: GoogleFonts.roboto(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
