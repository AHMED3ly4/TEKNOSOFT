import 'package:e_commerce/core/gi/service_locator.dart';
import 'package:e_commerce/core/theming/app_theme.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_states.dart';
import 'package:e_commerce/features/home/presentation/widgets/home_subsection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class BrandsSection extends StatefulWidget {
  BrandsSection({super.key});

  @override
  State<BrandsSection> createState() => _BrandsSectionState();
}

class _BrandsSectionState extends State<BrandsSection> {
  final HomeCubit homeCubit = getIt.get<HomeCubit>();
  @override
  void initState() {
    super.initState();
    homeCubit.getBrands();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeCubit,
      child: BlocBuilder<HomeCubit,HomeStates>(
        builder: (context, state) {
          if(state is GetBrandsLoading){
            return SizedBox(
              height: 300,
              child: Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.white,
                child: HomeSubsection(
                  sectionName: 'Brands',
                  ids:List.generate(6, (index) => "0"),
                  names: List.generate(6, (index) => ""),
                  imagePaths: List.generate(6, (index) => "assets/images/route_blue.png"),
                ),
              ),
            );
          }
          else if(state is GetBrandsSuccess){
            final brands = state.brands;
            return HomeSubsection(
              sectionName: 'Brands',
              ids: brands.map((brand) => brand.id).toList(),
              names: brands.map((brand) => brand.name).toList(),
              imagePaths: brands.map((brand) => brand.image).toList(),
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
