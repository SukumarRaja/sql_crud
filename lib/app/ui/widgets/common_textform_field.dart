import 'package:flutter/material.dart';

class CommonTextFormField extends StatefulWidget {
  CommonTextFormField({
    Key? key,
    this.filled,
    this.fillColor,
    this.controller,
    this.obscureText = false,
    this.textInputAction = TextInputAction.done,
    this.keyboardType = TextInputType.text,
    this.labelText,
    this.hintText,
    this.errorText,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.focusNode,
    this.nextFocusNode,
    this.isReadOnly = false,
    this.onTap,
    this.minLines,
    this.maxLines,
    this.suffixIcon,
    this.prefixIcon,
    this.underline = false,
    this.maxLength,
  }) : super(key: key);

  //
  final bool? filled;
  final Color? fillColor;
  final TextEditingController? controller;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;

  //
  final String? labelText;
  final String? hintText;
  final String? errorText;

  final Function? onChanged;
  final Function? onFieldSubmitted;

  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;

  final bool? isReadOnly;
  final Function? onTap;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final bool? underline;
  String? Function(String?)? validator;

  @override
  _CommonTextFormFieldState createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        maxLength: widget.maxLength,
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          errorText: widget.errorText,
          counterText: "",
          /*  enabledBorder: widget.underline
              ? InputStyles.inputUnderlineEnabledBorder()
              : InputStyles.inputEnabledBorder(),
          errorBorder: widget.underline
              ? InputStyles.inputUnderlineEnabledBorder()
              : InputStyles.inputEnabledBorder(),
          focusedErrorBorder: widget.underline
              ? InputStyles.inputUnderlineFocusBorder()
              : InputStyles.inputFocusBorder(),
          focusedBorder: widget.underline
              ? InputStyles.inputUnderlineFocusBorder()
              : InputStyles.inputFocusBorder(),*/
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon ?? _getSuffixWidget(),
          labelStyle: Theme.of(context).textTheme.bodyText1,
          contentPadding: EdgeInsets.all(10),
          filled: widget.fillColor != null,
          fillColor: widget.fillColor,
        ),

        cursorColor: Colors.blue,
        obscureText: widget.obscureText! ? !makePasswordVisible : false,
        /*onTap: widget.onTap,
        readOnly: widget.isReadOnly,*/
        controller: widget.controller,
        validator: widget.validator,
        focusNode: widget.focusNode,
        /* onFieldSubmitted: (data) {
          if (widget.onFieldSubmitted != null) {
            widget.onFieldSubmitted(data);
          } else {
            FocusScope.of(context).requestFocus(widget.nextFocusNode);
          }
        },*/
        // onChanged: widget.onChanged,
        textInputAction: widget.textInputAction,
        keyboardType: widget.keyboardType,
        minLines: widget.minLines,
        maxLines: widget.obscureText! ? 1 : widget.maxLines,
      ),
    );
  }

  //check if it's password input
  bool makePasswordVisible = false;

  Widget _getSuffixWidget() {
    if (widget.obscureText!) {
      return ButtonTheme(
        minWidth: 30,
        height: 30,
        padding: EdgeInsets.all(0),
        child: TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(0),
          ),
          onPressed: () {
            setState(() {
              makePasswordVisible = !makePasswordVisible;
            });
          },
          child: Icon(
            (!makePasswordVisible) ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }
/*  getPrefixWidget(){
     Country selectedCountry;
     try {
      this.selectedCountry = Country.parse(AppStrings.countryCode
          .toUpperCase()
          .replaceAll("AUTO,", "")
          .split(",")[0]);
    } catch (error) {
      this.selectedCountry = Country.parse("us");
    }
  }

  //
  showCountryDialPicker() {
    showCountryPicker(
      context: viewContext,
      showPhoneCode: true,
      onSelect: countryCodeSelected,
    );
  }

  countryCodeSelected(Country country) {
    selectedCountry = country;
    notifyListeners();
  }*/

}
