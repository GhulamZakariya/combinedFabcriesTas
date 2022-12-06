import 'package:flutter/material.dart';

class CsCommonTextFieldWidget extends StatefulWidget {
  const CsCommonTextFieldWidget(
      {super.key, this.titleText = '',
        this.titleTextAlign = TextAlign.center,
       required this.validator,
        required this.hintText,
         this.type,
        this.onTab,
        this.maxlines,
        required this.textController});

  final String titleText;
  final TextAlign titleTextAlign;
  final String hintText;
  final TextInputType? type;
  final Function()? onTab;
  final int? maxlines;
  final TextEditingController textController;
  final FormFieldValidator<String> validator;

  @override
  CsCommonTextFieldWidgetState createState() => CsCommonTextFieldWidgetState();
}

class CsCommonTextFieldWidgetState extends State<CsCommonTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textController,
      onTap: widget.onTab,
    maxLines: widget.maxlines ?? 1,
    keyboardType: widget.type,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10.0),
        hintText: widget.hintText, // pass the hint text parameter here
        hintStyle: const TextStyle(color: Colors.black26),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      style: const TextStyle(color: Colors.black),
      validator: widget.validator,
    );
  }
}