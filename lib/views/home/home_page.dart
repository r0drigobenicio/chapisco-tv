import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

import '../../core/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isShowBottomSheet = false;
  final _scaffoldStateKey = GlobalKey<ScaffoldState>();

  PersistentBottomSheetController? _bottomSheetController;

  void _showBottomSheet(bool show) {
    setState(() {
      _isShowBottomSheet = show;
    });
    
    if (_isShowBottomSheet) {
      _bottomSheetController = _scaffoldStateKey.currentState!.showBottomSheet(
        (context) => Container(
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          decoration: const BoxDecoration(
            color: AppColors.modalBackgroundColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: AppColors.blackColor,
                blurRadius: 10,
                spreadRadius: 1,
                offset: Offset(0.0, 0.5)
              )
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Os Chapiscadores Parte I',
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1
                    )
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _bottomSheetController?.close();
                      setState(() {
                        _isShowBottomSheet = !_isShowBottomSheet;
                      });
                    }, 
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      primary: AppColors.inputBackgroundColor.withOpacity(0.9),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      minimumSize: const Size.square(32),
                      padding: EdgeInsets.zero,
                    ),
                    child: const Icon(
                      PhosphorIcons.x, 
                      color: AppColors.whiteColor,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'O primeiro filme dos Chapiscadores, conta a história de Oliver Cromwell e Carlos I. No filme, são abordados os conflitos governamentais entre esses dois "cabras machos", de uma forma descontraída e bem humorada, no estilo chapiscador de ser, mas sempre com a preocupação de levar informação para o público.',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 12,
                        letterSpacing: 1,
                      ),
                      strutStyle: StrutStyle(height: 1.2)
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Ano de lançamento: 2019',
                                style: TextStyle(
                                  color: AppColors.grayColor,
                                  fontSize: 10,
                                  letterSpacing: 1
                                )
                              ),
                              SizedBox(height: 8,),
                              Text(
                                'Elenco: José Raylan, Larreurisson Lima, Rodrigo Benício, Rodrigo Cardoso',
                                style: TextStyle(
                                  color: AppColors.grayColor,
                                  fontSize: 10,
                                  letterSpacing: 1
                                ),
                                strutStyle: StrutStyle(height: 1.2)
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16,),
                        ElevatedButton(
                          onPressed: () {}, 
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<CircleBorder>(
                              const CircleBorder()
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              AppColors.whiteColor
                            ), 
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            minimumSize: MaterialStateProperty.all<Size>(
                              const Size.square(48)
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              AppColors.blackColor.withOpacity(0.2)
                            ),
                          ),
                          child: const Icon(
                            PhosphorIcons.play_fill,
                            color: AppColors.blackColor,
                            // size: 22,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        enableDrag: false,
        backgroundColor: Colors.transparent
      );
    } else {
      if (_bottomSheetController != null) _bottomSheetController?.close();
      _bottomSheetController = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    const String assetChapiscoTVLogo = 'assets/images/ChapiscoTV Logo.svg';

    final Widget chapiscoTVLogo = SvgPicture.asset(
      assetChapiscoTVLogo,
      semanticsLabel: 'Logo ChapiscoTV',
      height: 32
    );
    
    return WillPopScope(
      onWillPop: () async {
        if (_isShowBottomSheet) {
          setState(() {
            _isShowBottomSheet = !_isShowBottomSheet;
          });
        }
        
        return true;
      },
      child: Scaffold(
      key: _scaffoldStateKey,
        body: Scaffold(
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
                      pinned: false,
                      snap: true,
                      floating: true,
                      backgroundColor: AppColors.backgroundColor.withOpacity(0.9),
                      elevation: 0,
                      expandedHeight: 64,
                      collapsedHeight: 64,
                      automaticallyImplyLeading: false,
                      flexibleSpace: FlexibleSpaceBar(
                        titlePadding: EdgeInsets.zero,
                        expandedTitleScale: 1,
                        title: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16, 
                            horizontal: 24
                          ),
                          child: Row(
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
                          ),
                        ),
                      )
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: _SliverAppBarDelegate(
                        minHeight: 56,
                        maxHeight: 56,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 0, 
                            horizontal: 24
                          ),
                          width: double.infinity,
                          color: AppColors.backgroundColor.withOpacity(0.9),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {}, 
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size.zero,
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap
                                ),
                                child: const Text(
                                  'Filmes', 
                                  style: TextStyle(
                                    color: AppColors.whiteColor, 
                                    fontWeight: FontWeight.bold, 
                                    letterSpacing: 1
                                  )
                                )
                              ),
                              const SizedBox(height: 16,),
                              TextButton(
                                onPressed: () {}, 
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size.zero,
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap
                                ),
                                child: const Text(
                                  'Documentários', 
                                  style: TextStyle(
                                    color: AppColors.grayColor, 
                                    fontWeight: FontWeight.bold, 
                                    letterSpacing: 1
                                  )
                                )
                              ),
                              const SizedBox(height: 16,),
                              TextButton(
                                onPressed: () {}, 
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size.zero,
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap
                                ),
                                child: const Text(
                                  'Making Of', 
                                  style: TextStyle(
                                    color: AppColors.grayColor, 
                                    fontWeight: FontWeight.bold, 
                                    letterSpacing: 1
                                  )
                                )
                              ),
                            ],
                          ),
                        ),
                      )
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16, 
                          horizontal: 24
                        ),
                        child: Column(
                          children: [
                            InkWell(
                              splashColor: AppColors.blackColor,
                              onTap: () {
                                _showBottomSheet(!_isShowBottomSheet);
                              },
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(
                                    color: _isShowBottomSheet ? AppColors.whiteColor : Colors.transparent
                                  )
                                ),
                                margin: EdgeInsets.zero,
                                elevation: 5,
                                child: const Image(
                                  image: AssetImage('assets/images/Capa - Os Chapiscadores Parte I 1280x720.png'),
                                  fit: BoxFit.cover
                                ),
                              ),
                            ),
                            const SizedBox(height: 16,),
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                              ),
                              margin: EdgeInsets.zero,
                              elevation: 5,
                              child: const Image(
                                image: AssetImage('assets/images/Capa - Os Chapiscadores Parte I 1280x720.png'),
                                fit: BoxFit.cover
                              ),
                            ),
                            const SizedBox(height: 16,),
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                              ),
                              margin: EdgeInsets.zero,
                              elevation: 5,
                              child: const Image(
                                image: AssetImage('assets/images/Capa - Os Chapiscadores Parte I 1280x720.png'),
                                fit: BoxFit.cover
                              ),
                            ),
                            const SizedBox(height: 16,),
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                              ),
                              margin: EdgeInsets.zero,
                              elevation: 5,
                              child: const Image(
                                image: AssetImage('assets/images/Capa - Os Chapiscadores Parte I 1280x720.png'),
                                fit: BoxFit.cover
                              ),
                            ),
                            const SizedBox(height: 16,),
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                              ),
                              margin: EdgeInsets.zero,
                              elevation: 5,
                              child: const Image(
                                image: AssetImage('assets/images/Capa - Os Chapiscadores Parte I 1280x720.png'),
                                fit: BoxFit.cover
                              ),
                            ),
                            const SizedBox(height: 16,),
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                              ),
                              margin: EdgeInsets.zero,
                              elevation: 5,
                              child: const Image(
                                image: AssetImage('assets/images/Capa - Os Chapiscadores Parte I 1280x720.png'),
                                fit: BoxFit.cover
                              ),
                            ),
                            const SizedBox(height: 16,),
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                              ),
                              margin: EdgeInsets.zero,
                              elevation: 5,
                              child: const Image(
                                image: AssetImage('assets/images/Capa - Os Chapiscadores Parte I 1280x720.png'),
                                fit: BoxFit.cover
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(width: 1, color: AppColors.borderColor))
            ),
            child: BottomAppBar(
              color: AppColors.backgroundColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {}, 
                      icon: const Icon(
                        PhosphorIcons.house_fill, 
                        color: AppColors.whiteColor,
                      ),
                      tooltip: 'Início',
                    ),
                    IconButton(
                      onPressed: () {}, 
                      icon: const Icon(
                        PhosphorIcons.magnifying_glass, 
                        color: AppColors.grayColor,
                      ),
                      tooltip: 'Pesquisar',
                    ),
                    IconButton(
                      onPressed: () {}, 
                      icon: const Icon(
                        PhosphorIcons.download_simple, 
                        color: AppColors.grayColor,
                      ),
                      tooltip: 'Downloads',
                    ),
                  ]
                ),
              )
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}