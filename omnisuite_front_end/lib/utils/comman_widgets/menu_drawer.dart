import 'package:flutter/material.dart';
import 'package:omnisuite_front_end/utils/comman_widgets/nav_items.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_colors.dart';
import 'package:omnisuite_front_end/utils/components/ui_helpers.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key, required this.body,});

  final Widget body;

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  double width = 80;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MouseRegion(
          onEnter: (event) => setState(() {
            width = 250;
          }),
          onExit: (event) => setState(() {
            width = 80;
          }),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300,),
            color: OmniSuiteColors.primary.shade1,
            width: width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 05,),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: OmniSuiteColors.primary.shade1,
                      border: Border.all(color: OmniSuiteColors.white, width: 2,),
                    ),
                    width: width,
                    height: 80,
                  ),
                 UIHelpers.verticalSpaceTiny,
                  const Divider(),
                  UIHelpers.horizontalSpaceTiny,
                  ...NavMenuItem.values.map((e) => e.navTiles(width == 250 ? true : false,),).toList(),
                               
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: widget.body,
        ),
      ],
    );
  }
}