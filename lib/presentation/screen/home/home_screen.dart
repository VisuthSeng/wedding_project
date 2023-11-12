import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_project/core/constant/app_color.dart';
import 'package:wedding_project/presentation/screen/home/component/add_guest_form.dart';
import 'package:wedding_project/presentation/widget/button_text.dart';
import 'package:wedding_project/presentation/widget/textbox_search.dart';

import '../../../core/constant/app_language.dart';
import '../../controller/customer_controller.dart';
import '../../widget/alert_box.dart';
import '../../widget/message_box.dart';
import '../../widget/message_type.dart';
import 'component/customer_list.dart';

class HomeScreen extends StatefulWidget {
  final bool? formEdit;
  const HomeScreen({
    Key? key,
    this.formEdit = false,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final CustomerController customerController = Get.find();

  late TextEditingController tecSearch;

  late FocusNode fnSearch;

  @override
  void initState() {
    customerController.getStreamListOfCustomer();
    customerController.listAllCustomer.length;
    tecSearch = TextEditingController();
    fnSearch = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    tecSearch.dispose();
    fnSearch.dispose();
    super.dispose();
  }

  void onDelete(String id) {
    customerController.deleteData(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppColor.wedding,
        title: const Text(
          'Wedding ( Thika & DaRo ) ',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, letterSpacing: 10),
        ),
        centerTitle: true,
      ), // Make sure this function returns an AppBar
      backgroundColor: const Color(0xffE6EFFD),
      body: LayoutBuilder(
        builder: (context, constraints) => SizedBox(
          width: 1920,
          height: constraints.maxHeight,
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColor.wedding,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: constraints.maxWidth - 10,
                    height: constraints.maxHeight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.purple[200],
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 30,
                                      child: Text(
                                        '#',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: 200,
                                      child: Center(
                                        child: Text(
                                          'Name',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    SizedBox(
                                      width: 100,
                                      child: Center(
                                        child: Text(
                                          'Payment Type',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    SizedBox(
                                      width: 150,
                                      child: Center(
                                        child: Text(
                                          'Payment',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: 150,
                                      child: Center(
                                        child: Text(
                                          'Currency',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: 150,
                                      child: Center(
                                        child: Text(
                                          'Side',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    ButtonText(
                                      title: 'Add Guest',
                                      tooltip: '',
                                      onPress: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return const AddGuestForm();
                                          },
                                        );
                                      },
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Obx(
                                      () => ButtonText(
                                        record: customerController
                                            .listOfCustomer.length,
                                        backgroundButton: Colors.white,
                                        title: customerController
                                            .listAllCustomer.length
                                            .toString(),
                                        tooltip: '',
                                        onPress: () {},
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 2),
                                  child: SizedBox(
                                    width: 200,
                                    child: TextboxSearch(
                                      focusNode: fnSearch,
                                      controller: tecSearch,
                                      label: 'Search',
                                      isReadOnly: false,
                                      onChanged: ((search) => {
                                            customerController
                                                .searchData(search),
                                          }),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 1920,
                          height: constraints.maxHeight - 42,
                          child: SingleChildScrollView(
                            child: Obx(
                              () => Column(
                                children: List.generate(
                                  customerController.listOfCustomer.length,
                                  (index) => CustomerList(
                                    customerModel: customerController
                                        .listOfCustomer[index],
                                    index: index + 1,
                                    onSelect: () =>
                                        customerController.selectCustomer(
                                      customerController.listOfCustomer[index],
                                    ),
                                    onEdit: () {
                                      customerController.selectCustomer(
                                          customerController
                                              .listOfCustomer[index]);
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return const AddGuestForm(
                                            formEdit: true,
                                          );
                                        },
                                      );
                                    },
                                    onDelete: () {
                                      if (customerController.selectedCustomer !=
                                          null) {
                                        showDialog(
                                          context: context,
                                          barrierColor:
                                              Colors.grey.withOpacity(0.5),
                                          builder: (BuildContext context) {
                                            return Dialog(
                                              backgroundColor:
                                                  Colors.transparent,
                                              insetAnimationCurve:
                                                  Curves.easeIn,
                                              child: MessageBox(
                                                  message:
                                                      'Do you want to delete this record ?',
                                                  messageType:
                                                      MessageType.yesNo,
                                                  onYes: () {
                                                    customerController
                                                        .selectCustomer(
                                                            customerController
                                                                    .listOfCustomer[
                                                                index]);
                                                    onDelete(customerController
                                                        .selectedCustomer!.id);
                                                    Navigator.pop(context);
                                                  }),
                                            );
                                          },
                                        );
                                      } else {
                                        AlertBox.warning(
                                            message: AppLanguage
                                                .pleaseSelectDataToDelete);
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // SizedBox(
                          //   width: constraints.maxWidth - 10,
                          //   height: constraints.maxHeight - 60 - 42,
                          //   child: SingleChildScrollView(
                          //     child: Column(
                          //       children: List.generate(
                          //         categoryController.listOfCategory.length,
                          //         (index) => CategoryList(
                          //           categoryModel: categoryController
                          //               .listOfCategory[index],
                          //           index: index,
                          //           onSelect: () =>
                          //               categoryController.selectCategory(
                          //             categoryController.listOfCategory[index],
                          //           ),
                          //           onEdit: () {
                          //             categoryController.selectCategory(
                          //                 categoryController
                          //                     .listOfCategory[index]);
                          //             Get.to(
                          //               () => const CategoryForm(
                          //                 formEdit: true,
                          //               ),
                          //             );
                          //           },
                          //           onDelete: () => onDelete(
                          //             categoryController.listOfCategory[index],
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
