import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketmaster/ui/views/home/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, vm, child) {
      return Center(
          child: Text('Home View'),
      );
    });
  }
}