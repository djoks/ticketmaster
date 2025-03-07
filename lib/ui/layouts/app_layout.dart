import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticketmaster/ui/widgets/theme_toggle.dart';

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
        leading: showBackButton
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => context.pop(),
              )
            : null,
        title: Text(title!, style: const TextStyle(fontSize: 18)),
        actions: [
          Container(margin: EdgeInsets.only(right: 16), child: ThemeToggle())
        ],
      ),
      body: Container(child: child),
    );
  }
}
