import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:omnisuite_front_end/config/router/app_router.dart';
import 'package:omnisuite_front_end/config/router/app_router.gr.dart';
import 'package:omnisuite_front_end/services/locator.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_colors.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_typography.dart';
import 'package:omnisuite_front_end/utils/components/ui_helpers.dart';

class FeatureCardWidget extends StatefulWidget {
  const FeatureCardWidget({super.key, required this.title, required this.backgroundGif, required this.description, this.isAvailable = true,});

  final String title;
  final String backgroundGif;
  final String description;
  final bool isAvailable;

  @override
  State<FeatureCardWidget> createState() => _FeatureCardWidgetState();
}

class _FeatureCardWidgetState extends State<FeatureCardWidget> {

  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovering = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovering = false;
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: OmniSuiteColors.primary.shade1, width: 2, style: BorderStyle.solid,)
        ),
        elevation: isHovering ? 200 : 00,
        color: OmniSuiteColors.white,
        shadowColor: OmniSuiteColors.white.withOpacity(0.2),
        margin: const EdgeInsets.all(10),
        child: Container(
          width: UIHelpers.screenWidth(context) * 0.25,
          height: UIHelpers.screenHeight(context) * 0.7,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(34),
            image: DecorationImage(
              image: AssetImage(widget.backgroundGif,),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(children: [
            UIHelpers.verticalSpaceLarge,
            Text(widget.title, style: OmniSuiteTextStyle.subheadingH6.copyWith(fontWeight: FontWeight.w300, color: OmniSuiteColors.white, fontFeatures: [
              const FontFeature('smcp'),
            ],),),
            const Spacer(),
            
            Container(
              padding: const EdgeInsets.fromLTRB(05, 0, 05, 05),
              decoration: BoxDecoration(
                color: OmniSuiteColors.primary.shade1.withOpacity(0.7),
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(34), bottomRight: Radius.circular(34),),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(widget.description,
                  textAlign: TextAlign.justify,
                  style: OmniSuiteTextStyle.mediumHint.copyWith(fontWeight: FontWeight.w300, color: OmniSuiteColors.white, fontFeatures: [
                    const FontFeature('smcp'),
                  ],
                  ),
                  ),
                  IconButton(onPressed: widget.isAvailable ? () {
                    locator<AppRouter>().push(const TextModelRoute(),);
                  } : null, icon: Icon(Icons.send, color: OmniSuiteColors.hintColor,),),
                ],
              ),
            ),
          ],),
        ),
      ),
    );
  }
}