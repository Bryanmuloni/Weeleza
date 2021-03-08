import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:weeleza/constants/colors.dart';
import 'package:weeleza/constants/constants.dart';
import 'package:weeleza/constants/size_constants.dart';
import 'package:weeleza/models/category.dart';
import 'package:weeleza/models/delivery.dart';

class PickUpRequest extends StatefulWidget {
  @override
  _PickUpRequestState createState() => _PickUpRequestState();
}

class _PickUpRequestState extends State<PickUpRequest> {
  final _pickUpFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _sizeController = TextEditingController();
  final _departureController = TextEditingController();
  final _arrivalController = TextEditingController();
  final _destinationController = TextEditingController();
  ItemCategory _selectedCategory;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: LayoutBuilder(
        builder: (context, constraints) => Center(
          child: Container(
            height: constraints.maxWidth <= 500 ? size.height/1.5 : size.height / 1.8,
            width: constraints.maxWidth <= 500 ? size.width : size.width / 2.2,
            constraints: BoxConstraints(maxWidth: 800,minWidth: 500),
            child: Dialog(
              elevation: 5.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              child: Form(
                key: _pickUpFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          // color: Colors.grey[300],
                          color: WeelezaColors.primaryColor,
                          borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(15),
                              topRight: const Radius.circular(15)),
                        ),
                        child: Text(
                          'Request Pick Up Form',
                          style: GoogleFonts.roboto(fontSize: 15, color: WeelezaColors.whiteColor),
                        )),
                    SizedBox(
                      height: 10.0,
                    ),
                    Flexible(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Wrap(
                                    runSpacing: 10,
                                    children: [
                                      SizedBox(
                                        width: SizeConstants.inputFieldWidth,
                                        child: DropdownSearch<ItemCategory>(
                                          showSearchBox: true,
                                          hint: "Select Item Category",
                                          mode: Mode.MENU,
                                          items: itemCategories.keys.map((e) => e).toList(),
                                          label: "Item Category",
                                          dropdownBuilder: _categoryBuilder,
                                          popupItemBuilder: _categoryCustomPopupItemBuilder,
                                          showClearButton: true,
                                          onChanged: (value) {
                                            setState(() {
                                              _selectedCategory = value;
                                            });
                                          },
                                          selectedItem: _selectedCategory,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container()
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8.0,
                                  ),
                                  child: Wrap(runSpacing: 10, children: [
                                    SizedBox(
                                      width: SizeConstants.inputFieldWidth,
                                      child: TextFormField(
                                        controller: _nameController,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          labelText: 'Item Name',
                                          border: OutlineInputBorder(),
                                        ),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Item name is required';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    SizedBox(
                                      width: SizeConstants.inputFieldWidth,
                                      child: TextFormField(
                                        controller: _sizeController,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          labelText: 'Item Size (Weight)',
                                          border: OutlineInputBorder(),
                                        ),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Item size is required';
                                          }
                                          return null;
                                        },
                                      ),
                                    )
                                  ]),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Wrap(runSpacing: 10, children: [
                                    SizedBox(
                                      width: SizeConstants.inputFieldWidth,
                                      child: TextFormField(
                                        controller: _departureController,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          labelText: 'Departure Time',
                                          border: OutlineInputBorder(),
                                        ),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Departure time is required';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    SizedBox(
                                      width: SizeConstants.inputFieldWidth,
                                      child: TextFormField(
                                        controller: _arrivalController,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          labelText: 'Arrival Time',
                                          border: OutlineInputBorder(),
                                        ),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Arrival time is required';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ]),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8.0,
                                  ),
                                  child: Wrap(runSpacing: 10, children: [
                                    SizedBox(
                                      width: SizeConstants.inputFieldWidth,
                                      child: TextFormField(
                                        controller: _destinationController,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          labelText: 'Destination',
                                          border: OutlineInputBorder(),
                                        ),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Destination is required';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    SizedBox(
                                      width: SizeConstants.inputFieldWidth,
                                      child: TextFormField(
                                        maxLines: null,
                                        controller: _descriptionController,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          labelText: 'Item Description',
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                  ]),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Wrap(
                          runSpacing: 10,
                          children: [
                            TextButton.icon(
                              icon: Icon(
                                Icons.close,
                                color: WeelezaColors.accentColor,
                              ),
                              label: Text(
                                'Cancel',
                                style: GoogleFonts.roboto(),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            TextButton.icon(
                              icon: Icon(
                                Icons.save,
                                color: WeelezaColors.accentColor,
                              ),
                              label: Text(
                                'Submit Request',
                                style: GoogleFonts.roboto(),
                              ),
                              onPressed: () {
                                setState(() {
                                  if (_pickUpFormKey.currentState.validate()) {
                                    Box<Delivery> expenditureBox =
                                        Hive.box<Delivery>(Constants.deliveryBox);

                                    Delivery delivery = Delivery(
                                        itemName: _nameController.text,
                                        itemDescription: _descriptionController.text,
                                        itemCategory: _selectedCategory,
                                        itemSize: _sizeController.text,
                                        departureTime: _departureController.text,
                                        arrivalTime: _arrivalController.text,
                                        destination: _destinationController.text);

                                    expenditureBox.add(delivery);
                                    Navigator.pop(context);
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _categoryBuilder(BuildContext context, ItemCategory selectedItem, String itemAsString) {
    return Container(
      child: (selectedItem == null)
          ? ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text("No item selected"),
            )
          : ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(itemCategories[selectedItem]),
            ),
    );
  }

  Widget _categoryCustomPopupItemBuilder(BuildContext context, ItemCategory item, bool isSelected) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
      child: ListTile(
        selected: isSelected,
        title: Text(itemCategories[item]),
      ),
    );
  }
}
