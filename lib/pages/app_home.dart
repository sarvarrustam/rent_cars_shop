import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_cars_shop/data/cars_cats.dart';
import 'package:rent_cars_shop/data/logo_data.dart';
import 'package:rent_cars_shop/images/image_data.dart';
import 'package:rent_cars_shop/pages/app_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tap = 0;

  void changePress(int index) {
    tap = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 35.h),
            searchBar(),
            SizedBox(height: 10.h),
            brandText(),
            builderBarCarsLogo(),
            avilableCars(),
            SizedBox(
              width: 500.w,
              height: 390.h,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  // 1
                  mainContainer(
                    index: 0,
                    onPresend: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InfoPage(
                            info: Cars[tap][0],
                            infoImage: imageAssets[tap][0],
                          ),
                        ),
                      );
                    },
                  ),

                  // 2
                  mainContainer(
                    index: 1,
                    onPresend: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InfoPage(
                            info: Cars[tap][1],
                            infoImage: imageAssets[tap][1],
                          ),
                        ),
                      );
                    },
                  ),

                  // 3
                  mainContainer(
                    index: 2,
                    onPresend: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InfoPage(
                            info: Cars[tap][2],
                            infoImage: imageAssets[tap][2],
                          ),
                        ),
                      );
                    },
                  ),

                  // 4
                  mainContainer(
                    onPresend: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InfoPage(
                            info: Cars[tap][3],
                            infoImage: imageAssets[tap][3],
                          ),
                        ),
                      );
                    },
                    index: 3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stack mainContainer(
      {required int index, required GestureTapCallback onPresend}) {
    return Stack(
      children: [
        SizedBox(
          height: 150.h,
          width: 420.w,
        ),

        //
        Positioned(
          top: 25.sp,
          child: Container(
            padding: EdgeInsets.all(14.sp),
            decoration: BoxDecoration(
                color: const Color(0xffF2F2F3),
                borderRadius: BorderRadius.circular(27.sp)),
            width: 340.w,
            height: 130.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // name
                Text(
                  Cars[tap][index]['name'],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                //year
                Text(
                  Cars[tap][index]['year'],
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 17.h),

                //row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //price
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '\n ${Cars[tap][index]['price']}\$',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: "/day",
                            style: TextStyle(
                                color: const Color.fromARGB(255, 72, 70, 70),
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),

                    //jump to the info page
                    GestureDetector(
                      onTap: onPresend,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 5.0,
                              offset: Offset(5.0, 4.0),
                              color: Colors.grey,
                            )
                          ],
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20.sp),
                          ),
                        ),
                        width: 100.w,
                        height: 37.h,
                        child: Center(
                          child: Text(
                            'details',
                            style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
            top: -12.sp,
            width: 190.w,
            height: 155.h,
            child: Image.asset('${imageAssets[tap][index]}'))
      ],
    );
  }

  Widget avilableCars() {
    return Container(
      width: 360.w,
      height: 59.h,
      margin: EdgeInsets.only(right: 15.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(8.sp),
            child: Text(
              'Avilable cars',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Icon(Icons.sell_outlined, size: 22.sp)
        ],
      ),
    );
  }

  Container builderBarCarsLogo() {
    return Container(
      height: 103.h,
      padding: EdgeInsets.symmetric(vertical: 7.h),
      child: ListView.builder(
          itemCount: Cars.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (contex, index) {
            return GestureDetector(
              onTap: () {
                changePress(index);
              },
              child: Container(
                width: 70.w,
                height: 70.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.sp),
                  color: const Color(0xffF2F2F3),

                  //box shadow
                  boxShadow: [
                    tap == index
                        ? const BoxShadow(
                            blurRadius: 5,
                            offset: Offset(7, 5),
                            color: Colors.grey)
                        : const BoxShadow(blurRadius: 7, color: Colors.grey),
                  ],

                  //border Setting
                  border: tap == index
                      ? Border.all(width: 2.0, color: Colors.black)
                      : const Border(),
                ),

                //padding setting
                padding:
                    tap == index ? EdgeInsets.all(8.sp) : EdgeInsets.all(13.sp),

                //margin
                margin: EdgeInsets.only(
                  bottom: 7.sp,
                  right: 22.sp,
                  left: 6.sp,
                  top: 17.sp,
                ),

                //image
                child: Image(image: AssetImage(imageI[index])),
              ),
            );
          }),
    );
  }

  Container brandText() {
    return Container(
      padding: EdgeInsets.only(left: 5.w),
      child: Text(
        'Brands',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.sp),
      ),
    );
  }

  Widget searchBar() {
    return SizedBox(
      width: 343.w,
      height: 70.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //text Bar
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: 'Choose ',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.sp)),
            TextSpan(
                text: 'a Cars',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.sp,
                    color: Colors.black))
          ])),

          IconButton(
              splashColor: Colors.white,
              highlightColor: Colors.white,
              onPressed: (() {}),
              icon: Icon(
                Icons.manage_search_outlined,
                size: 25.sp,
              ))
        ],
      ),
    );
  }
}
