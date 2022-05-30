import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_propcom_home/common/app_images.dart';
import 'package:flutter_propcom_home/ui/widget/search_field.dart';

class AppBarWidget extends StatelessWidget {
  final double height, width;
  const AppBarWidget({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * .2,
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 40),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0, 0.88],
        colors: [Color(0xFFDD0000), Color(0xFF840000)],
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    child: CachedNetworkImage(
                      progressIndicatorBuilder: (context, _, process) {
                        return const SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.black),
                          ),
                        );
                      },
                      imageUrl:
                          "https://img4.thuthuatphanmem.vn/uploads/2020/08/07/anh-kaneki-ken-lanh-lung-vo-cam_085224041.jpg",
                      imageBuilder: (context, imageBuilder) {
                        return Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100)),
                            image: DecorationImage(
                              image: imageBuilder,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      errorWidget: (context, url, error) => Container(
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppImages.imgAvatarDefault),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Bài đăng của tôi",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                  const Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                ],
              ),
              Row(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                          height: 35,
                          width: 35,
                          child: Image.asset(AppImages.icMessage)),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          height: 17,
                          width: 17,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1890F7),
                            border: Border.all(width: 1, color: Colors.white),
                            shape: BoxShape.circle,
                          ),
                          child: const Text(
                            "99",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w300,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 5),
                  Image.asset(AppImages.icAlert),
                  const SizedBox(width: 7),
                  Image.asset(AppImages.icCheckList),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SearchField(),
              Container(
                height: 31,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xFFFF8080),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.icFliter),
                    const SizedBox(
                      width: 7,
                    ),
                    const Text("Lọc", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),),
                  ],
                ),
              ),
              Container(
                height: 31,
                width: 38,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image.asset(AppImages.icFavourite),
              )
            ],
          )
        ],
      ),
    );
  }
}
