import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weeleza/models/faq.dart';

class FaqScreen extends StatefulWidget {
  @override
  _FaqScreenState createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  TextEditingController _searchListController = TextEditingController();
  List<Faq> _faqList = faqList;
  int _activeMeterIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: ListView(
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
                    height: 20,
                  ),
                  Text(
                    "Frequently asked Questions",
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
            height: 30,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20.0),
              child: SizedBox(
                child: TextFormField(
                  controller: _searchListController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      labelText: "Type your question here",
                      hintText: "How to...",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 10, bottom: 10.0),
            child: Text(
              "Popular on Weeleza.",
              style: GoogleFonts.robotoCondensed(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(right: 20.0, left: 20.0, bottom: 20),
            child: ListView.builder(
                itemCount: _faqList.length,
                shrinkWrap: true,
                itemBuilder: (context, count) {
                  if (_searchListController.text.isEmpty) {
                    return Card(
                      elevation: 0,
                      child: ExpansionPanelList(
                        dividerColor: Colors.grey,
                        expansionCallback: (int index, bool status) {
                          setState(() {
                            _activeMeterIndex = _activeMeterIndex == count ? null : count;
                          });
                        },
                        children: [
                          ExpansionPanel(
                              canTapOnHeader: true,
                              isExpanded: _activeMeterIndex == count,
                              headerBuilder: (context, isExpanded) => Container(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 15.0,
                                          backgroundColor: Theme.of(context).accentColor,
                                          child: FaIcon(
                                            FontAwesomeIcons.infoCircle,
                                            color: Colors.white,
                                            size: 15.0,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text: _faqList[count].title,
                                            style: GoogleFonts.roboto(
                                                color: Theme.of(context).accentColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              body: Padding(
                                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right:8.0,bottom: 8.0,),
                                      child: Icon(
                                        Icons.category,
                                        color: Theme.of(context).accentColor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right:8.0,bottom: 8.0,),
                                        child: Text(
                                          _faqList[count].details ?? "-",
                                          style: GoogleFonts.roboto(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    );
                  } else if (_faqList[count].title.contains(_searchListController.text)) {
                    return Card(
                      elevation: 0,
                      child: ExpansionPanelList(
                        dividerColor: Colors.grey,
                        expansionCallback: (int index, bool status) {
                          setState(() {
                            _activeMeterIndex = _activeMeterIndex == count ? null : count;
                          });
                        },
                        children: [
                          ExpansionPanel(
                              canTapOnHeader: true,
                              isExpanded: _activeMeterIndex == count,
                              headerBuilder: (context, isExpanded) => Container(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 15.0,
                                          backgroundColor: Theme.of(context).accentColor,
                                          child: Icon(
                                            Icons.file_copy_rounded,
                                            color: Colors.white,
                                            size: 15.0,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text: _faqList[count].title,
                                            style: GoogleFonts.roboto(
                                                color: Theme.of(context).accentColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              body: Padding(
                                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right:8.0,bottom: 8.0,),
                                      child: Icon(
                                        Icons.category,
                                        color: Theme.of(context).accentColor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right:8.0,bottom: 8.0,),
                                        child: Text(
                                          _faqList[count].details ?? "-",
                                          style: GoogleFonts.roboto(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                }),
          )
        ],
      ),
    );
  }
}
