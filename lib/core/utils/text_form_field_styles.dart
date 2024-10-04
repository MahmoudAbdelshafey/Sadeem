import 'package:flutter/material.dart';

import 'constants.dart';


OutlineInputBorder normalOutlineInputBorder = OutlineInputBorder(
    borderSide: const BorderSide(color:  AppConstants.kPrimaryColor),
    borderRadius: BorderRadius.circular(10));


InputDecoration pinInputDecoration = InputDecoration(
    counter:const Offstage(),
    enabledBorder: OutlineInputBorder(
        borderSide: const  BorderSide(width: 2, color:  AppConstants.kPrimaryColor),
        borderRadius: BorderRadius.circular(12)),
    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 2, color: AppConstants.kPrimaryColor),
        borderRadius: BorderRadius.circular(12)),
    disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 2, color:  AppConstants.kPrimaryColor),
        borderRadius: BorderRadius.circular(12)),
    errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 2, color: Colors.red),
        borderRadius: BorderRadius.circular(12)),
    focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 2, color: Colors.red),
        borderRadius: BorderRadius.circular(12)),
    errorStyle: const TextStyle(height: 0)

);