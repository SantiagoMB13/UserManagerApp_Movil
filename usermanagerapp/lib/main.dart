import 'package:f_testing_template/data/repositories/uc_repository.dart';
import 'package:f_testing_template/domain/use_case/ucs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'data/repositories/client_repository.dart';
import 'data/repositories/report_repository.dart';
import 'data/repositories/us_repository.dart';
import 'domain/use_case/clientss.dart';
import 'domain/use_case/reports.dart';
import 'domain/use_case/uss.dart';
import 'ui/controllers/client_controller.dart';
import 'ui/controllers/report_controller.dart';
import 'ui/controllers/uc_controller.dart';
import 'ui/controllers/us_controller.dart';
import 'ui/pages/authentication/login.dart';

void main() {
  Get.put(ClientRepository());  
  Get.put(Clientss(Get.find<ClientRepository>()));  
  Get.put<ClientController>(ClientController(clientUseCase: Get.find<Clientss>()));  
  Get.put(USRepository());  
  Get.put(USs(Get.find<USRepository>()));  
  Get.put<USController>(USController(usUseCase: Get.find<USs>())); 
  Get.put(ReportRepository());  
  Get.put(Reportss(Get.find<ReportRepository>()));  
  Get.put<ReportController>(ReportController(reportUseCase: Get.find<Reportss>()));
  Get.put(UCRepository());  
  Get.put(UCs(Get.find<UCRepository>()));  
  Get.put<UCController>(UCController(ucUseCase: Get.find<UCs>()));   
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'User Management System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(
        key: Key('LoginScreen'),
        email: "blank",
        password: "blank",
      ),
    );
  }
}