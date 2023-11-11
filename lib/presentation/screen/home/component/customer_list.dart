import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wedding_project/data/model/customer_model.dart';
import 'package:wedding_project/presentation/widget/button_icon.dart';

import '../../../controller/customer_controller.dart';

class CustomerList extends StatefulWidget {
  final CustomerModel customerModel;
  final Function onSelect;
  final Function onDelete;
  final Function onEdit;
  final int index;
  const CustomerList({
    super.key,
    required this.customerModel,
    required this.index,
    required this.onSelect,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  State<CustomerList> createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  final CustomerController customerController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onSelect();
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: widget.customerModel == customerController.selectedCustomer
              ? Colors.blue.withOpacity(0.2)
              : Colors.transparent,
          border: const Border(
            bottom: BorderSide(
              color: Color.fromARGB(255, 192, 188, 188),
            ),
          ),
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
                  widget.index.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 13, color: Colors.black),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 200,
                child: Center(
                  child: Text(
                    widget.customerModel.name,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 14, color: Colors.black),
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
                    widget.customerModel.paymentType,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 14,
                        ),
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
                    widget.customerModel.payment.toString(),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 14,
                        ),
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
                    widget.customerModel.currency.toString(),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 14,
                        ),
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
                    widget.customerModel.side,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 14,
                        ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              ButtonIcon(
                icon: Icons.delete,
                backgroundButton: Colors.white,
                iconColor: Colors.red,
                onPress: () {
                  widget.onDelete();
                },
              ),
              const SizedBox(
                width: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
