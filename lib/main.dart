import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_course/src/app.dart';

void main() {
  runZonedGuarded(() => runApp(const CoffeeShopApp()), (error, stack) {
    log(error.toString(), name: 'App Error', stackTrace: stack);
  });
}
