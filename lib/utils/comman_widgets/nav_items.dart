import 'package:flutter/material.dart';
import 'package:omnisuite_front_end/utils/comman_widgets/nav_menu_tile.dart';

enum NavMenuItem {
  textModel,
  imageModel,
}

extension NavMenuItemExt on NavMenuItem {
  NavMenuTile navTiles(bool isHovered) {
    switch (this) {
      case NavMenuItem.textModel:
        return NavMenuTile(
          title: 'Text Generation',
          icon: Icons.text_fields,
          isHovered: isHovered,
        );
        case NavMenuItem.imageModel:
        return NavMenuTile(
          title: 'Image Generation',
          icon: Icons.image,
          isHovered: isHovered,
        );
    }
  }
}