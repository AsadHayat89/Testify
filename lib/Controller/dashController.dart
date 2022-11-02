import 'dart:collection';
import 'package:internet_speed_test/callbacks_enum.dart';
import 'package:internet_speed_test/internet_speed_test.dart';

import 'package:cpu_reader/cpu_reader.dart';
import 'package:cpu_reader/cpuinfo.dart';
import 'dart:async';
import 'package:battery_info/battery_info_plugin.dart';
import 'package:battery_info/model/android_battery_info.dart';
import 'package:get/get.dart';
import 'package:disk_space/disk_space.dart';
import 'package:system_info/system_info.dart';
import 'package:system_info_plus/system_info_plus.dart';

import '../Model/CpuPerformer.dart';
class DashController extends GetxController{
  RxDouble TotalStorage=0.0.obs;
  RxDouble RemaningStorage=0.0.obs;
  RxDouble StoragePercentage=0.0.obs;
  RxInt TotalRam=0.obs;
  RxInt RemaningRam=0.obs;
  RxDouble RamPercentage=0.0.obs;
  RxInt batteryPercent=0.obs;
  RxList<CpuPerformer> performance=RxList<CpuPerformer>().obs();

  void getDiskSpaceInfo() async{
    RemaningStorage.value=(await DiskSpace.getFreeDiskSpace)!/1000;
    TotalStorage.value=(await DiskSpace.getTotalDiskSpace)!/1000;
    StoragePercentage.value=(TotalStorage.value-RemaningStorage.value)/TotalStorage.value;

    TotalRam.value = (await SysInfo.getTotalPhysicalMemory()/1000000).toInt();
    RemaningRam.value = (await SysInfo.getFreePhysicalMemory()/1000000).toInt();

    RamPercentage.value=((TotalRam.value-RemaningRam.value)/TotalRam.value);
    batteryPercent.value=((await BatteryInfoPlugin().androidBatteryInfo)?.batteryLevel)!;



  }
void CorePerformance(int core,Timer t) async {
  int? freq = await CpuReader.getCurrentFrequency(core);
  print("Core ${core} :" + freq.toString());

  int match = 0;
  for (int i = 0; i < performance.length; i++) {
    if (performance[i].coreNumber == core + 1) {
      match = 1;
      performance[i].value?.addAll({t.tick: freq!});
    }

  }
  if (match == 0) {
    CpuPerformer CPP = new CpuPerformer();
    CPP.coreNumber = core + 1;
    CPP.value?.addAll({t.tick: freq!});
    performance.value.add(CPP);
  }
}
  void internettesting(){

    final internetSpeedTest = InternetSpeedTest();

    internetSpeedTest.startDownloadTesting(
      onDone: (double transferRate, SpeedUnit unit) {
        print('the dwounloainf rate $transferRate');
        // TODO: Change UI
      },
      onProgress: (double percent, double transferRate, SpeedUnit unit) {
        // TODO: Change UI
      },
      onError: (String errorMessage, String speedTestError) {
        // TODO: Show toast error
      },
    );



    internetSpeedTest.startUploadTesting(
      onDone: (double transferRate, SpeedUnit unit) {
        print('the transfer rate $transferRate');

      },
      onProgress: (double percent, double transferRate, SpeedUnit unit) {
        print(
            'the transfer rate $transferRate, the percent $percent');

      },
      onError: (String errorMessage, String speedTestError) {
        // TODO: Show toast error
      },
    );

  }
  void CpuPerformance() async{
    CpuInfo cpuInfo = await CpuReader.cpuInfo;
    print('Number of Cores ${cpuInfo.numberOfCores}');

    int courses=cpuInfo.numberOfCores!;
    print("Number if course: "+courses.toString());
    for(int i=0;i<courses;i++){
      Timer.periodic(Duration(milliseconds: 1000), (Timer t) => CorePerformance(i,t));

    }


  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //CpuPerformance();
    Timer.periodic(Duration(milliseconds: 500), (Timer t) => getDiskSpaceInfo());
    //Timer.periodic(Duration(seconds:10), (Timer t) => CpuPerformance(t));

    Timer.periodic(Duration(milliseconds: 500), (Timer t) => internettesting());
  }
}