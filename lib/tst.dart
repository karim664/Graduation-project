import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signup_demo/providers/AppProvider_provider.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<AppProvider>(context);

    return Scaffold(
      body: Column(),
    );
  }
}
