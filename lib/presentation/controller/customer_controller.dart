import 'package:get/get.dart';
import 'package:wedding_project/core/util/Uid.dart';

import '../../data/model/customer_model.dart';
import '../../data/repository/customer_repository.dart';
import '../widget/alert_box.dart';

class CustomerController extends GetxController {
  final CustomerRepository customerRepository; // Inject the repository

  List<CustomerModel> listAllCustomer = [];

  var listOfCustomer = RxList<CustomerModel>();

  var blankCustomer = CustomerModel(
    id: UId.getId(),
    name: '',
    paymentType: '',
    payment: 0,
    side: '',
    currency: '',
  );
  late CustomerModel? selectedCustomer;

  var isLoading = false.obs;

  CustomerController(
      {required this.customerRepository}); // Inject the repository

  @override
  void onInit() async {
    selectedCustomer = blankCustomer;
    _getStreamListOfCustomer();
    super.onInit();
  }

  void resetData() {
    selectedCustomer = blankCustomer;
    listOfCustomer.assignAll(listAllCustomer);
  }

  void searchData(String strSearch) {
    isLoading.value = true;
    strSearch = strSearch.toLowerCase();
    if (strSearch.isEmpty) {
      listOfCustomer.assignAll(listAllCustomer);
    } else {
      listOfCustomer.assignAll(
        listAllCustomer.where((x) => x.name.toLowerCase().contains(strSearch)),
      );
    }
    isLoading.value = false;
  }

  void _getStreamListOfCustomer() {
    customerRepository.getStreamOfCustomer().listen(
      (event) {
        isLoading.value = true;
        listAllCustomer.clear();
        listAllCustomer.addAll(event);
        listAllCustomer.sort(((a, b) => a.name.compareTo(b.name)));
        listOfCustomer.assignAll(listAllCustomer);
        //selectedCustomer = blankCustomer;
        isLoading.value = false;
      },
      onError: (error) {
        AlertBox.warning(message: 'Warning');
      },
    );
  }

  void selectCustomer(CustomerModel? model) {
    selectedCustomer = model;
    listOfCustomer.refresh();
  }

  Future<bool> saveData(CustomerModel model) async {
    var bCheck = false;
    try {
      selectedCustomer = await customerRepository.saveCustomer(model);
      bCheck = true;
    } catch (error) {
      AlertBox.warning(message: 'Warning');
    }
    return bCheck;
  }

  Future<bool> updateData(CustomerModel model) async {
    var bCheck = false;
    try {
      await customerRepository.updateCustomer(model);
      bCheck = true;
      selectedCustomer = model;
    } catch (error) {
      AlertBox.warning(message: 'Warning');
    }
    return bCheck;
  }

  Future<bool> deleteData(String recordId) async {
    var bCheck = false;
    try {
      await customerRepository.deleteCustomer(recordId);
      selectedCustomer = blankCustomer;
      bCheck = true;
    } catch (error) {
      AlertBox.warning(message: 'Warning');
    }
    return bCheck;
  }
}
