// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoPage extends StatefulWidget {
  static const id = "InfoPage";
  Map? info;
  String? infoImage;
  InfoPage({super.key, this.info, this.infoImage});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff1d1f20),
        elevation: 0.0,
        actions: [
          Icon(Icons.more_horiz_outlined, size: 32.0.w),
          SizedBox(width: 10.w),
        ],
      ),
      body: Column(
        children: [
          //tap
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            decoration: BoxDecoration(
              color: const Color(0xff1d1f20),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.sp),
                  bottomRight: Radius.circular(40.sp)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //tap text name year
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: widget.info!['name'],
                        style: TextStyle(fontSize: 20.sp),
                      ),
                      TextSpan(
                        text: '\n ${widget.info!['year']}',
                        style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                      ),
                    ],
                  ),
                ),

                //image
                SizedBox(
                  width: 360.w,
                  height: 250.h,
                  child: Image.asset(widget.infoImage.toString()),
                )
              ],
            ),
          ),

          //bottom
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(17.sp),
                child: Text(
                  'Specifications',
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
              ),

              //info scroll
              SizedBox(
                height: 100.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    infoAll(
                      icon: Icons.speed_outlined,
                      text: '${widget.info!['speed']} km/h',
                    ),
                    infoAll(
                      icon: Icons.money_rounded,
                      text: '${widget.info!['to_100']}',
                    ),
                    infoAll(
                      icon: Icons.local_mall_outlined,
                      text: '${widget.info!['price']}\$ / day',
                    ),
                  ],
                ),
              ),
              locationText(),
              location(),
              SizedBox(height: 25.h),

              //list container
              SizedBox(
                height: 65.h,
                width: 360.w,
                child: Row(
                  children: [
                    //one expanded
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.only(left: 18.sp),
                      child: RichText(
                        text: TextSpan(children: [
                          //price
                          TextSpan(
                            text: '${widget.info!['price']}\$',
                            style: const TextStyle(
                              fontSize: 25.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const TextSpan(
                            text: '/day',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Color.fromARGB(255, 75, 74, 74),
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ]),
                      ),
                    )),

                    //two expanded
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xff1d1f20),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50.sp),
                              bottomLeft: Radius.circular(50.sp))),
                      child: Center(
                        child: Text(
                          'Get Car',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0.h,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ))
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Container location() {
    return Container(
      margin: EdgeInsets.only(left: 15.0.h),
      child: Row(children: [
        const Icon(Icons.location_on, color: Color(0xff1d1f20)),
        Text(
          ' Toshkent Yangiyo\'l',
          style: TextStyle(fontSize: 14.0.h, color: Colors.black),
        ),
      ]),
    );
  }

  Container locationText() {
    return Container(
      margin: EdgeInsets.all(17.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Location',
            style: TextStyle(
                fontSize: 20.0.h,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          Row(
            children: [
              Icon(
                Icons.sports_martial_arts,
                color: Colors.grey,
                size: 15.sp,
              ),
              Text(
                ' 763/m',
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              )
            ],
          )
        ],
      ),
    );
  }

  Container infoAll({
    required String text,
    IconData? icon,
  }) {
    return Container(
      height: 110.h,
      width: 155.h,
      margin: EdgeInsets.only(left: 7.5.sp, right: 7.5.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.sp),
        color: const Color(0xff1d1f20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 35.sp,
            color: Colors.white,
          ),
          SizedBox(height: 8.h),
          Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 15.sp),
          )
        ],
      ),
    );
  }
}
