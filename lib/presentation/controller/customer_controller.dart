import 'package:get/get.dart';
import 'package:wedding_project/data/model/customer_model.dart';
import 'package:wedding_project/data/repository/customer_repository.dart';
import 'package:wedding_project/presentation/widget/alert_box.dart';

class CustomerController extends GetxController {
  final CustomerRepository customerRepository; // Inject the repository

  List<CustomerModel> listAllCustomer = [];

  var listOfCustomer = RxList<CustomerModel>();

  var blankCategory = CustomerModel(
    id: '',
    name: '',
    paymentType: '',
    payment: 0,
    currency: '',
    side: '',
  );
  late CustomerModel? selectedCustomer;

  var isLoading = false.obs;

  double totalPayments = 0.0;

  CustomerController(
      {required this.customerRepository}); // Inject the repository

  @override
  void onInit() async {
    selectedCustomer = blankCategory;
    getStreamListOfCustomer();
    super.onInit();
  }

  void selectCustomer(CustomerModel? model) {
    selectedCustomer = model;
    listOfCustomer.refresh();
  }

  void resetData() {
    selectedCustomer = blankCategory;
    listOfCustomer.assignAll(listAllCustomer);
  }

  void assignRielsCustomersToList() {
    List<CustomerModel> rielsCustomers = listAllCustomer
        .where((customer) => customer.currency == 'Riels')
        .toList();
    listOfCustomer.assignAll(rielsCustomers);
  }

  void assignDollarCustomersToList() {
    List<CustomerModel> rielsCustomers = listAllCustomer
        .where((customer) => customer.currency == 'Dollar')
        .toList();
    listOfCustomer.assignAll(rielsCustomers);
  }

  double calculateTotalPayments() {
    totalPayments = 0;
    for (CustomerModel customer in listOfCustomer) {
      totalPayments += customer.payment;
    }
    return totalPayments;
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

  void getStreamListOfCustomer() {
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
    // try {
    //   await customerRepository.deleteCustomer(recordId);
    //   selectedCustomer = blankCategory;
    //   bCheck = true;
    // } catch (error) {
    //   AlertBox.warning(message: 'Warning');
    // }
    return bCheck;
  }
}
