import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  final List<String> imageList = [
    "assets/browse.png",
    "assets/transport.png",
    "assets/deliver.png",
  ];
  final List<String> textList = [
    "Browse the menu and order your delivery right away.",
    "Your order will be immediately collected and sent by our courier.",
    "Get ready to pick up your items at the door step and enjoy!.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2.5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:30.0,left: 20),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(
                            "Weeleza",
                            style: GoogleFonts.lobster(color: Colors.white, fontSize: 30),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "For secure and quick delivery \nof all your items.",
                            style: GoogleFonts.lobster(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            "Make an order with us and we will deliver \nyour items directly to "
                                "your "
                                "home.",
                            style: GoogleFonts.lobster(color: Colors.white, fontSize: 15),
                          ),
                        ]),
                      ),
                      Image.asset(
                        "assets/weeleza.png",
                        fit: BoxFit.fill,
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50), bottomLeft: Radius.circular(50))),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Quick steps to make your order.",
                  style: GoogleFonts.robotoCondensed(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: imageList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 1.4),
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                    ),
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                imageList[index],
                                height: 120,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                textList[index],
                                style: GoogleFonts.robotoCondensed(
                                    fontSize: 15,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
