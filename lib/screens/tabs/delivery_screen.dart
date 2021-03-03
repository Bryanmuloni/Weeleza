import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weeleza/constants/colors.dart';
import 'package:weeleza/utils/extendable_fab.dart';

class DeliveryScreen extends StatefulWidget {
  @override
  _DeliveryScreenState createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  int _selectedIndex = 0;
  bool _extended = false;

  List<NavigationRailDestination> _buildDestinations() {
    return [
      NavigationRailDestination(
        icon: Icon(
          Icons.drafts_rounded,
          color: WeelezaColors.textBlack,
        ),
        selectedIcon: Icon(
          Icons.drafts_rounded,
          color: WeelezaColors.accentColor,
        ),
        label: Text('Saved Drafts'),
      ),
      NavigationRailDestination(
        icon: Icon(
          Icons.assignment_rounded,
          color: WeelezaColors.textBlack,
        ),
        selectedIcon: Icon(
          Icons.assignment_rounded,
          color: WeelezaColors.accentColor,
        ),
        label: Text('Requests'),
      ),
      NavigationRailDestination(
        icon: Icon(
          Icons.check_box_rounded,
          color: WeelezaColors.textBlack,
        ),
        selectedIcon: Icon(
          Icons.check_box_rounded,
          color: WeelezaColors.accentColor,
        ),
        label: Text('Delivered'),
      ),
      NavigationRailDestination(
        icon: Icon(
          Icons.assignment_return_rounded,
          color: WeelezaColors.textBlack,
        ),
        selectedIcon: Icon(
          Icons.assignment_return_rounded,
          color: WeelezaColors.accentColor,
        ),
        label: Text('Returned'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: WeelezaColors.screenBackgroundColor,
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          NavigationRail(
                            selectedLabelTextStyle: TextStyle(
                              color: WeelezaColors.accentColor,
                              fontSize: 14,
                              letterSpacing: 1,
                              decorationThickness: 2.0,
                            ),
                            unselectedLabelTextStyle: TextStyle(
                              color: WeelezaColors.textBlack,
                              fontSize: 13,
                              letterSpacing: 0.8,
                            ),
                            leading: Tooltip(
                              message: "Request Pick Up",
                              child: ExtendableFab(
                                icon: Icons.delivery_dining,
                                label: Text("Request Pick Up"),
                                onPressed: () {
                                  print("New Request");
                                },
                              ),
                            ),
                            trailing: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                  alignment: Alignment.bottomRight,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _extended = !_extended;
                                      });
                                    },
                                    icon: _extended
                                        ? Icon(
                                            Icons.arrow_back_ios_rounded,
                                            color: WeelezaColors.accentColor,
                                          )
                                        : Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: WeelezaColors.textBlack,
                                          ),
                                  )),
                            ),
                            extended: _extended,
                            minExtendedWidth: 200,
                            elevation: 2.0,
                            labelType: NavigationRailLabelType.none,
                            selectedIndex: _selectedIndex,
                            destinations: _buildDestinations(),
                            onDestinationSelected: (int index) {
                              setState(() {
                                _selectedIndex = index;
                              });
                            },
                          ),
                          VerticalDivider(),
                          Expanded(
                            // child: _renderMainContent(_selectedIndex),
                            child: IndexedStack(
                              index: _selectedIndex,
                              children: [
                                Container(
                                  child: Text("Drafts"),
                                ),
                                Container(
                                  child: Text("Requests"),
                                ),
                                Container(
                                  child: Text("Delivered"),
                                ),
                                Container(
                                  child: Text("Returned"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
