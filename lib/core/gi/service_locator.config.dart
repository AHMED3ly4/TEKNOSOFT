// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:e_commerce/features/auth/data/data_source/local/auth_local_data_source.dart'
    as _i9;
import 'package:e_commerce/features/auth/data/data_source/local/auth_shared_pref_local_data_source.dart'
    as _i10;
import 'package:e_commerce/features/auth/data/data_source/remote/auth_remote_api_data_Source.dart'
    as _i4;
import 'package:e_commerce/features/auth/data/data_source/remote/auth_remote_data_source.dart'
    as _i3;
import 'package:e_commerce/features/auth/data/repository/auth_repository_imp.dart'
    as _i14;
import 'package:e_commerce/features/auth/domain/repository/auth_repository.dart'
    as _i13;
import 'package:e_commerce/features/auth/domain/use_cases/login.dart' as _i22;
import 'package:e_commerce/features/auth/domain/use_cases/register.dart'
    as _i23;
import 'package:e_commerce/features/auth/presentation/cubit/auth_cubit.dart'
    as _i32;
import 'package:e_commerce/features/cart/data/data_source/cart_api_remote_data_source.dart'
    as _i8;
import 'package:e_commerce/features/cart/data/data_source/cart_remote_data_source.dart'
    as _i7;
import 'package:e_commerce/features/cart/data/repository/cart_repository_imp.dart'
    as _i18;
import 'package:e_commerce/features/cart/domain/repository/cart_repository.dart'
    as _i17;
import 'package:e_commerce/features/cart/domain/use_cases/add_to_cart.dart'
    as _i27;
import 'package:e_commerce/features/cart/domain/use_cases/clear_cart.dart'
    as _i28;
import 'package:e_commerce/features/cart/domain/use_cases/getCart.dart' as _i29;
import 'package:e_commerce/features/cart/domain/use_cases/remove_from_cart.dart'
    as _i30;
import 'package:e_commerce/features/cart/domain/use_cases/update_product_quantity.dart'
    as _i31;
import 'package:e_commerce/features/cart/presentation/cubit/cart_cubit.dart'
    as _i33;
import 'package:e_commerce/features/home/data/data_sources/home_api_remote_data_source.dart'
    as _i12;
import 'package:e_commerce/features/home/data/data_sources/home_remoe_data_source.dart'
    as _i11;
import 'package:e_commerce/features/home/data/repository/home_repository_imp.dart'
    as _i21;
import 'package:e_commerce/features/home/domain/repository/home_repository.dart'
    as _i20;
import 'package:e_commerce/features/home/domain/use_cases/get_brands.dart'
    as _i24;
import 'package:e_commerce/features/home/domain/use_cases/get_categories.dart'
    as _i25;
import 'package:e_commerce/features/home/presentation/cubit/home_cubit.dart'
    as _i26;
import 'package:e_commerce/features/products/data/data_source/product_api_remote_data_source.dart'
    as _i6;
import 'package:e_commerce/features/products/data/data_source/products_remote_data_source.dart'
    as _i5;
import 'package:e_commerce/features/products/data/repository/products_repository_imp.dart'
    as _i16;
import 'package:e_commerce/features/products/domain/repository/products_repository.dart'
    as _i15;
import 'package:e_commerce/features/products/domain/use_cases/getAllProducts.dart'
    as _i19;
import 'package:e_commerce/features/products/presentaion/cubit/products_cubit.dart'
    as _i34;
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
    gh.singleton<_i7.CartRemoteDataSource>(() => _i8.CartAPIRemoteDataSource());
    gh.singleton<_i9.AuthLocalDataSource>(
        () => _i10.AuthSharedPrefLocalDataSource());
    gh.singleton<_i11.HomeRemoteDataSource>(
        () => _i12.HomeAPIRemoteDataSource());
    gh.singleton<_i13.AuthRepository>(() => _i14.AuthRepositoryImpl(
          authRemoteDataSource: gh<_i3.AuthRemoteDataSource>(),
          authLocalDataSource: gh<_i9.AuthLocalDataSource>(),
        ));
    gh.singleton<_i15.ProductRepository>(() => _i16.ProductRepositoryImp(
        remoteDataSource: gh<_i5.ProductsRemoteDataSource>()));
    gh.singleton<_i17.CartRepository>(
        () => _i18.CartRepositoryImp(gh<_i7.CartRemoteDataSource>()));
    gh.singleton<_i19.GetAllProducts>(
        () => _i19.GetAllProducts(gh<_i15.ProductRepository>()));
    gh.singleton<_i20.HomeRepository>(() => _i21.HomeRepositoryImp(
        remoteDataSource: gh<_i11.HomeRemoteDataSource>()));
    gh.singleton<_i22.Login>(
        () => _i22.Login(authRepository: gh<_i13.AuthRepository>()));
    gh.singleton<_i23.Register>(
        () => _i23.Register(authRepository: gh<_i13.AuthRepository>()));
    gh.singleton<_i24.GetBrands>(
        () => _i24.GetBrands(homeRepository: gh<_i20.HomeRepository>()));
    gh.singleton<_i25.GetCategories>(
        () => _i25.GetCategories(homeRepository: gh<_i20.HomeRepository>()));
    gh.factory<_i26.HomeCubit>(() => _i26.HomeCubit(
          gh<_i25.GetCategories>(),
          gh<_i24.GetBrands>(),
        ));
    gh.singleton<_i27.AddToCart>(
        () => _i27.AddToCart(gh<_i17.CartRepository>()));
    gh.singleton<_i28.ClearCart>(
        () => _i28.ClearCart(gh<_i17.CartRepository>()));
    gh.singleton<_i29.GetCart>(() => _i29.GetCart(gh<_i17.CartRepository>()));
    gh.singleton<_i30.RemoveFromCart>(
        () => _i30.RemoveFromCart(gh<_i17.CartRepository>()));
    gh.singleton<_i31.UpdateProductQuantity>(
        () => _i31.UpdateProductQuantity(gh<_i17.CartRepository>()));
    gh.singleton<_i32.AuthCubit>(() => _i32.AuthCubit(
          gh<_i22.Login>(),
          gh<_i23.Register>(),
        ));
    gh.factory<_i33.CartCubit>(() => _i33.CartCubit(
          gh<_i29.GetCart>(),
          gh<_i27.AddToCart>(),
          gh<_i28.ClearCart>(),
          gh<_i30.RemoveFromCart>(),
          gh<_i31.UpdateProductQuantity>(),
        ));
    gh.factory<_i34.ProductsCubit>(
        () => _i34.ProductsCubit(gh<_i19.GetAllProducts>()));
    return this;
  }
}
