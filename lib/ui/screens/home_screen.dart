import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_propcom_home/bloc/home_cubit.dart';
import 'package:flutter_propcom_home/common/app_images.dart';
import 'package:flutter_propcom_home/model/post_type.dart';
import 'package:flutter_propcom_home/ui/widget/app_bar.dart';
import 'package:flutter_propcom_home/ui/widget/app_post.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double _screenHeight, _screenWidth;
  List<String> categories = [
    "Tất cả",
    "Mua bán",
    "Cho thuê",
    "Tài chính",
    "Xe hơi"
  ];
  late final HomeCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = HomeCubit();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _screenHeight = size.height;
    _screenWidth = size.width;
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        SizedBox(
          height: _screenHeight,
          width: _screenWidth,
        ),
        AppBarWidget(
          height: _screenHeight,
          width: _screenWidth,
        ),
        Positioned(
          top: 129,
          child: Container(
            height: _screenHeight - 129 - 90,
            width: _screenWidth,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            decoration: const BoxDecoration(
              color: Color(0xFFFAFAFA),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: BlocBuilder<HomeCubit,HomeState>(
              bloc: _cubit,
              buildWhen: (prev,cur) => prev.postType != cur.postType,
              builder: (context, state) {
                return Column(
                  children: [
                    SizedBox(
                      height: 52,
                      width: _screenWidth,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            categories.length,
                            (index) => GestureDetector(
                              onTap: () {
                                _cubit.onSlectType(PostType.values[index]);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 12),
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    color: PostType.values[index] == state.postType
                                        ? const Color(0xFFFFEEED)
                                        : const Color(0xFFF2F2F2),
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        color: PostType.values[index] == state.postType
                                            ? const Color(0xFFDD0000)
                                            : Colors.transparent)),
                                child: Text(
                                  categories[index],
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: PostType.values[index] == state.postType
                                          ? const Color(0xFFDD0000)
                                          : Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: PostType.values.length,
                        itemBuilder: (context, index) => AppPost(
                          height: _screenHeight,
                          width: _screenWidth,
                          postType: PostType.values[index],
                          title: 'fff',
                        ),
                      ),
                    )
                  ],
                );
              }
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: 90,
            width: _screenWidth,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, -5),
                    blurRadius: 6,
                    color: Color(0x00000012),
                  )
                ]),
            child: Row(
              children: [
                Column(
                  children: const [
                    GradientIcon(
                      icon: AppImages.icHome,
                      size: 50,
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFDD0000),
                            Color(0xFF840000),
                          ]),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class GradientIcon extends StatelessWidget {
  const GradientIcon({
    Key? key,
    required this.icon,
    required this.size,
    required this.gradient,
  }) : super(key: key);

  final String icon;
  final double size;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
        width: size * 1.2,
        height: size * 1.2,
        child: Image.asset(
          icon,
          color: Colors.white,
        ),
      ),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, size, size);
        return gradient.createShader(rect);
      },
    );
  }
}
