import 'package:e_commerce/core/gi/service_locator.dart';
import 'package:e_commerce/core/theming/app_theme.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_states.dart';
import 'package:e_commerce/features/home/presentation/widgets/home_subsection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesSection extends StatefulWidget {
  CategoriesSection({super.key});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  final HomeCubit homeCubit = getIt.get<HomeCubit>();
  @override
  void initState() {
    super.initState();
    homeCubit.getCategories();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => homeCubit,
      child: BlocBuilder<HomeCubit,HomeStates>(
          builder: (context, state) {
            if(state is GetCategoriesLoading){
              return SizedBox(
                height: 300,
                child: Shimmer.fromColors(
                    child: HomeSubsection(
                      sectionName: 'Categories',
                      ids:List.generate(6, (index) => "men"),
                      names: List.generate(6, (index) => ""),
                      imagePaths: List.generate(6, (index) => "assets/images/route_blue.png"),
                    ),
                    baseColor: Colors.grey,
                    highlightColor: Colors.white,
                ),
              );
            }
            else if(state is GetCategoriesSuccess){
              final categories = state.categories;
              return HomeSubsection(
                sectionName: 'Categories',
                  ids: categories.map((category) => category.id).toList(),
                  names: categories.map((category) => category.name).toList(),
                  imagePaths: categories.map((category) => category.image).toList(),
              );
            }
            else if(state is GetCategoriesError){
              return const Icon(Icons.error);
            }
            return const SizedBox();
          },
      ),
    );
  }
}
