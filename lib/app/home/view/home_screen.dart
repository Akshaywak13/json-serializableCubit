import 'package:erp_demo/app/home/cubit/cubit/homepage_cubit.dart';
import 'package:erp_demo/app/widgets/bottom_navbar.dart';
import 'package:erp_demo/constants/app_colors.dart';
import 'package:erp_demo/utils/routes/routes.dart';
import 'package:erp_demo/widgets/loadingIndicator.dart';
import 'package:erp_demo/widgets/sizebox_widget.dart';
import 'package:erp_demo/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double width = 0;
  bool myAnimation = false;
  bool _isShowSearch = false;
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<HomepageCubit>().getHomepage();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    context.read<HomepageCubit>().searchHomepage(_searchController.text);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: _isShowSearch
            ? AppBar(
                backgroundColor: AppColors.lightVioletColor,
                leading: BackButton(
                  color: AppColors.whiteColor,
                  onPressed: () {
                    setState(() {
                      _isShowSearch = false;
                      _searchController.clear();
                    });
                  },
                ),
                title: TextFormField(
                  autofocus: true,
                  controller: _searchController,
                  cursorColor: AppColors.whiteColor,
                  decoration: const InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 15,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.whiteColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.whiteColor),
                    ),
                  ),
                  style: const TextStyle(color: AppColors.whiteColor),
                ),
              )
            : AppBar(
                backgroundColor: AppColors.lightVioletColor,
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.search,
                            color: AppColors.whiteColor,
                            size: 27,
                          ),
                          onPressed: () {
                            setState(() {
                              _isShowSearch = true;
                            });
                          },
                        ),
                        const SizedBoxWidget(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            context.push(Routes.newPostScreen);
                          },
                          child: const Icon(
                            Icons.person_add_rounded,
                            color: AppColors.whiteColor,
                            size: 27,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
        bottomNavigationBar: const SizedBox(height: 80, child: BottomNavBarV2()),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: AppColors.lightVioletColor,
                ),
                child: TextWidget(
                  text: 'BAPU',
                  fontSize: 25,
                  color: AppColors.whiteColor,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: BlocBuilder<HomepageCubit, HomepageState>(
          builder: (context, state) {
            if (state is HomepageLoading) {
              return Center(child: loadingIndicator(AppColors.pinkColors));
            } else if (state is HomepageLoaded) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                setState(() {
                  myAnimation = true;
                });
              });
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.homeData.length,
                itemBuilder: (context, index) {
                  final home = state.homeData[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: InkWell(
                      onTap: () {
                        context.push(Routes.detailScreen, extra: home);
                      },
                      child: AnimatedContainer(
                        width: double.infinity,
                        duration: Duration(
                          milliseconds: 400 + (index * 250),
                        ),
                        curve: Curves.decelerate,
                        transform: Matrix4.translationValues(
                          myAnimation ? 0 : width,
                          0,
                          0,
                        ),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.lightVioletColor,
                              AppColors.blueColor,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                child: Text(home?.id ?? ""),
                              ),
                              TextWidget(
                                text: 'Name: ${home?.name ?? ""}',
                                fontSize: 20,
                                color: AppColors.whiteColor,
                              ),
                              TextWidget(
                                text: 'Address: ${home?.address ?? ""}',
                                fontSize: 15,
                                color: AppColors.whiteColor,
                              ),
                              TextWidget(
                                text: 'City: ${home?.city ?? ""}',
                                fontSize: 15,
                                color: AppColors.whiteColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (state is HomepageError) {
              return Center(
                child: Text(
                  state.error.toString(),
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
