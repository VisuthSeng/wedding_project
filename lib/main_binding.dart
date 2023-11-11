import 'package:get/get.dart';

import 'data/repository/customer_repository.dart';
import 'presentation/controller/customer_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      CustomerRepository(),
      permanent: true,
    );
    Get.put(
      CustomerController(
        customerRepository: Get.find(),
      ),
      permanent: true,
    );
  }
}
