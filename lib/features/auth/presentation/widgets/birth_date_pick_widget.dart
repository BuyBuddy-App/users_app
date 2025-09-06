import 'package:buy_buddy_user_app/core/custom/custom_button_grad.dart';
import 'package:buy_buddy_user_app/core/custom/custom_text_form_field.dart';
import 'package:buy_buddy_user_app/core/utils/app_colors.dart';
import 'package:buy_buddy_user_app/translations/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BirthDatePickWidget extends StatefulWidget {
  const BirthDatePickWidget({super.key});

  @override
  State<BirthDatePickWidget> createState() => _BirthDatePickWidgetState();
}

class _BirthDatePickWidgetState extends State<BirthDatePickWidget> {
  final TextEditingController _controller = TextEditingController();

  void _showCupertinoPicker(BuildContext context) {
    DateTime tempPickedDate = DateTime(2000); // default selected

    showModalBottomSheet(
      backgroundColor: Colors.black,
      context: context,
      builder: (_) {
        return Center(
          child: Container(
            height: 250,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black,
            ),
            child: Column(
              children: [
                Expanded(
                  child: CupertinoTheme(
                    data: CupertinoThemeData(
                      barBackgroundColor: Colors.amberAccent,
                      textTheme: CupertinoTextThemeData(
                        dateTimePickerTextStyle: TextStyle(
                          fontSize: 20,
                          color: AppColors.onPrimary,
                        ),
                      ),
                    ),
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      backgroundColor: CupertinoColors.black,
                      initialDateTime: DateTime(2000),
                      minimumDate: DateTime(1900),
                      maximumDate: DateTime.now(),
                      onDateTimeChanged: (DateTime newDate) {
                        tempPickedDate = newDate;
                      },
                    ),
                  ),
                ),
                CustomButtonGrad(
                  text: LocaleKeys.authProfileSet.tr(),
                  onPressed: () {
                    setState(() {
                      _controller.text =
                          "${tempPickedDate.day}/${tempPickedDate.month}/${tempPickedDate.year}";
                    });
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: _controller,
      readOnly: true,
      labelText: LocaleKeys.authProfileBirth.tr(),
      helperText: LocaleKeys.authProfileSelectBirth.tr(),
      suffixIcon: IconButton(
        icon: const Icon(Icons.arrow_drop_down),
        onPressed: () => _showCupertinoPicker(context),
      ),
    );
  }
}
