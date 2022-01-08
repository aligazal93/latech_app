import 'package:flutter/cupertino.dart';

class PopScaffold extends StatelessWidget {
  const PopScaffold({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: child);
  }
}
