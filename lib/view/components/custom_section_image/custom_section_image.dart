import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import '../../../utils/app_colors/app_colors.dart';
import '../custom_netwrok_image/custom_network_image.dart';

class CustomSectionImage extends StatelessWidget {
  const CustomSectionImage(
      {super.key,
      this.fileImage,
      required this.onTap,
      required this.deleteButton,
      required this.svgImage,
      this.netWorkImage});

  final String? netWorkImage;
  final File? fileImage;
  final String svgImage;
  final VoidCallback onTap;
  final VoidCallback deleteButton;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            //  height: 200,
            child: fileImage == null && netWorkImage == null
                ? SvgPicture.asset(
                    svgImage,
                    // height: MediaQuery.sizeOf(context).height / 2,
                    //fit: BoxFit.fill,
                  )
                : fileImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.file(
                          File(fileImage!.path),
                          height: MediaQuery.sizeOf(context).height / 3,
                          //  width: MediaQuery.sizeOf(context).width,
                          //  fit: BoxFit.fill,
                        ),
                      )
                    : GestureDetector(
                        onDoubleTap: deleteButton,
                        child: CustomNetworkImage(
                          imageUrl: "netWorkImage",
                          height: MediaQuery.sizeOf(context).height / 3,
                          width: MediaQuery.sizeOf(context).height, 
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
          ),
          Positioned(
            bottom: -20,
            right: 50, 
            left: 50,
            child: CircleAvatar(
              backgroundColor: AppColors.greyGrey_50,
              child: IconButton(
                onPressed: () {
                  onTap();
                },
                icon: const Icon(
                  Icons.image,
                  color: AppColors.softlimegreen,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
