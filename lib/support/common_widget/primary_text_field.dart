import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:royal_class_app/support/app_theme.dart';

class InputText extends StatefulWidget {
  final bool? isObscure;
  final String? hint;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final String? errorText;
  final String? initialValue;
  final String? labelText;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextEditingController? textEditingController;
  final bool isReadonly;
  final double height;
  final bool isBorder;
  final bool isNext;
  final bool isTextArea;
  final bool? requestFocusNeeded;
  final int? maxLength;
  final bool? isMaxLengthExceeded;
  final double borderRadius;
  final TextInputType? keyboardType;
  final Color? borderColor;
  const InputText(
      {Key? key,
      this.hint,
      this.inputTextStyle,
      this.hintStyle,
      this.onChanged,
      this.isObscure,
      this.onSubmitted,
      this.borderColor,
      required this.textEditingController,
      this.errorText,
      this.initialValue,
      this.isReadonly = false,
      this.height = 42,
      this.isBorder = false,
      this.isNext = false,
      this.isTextArea = false,
      this.requestFocusNeeded = false,
      this.isMaxLengthExceeded = false,
      this.maxLength,
      this.borderRadius = 10,
      this.labelText,
      this.keyboardType = TextInputType.multiline})
      : super(key: key);
  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  FocusNode focusNode = FocusNode();
  bool isFocused = false;
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {
        isFocused = focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle finalHintStyle = widget.hintStyle ??
        GoogleFonts.montserrat(
            textStyle: TextStyle(
          color: colors(context).text,
          fontSize: widget.isTextArea ? 12 : 14,
          fontWeight: FontWeight.w400,
        ));

    if (widget.textEditingController != null) {
      widget.textEditingController?.selection = TextSelection.fromPosition(
          TextPosition(offset: widget.textEditingController!.text.length));
    }
    if (widget.requestFocusNeeded == true) {
      focusNode.requestFocus();
    }
    return Column(
      children: [
        Container(
          height: widget.isTextArea ? null : widget.height,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: colors(context).background!.withOpacity(0.5),
              borderRadius: BorderRadius.circular(widget.borderRadius),
              border: widget.isBorder
                  ? null
                  : Border.all(
                      color: widget.borderColor ??
                          colors(context).primaryStroke!)),
          child: TextFormField(
            obscureText: widget.isObscure ?? false,
            maxLength: widget.maxLength,
            focusNode: focusNode,
            style: widget.inputTextStyle,
            readOnly: widget.isReadonly,
            initialValue: widget.initialValue,
            textInputAction:
                widget.isNext ? TextInputAction.next : TextInputAction.newline,
            controller: widget.textEditingController,
            textAlign: TextAlign.start,
            keyboardType: widget.keyboardType,
            maxLines: widget.isTextArea ? null : 1,
            minLines: widget.isTextArea ? 2 : null,
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onSubmitted,
            cursorColor: colors(context).text,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 14.0),
              hintText: isFocused ? '' : widget.hint,
              hintStyle: finalHintStyle,
              border: InputBorder.none,
              counterText: widget.isMaxLengthExceeded == true
                  ? "Exceeded ${widget.maxLength} characters."
                  : "",
              counterStyle: const TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        ),
        Visibility(
          visible: widget.errorText != null,
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
            alignment: Alignment.centerLeft,
            child: Text(
              widget.errorText ?? "",
              style: const TextStyle(fontSize: 12.0, color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}
