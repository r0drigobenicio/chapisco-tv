import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../core/theme/app_colors.dart';
import '../../graphql/queries/read_categories_query.dart';
import '../../graphql/queries/read_videos_query.dart';
import 'widgets/category_button_widget.dart';
import 'widgets/item_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldStateKey = GlobalKey<ScaffoldState>();
  final ItemScrollController categoryItemScrollController = ItemScrollController();
  final ItemPositionsListener categoryItemPositionsListener = ItemPositionsListener.create();


  String _activeCategoryId = '';
  String _activeItemId = '';
  bool _isShowBottomSheet = false;

  PersistentBottomSheetController? _bottomSheetController;

  void _showBottomSheet(dynamic video) {
    setState(() {
      _isShowBottomSheet = true;
    });

    if (_activeItemId != video['id']) {
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
                  Flexible(
                    child: Text(
                      video['title'],
                      style: const TextStyle(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 16,),
                  ElevatedButton(
                    onPressed: () {
                      _closeBottomSheet();
                    }, 
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      primary: AppColors.modalCloseButtonColor,
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
                    Flexible(
                      child: SingleChildScrollView(
                        child: Text(
                          video['description'],
                          style: const TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 12,
                            letterSpacing: 1,
                          ),
                          strutStyle: const StrutStyle(height: 1.2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Ano de lançamento: ',
                                  style: const TextStyle(
                                    color: AppColors.grayColor,
                                    fontSize: 10,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '${video['releasedAt']}'.substring(0, 4),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.normal
                                      )
                                    )
                                  ]
                                ),
                              ),
                              const SizedBox(height: 4,),
                              RichText(
                                text: TextSpan(
                                  text: 'Elenco: ',
                                  style: const TextStyle(
                                    color: AppColors.grayColor,
                                    fontSize: 10,
                                    letterSpacing: 1,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '${video['cast']}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.normal
                                      )
                                    )
                                  ]
                                ),
                                strutStyle: const StrutStyle(height: 1.2),
                                maxLines: 2,
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
      return;
    }
  }

  void _closeBottomSheet() {
    setState(() {
      _activeItemId = '';
      _isShowBottomSheet = false;
    });

    if (_bottomSheetController != null) {
      _bottomSheetController?.close();
    }
    
    _bottomSheetController = null;
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
          _closeBottomSheet();
        }
        
        return false;
      },
      child: Scaffold(
        key: _scaffoldStateKey,
        body: GestureDetector(
          onTap: () {
            if (_isShowBottomSheet) {
              _closeBottomSheet();
            }
          },
          child: Scaffold(
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
                                Material(
                                  color: Colors.transparent,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    side: const BorderSide(
                                      color: AppColors.whiteColor
                                    )
                                  ),
                                  elevation: 5,
                                  child: Ink.image(
                                    image: const AssetImage('assets/images/jj.jpeg'),
                                    height: 32,
                                    width: 32,
                                    fit: BoxFit.cover,
                                    child: InkWell(
                                      onTap: () {},
                                    ),
                                  ),
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
                            color: AppColors.backgroundColor.withOpacity(0.9),
                            padding: const EdgeInsets.symmetric(
                              vertical: 0, 
                              horizontal: 24
                            ),
                            child: Query(
                              options: QueryOptions(
                                document: gql(readCategoriesQuery),
                                fetchPolicy: FetchPolicy.cacheAndNetwork,
                                pollInterval: const Duration(seconds: 10),
                              ),
                              builder: (QueryResult result,
                              { VoidCallback? refetch, FetchMore? fetchMore }) {
                                if (result.hasException) {
                                  return Text(result.exception.toString());
                                }

                                if (result.isLoading) {
                                  return const Text('Carregando');
                                }

                                List? categories = result.data?['categories'];

                                if (categories == null) {
                                  return const Text('Não há categorias');
                                }

                                return ScrollablePositionedList.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemScrollController: categoryItemScrollController,
                                  itemPositionsListener: categoryItemPositionsListener,
                                  itemCount: categories.length,
                                  itemBuilder: (context, index) {
                                    final category = categories[index];

                                    if (_activeCategoryId == '') {
                                      _activeCategoryId = categories[0]?['id'] ?? '';
                                    }

                                    return CategoryButtonWidget(
                                      id: category['id'] ?? '',
                                      name: category['name'] ?? '', 
                                      onPressed: () {
                                        setState(() {
                                          _activeCategoryId = category['id'] ?? '';
                                        });

                                        categoryItemScrollController.scrollTo(
                                          index: index,
                                          duration: const Duration(milliseconds: 300),
                                          curve: Curves.easeInOut
                                        );

                                        if (_isShowBottomSheet) {
                                          _closeBottomSheet();
                                        } 
                                      }, 
                                      activeCategoryId: _activeCategoryId
                                    );
                                  },
                                  separatorBuilder: (context, index) => 
                                    const SizedBox(width: 16,),
                                );
                              }
                            ),
                          )
                        )
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16, 
                            horizontal: 24
                          ),
                          child: Query(
                            options: QueryOptions(
                              document: gql(readVideosQuery),
                              fetchPolicy: FetchPolicy.cacheAndNetwork,
                              pollInterval: const Duration(seconds: 10),
                            ),
                            builder: (QueryResult result,
                            { VoidCallback? refetch, FetchMore? fetchMore }) {
                              if (result.hasException) {
                                return Text(result.exception.toString());
                              }

                              if (result.isLoading) {
                                return const Text('Carregando');
                              }

                              List? videos = result.data?['videos'];

                              if (videos == null) {
                                return const Text('Não há vídeos');
                              }

                              return ListView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount: videos.length,
                                itemBuilder: (context, index) {
                                  if (_activeCategoryId == videos[index]?['category']?['id']) {
                                    final video = videos[index];

                                    return Column(
                                      children: [
                                        ItemCardWidget(
                                          id: video['id'] ?? '',
                                          image: video['image']?['url'] ?? '',
                                          onTap: () {
                                            _showBottomSheet(video);

                                            setState(() {
                                              _activeItemId = video['id'] ?? '';
                                            });
                                          },
                                          activeItemId: _activeItemId,
                                        ),
                                        const SizedBox(height: 16,),
                                      ],
                                    );
                                  } else {
                                    return const SizedBox();
                                  }
                                }
                              );
                            }
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