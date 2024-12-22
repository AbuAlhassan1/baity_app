import 'dart:developer';

import 'package:baity_app/common/views/network_image_widget.dart';
import 'package:baity_app/home/models/realestate_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';

class RealestatePostWidget extends StatelessWidget {
  final RealestateItemModel item;
  const RealestatePostWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    log(item.id.toString());
    return GestureDetector(
      onTap: () => context.push("/details/${item.id}"),
      child: Container(
          padding: EdgeInsets.all(10.sp),
          margin: EdgeInsets.only(bottom: 10.sp, left: 20.sp, right: 20.sp),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black.withOpacity(0.1)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6.sp),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: NetWorkImageWidget(url: item.image!)
                ),
              ),
        
              SizedBox(height: 10.sp),
        
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Text(item.title!, style: TextStyle(color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.bold))),
                  
                  SizedBox( width: 10.sp),
        
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 2.sp),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(100.sp),
                    ),
                    child: Text(item.category!.name!, style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
              Text(item.ownerName!, style: TextStyle(color: Colors.black, fontSize: 14.sp)),
              Text(
                "${item.price} د.ع",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold
                ),
              ),
      
              Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.grey, size: 16.sp),
                      SizedBox(width: 5.sp),
                      Text(item.city!.name!, style: TextStyle(color: Colors.grey, fontSize: 14.sp)),
                    ],
                  ),
                  SizedBox(width: 10.sp),
                  Row(
                    children: [
                      Icon(Icons.aspect_ratio, color: Colors.grey, size: 16.sp),
                      SizedBox(width: 5.sp),
                      Text("${item.area} متر", style: TextStyle(color: Colors.grey, fontSize: 14.sp)),
                    ],
                  ),
                  SizedBox(width: 10.sp),
                  Row(
                    children: [
                      Icon(Icons.bed_outlined, color: Colors.grey, size: 16.sp),
                      SizedBox(width: 5.sp),
                      Text("${item.noOfBedRooms}", style: TextStyle(color: Colors.grey, fontSize: 14.sp)),
                    ],
                  ),
                  SizedBox(width: 10.sp),
                  Row(
                    children: [
                      Icon(TablerIcons.sofa, color: Colors.grey, size: 16.sp),
                      SizedBox(width: 5.sp),
                      Text("${item.noOfLivingRooms}", style: TextStyle(color: Colors.grey, fontSize: 14.sp)),
                    ],
                  ),
      
                ],
              ),
            ],
          ),
        ),
    );
  }
}