import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../core/utils/config/styles/colors.dart';
import '../../controller/home_controller.dart';

class Breadcrumbs extends StatelessWidget {
  const Breadcrumbs({super.key});

  @override
  Widget build(BuildContext context) {
    final route = GoRouterState.of(context).matchedLocation;
    final List<String> segments =
    route.split('/').where((e) => e.isNotEmpty).toList();

    // Get the DrawerProvider
    final drawerProvider = Provider.of<HomeController>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: Colors.white,
          border: Border.all(
            width: 1,
            color: AppColor.breadCramp,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(Icons.home_outlined, color: AppColor.txtColor, size: 20),
              ...segments.asMap().entries.map((entry) {
                final int idx = entry.key;
                final String segment = entry.value;

                // Check if the segment is "dashboard" and replace it with "Home"
                String displayText = segment.toLowerCase() == 'dashboard' ? 'Home' : segment.capitalize();

                return Row(
                  children: [
                    Icon(Icons.chevron_right, color: AppColor.txtColor, size: 20),
                    GestureDetector(
                      onTap: () {
                        final path = '/' + segments.sublist(0, idx + 1).join('/');
                        context.go(path);
                        // Update the selected item in the drawer
                        drawerProvider.setSelectedItem(displayText);
                      },
                      child: Text(
                        displayText,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColor.txtColor,
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}

extension StringCapitalization on String {
  String capitalize() => '${this[0].toUpperCase()}${substring(1)}';
}
