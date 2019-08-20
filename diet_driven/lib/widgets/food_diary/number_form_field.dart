/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'dart:math';

import 'package:flutter/material.dart';

class NumberFormField extends StatefulWidget {
  final num value;
  final num minValue;
  final num maxValue;
  final FocusNode focusNode;
  final int decimalPlaces;
  final bool signed;
  final bool autofocus;
  final bool enabled;
  final TextInputAction textInputAction;
  final String errorText;
  final String labelText;
  final Icon icon;
  final ValueChanged<num> onChanged;

  const NumberFormField({
    Key key,
    @required this.value,
    this.minValue,
    this.maxValue,
    this.focusNode,
    this.decimalPlaces: 0,
    this.signed: false,
    this.autofocus: false,
    this.enabled: true,
    this.textInputAction,
    this.errorText,
    this.labelText,
    this.icon,
    @required this.onChanged
  }) :
      assert(value != null),
      assert(onChanged != null),
      assert(0 <= decimalPlaces),
      super(key: key);

  @override
  _NumberFormFieldState createState() => _NumberFormFieldState();
}

class _NumberFormFieldState extends State<NumberFormField> {
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: valToString(widget.value)) // TODO: format to locale
      ..selection = TextSelection(baseOffset: 0, extentOffset: valToString(widget.value).length)
      ..addListener(() {
        num value = num.tryParse(controller.text);

        if (value != null && validNumber(controller.text)) {
          widget.onChanged(round(value, widget.decimalPlaces));
        }
      });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.key,
      controller: controller,
      focusNode: widget.focusNode,
      keyboardType: TextInputType.numberWithOptions(
        decimal: widget.decimalPlaces >= 0, // TODO: negative decimal places for tens/hundreds/etc. precision
        signed: widget.signed
      ),
      autofocus: widget.autofocus,
      enabled: widget.enabled,
      textInputAction: widget.textInputAction,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        errorText: widget.errorText,
        labelText: widget.labelText,
        prefixIcon: widget.icon,
      ),
      autocorrect: false,
      autovalidate: true,
      // Overrides errorText text
      validator: (text) => validNumber(text) ? null : "Please enter a valid number", // TODO: change message based on decimal points, signed
      onEditingComplete: () {
        if (!validNumber(controller.text)) {
          // Reset to last valid number
          controller.value = TextEditingValue(
            text: valToString(widget.value),
            selection: TextSelection(baseOffset: 0, extentOffset: valToString(widget.value).length)
          );

          // TODO: evaluate expression if math - separate regex for validity!
        }
        else {
          // TODO: callback, possibly pop from above page!
        }
      },
    );
  }

  String valToString(num value) => value.toStringAsFixed(widget.decimalPlaces);

  // TODO: make this a globally used function
  num round(num val, num places) {
    num mod = pow(10.0, places);
    return (val * mod).round().toDouble() / mod;
  }

  bool validNumber(String text) {
    // Valid pattern
    RegExp numberRegex;

    // TODO: take into consideration locale
    if (widget.decimalPlaces == 0) {
      if (widget.signed) {
        numberRegex = RegExp(r'^\d+$'); // FIXME match +-
      }
      else {
        numberRegex = RegExp(r'^\d+$');
      }
    }
    else {
      if (widget.signed) {
        numberRegex = RegExp(r'^[-+]?\d+(\.\d+)?$'); // FIXME: fails on 23.
        // https://stackoverflow.com/a/23872060 numberRegex = RegExp(r'/^[+-]?((\d+(\.\d*)?)|(\.\d+))$/'); // FIXME
      }
      else {
        // https://stackoverflow.com/a/35259323
        numberRegex = RegExp(r'^0$|^[1-9]\d*$|^\.\d+$|^0\.\d*$|^[1-9]\d*\.\d*$');
      }
    }

    if (!numberRegex.hasMatch(text)) {
      return false;
    }

    // Valid value
    num value = num.tryParse(controller.text);

    if (value == null) {
      return false;
    }

    if (widget.minValue != null && value < widget.minValue) { // TODO: specific error message
      return false;
    }

    if (widget.maxValue != null && value > widget.maxValue) { // TODO: specific error message
      return false;
    }

    return true;
  }
}
