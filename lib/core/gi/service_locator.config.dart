// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:e_commerce/features/auth/data/data_source/local/auth_local_data_source.dart'
    as _i7;
import 'package:e_commerce/features/auth/data/data_source/local/auth_shared_pref_local_data_source.dart'
    as _i8;
import 'package:e_commerce/features/auth/data/data_source/remote/auth_remote_api_data_Source.dart'
    as _i4;
import 'package:e_commerce/features/auth/data/data_source/remote/auth_remote_data_source.dart'
    as _i3;
import 'package:e_commerce/features/auth/data/repository/auth_repository_imp.dart'
    as _i12;
import 'package:e_commerce/features/auth/domain/repository/auth_repository.dart'
    as _i11;
import 'package:e_commerce/features/auth/domain/use_cases/login.dart' as _i18;
import 'package:e_commerce/features/auth/domain/use_cases/register.dart'
    as _i19;
import 'package:e_commerce/features/auth/presentation/cubit/auth_cubit.dart'
    as _i23;
import 'package:e_commerce/features/home/data/data_sources/home_api_remote_data_source.dart'
    as _i10;
import 'package:e_commerce/features/home/data/data_sources/home_remoe_data_source.dart'
    as _i9;
import 'package:e_commerce/features/home/data/repository/home_repository_imp.dart'
    as _i17;
import 'package:e_commerce/features/home/domain/repository/home_repository.dart'
    as _i16;
import 'package:e_commerce/features/home/domain/use_cases/get_brands.dart'
    as _i20;
import 'package:e_commerce/features/home/domain/use_cases/get_categories.dart'
    as _i21;
import 'package:e_commerce/features/home/presentation/cubit/home_cubit.dart'
    as _i22;
import 'package:e_commerce/features/products/data/data_source/product_api_remote_data_source.dart'
    as _i6;
import 'package:e_commerce/features/products/data/data_source/products_remote_data_source.dart'
    as _i5;
import 'package:e_commerce/features/products/data/repository/products_repository_imp.dart'
    as _i14;
import 'package:e_commerce/features/products/domain/repository/products_repository.dart'
    as _i13;
import 'package:e_commerce/features/products/domain/use_cases/getAllProducts.dart'
    as _i15;
import 'package:e_commerce/features/products/presentaion/cubit/products_cubit.dart'
    as _i24;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.AuthRemoteDataSource>(() => _i4.AuthRemoteAPIDataSource());
    gh.singleton<_i5.ProductsRemoteDataSource>(
        () => _i6.ProductsAPIRemoteDataSource());
    gh.singleton<_i7.AuthLocalDataSource>(
        () => _i8.AuthSharedPrefLocalDataSource());
    gh.singleton<_i9.HomeRemoteDataSource>(
        () => _i10.HomeAPIRemoteDataSource());
    gh.singleton<_i11.AuthRepository>(() => _i12.AuthRepositoryImpl(
          authRemoteDataSource: gh<_i3.AuthRemoteDataSource>(),
          authLocalDataSource: gh<_i7.AuthLocalDataSource>(),
        ));
    gh.singleton<_i13.ProductRepository>(() => _i14.ProductRepositoryImp(
        remoteDataSource: gh<_i5.ProductsRemoteDataSource>()));
    gh.singleton<_i15.GetAllProducts>(
        () => _i15.GetAllProducts(gh<_i13.ProductRepository>()));
    gh.singleton<_i16.HomeRepository>(() => _i17.HomeRepositoryImp(
        remoteDataSource: gh<_i9.HomeRemoteDataSource>()));
    gh.singleton<_i18.Login>(
        () => _i18.Login(authRepository: gh<_i11.AuthRepository>()));
    gh.singleton<_i19.Register>(
        () => _i19.Register(authRepository: gh<_i11.AuthRepository>()));
    gh.singleton<_i20.GetBrands>(
        () => _i20.GetBrands(homeRepository: gh<_i16.HomeRepository>()));
    gh.singleton<_i21.GetCategories>(
        () => _i21.GetCategories(homeRepository: gh<_i16.HomeRepository>()));
    gh.factory<_i22.HomeCubit>(() => _i22.HomeCubit(
          gh<_i21.GetCategories>(),
          gh<_i20.GetBrands>(),
        ));
    gh.singleton<_i23.AuthCubit>(() => _i23.AuthCubit(
          gh<_i18.Login>(),
          gh<_i19.Register>(),
        ));
    gh.factory<_i24.ProductsCubit>(
        () => _i24.ProductsCubit(gh<_i15.GetAllProducts>()));
    return this;
  }
}
