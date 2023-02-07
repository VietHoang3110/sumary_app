import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
// ignore: import_of_legacy_library_into_null_safe

import '../src/src_index.dart';

class WidgetInput extends StatefulWidget {
  final TextEditingController? inputController;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final String? hint, errorText, labelText1,labelText, initialValue;
  final int? maxLine;
  final int? minLine;
  final int? maxLength;
  final double? height;
  final bool? obscureText;
  final TextInputType? inputType;
  final Widget? leadIcon;
  final Widget? endIcon;
  final Widget? fix;
  final bool? enabled;
  final FocusNode? focusNode;
  final CrossAxisAlignment? crossAxisAlignment;
  final TextInputAction? textInputAction;
  final BoxDecoration? boxDecoration;
  const WidgetInput(
      {Key? key,
        this.focusNode,
        this.inputController,
        this.onChanged,
        this.validator,
        this.fix,
        this.hint,
        this.errorText,
        this.labelText,
        this.labelText1,
        this.initialValue,
        this.maxLine = 1,
        this.minLine = 1,
        this.maxLength,
        this.height = 48,
        this.obscureText = false,
        this.inputType = TextInputType.text,
        this.crossAxisAlignment = CrossAxisAlignment.center,
        this.textInputAction = TextInputAction.go,
        this.leadIcon,
        this.endIcon,
        this.enabled = true,
        this.boxDecoration,
      })
      : super(key: key);

  @override
  _WidgetInputState createState() => _WidgetInputState();
}

class _WidgetInputState extends State<WidgetInput> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: widget.height,
          decoration: widget.boxDecoration,
          child: Row(
            crossAxisAlignment: widget.crossAxisAlignment!,
            children: [
              widget.leadIcon != null ? Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Center(child: Container(height: 25, width: 25, child: widget.leadIcon)),
              ) : Container(),
              Expanded(
                flex:8,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    key: widget.key,
                    controller: widget.inputController,
                    onChanged: (change) => widget.onChanged!(change),
                    enabled: widget.enabled,
                    validator: widget.validator,
                    style: AppStyle.DEFAULT_16,
                    maxLines: widget.maxLine,
                    minLines: widget.minLine,
                    keyboardType: widget.inputType,
                    textAlign: TextAlign.left,
                    obscureText: widget.obscureText!,
                    initialValue: widget.initialValue,
                    focusNode: widget.focusNode,
                    textAlignVertical: TextAlignVertical.top,
                    textInputAction: widget.textInputAction,
                    maxLength: widget.maxLength,
                    decoration: InputDecoration(
                      labelText: widget.labelText,
                      labelStyle: AppStyle.DEFAULT_14.copyWith(color: COLORS.PRIMARY_COLOR),
                      hintText: widget.hint,
                      errorText: widget.errorText,
                      errorStyle: AppStyle.DEFAULT_12.copyWith(color: COLORS.RED, fontSize: 7),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              widget.endIcon != null ? Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Center(child: Container(height: 25, child: widget.endIcon)),
              ) : Container()
            ],
          ),
        ),
        Positioned(
          top: -10,
          left: 15,
          child:widget.fix ?? Container(
            width: 50,
            height: 25,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Stack(children: [
              Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.white),
                      left: BorderSide(color: Colors.white),
                      right: BorderSide(color: Colors.white),
                    ),
                  ),
                  height: 11
              ),
              Center(
                child: Text(widget.labelText1.toString(),style: AppStyle.DEFAULT_16,),
              ),
            ],
            ),
          ),
        ),
      ],
    );
  }
}


class WidgetInput2 extends StatefulWidget {
  final TextEditingController? inputController;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final String? hint, errorText, labelText1,labelText, initialValue;
  final int? maxLine;
  final int? minLine;
  final int? maxLength;
  final double? height;
  final double? width;
  final bool? obscureText;
  final TextInputType? inputType;
  final Widget? leadIcon;
  final Widget? endIcon;
  final Widget? fix;
  final bool? enabled;
  final bool? readOnly;
  final FocusNode? focusNode;
  final CrossAxisAlignment? crossAxisAlignment;
  final TextInputAction? textInputAction;
  final BoxDecoration? boxDecoration;
  const WidgetInput2(
      {Key? key,
        this.focusNode,
        this.inputController,
        this.onChanged,
        this.validator,
        this.fix,
        this.hint,
        this.errorText,
        this.labelText,
        this.labelText1,
        this.initialValue,
        this.maxLine = 1,
        this.minLine = 1,
        this.maxLength,
        this.height = 55,
        this.width ,
        this.obscureText = false,
        this.inputType = TextInputType.text,
        this.crossAxisAlignment = CrossAxisAlignment.center,
        this.textInputAction = TextInputAction.go,
        this.leadIcon,
        this.endIcon,
        this.enabled = true,
        this.boxDecoration,
        this.readOnly = false,
      })
      : super(key: key);

  @override
  _WidgetInput2State createState() => _WidgetInput2State();
}

class _WidgetInput2State extends State<WidgetInput2> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: widget.height,
          width: widget.width,
          decoration: widget.boxDecoration,
          child: Row(
            crossAxisAlignment: widget.crossAxisAlignment!,
            children: [
              widget.leadIcon != null ? Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Center(child: Container(height: 25, width: 25, child: widget.leadIcon)),
              ) : Container(),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextFormField(
                    key: widget.key,
                    readOnly: widget.readOnly!,
                    controller: widget.inputController,
                    onChanged: (change) => widget.onChanged!(change),
                    enabled: widget.enabled,
                    validator: widget.validator,
                    style: AppStyle.DEFAULT_16,
                    maxLines: widget.maxLine,
                    minLines: widget.minLine,
                    keyboardType: widget.inputType,
                    textAlign: TextAlign.left,
                    obscureText: widget.obscureText!,
                    initialValue: widget.initialValue,
                    focusNode: widget.focusNode,
                    textAlignVertical: TextAlignVertical.top,
                    textInputAction: widget.textInputAction,
                    maxLength: widget.maxLength,
                    decoration: InputDecoration(
                      labelText: widget.labelText,
                      labelStyle: AppStyle.DEFAULT_14.copyWith(color: COLORS.PRIMARY_COLOR),
                      hintText: widget.hint,
                      hintStyle: AppStyle.DEFAULT_16.copyWith(color: COLORS.GREY_HINT),
                      errorText: widget.errorText,
                      errorStyle: AppStyle.DEFAULT_12.copyWith(color: COLORS.RED, fontSize: 8),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              widget.endIcon != null ? Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Center(child: Container(height: 25, child: widget.endIcon)),
              ) : Container()
            ],
          ),
        ),
        Positioned(
          top: -13,
          left: 15,
          child:widget.fix ?? Container(
            width: 50,
            height: 25,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Stack(children: [
              Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.white),
                      left: BorderSide(color: Colors.white),
                      right: BorderSide(color: Colors.white),
                    ),
                  ),
                  height: 11),
              Center(
                child: Text(widget.labelText1.toString(),style: AppStyle.DEFAULT_16,),
              ),
            ],
            ),
          ),
        ),
      ],
    );
  }
}

class WidgetInput3 extends StatefulWidget {
  final TextEditingController? inputController;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final String? hint, errorText, labelText1,labelText, initialValue;
  final int? maxLine;
  final int? minLine;
  final int? maxLength;
  final double? height;
  final bool? obscureText;
  final TextInputType? inputType;
  final Widget? leadIcon;
  final Widget? endIcon;
  final Widget? fix;
  final bool? enabled;
  final FocusNode? focusNode;
  final CrossAxisAlignment? crossAxisAlignment;
  final TextInputAction? textInputAction;
  final BoxDecoration? boxDecoration;
  const WidgetInput3(
      {Key? key,
        this.focusNode,
        this.inputController,
        this.onChanged,
        this.validator,
        this.fix,
        this.hint,
        this.errorText,
        this.labelText,
        this.labelText1,
        this.initialValue,
        this.maxLine = 1,
        this.minLine = 1,
        this.maxLength,
        this.height = 55,
        this.obscureText = false,
        this.inputType = TextInputType.text,
        this.crossAxisAlignment = CrossAxisAlignment.center,
        this.textInputAction = TextInputAction.go,
        this.leadIcon,
        this.endIcon,
        this.enabled = true,
        this.boxDecoration,
      })
      : super(key: key);

  @override
  _WidgetInput3State createState() => _WidgetInput3State();
}

class _WidgetInput3State extends State<WidgetInput3> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: widget.height,
          decoration: widget.boxDecoration,
          child: Row(
            crossAxisAlignment: widget.crossAxisAlignment!,
            children: [
              widget.leadIcon != null ? Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Center(child: Container(height: 25, width: 25, child: widget.leadIcon)),
              ) : Container(),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    key: widget.key,
                    controller: widget.inputController,
                    onChanged: (change) => widget.onChanged!(change),
                    enabled: widget.enabled,
                    validator: widget.validator,
                    style: AppStyle.DEFAULT_16,
                    maxLines: widget.maxLine,
                    minLines: widget.minLine,
                    keyboardType: widget.inputType,
                    textAlign: TextAlign.left,
                    obscureText: widget.obscureText!,
                    initialValue: widget.initialValue,
                    focusNode: widget.focusNode,
                    textAlignVertical: TextAlignVertical.top,
                    textInputAction: widget.textInputAction,
                    maxLength: widget.maxLength,
                    decoration: InputDecoration(
                      labelText: widget.labelText,
                      labelStyle: AppStyle.DEFAULT_14.copyWith(color: COLORS.PRIMARY_COLOR),
                      hintText: widget.hint,
                      errorText: widget.errorText,
                      errorStyle: AppStyle.DEFAULT_12.copyWith(color: COLORS.RED, fontSize: 8),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              widget.endIcon != null ? Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Center(child: Container(height: 25, child: widget.endIcon)),
              ) : Container()
            ],
          ),
        ),
        Positioned(
          top: -12,
          left: 15,
          child:widget.fix ?? Container(
            width: 50,
            height: 25,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Stack(children: [
              Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.white),
                      left: BorderSide(color: Colors.white),
                      right: BorderSide(color: Colors.white),
                    ),
                  ),
                  height: 11),
              Center(
                child: Text(widget.labelText1.toString(),style: AppStyle.DEFAULT_16,),
              ),
            ],
            ),
          ),
        ),
      ],
    );
  }
}

class WidgetInputkk extends StatefulWidget {
  final TextEditingController? inputController;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final String? hint, errorText, labelText1,labelText, initialValue;
  final int? maxLine;
  final int? minLine;
  final int? maxLength;
  final double? height;
  final bool? obscureText;
  final TextInputType? inputType;
  final Widget? leadIcon;
  final Widget? endIcon;
  final Widget? fix;
  final bool? enabled;
  final FocusNode? focusNode;
  final CrossAxisAlignment? crossAxisAlignment;
  final TextInputAction? textInputAction;
  final BoxDecoration? boxDecoration;
  const WidgetInputkk(
      {Key? key,
        this.focusNode,
        this.inputController,
        this.onChanged,
        this.validator,
        this.fix,
        this.hint,
        this.errorText,
        this.labelText,
        this.labelText1,
        this.initialValue,
        this.maxLine = 1,
        this.minLine = 1,
        this.maxLength,
        this.height = 30,
        this.obscureText = false,
        this.inputType = TextInputType.text,
        this.crossAxisAlignment = CrossAxisAlignment.center,
        this.textInputAction = TextInputAction.go,
        this.leadIcon,
        this.endIcon,
        this.enabled = true,
        this.boxDecoration,
      })
      : super(key: key);

  @override
  _WidgetInputkkState createState() => _WidgetInputkkState();
}

class _WidgetInputkkState extends State<WidgetInputkk> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: widget.height,
          decoration: widget.boxDecoration,
          child: Row(
            crossAxisAlignment: widget.crossAxisAlignment!,
            children: [
              widget.leadIcon != null ? Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Center(child: Container(height: 25, width: 25, child: widget.leadIcon)),
              ) : Container(),
              Expanded(
                flex: 5,
                child: TextFormField(
                  key: widget.key,
                  controller: widget.inputController,
                  onChanged: (change) => widget.onChanged!(change),
                  enabled: widget.enabled,
                  validator: widget.validator,
                  style: AppStyle.DEFAULT_12,
                  maxLines: widget.maxLine,
                  minLines: widget.minLine,
                  keyboardType: widget.inputType,
                  textAlign: TextAlign.left,
                  obscureText: widget.obscureText!,
                  initialValue: widget.initialValue,
                  focusNode: widget.focusNode,
                  textAlignVertical: TextAlignVertical.top,
                  textInputAction: widget.textInputAction,
                  maxLength: widget.maxLength,
                  decoration: InputDecoration(
                    labelText: widget.labelText,
                    labelStyle: AppStyle.DEFAULT_14.copyWith(color: COLORS.PRIMARY_COLOR),
                    hintText: widget.hint,
                    errorText: widget.errorText,
                    errorStyle: AppStyle.DEFAULT_12.copyWith(color: COLORS.RED, fontSize: 8),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
              widget.endIcon != null ? Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Center(child: Container(height: 25, child: widget.endIcon)),
              ) : Container()
            ],
          ),
        ),
      ],
    );
  }
}

class WidgetInput4 extends StatefulWidget {
  final TextEditingController? inputController;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final String? hint, errorText, labelText1,labelText, initialValue;
  final int? maxLine;
  final int? minLine;
  final int? maxLength;
  final double? height;
  final double? width;
  final bool? obscureText;
  final TextInputType? inputType;
  final VoidCallback? onEditingComplete;
  final Widget? leadIcon;
  final Widget? endIcon;
  final bool? enabled;
  final FocusNode? focusNode;
  final CrossAxisAlignment? crossAxisAlignment;
  final TextInputAction? textInputAction;
  final BoxDecoration? boxDecoration;
  const WidgetInput4(
      {Key? key,
        this.focusNode,
        this.inputController,
        this.onChanged,
        this.validator,
        this.hint,
        this.errorText,
        this.labelText,
        this.labelText1,
        this.initialValue,
        this.maxLine = 1,
        this.minLine = 1,
        this.maxLength,
        this.height = 40,
        this.width,
        this.obscureText = false,
        this.inputType = TextInputType.text,
        this.crossAxisAlignment = CrossAxisAlignment.center,
        this.textInputAction = TextInputAction.go,
        this.leadIcon,
        this.endIcon,
        this.enabled = true,
        this.boxDecoration, this.onEditingComplete,
      })
      : super(key: key);

  @override
  _WidgetInput4State createState() => _WidgetInput4State();
}

class _WidgetInput4State extends State<WidgetInput4> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: widget.height,
          width: widget.width,
          decoration: widget.boxDecoration,
          child: Row(
            crossAxisAlignment: widget.crossAxisAlignment!,
            children: [
              widget.leadIcon != null ? Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Center(child: Container(height: 25, width: 25, child: widget.leadIcon)),
              ) : Container(),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    key: widget.key,
                    controller: widget.inputController,
                    onChanged: (change) => widget.onChanged!(change),
                    onEditingComplete: widget.onEditingComplete,
                    enabled: widget.enabled,
                    validator: widget.validator,
                    style: AppStyle.DEFAULT_16,
                    maxLines: widget.maxLine,
                    minLines: widget.minLine,
                    keyboardType: widget.inputType,
                    textAlign: TextAlign.left,
                    obscureText: widget.obscureText!,
                    initialValue: widget.initialValue,
                    focusNode: widget.focusNode,
                    textAlignVertical: TextAlignVertical.top,
                    textInputAction: widget.textInputAction,
                    maxLength: widget.maxLength,
                    decoration: InputDecoration(
                      labelText: widget.labelText,
                      labelStyle: AppStyle.DEFAULT_14.copyWith(color: COLORS.PRIMARY_COLOR),
                      hintText: widget.hint,
                      errorText: widget.errorText,
                      errorStyle: AppStyle.DEFAULT_12.copyWith(color: COLORS.RED, fontSize: 8),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              widget.endIcon != null ? Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Center(child: Container(height: 25, child: widget.endIcon)),
              ) : Container()
            ],
          ),
        ),
      ],
    );
  }
}

class WidgetInput5 extends StatefulWidget {
  final TextEditingController? inputController;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final String? hint, errorText, labelText1,labelText, initialValue;
  final int? maxLine;
  final int? minLine;
  final int? maxLength;
  final double? height;
  final bool? obscureText;
  final TextInputType? inputType;
  final Widget? leadIcon;
  final Widget? endIcon;
  final Widget? fix;
  final bool? enabled;
  final FocusNode? focusNode;
  final CrossAxisAlignment? crossAxisAlignment;
  final TextInputAction? textInputAction;
  final BoxDecoration? boxDecoration;
  final bool autofocus;
  final bool readOnly;
  const WidgetInput5(
      {Key? key,
        this.focusNode,
        this.readOnly = false,
        this.inputController,
        this.onChanged,
        this.validator,
        this.fix,
        this.hint,
        this.errorText,
        this.labelText,
        this.labelText1,
        this.initialValue,
        this.maxLine = 1,
        this.minLine = 1,
        this.maxLength,
        this.height = 65,
        this.obscureText = false,
        this.inputType = TextInputType.text,
        this.crossAxisAlignment = CrossAxisAlignment.center,
        this.textInputAction = TextInputAction.go,
        this.leadIcon,
        this.endIcon,
        this.enabled = true,
        this.boxDecoration,
        this.autofocus = false,
      })
      : super(key: key);

  @override
  _WidgetInput5State createState() => _WidgetInput5State();
}

class _WidgetInput5State extends State<WidgetInput5> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: widget.height,
          decoration: widget.boxDecoration,
          child: Row(
            crossAxisAlignment: widget.crossAxisAlignment!,
            children: [
              widget.leadIcon != null ? Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Center(child: Container(height: 25, width: 25, child: widget.leadIcon)),
              ) : Container(),
              Expanded(
                flex:8,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    autofocus: widget.autofocus,
                    key: widget.key,
                    controller: widget.inputController,
                    onChanged: (change) => widget.onChanged!(change),
                    enabled: widget.enabled,
                    readOnly: widget.readOnly,
                    validator: widget.validator,
                    style: AppStyle.DEFAULT_16,
                    maxLines: widget.maxLine,
                    minLines: widget.minLine,
                    keyboardType: widget.inputType,
                    textAlign: TextAlign.left,
                    obscureText: widget.obscureText!,
                    initialValue: widget.initialValue,
                    focusNode: widget.focusNode,
                    textAlignVertical: TextAlignVertical.top,
                    textInputAction: widget.textInputAction,
                    maxLength: widget.maxLength,
                    decoration: InputDecoration(
                      labelText: widget.labelText,
                      labelStyle: AppStyle.DEFAULT_14.copyWith(color: COLORS.PRIMARY_COLOR),
                      hintText: widget.hint,
                      hintStyle: AppStyle.DEFAULT_16.copyWith(color: COLORS.GREY_HINT),
                      errorStyle: AppStyle.DEFAULT_12.copyWith(color: COLORS.RED, fontSize: 7),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              widget.endIcon != null ? Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Center(child: Container(height: 25, child: widget.endIcon)),
              ) : Container()
            ],
          ),
        ),
        Positioned(
          top: -13,
          left: 15,
          child:widget.fix ?? Container(
            width: 50,
            height: 25,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Stack(children: [
              Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.white),
                      left: BorderSide(color: Colors.white),
                      right: BorderSide(color: Colors.white),
                    ),
                  ),
                  height: 11
              ),
              Center(
                child: Text(widget.labelText1.toString(),style: AppStyle.DEFAULT_16,),
              ),
            ],
            ),
          ),
        ),
      ],
    );
  }
}

class WidgetInput7 extends StatefulWidget {
  final TextEditingController? inputController;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final String? hint, errorText, labelText1,labelText, initialValue;
  final int? maxLine;
  final int? minLine;
  final int? maxLength;
  final double? height;
  final bool? obscureText;
  final TextInputType? inputType;
  final Widget? leadIcon;
  final Widget? endIcon;
  final Widget? fix;
  final bool? enabled;
  final FocusNode? focusNode;
  final CrossAxisAlignment? crossAxisAlignment;
  final TextInputAction? textInputAction;
  final BoxDecoration? boxDecoration;
  const WidgetInput7(
      {Key? key,
        this.focusNode,
        this.inputController,
        this.onChanged,
        this.validator,
        this.fix,
        this.hint,
        this.errorText,
        this.labelText,
        this.labelText1,
        this.initialValue,
        this.maxLine = 1,
        this.minLine = 1,
        this.maxLength,
        this.height = 48,
        this.obscureText = false,
        this.inputType = TextInputType.text,
        this.crossAxisAlignment = CrossAxisAlignment.center,
        this.textInputAction = TextInputAction.go,
        this.leadIcon,
        this.endIcon,
        this.enabled = true,
        this.boxDecoration,
      })
      : super(key: key);

  @override
  _WidgetInput7State createState() => _WidgetInput7State();
}

class _WidgetInput7State extends State<WidgetInput7> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: widget.height,
          decoration: widget.boxDecoration,
          child: Row(
            crossAxisAlignment: widget.crossAxisAlignment!,
            children: [
              widget.leadIcon != null ? Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Center(child: Container(height: 25, width: 25, child: widget.leadIcon)),
              ) : Container(),
              Expanded(
                flex:8,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    key: widget.key,
                    controller: widget.inputController,
                    onChanged: (change) => widget.onChanged!(change),
                    enabled: widget.enabled,
                    validator: widget.validator,
                    style: AppStyle.DEFAULT_16,
                    maxLines: widget.maxLine,
                    minLines: widget.minLine,
                    keyboardType: widget.inputType,
                    textAlign: TextAlign.left,
                    obscureText: widget.obscureText!,
                    initialValue: widget.initialValue,
                    focusNode: widget.focusNode,
                    textAlignVertical: TextAlignVertical.top,
                    textInputAction: widget.textInputAction,
                    maxLength: widget.maxLength,
                    decoration: InputDecoration(
                      labelText: widget.labelText,
                      labelStyle: AppStyle.DEFAULT_14.copyWith(color: COLORS.PRIMARY_COLOR),
                      hintText: widget.hint,
                      errorText: widget.errorText,
                      errorStyle: AppStyle.DEFAULT_12.copyWith(color: COLORS.RED, fontSize: 7),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              widget.endIcon != null ? Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Center(child: Container(height: 25, child: widget.endIcon)),
              ) : Container()
            ],
          ),
        ),
      ],
    );
  }

}

