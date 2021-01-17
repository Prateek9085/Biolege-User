import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Icon navIcon(String icon) {
    return Icon(
      Icons.home,
      color: Color(0xFFC4C4C4),
    );
  }

  BottomNavigationBarItem bottomNav({String iconName, String icon}) {
    return BottomNavigationBarItem(
      icon: navIcon(icon),
      title: Text(
        iconName,
        style: TextStyle(fontFamily: 'Nunito'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: Color(0xFFE1E1E1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(Icons.arrow_back_ios),
                        ),
                      ),
                      Image.asset(
                        'images/logo.png',
                        height: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Doctor Appointment",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 45,
                  margin: EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(
                    color: Color(0xFFF9F6F6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      // filled: true,
                      // fillColor: Colors.black12,
                      labelText:
                          'Search for doctors,specialist,hospitals,clinics etc',
                      labelStyle: TextStyle(fontFamily: 'Nunito', fontSize: 13),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: [
              bottomNav(iconName: "Home", icon: "home"),
              bottomNav(iconName: "Activities", icon: "offline_pin"),
              bottomNav(iconName: "Notification", icon: "notifications"),
              bottomNav(iconName: "My Account", icon: "account_circle"),
            ],
          ),
        ),
      ),
    );
  }
}
