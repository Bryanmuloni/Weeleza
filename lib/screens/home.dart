import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weeleza/screens/tabs/about_screen.dart';
import 'package:weeleza/screens/tabs/delivery_screen.dart';
import 'package:weeleza/screens/tabs/faq_screen.dart';
import 'package:weeleza/screens/tabs/home_screen.dart';
import 'package:weeleza/widgets/menu_item.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: LayoutBuilder(
        builder:(context,constraints)=> Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                CircleAvatar(radius: 20, child: Icon(Icons.delivery_dining)),
                SizedBox(
                  width: 2.0,
                ),
                Text(
                  "Weeleza",
                  style: GoogleFonts.lobster(),
                ),
              ],
            ),
            actions: [
              constraints.maxWidth > 600 ?Row(
                children: [
                  TextButton(
                    style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(Theme.of(context).hoverColor)),
                    onPressed: () {},
                    child: MenuItem(
                        icon: Icon(Icons.translate_rounded, size: 20.0, color: Colors.white),
                        text: Text(
                          "Language",
                          style: GoogleFonts.roboto(color: Colors.white),
                        )),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    width: 1.5,
                    color: Colors.white,
                    height: 10.0,
                  ),
                  TextButton(
                    autofocus: true,
                    style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(Theme.of(context).hoverColor)),
                    onPressed: () {},
                    child: MenuItem(
                        icon: Icon(Icons.login_rounded, size: 20.0, color: Colors.white),
                        text: Text(
                          "Sign In",
                          style: GoogleFonts.roboto(color: Colors.white),
                        )),
                  ),
                ],
              ):PopupMenuButton(itemBuilder: (context)=> ["Language","Sign In"].map((e) => PopupMenuItem(child: Text(e)))
                  .toList()),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(40.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  indicatorColor: Colors.white,
                  isScrollable: true,
                  tabs: [
                    Tab(
                      child: Container(
                        width: 200,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Icon(Icons.home_rounded, color: Colors.white),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                'Home',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: 200,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Icon(Icons.delivery_dining, color: Colors.white),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                'Delivery',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: 200,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Icon(Icons.info_rounded, color: Colors.white),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                'About Weeleza',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: 200,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Icon(Icons.question_answer_rounded, color: Colors.white),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                'FAQ',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              HomeScreen(),
              DeliveryScreen(),
              AboutScreen(),
              FaqScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
