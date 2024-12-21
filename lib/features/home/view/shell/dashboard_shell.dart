import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/home_controller.dart';
import '../Breadcrumbs/breadcrumbs.dart';
import '../custom_appbar/custom_appbar.dart';
import '../custom_drawer/custom_drawer.dart';

class DashboardShell extends StatelessWidget {
  final Widget child;

  const DashboardShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeController()..pageStart(item: 'Dashboard', context: context),
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              const CustomAppBar(), // Custom AppBar at the top
              Expanded(
                // Wrap the Row in Expanded to give it bounded height
                child: Row(
                  children: [
                    CustomDrawer(), // Custom Drawer on the left
                    Expanded(
                      child: Column(
                        children: [
                          const Breadcrumbs(), // Breadcrumbs below the AppBar
                          Expanded(child: child), // Main content area
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class ProductAdd extends StatelessWidget {
  const ProductAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Add', style: TextStyle(fontSize: 24)));
  }
}

class ProductDelete extends StatelessWidget {
  const ProductDelete({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Delete', style: TextStyle(fontSize: 24)));
  }
}

class ProductUpdate extends StatelessWidget {
  const ProductUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Update', style: TextStyle(fontSize: 24)));
  }
}

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('View', style: TextStyle(fontSize: 24)));
  }
}
