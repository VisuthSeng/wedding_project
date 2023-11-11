import 'package:flutter/material.dart';
import 'package:wedding_project/core/constant/app_color.dart';
import 'package:wedding_project/presentation/screen/home/component/add_guest_form.dart';
import 'package:wedding_project/presentation/widget/button_text.dart';

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
          height: constraints.maxHeight - 20,
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
                    height: constraints.maxHeight - 60,
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
                                  width: 150,
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
                                      'Payment ',
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
                                  width: 50,
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
                              ],
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
