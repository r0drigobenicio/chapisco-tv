import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    const String assetChapiscoTVLogo = 'assets/images/ChapiscoTV Logo.svg';

    final Widget chapiscoTVLogo = SvgPicture.asset(
      assetChapiscoTVLogo,
      semanticsLabel: 'Logo ChapiscoTV',
      height: 32
    );
    
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Gradient Background - Mobile.png'),
                fit: BoxFit.cover
              )
            ),
          ),
          SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  snap: true,
                  floating: true,
                  backgroundColor: AppColors.backgroundColor.withOpacity(0.8),
                  expandedHeight: 112,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            chapiscoTVLogo,
                            Container(
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('assets/images/jj.jpeg'),
                                  fit: BoxFit.cover
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(100)
                                ),
                                border: Border.all(
                                  color: AppColors.whiteColor,
                                  width: 1
                                ),
                              )
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}