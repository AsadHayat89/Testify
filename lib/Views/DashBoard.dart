import 'package:flutter/material.dart';

import 'Screens/mainDashBoard.dart';
import 'Screens/testingScreen.dart';
import 'constants/color.dart';

class dashboard extends StatefulWidget {
  int _currentIndex = 1;
  final List _children = [
    MainDash(),
    testing(),
    testing(),
    testing(),
  ];
  dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {


  void onTabTapped(int index) {
    setState(() {
      widget._currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Image.asset("assests/Icon.jpeg"),
        ),
        titleSpacing: 0,
        title: Text('Testy',
            style: TextStyle(fontSize: 24, color: Colors.black54)),
        actions: [
          PopupMenuButton<int>(
            icon: Icon(Icons.more_vert_sharp,color: Colors.black54,),
            itemBuilder: (context) => [
              // PopupMenuItem 1
              PopupMenuItem(
                value: 1,
                // row with 2 children
                child: Row(
                  children: [
                    Icon(Icons.star),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Get The App")
                  ],
                ),
              ),
              // PopupMenuItem 2
              PopupMenuItem(
                value: 2,
                // row with two children
                child: Row(
                  children: [
                    Icon(Icons.chrome_reader_mode),
                    SizedBox(
                      width: 10,
                    ),
                    Text("About")
                  ],
                ),
              ),
            ],
            offset: Offset(0, 50),
            elevation: 2,
            // on selected we show the dialog box
            onSelected: (value) {
              // if value 1 show dialog
              if (value == 1) {
               // _showDialog(context);
                // if value 2 show dialog
              } else if (value == 2) {
                //_showDialog(context);
              }
            },
          ),
        ],
      ),
      body: widget._children[widget._currentIndex],
      bottomNavigationBar:  BottomNavigationBar(
        onTap: onTabTapped,
        selectedItemColor: AppColor.theme,
        type: BottomNavigationBarType.fixed,
        currentIndex: widget._currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
              icon: Image.asset( widget._currentIndex==0?'assests/dashboard_click.png':'assests/dashboard.png',scale: 17,),
              label: 'Dashboard',


          ),
          BottomNavigationBarItem(
            icon: Image.asset( widget._currentIndex==1?'assests/testing_click.png':'assests/testing.png',scale: 15,),
            label: 'Testing',
          ),
          BottomNavigationBarItem(
              icon: Image.asset(widget._currentIndex==2?'assests/hand-tools collered.png':'assests/hand-tools.png',scale: 15,),
              label: 'Tools'
          ),
          BottomNavigationBarItem(
              icon: Image.asset(widget._currentIndex==3?'assests/DDD_click.png':'assests/DDD.png',scale: 12,),
              label: 'Tools'
          ),
        ],
      ),
    );
  }
}

