// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:salon_booking_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:salon_booking_app/view/components/nav_bar/nav_bar.dart';

class MassageListScreen extends StatelessWidget {
  const MassageListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: "Massage List"), 
        bottomNavigationBar: const NavBar(currentIndex: 3),
    );
  }
}