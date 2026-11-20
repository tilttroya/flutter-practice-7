
import 'package:flutter/material.dart';

enum InputFieldType { name, email, password, confirmPassword }

class CustomTextFormField extends StatefulWidget {
  final InputFieldType inputType;
  final String labelText;
  final String hintText;
  final TextEditingController controller;

  const CustomTextFormField({
    super.key,
    required this.inputType,
    required this.labelText,
    required this.hintText,
    required this.controller,
  });

  @override
  State<CustomTextFormField> createState() =>
      _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _hidePassword = true;

  String? _validator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Поле не может быть пустым';
    }

    switch (widget.inputType) {
      case InputFieldType.name:
        final reg = RegExp(r'^[A-Za-zА-Яа-яЁё\s]+$');
        if (!reg.hasMatch(value)) {
          return 'ФИО должно содержать только буквы и пробелы';
        }
        break;

      case InputFieldType.email:
        final reg = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
        if (!reg.hasMatch(value)) {
          return 'Введите корректный Email';
        }
        break;

      case InputFieldType.password:
      case InputFieldType.confirmPassword:
        final reg = RegExp(
          r'^(?=.*[A-Za-zА-Яа-яЁё])(?=.*\d)(?=.*[+_-]).{6,}$',
        );
        if (!reg.hasMatch(value)) {
          return 'Минимум 6 символов: буквы, цифры и +, _, -';
        }
        break;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final isPassword = widget.inputType == InputFieldType.password ||
        widget.inputType == InputFieldType.confirmPassword;

    return TextFormField(
      controller: widget.controller,
      validator: _validator,
      obscureText: isPassword && _hidePassword,
      keyboardType: widget.inputType == InputFieldType.email
          ? TextInputType.emailAddress
          : TextInputType.text,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) =>
          FocusScope.of(context).nextFocus(),
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        prefixIcon: Icon(
          widget.inputType == InputFieldType.name
              ? Icons.person_outline
              : widget.inputType == InputFieldType.email
              ? Icons.email_outlined
              : Icons.security,
        ),
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(
            _hidePassword
                ? Icons.visibility
                : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _hidePassword = !_hidePassword;
            });
          },
        )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
