import 'package:flutter/material.dart';
import 'package:disk_space/disk_space.dart';
import 'package:get/get.dart';
import 'package:sensortesting/Views/Screens/testing/screenTesting.dart';
import 'package:sensortesting/Views/Screens/testing/touchScreen.dart';
import 'package:sensortesting/Views/Screens/testing/touchTesting.dart';

import '../constants/color.dart';

class testing extends StatefulWidget {
  const testing({Key? key}) : super(key: key);

  @override
  State<testing> createState() => _testingState();
}

class _testingState extends State<testing> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
          Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Padding(
                padding: EdgeInsets.only(top: 40),
                child: Text(
                  "Tests",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              )),
              Padding(
                  padding: EdgeInsets.only(top: 15, left: 25, right: 25),
                  child: Container(
                    height: 500,
                    child: GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 20.0,
                      physics: NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 25.0,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap:(){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => screenTesting()));
                                //Get.to(screenTesting());
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: AppColor.LigthPink,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Image.asset(
                                    "assests/device.png",
                                    scale: 8,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "Screen",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => touchSettings()));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: AppColor.skinColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 4, bottom: 4, left: 20, right: 20),
                                  child: Image.asset(
                                    "assests/multiTouch.png",
                                    scale: 16,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "Screen",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExamplePage()));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: AppColor.lightYellowColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 8, left: 20, right: 20),
                                  child: Image.asset(
                                    "assests/pointer.png",
                                    scale: 16,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "Pointer",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColor.lightGreenColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom: 8, left: 20, right: 20),
                                child: Image.asset(
                                  "assests/pointer.png",
                                  scale: 16,
                                ),
                              ),
                            ),
                            Text(
                              "Touch Screen",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColor.lightBlueColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assests/network.png",
                                  scale: 10,
                                ),
                              ),
                            ),
                            Text(
                              "Network",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColor.skinColor,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assests/gps.png",
                                  scale: 10,
                                ),
                              ),
                            ),
                            Text(
                              "GPS",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColor.LigthPink2,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                              child: Padding(
                                padding: EdgeInsets.only(left: 18,top:5,bottom:5,right: 18),
                                child: Image.asset(
                                  "assests/audio.png",
                                  scale: 18,
                                ),
                              ),
                            ),
                            Text(
                              "Audio",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColor.lightYellowColor,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assests/sensor.png",
                                  scale: 10,
                                ),
                              ),
                            ),
                            Text(
                              "Sensor",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColor.lightGreenColor,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assests/camera.PNG",
                                  scale:6.5,
                                ),
                              ),
                            ),
                            Text(
                              "Camera",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColor.skinColor,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assests/sensor.png",
                                  scale: 10,
                                ),
                              ),
                            ),
                            Text(
                              "Biometric",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColor.LigthPink,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assests/sensor.png",
                                  scale: 10,
                                ),
                              ),
                            ),
                            Text(
                              "Sim",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColor.lightYellowColor,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Image.asset(
                                  "assests/DeviceInfo.png",
                                  scale: 10,
                                ),
                              ),
                            ),
                            Text(
                              "Device Info",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),

    );
  }
}
