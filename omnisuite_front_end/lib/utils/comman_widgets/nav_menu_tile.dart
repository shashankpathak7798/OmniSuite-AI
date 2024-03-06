import 'package:flutter/material.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_colors.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_typography.dart';

class NavMenuTile extends StatefulWidget {
  const NavMenuTile({super.key, required this.isHovered, required this.icon, required this.title,});

  final bool isHovered;
  final IconData icon;
  final String title;

  @override
  State<NavMenuTile> createState() => _NavMenuTileState();
}

class _NavMenuTileState extends State<NavMenuTile> {
  bool isHoveredTile = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,),
      child: MouseRegion(
        onHover: (_) {
          setState(() {
            isHoveredTile = true;
          });
        },
        onEnter: (_) {
          setState(() {
            isHoveredTile = true;
          });
        },
        onExit: (_) {
          setState(() {
            isHoveredTile = false;
          });
        },
        child: InkWell(
          onTap: () {
            
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon, color: isHoveredTile ? OmniSuiteColors.white : OmniSuiteColors.hintColor,),
              if(widget.isHovered) ...[
                const SizedBox(width: 10,),
                Expanded(child: Text(widget.title,
                maxLines: 1,
                style: OmniSuiteTextStyle.normal,),),
              ]
            ],
          ),
        ),
      ),
    );
  }
}