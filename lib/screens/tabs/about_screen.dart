import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weeleza/constants/colors.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WeelezaColors.screenBackgroundColor,
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2.5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/weeleza.png",
                    fit: BoxFit.contain,
                    height: 200,
                  ),
                  Text(
                    "Weeleza",
                    style: GoogleFonts.lobster(color: Colors.white, fontSize: 30),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Version 1.0.0",
                    style: GoogleFonts.lobster(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50), bottomLeft: Radius.circular(50))),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 20.0),
            child: Center(
              child: Text(
                "About Weeleza.",
                style: GoogleFonts.robotoCondensed(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 20.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "A solution crafted and tailored to enable the community deliver "
                        "(Weeleza) their items of all kinds securely and in time.",
                        style: GoogleFonts.roboto(fontSize: 15),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Who do we serve?",
                        style: GoogleFonts.roboto(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "We are open twenty four hours per week to serve all sorts of "
                        "community people to deliver their items in a secure and timely basis.\n"
                        "These people include but not limited to cargo, documents, valuables, "
                        "produce among others",
                        style: GoogleFonts.roboto(fontSize: 15),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "How do we get in touch?",
                        style: GoogleFonts.roboto(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "We are available physically in our country office on plot 30, cathedral"
                        " avenue, Mbale City.\nWe are also available on social media channels "
                        "Facebook, Twitter and Instagram.",
                        style: GoogleFonts.roboto(fontSize: 15),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Tooltip(message:"Bryan Muloni",child: FaIcon(FontAwesomeIcons
                                .facebookSquare,
                              size:
                            25,)),
                            Container(
                              margin: const EdgeInsets.all(10.0),
                              width: 1.5,
                              color: Colors.black,
                              height: 2.0,
                            ),
                            Tooltip(message:"@bryanmuloni",child: FaIcon(FontAwesomeIcons
                                .twitterSquare,size: 25)),
                            Container(
                              margin: const EdgeInsets.all(10.0),
                              width: 1.5,
                              color: Colors.black,
                              height: 2.0,
                            ),
                            Tooltip(message:"bryanmuloni",child: FaIcon(FontAwesomeIcons
                                .instagramSquare,size: 25,)),
                            Container(
                              margin: const EdgeInsets.all(10.0),
                              width: 1.5,
                              color: Colors.black,
                              height: 2.0,
                            ),
                            Tooltip(message:"+256777190626",child: FaIcon(FontAwesomeIcons
                                .whatsappSquare,size: 25)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
