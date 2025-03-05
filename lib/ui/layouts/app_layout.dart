import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  final Widget child;
  final String? title;
  final Widget? floatingActionButton;
  final bool showBackButton;

  const AppLayout({
    super.key,   
    required this.child,
    this.title,
    this.floatingActionButton,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(tr('home.title')),
        ),
        body: Container(child: child),
      );
  }
}