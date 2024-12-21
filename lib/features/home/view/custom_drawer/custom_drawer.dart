import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/helpers/routes/app_route_path.dart';
import '../../controller/home_controller.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<HomeController>(context);

    return Container(
      width: drawerProvider.showIcons ? 220 : 60,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueGrey[800]!, Colors.blueGrey[900]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(5),
              children: drawerProvider.drawerMenuItems.map((item) {
                bool isSelected = drawerProvider.selectedItem == item['name'];
                if (item['name'] == 'Add') {
                  // ExpansionTile for Add
                  return Theme(
                    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      iconColor: Colors.grey[300],
                      collapsedIconColor: Colors.grey[300],
                      title: Row(
                        children: [
                          Icon(
                            item['icon'],
                            size: 20,
                            color: Colors.grey[300],
                          ),
                          if (drawerProvider.showIcons) ...[
                            const SizedBox(width: 16),
                            Text(
                              item['name']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ],
                      ),
                      children: (item['subItems'] as List<Map<String, dynamic>>?)
                          ?.map((subItem) => ListTile(
                        title: Row(
                          children: [
                            Icon(
                              subItem['icon'],
                              size: 18,
                              color: Colors.grey[300],
                            ),
                            const SizedBox(width: 16),
                            Text(
                              subItem['name']!,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          context.go(subItem['route']!);
                        },
                      ))
                          .toList() ??
                          [],
                    ),
                  );
                } else {
                  // Non-expandable menu items
                  return GestureDetector(
                    onTap: () {
                      drawerProvider.setSelectedItem(item['name']!);
                      context.go(item['route']!);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blueGrey[700] : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              item['icon'],
                              size: 20,
                              color: isSelected ? Colors.white : Colors.grey[300],
                            ),
                            if (drawerProvider.showIcons) ...[
                              const SizedBox(width: 16),
                              Expanded(
                                child: Text(
                                  item['name']!,
                                  style: TextStyle(
                                    color: isSelected ? Colors.white : Colors.grey[300],
                                    fontWeight:
                                    isSelected ? FontWeight.bold : FontWeight.normal,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  );
                }
              }).toList(),
            ),
          ),
          // Logout Button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                _showLogoutDialog(context);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blueGrey[700],
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.logout_outlined,
                        size: 20,
                        color: Colors.white,
                      ),
                      if (drawerProvider.showIcons) ...[
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Text(
                            "Logout",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.blueGrey[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text(
            "Logout",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          content: const Text(
            "Are you sure you want to logout?",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Add logout logic here, e.g., context.go('/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
