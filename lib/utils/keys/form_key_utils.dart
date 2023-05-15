import 'package:flutter/material.dart';

class FormKeyUtils {
  static GlobalKey<FormState> createFormKey(String uniqueId) {
    return GlobalKey<FormState>(debugLabel: 'formKey$uniqueId');
  }
}
