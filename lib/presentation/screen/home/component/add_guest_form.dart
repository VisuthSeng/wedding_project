import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_project/core/constant/app_color.dart';
import 'package:wedding_project/presentation/controller/customer_controller.dart';
import 'package:wedding_project/presentation/widget/textbox.dart';

import '../../../../core/util/Uid.dart';
import '../../../../data/model/customer_model.dart';
import '../../../widget/button_icon.dart';
import '../../../widget/button_text.dart';
import '../layout/form_header.dart';

class AddGuestForm extends StatefulWidget {
  final bool? formEdit;
  const AddGuestForm({super.key, this.formEdit = false});

  @override
  State<AddGuestForm> createState() => _AddGuestFormState();
}

class _AddGuestFormState extends State<AddGuestForm> {
  String selectedPaymentType = 'ABA';
  String selectedCurrency = '\$';
  String selectedSide = '';

  final CustomerController customerController = Get.find();

  late TextEditingController tecName;
  late TextEditingController tecPaymentType;
  late TextEditingController tecPayment;
  late TextEditingController tecCurrency;
  late TextEditingController tecSide;

  late FocusNode fnName;
  late FocusNode fnPaymentType;
  late FocusNode fnPayment;
  late FocusNode fnCurrency;
  late FocusNode fnSide;

  bool errorCustomerBlank = false;
  bool errorCustomerExist = false;

  bool loading = false;

  @override
  void initState() {
    tecName = TextEditingController();
    tecPaymentType = TextEditingController();
    tecPayment = TextEditingController();
    tecCurrency = TextEditingController();
    tecSide = TextEditingController();

    fnName = FocusNode();
    fnPaymentType = FocusNode();
    fnPayment = FocusNode();
    fnCurrency = FocusNode();
    fnSide = FocusNode();

    tecPaymentType.text = 'ABA';
    tecCurrency.text = 'Dollar';

    if (widget.formEdit == true) {
      tecName.text = customerController.selectedCustomer!.name;
      tecPaymentType.text = customerController.selectedCustomer!.paymentType;
      tecPayment.text = customerController.selectedCustomer!.payment.toString();
      tecCurrency.text = customerController.selectedCustomer!.currency;
      tecSide.text = customerController.selectedCustomer!.side;
    }

    super.initState();
  }

  @override
  void dispose() {
    tecName.dispose();
    tecPaymentType.dispose();
    tecPayment.dispose();
    tecCurrency.dispose();
    tecSide.dispose();

    fnName.dispose();
    fnPaymentType.dispose();
    fnPayment.dispose();
    fnCurrency.dispose();
    fnSide.dispose();

    super.dispose();
  }

  Future<void> saveData() async {
    var model = CustomerModel(
      id: UId.getId(),
      name: tecName.text,
      paymentType: tecPaymentType.text,
      payment: double.tryParse(tecPayment.text) ?? 0,
      currency: tecCurrency.text,
      side: tecSide.text,
    );
    customerController.saveData(model);
  }

  Future<void> updateData() async {
    var model = CustomerModel(
      id: customerController.selectedCustomer!.id,
      name: tecName.text,
      paymentType: tecPaymentType.text,
      payment: double.tryParse(tecPayment.text) ?? 0,
      currency: tecCurrency.text,
      side: tecSide.text,
    );
    customerController.updateData(model);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 500,
        height: 500,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FormHeader(
              title: 'Add Guest',
            ),
            const SizedBox(height: 16),
            TextBox(focusNode: fnName, controller: tecName, labelText: 'Name'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20, left: 25),
                  child: Text(
                    'Payment Type   :   ',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ButtonText(
                      backgroundButton: selectedPaymentType == 'Cash'
                          ? Colors.lightBlue
                          : Colors.white,
                      width: 65,
                      title: 'Cash',
                      tooltip: '',
                      onPress: () {
                        setState(() {
                          selectedPaymentType = 'Cash';
                          tecPaymentType.text = 'Cash';
                        });
                      }),
                ),
                const SizedBox(
                  width: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: ButtonText(
                      backgroundButton: selectedPaymentType == 'ABA'
                          ? Colors.lightBlue
                          : Colors.white,
                      width: 60,
                      title: 'ABA',
                      tooltip: '',
                      onPress: () {
                        setState(() {
                          selectedPaymentType = 'ABA';
                          tecPaymentType.text = 'ABA';
                        });
                      }),
                ),
                const SizedBox(
                  width: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ButtonText(
                      backgroundButton: selectedPaymentType == 'ACLEDA'
                          ? Colors.lightBlue
                          : const Color.fromRGBO(255, 255, 255, 1),
                      width: 80,
                      title: 'ACLEDA',
                      tooltip: '',
                      onPress: () {
                        setState(() {
                          selectedPaymentType = 'ACLEDA';
                          tecPaymentType.text = 'ACELEDA';
                        });
                      }),
                ),
                const SizedBox(
                  width: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ButtonText(
                      backgroundButton: selectedPaymentType == 'Wing'
                          ? Colors.lightBlue
                          : Colors.white,
                      width: 65,
                      title: 'Wing',
                      tooltip: '',
                      onPress: () {
                        setState(() {
                          selectedPaymentType = 'Wing';
                          tecPaymentType.text = 'Wing';
                        });
                      }),
                ),
              ],
            ),
            Row(
              children: [
                TextBox(
                  width: 250,
                  focusNode: fnPayment,
                  controller: tecPayment,
                  labelText: 'Payment',
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ButtonText(
                    width: 50,
                    title: '\$',
                    tooltip: '',
                    onPress: () {
                      // Set the selected title to '$' and update UI
                      setState(() {
                        selectedCurrency = '\$';
                        tecCurrency.text = 'Dollar';
                      });
                    },
                    backgroundButton: selectedCurrency == '\$'
                        ? Colors.lightBlue
                        : Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ButtonText(
                    width: 80,
                    title: 'Riels',
                    tooltip: '',
                    onPress: () {
                      // Set the selected title to 'Riels' and update UI
                      setState(() {
                        selectedCurrency = 'Riels';
                        tecCurrency.text = 'Riels';
                      });
                    },
                    backgroundButton: selectedCurrency == 'Riels'
                        ? Colors.lightBlue
                        : Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20, left: 25),
                  child: Text(
                    'Side   :   ',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: ButtonText(
                      backgroundButton: selectedSide == 'Groom'
                          ? Colors.lightBlue
                          : Colors.white,
                      width: 80,
                      title: 'Groom',
                      tooltip: '',
                      onPress: () {
                        setState(() {
                          selectedSide = 'Groom';
                          tecSide.text = 'Groom';
                        });
                      }),
                ),
                const SizedBox(
                  width: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ButtonText(
                      backgroundButton: selectedSide == 'Bride'
                          ? Colors.lightBlue
                          : Colors.white,
                      width: 80,
                      title: 'Bride',
                      tooltip: '',
                      onPress: () {
                        setState(() {
                          selectedSide = 'Bride';
                          tecSide.text = 'Bride';
                        });
                      }),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonIcon(
                    backgroundButton: Colors.greenAccent,
                    width: 50,
                    height: 40,
                    icon: Icons.done_outline,
                    iconColor: Colors.white,
                    iconSize: 24,
                    onPress: () {
                      saveData();
                      Navigator.pop(context);
                    }),
                ButtonText(
                  backgroundButton: AppColor.wedding,
                  title: 'Save & Next',
                  tooltip: '',
                  onPress: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
