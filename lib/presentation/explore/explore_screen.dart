import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:configuration/utility/color_const.dart';
import 'package:flutter/material.dart';
import 'package:shoppbee/presentation/home/controller/home_controller.dart';
import 'package:shoppbee/presentation/shop/widget/list_product_category.dart';
import 'package:shoppbee/style/font/font_constan.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../search_screen.dart';
class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    final double itemWidth = size.width / 2;

    return GetBuilder<HomeController>(

      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
           appBar: AppBar(
             elevation: 0,
             backgroundColor: Colors.white,
             title: Text('Find Products',style: TextStyle(
               fontSize: 18.sp,
               fontFamily: FontConstant.gilroy_bold,
               color: ColorConstant.textColor

             ),),centerTitle: true,
           ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(children: [
              GestureDetector(
               onTap: ()
                {
                  controller.searchProduct('');
                  Get.to(()=>SearchScreen());
                },
                child: TextField(
                  enabled: false,
                  decoration: new InputDecoration(
                      prefixIcon: Icon(
                        Icons.search_outlined,
                        color: ColorConstant.text2,
                      ),
                      contentPadding: EdgeInsets.only(top: 8.h, left: 8.w),
                      fillColor: ColorConstant.card1,
                      filled: true,
                      constraints: BoxConstraints(maxHeight: 44.h),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.r)),
                        borderSide: BorderSide(
                            color: ColorConstant.activeColor, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.r)),
                        borderSide: BorderSide(color: Colors.white70, width: 1.0),
                      ),
                      hintText: 'Search in store',
                      hintStyle: TextStyle(fontWeight: FontWeight.w600)),
                ),
              ),
              SizedBox(height: 20.h,),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: (itemWidth / itemHeight),
                  controller:  ScrollController(keepScrollOffset: false),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: controller.listCategory.map(( value) {
                    return  GestureDetector(
                      onTap: (){
                        controller.selectListProductByCategory(value.id!);
                        Get.to(()=>ListProductCategory(title: value.name!));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: controller.getColorExplore(int.tryParse(value.id!)??0).withOpacity(0.22),
                          borderRadius: BorderRadius.all(Radius.circular(16.r)),
                          border: Border.all(color: controller.getColorExplore(int.tryParse(value.id!)??0),width: 1)
                        ),
                        margin:  EdgeInsets.all(4.0),
                        child:  Center(
                          child: Column(
                            children: [
                              SizedBox(height: 16.h,),
                              CachedNetworkImage(
                                width: 0.17.sw,
                                height: 0.1348.sh,
                                imageUrl: "https://4925-14-231-246-163.ngrok-free.app/s-cart/public${value.image}",
                                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                              ),
                              SizedBox(height: 18.h,),
                              Text('Frash Fruits & Vegetable',style: TextStyle(
                                color: ColorConstant.textColor,
                                fontFamily: FontConstant.gilroy_bold,
                                fontSize: 18.sp
                              ),textAlign: TextAlign.center,)
                            ],
                          )
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],),
          ),
        );
      }
    );
  }
}
