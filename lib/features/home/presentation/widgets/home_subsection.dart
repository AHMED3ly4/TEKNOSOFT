import 'package:e_commerce/core/theming/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSubsection extends StatelessWidget {
  const HomeSubsection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            children: [
              Text('Categories',
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
            height: 250.h,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 15,
              gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0,
              ),
              itemBuilder: (context, index) => Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/images/route_blue.png",

                    ),
                    radius: 40.r,
                  ),
                  const Text(
                    "men's \n fashion",
                    textAlign: TextAlign.center,
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
