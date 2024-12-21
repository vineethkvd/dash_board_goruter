import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/helpers/routes/app_route_path.dart';

class HomeController with ChangeNotifier {
  HomeController() {
    _filteredItems = List.from(homePageItems);
  }
  //Drawer
  String _selectedItem = 'Dashboard';
  bool _showIcons = true;

  String get selectedItem => _selectedItem;
  bool get showIcons => _showIcons; // Getter for showIcons

  void setSelectedItem(String item) {
    _selectedItem = item;
    notifyListeners();
  }

  void pageStart({required String item, required BuildContext context}) {
    setSelectedItem(item);
    context.go("/dashboard");
    notifyListeners();
  }

  void toggleShowIcons() {
    _showIcons = !_showIcons; // Toggle the visibility of icons and titles
    notifyListeners();
  }

  //popup menu button
  final List<Map<String, dynamic>> menuItems = [
    {
      'icon': Icons.person,
      'text': 'My Profile',
    },
    {
      'icon': Icons.logout_outlined,
      'text': 'Logout',
    },
  ];

  //drawer items
  final List<Map<String, dynamic>> drawerMenuItems = [
    {'name': 'Home', 'route': RoutesPath.dashboard, 'icon': Icons.home},
    {'name': 'View', 'route': RoutesPath.productView, 'icon': Icons.visibility},
    {'name': 'Add', 'route': RoutesPath.productAdd, 'icon': Icons.add},
    {'name': 'Update', 'route': RoutesPath.productUpdate, 'icon': Icons.edit},
    {'name': 'Delete', 'route': RoutesPath.productDelete, 'icon': Icons.delete},
  ];

  //home page items

  //drawer items
  final List<Map<String, dynamic>> homePageItems = [
    {'name': 'Home', 'route': RoutesPath.dashboard, 'icon': Icons.home},
    {'name': 'View', 'route': RoutesPath.productView, 'icon': Icons.visibility},
    {
      'name': 'Add',
      'route': null, // No direct route for parent
      'icon': Icons.add,
      'subItems': [
        {'name': 'Add Employee', 'route': '', 'icon': Icons.person_add},
        {'name': 'Add Customer', 'route': '', 'icon': Icons.person_add_alt_1},
      ],
    },
    {'name': 'Update', 'route': RoutesPath.productUpdate, 'icon': Icons.edit},
    {'name': 'Delete', 'route': RoutesPath.productDelete, 'icon': Icons.delete},
  ];

  // Filtered items
  List<Map<String, dynamic>> _filteredItems = [];
  List<Map<String, dynamic>> get filteredItems => _filteredItems;

  // Search functionality
  void searchItems(String query) {
    if (query.isEmpty) {
      _filteredItems = List.from(homePageItems); // Reset to all items
    } else {
      _filteredItems = homePageItems.where((item) {
        return item['name'].toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}
