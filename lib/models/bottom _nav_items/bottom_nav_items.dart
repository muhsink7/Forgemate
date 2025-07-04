import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:forgemate/constants/colour_constants.dart';

class NavItemsModel {
  final String label;
  final IconData iconData;
  final RxInt indexChangeNotifier;
  final int index;

  NavItemsModel({
    required this.label,
    required this.iconData,
    required this.indexChangeNotifier,
    required this.index,
  });

  Icon get icon {
    return Icon(
      iconData,
      color: indexChangeNotifier.value == index ? kWhiteColor : kGreyColor,
    );
  }
}

// Create a common RxInt to track index
final RxInt indexChangeNotifier = 0.obs;

List<NavItemsModel> bottomNavItems = [
  NavItemsModel(
    label: "Insights",
    iconData: Icons.insights,
    indexChangeNotifier: indexChangeNotifier,
    index: 0,
  ),
  NavItemsModel(
    label: "Create Project",
    iconData: Icons.add_circle_sharp,
    indexChangeNotifier: indexChangeNotifier,
    index: 1,
  ),
  NavItemsModel(
    label: "Projects",
    iconData: Icons.villa,
    indexChangeNotifier: indexChangeNotifier,
    index: 2,
  ),
  NavItemsModel(
    label: "WorkForce",
    iconData: Icons.engineering,
    indexChangeNotifier: indexChangeNotifier,
    index: 3,
  ),
  NavItemsModel(
    label: "Expenses",
    iconData: Icons.payments,
    indexChangeNotifier: indexChangeNotifier,
    index: 4,
  ),
];
