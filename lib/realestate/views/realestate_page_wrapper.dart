import 'package:baity_app/common/views/network_image_widget.dart';
import 'package:baity_app/realestate/controllers/realestate_details/realestate_details_cubit.dart';
import 'package:baity_app/realestate/models/realestate_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class RealestatePageWrapper extends StatefulWidget {
  final String id;
  const RealestatePageWrapper({super.key, required this.id});

  @override
  State<RealestatePageWrapper> createState() => _RealestatePageWrapperState();
}

class _RealestatePageWrapperState extends State<RealestatePageWrapper> {

  @override
  void initState() {
    context.read<RealestateDetailsCubit>().getRealestateDetails(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("B  a  i  t  y"),
        centerTitle: true,
      ),
      body: BlocBuilder<RealestateDetailsCubit, RealestateDetailsState>(
        builder: (context, state) {
          if (state is RealestateDetailsInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RealestateDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RealestateDetailsError) {
            return const Center(child: CircularProgressIndicator());
           }else if (state is RealestateDetailsDone) {
            RealestateDetailsModel? realestate = context.read<RealestateDetailsCubit>().realestateDetailsModel;
            return ListView(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: CarouselSlider(
                    items: realestate!.payload!.images!.map((image) =>
                    AspectRatio(
                      aspectRatio: 1,
                      child: NetWorkImageWidget(url: image),
                    )).toList(),
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 1,
                      viewportFraction: 1,
                      enlargeCenterPage: false,
                      padEnds: false,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        realestate.payload!.title!,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      // SizedBox(height: 10.sp),
                      // Text(realestate.payload!.description!, style: const TextStyle(fontSize: 16)),
                      Row(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.grey, size: 16.sp),
                              SizedBox(width: 5.sp),
                              Text(realestate.payload!.city!.name!, style: TextStyle(color: Colors.grey, fontSize: 14.sp)),
                            ],
                          ),
                          SizedBox(width: 10.sp),
                          Row(
                            children: [
                              Icon(Icons.aspect_ratio, color: Colors.grey, size: 16.sp),
                              SizedBox(width: 5.sp),
                              Text("${realestate.payload!.area} متر", style: TextStyle(color: Colors.grey, fontSize: 14.sp)),
                            ],
                          ),
                          SizedBox(width: 10.sp),
                          Row(
                            children: [
                              Icon(Icons.bed_outlined, color: Colors.grey, size: 16.sp),
                              SizedBox(width: 5.sp),
                              Text("${realestate.payload!.noOfBedRooms}", style: TextStyle(color: Colors.grey, fontSize: 14.sp)),
                            ],
                          ),
                          SizedBox(width: 10.sp),
                          Row(
                            children: [
                              Icon(TablerIcons.sofa, color: Colors.grey, size: 16.sp),
                              SizedBox(width: 5.sp),
                              Text("${realestate.payload!.noOfLivingRooms}", style: TextStyle(color: Colors.grey, fontSize: 14.sp)),
                            ],
                          ),
                          SizedBox(width: 10.sp),
                          Row(
                            children: [
                              Icon(TablerIcons.bath, color: Colors.grey, size: 16.sp),
                              SizedBox(width: 5.sp),
                              Text("${realestate.payload!.noOfBathRooms}", style: TextStyle(color: Colors.grey, fontSize: 14.sp)),
                            ],
                          ),
              
                        ],
                      ),

                      SizedBox(height: 20.sp),
                      
                      Column(
                        children: [
                          Row(
                            children: [
                              const Expanded(child: Text("نوع العرض")),
                              Expanded(child: Text(realestate.payload!.offerType?.name == "RENT" ? "للايجار" : "للبيع"),)
                            ],
                          ),
                          Row(
                            children: [
                              const Expanded(child: Text("طريقة الدفع"),),
                              Expanded(child: Text(realestate.payload!.payType == "CASH" ? "كاش" : "قسط"),)
                            ],
                          ),
                          Row(
                            children: [
                              const Expanded(child: Text("السعر"),),
                              Expanded(child: Text(realestate.payload!.price.toString()),)
                            ],
                          ),
                          Row(
                            children: [
                              const Expanded(child: Text("صنف او نوع العقار"),),
                              Expanded(child: Text(realestate.payload!.category!.name.toString()),)
                            ],
                          ),
                          Row(
                            children: [
                              const Expanded(child: Text("نوع الملكية"),),
                              Expanded(child: Text(realestate.payload!.ownershipType.toString()),)
                            ],
                          ),
                          Row(
                            children: [
                              const Expanded(child: Text("رقم الاعلان"),),
                              Expanded(child: Text(realestate.payload!.id.toString()),)
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class NetworkImageWidget {
}