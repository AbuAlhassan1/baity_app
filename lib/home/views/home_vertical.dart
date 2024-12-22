import 'dart:developer';
import 'package:baity_app/common/controllers/master_data/master_data_cubit.dart';
import 'package:baity_app/common/models/drop_down_menu_field_obj.dart';
import 'package:baity_app/common/models/master_data/categories_model.dart';
import 'package:baity_app/common/models/master_data/cities_model.dart';
import 'package:baity_app/common/views/new_drop_down/new_drop_down.dart';
import 'package:baity_app/common/views/simple_button.dart';
import 'package:baity_app/helper/show_bottom_sheet.dart';
import 'package:baity_app/home/controllers/home/home_cubit.dart';
import 'package:baity_app/home/models/realestate_list_model.dart';
import 'package:baity_app/home/views/widgets/realestate_post_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

late DropDownMenuFieldObject<CategoryItemModel> categoriesDropDown;
late DropDownMenuFieldObject<CityItemModel> citiesDropDown;

class HomeVertical extends StatefulWidget{
  const HomeVertical({super.key});

  @override
  State<HomeVertical> createState() => _HomeVerticalState();
}

class _HomeVerticalState extends State<HomeVertical> with SingleTickerProviderStateMixin {

  static const pageSize = 20;
  String? categoryId;
  String? offerTypeId;
  String? cityId;

  final PagingController<int, RealestateItemModel> pagingController = PagingController(firstPageKey: 0);

  Future<void> fetchPage(int pageKey) async {
    try {
      List<RealestateItemModel>? newItems = await context.read<HomeCubit>().getRealestateList(
        pageKey+1,
        pageSize,
        cityId,
        categoryId,
        offerTypeId,
      );
      if( newItems == null) {
        pagingController.error = "An error occurred";
        return;
      }
      bool isLastPage = newItems.length < pageSize;
      if (isLastPage) {
        log("isLastPage: $isLastPage");
        pagingController.appendLastPage(newItems);
      } else {
        log("isLastPage: $isLastPage");
        int nextPageKey = pageKey + newItems.length;
        pagingController.appendPage(newItems, nextPageKey.round());
      }
    } catch (error) {
      log("error: $error");
      pagingController.error = error;
    }
  }

  @override
  void initState() {
    super.initState();
    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });

    categoriesDropDown = DropDownMenuFieldObject<CategoryItemModel>(
      name: "categories",
      lable: "التصنيفات",
      onSelect: (selectedItem, context) async {},
      validator: (regex, value) => null,
      valueNotifier: ValueNotifier(0),
      getData: (context) async {
        return context.read<MasterDataCubit>().categoriesModel!.payload!;
      },
    );

    citiesDropDown = DropDownMenuFieldObject<CityItemModel>(
      name: "cities",
      lable: "المدينة",
      onSelect: (selectedItem, context) async {},
      validator: (regex, value) => null,
      valueNotifier: ValueNotifier(0),
      getData: (context) async {
        log( context.read<MasterDataCubit>().citiesModel!.payload!.toString() );
        return context.read<MasterDataCubit>().citiesModel!.payload!;
      },
    );
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => Future.sync(() => pagingController.refresh()),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 80.sp,
              collapsedHeight: 80.sp,
              floating: true,
              pinned: true,
              flexibleSpace: SafeArea(
                child: Column(
                  children: [
                    Text("B  a  i  t  y", style: TextStyle(color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15.sp),
                    InkWell(
                      onTap: () => showBottomSheeet(
                        context,
                        Container(
                          margin: EdgeInsets.only(top: 100.sp),
                          padding: EdgeInsets.only(top: 20.sp, left: 20.sp, right: 20.sp),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20.sp), topRight: Radius.circular(20.sp))
                          ),
                          child: Column(
                            children: [

                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("F i l t e r")
                                ],
                              ),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(child: DropDownMenuWithSearch2(fieldObject: categoriesDropDown)),
                                  SizedBox(width: 10.sp),
                                  Padding(
                                    padding: EdgeInsets.only(top: 15.sp),
                                    child: IconButton(
                                      icon: const Icon(TablerIcons.trash),
                                      onPressed: (){
                                        categoriesDropDown.selectedItem = null;
                                        categoryId = null;
                                        categoriesDropDown.controller.clear();
                                      },
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 20.sp),

                              
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(child: DropDownMenuWithSearch2(fieldObject: citiesDropDown),),
                                  SizedBox(width: 10.sp),
                                  Padding(
                                    padding: EdgeInsets.only(top: 15.sp),
                                    child: IconButton(
                                      icon: const Icon(TablerIcons.trash),
                                      onPressed: (){
                                        citiesDropDown.selectedItem = null;
                                        cityId = null;
                                        citiesDropDown.controller.clear();
                                      },
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 20.sp),

                              SimpleButton(
                                text: "تطبيق",
                                onTap: () {
                                  categoryId = categoriesDropDown.selectedItem?.id;
                                  cityId = citiesDropDown.selectedItem?.id;
                                  if( categoryId != null || cityId != null) {
                                    pagingController.refresh();
                                  }
                                  Navigator.pop(context);
                                },
                              )

                            ],
                          ),
                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(TablerIcons.category, color: Colors.grey, size: 20.sp),
                              SizedBox(width: 5.sp),
                              Text("التصنيفات", style: TextStyle(color: Colors.black, fontSize: 16.sp)),
                            ],
                          ),
                          SizedBox(width: 10.sp),
                          Row(
                            children: [
                              Icon(Icons.place, color: Colors.grey, size: 20.sp),
                              SizedBox(width: 5.sp),
                              Text("المدينة", style: TextStyle(color: Colors.black, fontSize: 16.sp)),
                            ],
                          ),
                          SizedBox(width: 10.sp),
                          Row(
                            children: [
                              Icon(TablerIcons.moneybag, color: Colors.grey, size: 20.sp),
                              SizedBox(width: 5.sp),
                              Text("نوع العرض", style: TextStyle(color: Colors.black, fontSize: 16.sp)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20.sp)),
            PagedSliverList<int, RealestateItemModel>(
              pagingController: pagingController,
              builderDelegate: PagedChildBuilderDelegate<RealestateItemModel>(
                itemBuilder: (context, item, index) {
                  return RealestatePostWidget(item: item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}