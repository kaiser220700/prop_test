import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_propcom_home/common/app_images.dart';
import 'package:flutter_propcom_home/model/post_type.dart';
import 'package:flutter_propcom_home/ui/widget/app_button.dart';
import 'package:flutter_propcom_home/ui/widget/line_dash.dart';
import 'package:flutter_propcom_home/ui/widget/property.dart';

class AppPost extends StatelessWidget {
  final double height, width;
  final PostType postType;
  final String content1, content2, content3, content4, content5, title;
  const AppPost(
      {Key? key,
      required this.height,
      required this.width,
      required this.postType,
      required this.title,
      required this.content1, 
      required this.content2,
      required this.content3,
      required this.content4,
      required this.content5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * .315,
      width: width,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              color: Colors.black.withAlpha(15),
              blurRadius: 10,
            )
          ]),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 92,
                width: width - 36,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => CachedNetworkImage(
                    imageUrl:
                        "https://www.teahub.io/photos/full/21-218810_beautiful-wallpapers-download-for-mobile-download-beautiful-images.jpg",
                    imageBuilder: (context, imageBuilder) {
                      return Container(
                        width: 150,
                        height: 90,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          image: DecorationImage(
                            image: imageBuilder,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemCount: 3,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Căn hộ chung cư quận 2",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              _buildBody(),
              const SizedBox(height: 15),
              CustomPaint(painter: LineDashedPainter()),
              Container(
                height: 57.5,
                decoration: const BoxDecoration(
                  color: Color(0xFFFAFAFA),
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                          child: CachedNetworkImage(
                            progressIndicatorBuilder: (context, _, process) {
                              return const SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.black),
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
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(100)),
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
                        const SizedBox(width: 5),
                        const Text("Kaiser Zero",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      ],
                    ),
                    Row(
                      children: const [
                        AppButton(icon: AppImages.icFavourite, text: "500"),
                        SizedBox(width: 20),
                        AppButton(icon: AppImages.icShakeHand, text: "500"),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          _buildLabel(),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return postType == PostType.TRADE
        ? Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFD6D3),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Text(
                              "Nhà phố",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFDD0000)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(
                      child: Property(
                        title: "Giá bán",
                        content: "",
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  children: const [
                    Expanded(
                      child: Property(
                        title: "Ký quỹ: ",
                        content: "",
                      ),
                    ),
                    Expanded(
                      child: Property(
                        title: "Hoa hồng: ",
                        content: "",
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  children: const [
                    Expanded(
                      child: Property(
                        title: "Ngày đăng: ",
                        content: "",
                      ),
                    ),
                    Expanded(
                      child: Property(
                        title: "Hạn bán: ",
                        content: "",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        : postType == PostType.FINANCE
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Property(
                            title: "Thời hạn vay: ",
                            content: "",
                          ),
                        ),
                        Expanded(
                          child: Property(
                            title: "Lãi suất: ",
                            content: "",
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Property(
                            title: "Hạn mức: ",
                            content: "",
                          ),
                        ),
                        Expanded(
                          child: Property(
                            title: "Ngày đăng: ",
                            content: "",
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Property(
                      title: "Thơi gian phê duyệt: ",
                      content: "",
                    ),
                  ),
                ],
              )
            : postType == PostType.RENT
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFFD6D3),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: const Text(
                                      "Nhà phố",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFDD0000)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Expanded(
                              child: Property(
                                title: "Giá thuê: ",
                                content: "",
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Row(
                          children: const [
                            Expanded(
                              child: Property(
                                title: "Phòng ngủ: ",
                                content: "",
                              ),
                            ),
                            Expanded(
                              child: Property(
                                title: "Phòng tắm: ",
                                content: "",
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Row(
                          children: const [
                            Expanded(
                              child: Property(
                                title: "Thời gian thuê: ",
                                content: "",
                              ),
                            ),
                            Expanded(
                              child: Property(
                                title: "Ngày đăng: ",
                                content: "",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFFD6D3),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: const Text(
                                      "Nhà phố",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFDD0000)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Expanded(
                              child: Property(
                                title: "Tên xe: ",
                                content: "",
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Row(
                          children: const [
                            Expanded(
                              child: Property(
                                title: "Hãng xe: ",
                                content: "",
                              ),
                            ),
                            Expanded(
                              child: Property(
                                title: "Số ghế: ",
                                content: "",
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Row(
                          children: const [
                            Expanded(
                              child: Property(
                                title: "Màu xe: ",
                                content: "",
                              ),
                            ),
                            Expanded(
                              child: Property(
                                title: "Ngày đăng: ",
                                content: "",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
  }

  Widget _buildLabel() {
    return Container(
            width: 80,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
                color: postType == PostType.TRADE 
                ?  const Color(0xFF04C35C)
                : postType == PostType.RENT 
                ? const Color(0xFF1890F7)
                : postType == PostType.FINANCE
                ? const Color(0xFF0426F5)
                : const Color(0xFFFFC224),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: postType == PostType.TRADE
             ? Row(
              children: [
                Image.asset(AppImages.icTrade),
                const SizedBox(width: 5),
                const Text(
                  "Mua Bán",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ],
            )
            : postType == PostType.RENT 
            ? Row(
              children: [
                Image.asset(AppImages.icRent),
                const SizedBox(width: 5),
                const Text(
                  "Cho thuê",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ],
            )
            : postType == PostType.FINANCE
            ? Row(
              children: [
                Image.asset(AppImages.icFinance),
                const SizedBox(width: 5),
                const Text(
                  "Tài chính",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ],
            )
            : Row(
              children: [
                Image.asset(AppImages.icCar),
                const SizedBox(width: 5),
                const Text(
                  "Xe hơi",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ],
            ),
          );
  }
}
