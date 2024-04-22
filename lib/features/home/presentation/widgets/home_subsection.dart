import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/theming/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSubsection extends StatelessWidget {
  final String sectionName;
  final List<String> ids;
  final List<String> names;
  final List<String> imagePaths;
  HomeSubsection({super.key, required this.ids, required this.names, required this.imagePaths, required this.sectionName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            children: [
              Text(sectionName,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppTheme.blueColor,
                    fontWeight: FontWeight.w600
                ),
              ),
              const Spacer(),
              Text(
                  'view more',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppTheme.blueColor,

                  )
              ),
            ],
          ),
          SizedBox(height: 16.h,),
          SizedBox(
            height: 270.h,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imagePaths.length,
              gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0,
              ),
              itemBuilder: (context, index) => Column(
                children: [
                  CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                      imagePaths[index],
                      errorListener: (p0) => Icon(Icons.error),
                    ),
                    radius: 40.r,
                  ),
                   Text(
                    names[index],
                    textAlign: TextAlign.center,
                     style: TextStyle(
                       fontSize: 14.sp,
                     ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
