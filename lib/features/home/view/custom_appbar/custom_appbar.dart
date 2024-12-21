import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/config/styles/colors.dart';
import '../../controller/home_controller.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<HomeController>(context);
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: AppColor.appBarColor,
        border: Border(
          bottom: BorderSide(
            width: 4,
            color: AppColor.appBarSecColor,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/images/app_logo.png"),
              SizedBox(
                width: 10,
              ),
              InkWell(
                child: Icon(
                  Icons.menu,
                  size: 20,
                  color: Colors.white,
                ),
                onTap: () {
                  drawerProvider.toggleShowIcons();
                },
              ),
            ],
          ),
          Container(
            height: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  width: 1,
                  color: AppColor.breadCramp,
                ),
                right: BorderSide(
                  width: 1,
                  color: AppColor.breadCramp,
                ),
              ),
            ),
            child: Row(children: [
              Icon(CupertinoIcons.profile_circled,
                  size: 20, color: AppColor.txtColor),
              SizedBox(
                width: 10,
              ),
              Text(
                "VINEETH VENU",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight:FontWeight.bold,
                    color: AppColor.txtColor),
              ),
              SizedBox(
                width: 10,
              ),
              PopupMenuButton(
                position: PopupMenuPosition.under,
                padding: const EdgeInsets.all(3),
                color: Colors.white,
                icon: const Icon(
                  Icons.keyboard_arrow_down_sharp,
                  size: 20,
                  color: Colors.black,
                ),
                itemBuilder: (context) {
                  return drawerProvider.menuItems.map<PopupMenuEntry<dynamic>>((item) {
                    return PopupMenuItem(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 0.5,
                          ),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              item['icon'],
                              size: 15,
                              color: Colors.black,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              item['text'],
                              style: _headerTextStyle,
                            ),
                            const Expanded(child: SizedBox()),
                          ],
                        ),
                      ),
                    );
                  }).toList();
                },
              ),

            ]),
          ),

        ],
      ),
    );
  }
}
const TextStyle _headerTextStyle = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 14,
  color: AppColor.txtColor,
);

