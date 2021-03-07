
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lock_screen/flutter_lock_screen.dart';

class TimerCode {

  static Timer timer;

  void logOutUser() {
    timer?.cancel();
    timer = null;
  }

}