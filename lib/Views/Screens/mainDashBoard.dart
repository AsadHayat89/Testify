import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:disk_space/disk_space.dart';
import '../../Controller/dashController.dart';
import '../constants/color.dart';

class MainDash extends StatelessWidget {
  var DashBoardControll = Get.put(DashController());

  MainDash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<LineSeries<HashMap<int,int>, String>> getSeries(){
    //   List<LineSeries<HashMap<int,int>, String>> newlist=[];
    //   for(int i=0;i<DashBoardControll.performance.length;i++){
    //     newlist.add(LineSeries<HashMap<int,int>, String>(
    //       // Bind data source
    //         dataSource:  <HashMap<int,int>>[
    //           DashBoardControll.performance[i].value!
    //
    //         ],
    //         xValueMapper: (<HashMap<int,int>, _) => int,
    //         yValueMapper: (SalesData sales, _) => sales.sales
    //     ));
    //   }
    //   return newlist;
    // }

    return SingleChildScrollView(
      child: Obx(
        () => Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Center(
                    child: Text(
                  "Dashboard",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black54),
                )),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                      color: AppColor.CardBack,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 200,
                        child: SfCartesianChart(
                            // Initialize category axis
                            primaryXAxis: CategoryAxis(),
                            series: <LineSeries<SalesData, int>>[
                              //getSeries(),
                              LineSeries<SalesData, int>(
                                  // Bind data source
                                  dataSource: <SalesData>[
                                    SalesData(5, 35),
                                    SalesData(10, 28),
                                    SalesData(15, 34),
                                    SalesData(20, 32),
                                    SalesData(25, 40)
                                  ],
                                  xValueMapper: (SalesData sales, _) =>
                                      sales.core,
                                  yValueMapper: (SalesData sales, _) =>
                                      sales.value),
                              LineSeries<SalesData, int>(
                                  // Bind data source
                                  color: Colors.black,
                                  dataSource: <SalesData>[
                                    SalesData(5, 45),
                                    SalesData(10, 58),
                                    SalesData(15, 64),
                                    SalesData(20, 22),
                                    SalesData(25, 40)
                                  ],
                                  xValueMapper: (SalesData sales, _) =>
                                      sales.core,
                                  yValueMapper: (SalesData sales, _) =>
                                      sales.value),
                            ]),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Container(
                  height: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    physics: NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 8.0,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: AppColor.CardBack,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20, left: 20),
                              child: Text(
                                "Storage",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10, left: 20),
                              child: Text(
                                "${DashBoardControll.RemaningStorage.toStringAsFixed(1)}GB / ${DashBoardControll.TotalStorage.toStringAsFixed(1)}GB",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20, left: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: LinearPercentIndicator(
                                  width: 150,
                                  barRadius: Radius.circular(15),
                                  animation: true,
                                  lineHeight: 35.0,
                                  animationDuration: 2000,
                                  percent: double.parse(DashBoardControll
                                      .StoragePercentage.value
                                      .toStringAsFixed(2)),
                                  center: Text(DashBoardControll
                                          .StoragePercentage.value
                                          .toStringAsFixed(2) +
                                      "%"),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: AppColor.theme,
                                  backgroundColor: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColor.CardBack,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20, left: 20),
                              child: Text(
                                "RAM",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10, left: 20),
                              child: Text(
                                "${DashBoardControll.RemaningRam}MB / ${DashBoardControll.TotalRam}MB",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20, left: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: LinearPercentIndicator(
                                  width: 150,
                                  barRadius: Radius.circular(15),
                                  animation: true,
                                  lineHeight: 35.0,
                                  animationDuration: 2000,
                                  percent: double.parse(DashBoardControll
                                      .RamPercentage.toStringAsFixed(2)),
                                  center: Text(DashBoardControll.RamPercentage
                                          .toStringAsFixed(2) +
                                      "%"),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: AppColor.theme,
                                  backgroundColor: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColor.CardBack,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20, left: 20),
                              child: Text(
                                "Battery",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10, left: 20),
                              child: Text(
                                "${DashBoardControll.batteryPercent} % ",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20, left: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: LinearPercentIndicator(
                                  width: 150,
                                  barRadius: Radius.circular(15),
                                  animation: true,
                                  lineHeight: 35.0,
                                  animationDuration: 2000,
                                  percent:
                                      DashBoardControll.batteryPercent / 100,
                                  center: Text(DashBoardControll.batteryPercent
                                          .toString() +
                                      "%"),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: AppColor.theme,
                                  backgroundColor: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColor.CardBack,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20, left: 20),
                              child: Text(
                                "Network",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 10, left: 20, right: 10),
                              child: Container(
                                height: 30,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.arrow_upward_rounded,
                                              color: Colors.green,
                                            ),
                                            Text(
                                              "up",
                                              style: TextStyle(fontSize: 18),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 5),
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.arrow_downward_outlined,
                                              color: Colors.red,
                                            ),
                                            Text(
                                              "down",
                                              style: TextStyle(fontSize: 18),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20, left: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: LinearPercentIndicator(
                                    width: 150,
                                    barRadius: Radius.circular(15),
                                    animation: true,
                                    lineHeight: 35.0,
                                    animationDuration: 2000,
                                    percent: 0.9,
                                    center: Text("90.0%"),
                                    linearStrokeCap: LinearStrokeCap.roundAll,
                                    progressColor: AppColor.theme,
                                    backgroundColor: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.core, this.value);

  final int core;
  final int value;
}
