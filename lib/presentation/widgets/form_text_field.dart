import 'package:flutter/material.dart';
import 'package:flutter_todo_app/presentation/styles/colors.dart';

class FormTextField extends StatelessWidget {
  const FormTextField({Key? key, required this.icon, required this.label})
      : super(key: key);

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
        border: Border.all(color: AppColors.black),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Icon(
              icon,
              color: AppColors.purple,
            ),
          ),
          Expanded(
            child: TextFormField(
              style: const TextStyle(color: AppColors.black),
              onChanged: (value) {},
              validator: (value) {
                return null;
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: label,
                hintStyle: const TextStyle(
                    color: AppColors.purple, fontWeight: FontWeight.w700),
              ),
              cursorColor: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
