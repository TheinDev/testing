


import 'package:integration_test/integration_test_driver.dart';

Future<void> main() => integrationDriver(responseDataCallback: (data){

  print("Test result>> ${data as String}");
});