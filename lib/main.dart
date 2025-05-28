import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:noct_cinedex/root_app.dart';
import 'package:noct_cinedex/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  di.setup();
  runApp(const RootApp());
}
