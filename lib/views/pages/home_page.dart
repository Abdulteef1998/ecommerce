import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerece/view_models/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/app_colors.dart';
import '../widgets/category_tab_view.dart';
import '../widgets/home_tab_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = HomeCubit();
        cubit.getHomeData();
        return cubit;
      },
      child: Scaffold(
          body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: CachedNetworkImageProvider(
                            'https://pbs.twimg.com/profile_images/1493704582505144323/Stvh3FSK_400x400.jpg'),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tarek Alabd',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Text(
                            'Let\'s go shopping!',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  color: Colors.grey,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.notifications))
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              TabBar(
                  controller: _tabController,
                  unselectedLabelColor: AppColors.grey,
                  tabs: const [
                    Tab(
                      text: 'Home',
                    ),
                    Tab(
                      text: 'Category',
                    )
                  ]),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                child: TabBarView(
                    controller: _tabController,
                    children: [HomeTabView(), CategoryTabView()]),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
