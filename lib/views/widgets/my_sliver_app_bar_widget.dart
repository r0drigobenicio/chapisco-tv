import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

import '../../core/theme/app_colors.dart';

class MySliverAppBarWidget extends StatelessWidget {
  const MySliverAppBarWidget({
    Key? key, 
    this.pinned = false, 
    this.expandedHeight, 
    this.collapsedHeight, 
    this.flexibleSpace,
    this.hasLeading = true,
    this.title
  }) : super(key: key);

  final bool pinned;
  final double? expandedHeight;
  final double? collapsedHeight;
  final Widget? flexibleSpace;
  final bool? hasLeading;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return (
      SliverAppBar(
        pinned: pinned,
        snap: true,
        floating: true,
        backgroundColor: AppColors.backgroundColor.withOpacity(0.9),
        elevation: 0,
        expandedHeight: expandedHeight,
        collapsedHeight: collapsedHeight,
        automaticallyImplyLeading: false,
        flexibleSpace: flexibleSpace,
        leading: hasLeading == true ? Padding(
          padding: const EdgeInsets.only(left: 16),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            }, 
            icon: const Icon(PhosphorIcons.arrow_left)
          ),
        ) : null,
        title: title
      )
    );
  }
}