import 'package:flutter/material.dart';

import '../constants/constants.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.body,
    this.title,
    this.actions,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.showBack = true,
    this.safeArea = true,
    this.padding = const EdgeInsets.symmetric(
      horizontal: AppSpacing.pagePadding,
    ),
  });

  final Widget body;
  final String? title;
  final List<Widget>? actions;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final bool showBack;
  final bool safeArea;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final Widget content = Padding(padding: padding, child: body);

    return Scaffold(
      appBar: title == null && actions == null
          ? null
          : AppBar(
              automaticallyImplyLeading: showBack,
              title: title == null ? null : Text(title!),
              actions: actions,
            ),
      body: safeArea ? SafeArea(child: content) : content,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }
}
