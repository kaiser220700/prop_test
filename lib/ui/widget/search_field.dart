import 'package:flutter/material.dart';
import 'package:flutter_propcom_home/common/app_images.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 31,
      width: 255,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Image.asset(AppImages.icSearch, height: 17,width: 17,),
          ),
          Container(
            height: 31,
            width: 210,
            alignment: Alignment.center,
            child: const TextField(
              decoration: InputDecoration.collapsed(
                hintText: 'Tìm kiếm ...',
                hintStyle: TextStyle(
                    color: Color(0xFFA7A7A7),
                    fontSize: 14.0,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
