import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:wedding_project/presentation/widget/message_type.dart';

import '../../../../core/constant/app_size.dart';
import '../screen/home/layout/form_list_button.dart';

class MessageBox extends StatelessWidget {
  final bool loading;
  final String message;
  final MessageType messageType;
  final Function()? onYes;
  final Function()? onCancel;
  const MessageBox({
    Key? key,
    this.loading = false,
    required this.message,
    this.messageType = MessageType.ok,
    this.onYes,
    this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.formRadius),
        color: const Color.fromARGB(255, 255, 255, 255),
      ),
      width: 500,
      height: 250,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250 - AppSize.formBottom,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: AutoSizeText(
                    message,
                    style: const TextStyle(fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            Container(
              height: AppSize.formBottom,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Color.fromARGB(255, 240, 240, 240)),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (messageType == MessageType.ok)
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: FormListButton(
                        icon: Icons.done_rounded,
                        color: const Color.fromARGB(255, 22, 133, 0),
                        title: 'YES',
                        onTap: () => Navigator.pop(context),
                      ),
                    ),
                  if (messageType == MessageType.yesNo)
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: FormListButton(
                          icon: Icons.done_rounded,
                          color: const Color.fromARGB(255, 22, 133, 0),
                          title: 'YES',
                          onTap: () {
                            if (onYes != null) onYes!();
                          }),
                    ),
                  if (messageType == MessageType.yesNo)
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: FormListButton(
                        icon: Icons.close_rounded,
                        color: const Color.fromRGBO(244, 67, 54, 1),
                        title: 'No',
                        onTap: () {
                          if (onCancel != null) {
                            onCancel!();
                          }
                          Navigator.pop(context);
                        },
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
