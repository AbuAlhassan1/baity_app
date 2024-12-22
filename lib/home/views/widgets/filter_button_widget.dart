import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class FilterButtonWidget extends StatelessWidget {
  const FilterButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => showMaterialModalBottomSheet(
          context: context,
          builder: (context) => Container(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              children: [
                Text("التصنيفات", style: TextStyle(color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.bold)),
                SizedBox(height: 20.sp),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // setState(() {
                        //   categoryId = index;
                        // });
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(10.sp),
                        margin: EdgeInsets.only(bottom: 10.sp),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black.withOpacity(0.1)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text("تصنيف $index", style: TextStyle(color: Colors.black, fontSize: 16.sp)),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
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
    );
  }
}