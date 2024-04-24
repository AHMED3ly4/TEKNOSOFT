// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:e_commerce/features/auth/data/data_source/local/auth_local_data_source.dart'
    as _i11;
import 'package:e_commerce/features/auth/data/data_source/local/auth_shared_pref_local_data_source.dart'
    as _i12;
import 'package:e_commerce/features/auth/data/data_source/remote/auth_remote_api_data_Source.dart'
    as _i4;
import 'package:e_commerce/features/auth/data/data_source/remote/auth_remote_data_source.dart'
    as _i3;
import 'package:e_commerce/features/auth/data/repository/auth_repository_imp.dart'
    as _i16;
import 'package:e_commerce/features/auth/domain/repository/auth_repository.dart'
    as _i15;
import 'package:e_commerce/features/auth/domain/use_cases/login.dart' as _i26;
import 'package:e_commerce/features/auth/domain/use_cases/register.dart'
    as _i27;
import 'package:e_commerce/features/auth/presentation/cubit/auth_cubit.dart'
    as _i36;
import 'package:e_commerce/features/cart/data/data_source/cart_api_remote_data_source.dart'
    as _i10;
import 'package:e_commerce/features/cart/data/data_source/cart_remote_data_source.dart'
    as _i9;
import 'package:e_commerce/features/cart/data/repository/cart_repository_imp.dart'
    as _i20;
import 'package:e_commerce/features/cart/domain/repository/cart_repository.dart'
    as _i19;
import 'package:e_commerce/features/cart/domain/use_cases/add_to_cart.dart'
    as _i31;
import 'package:e_commerce/features/cart/domain/use_cases/clear_cart.dart'
    as _i32;
import 'package:e_commerce/features/cart/domain/use_cases/getCart.dart' as _i33;
import 'package:e_commerce/features/cart/domain/use_cases/remove_from_cart.dart'
    as _i34;
import 'package:e_commerce/features/cart/domain/use_cases/update_product_quantity.dart'
    as _i35;
import 'package:e_commerce/features/cart/presentation/cubit/cart_cubit.dart'
    as _i37;
import 'package:e_commerce/features/favourite/data/data_sources/favourite_remote_api_data_source.dart'
    as _i8;
import 'package:e_commerce/features/favourite/data/data_sources/favourite_remote_data_source.dart'
    as _i7;
import 'package:e_commerce/features/favourite/data/repository/favourite_repository_imp.dart'
    as _i23;
import 'package:e_commerce/features/favourite/domain/repository/favourite_repository.dart'
    as _i22;
import 'package:e_commerce/features/favourite/domain/use_cases/add_to_favourite.dart'
    as _i38;
import 'package:e_commerce/features/favourite/domain/use_cases/get_favourite.dart'
    as _i39;
import 'package:e_commerce/features/favourite/domain/use_cases/remove_from_favourite.dart'
    as _i40;
import 'package:e_commerce/features/favourite/presentation/cubit/favourite_cubit.dart'
    as _i42;
import 'package:e_commerce/features/home/data/data_sources/home_api_remote_data_source.dart'
    as _i14;
import 'package:e_commerce/features/home/data/data_sources/home_remoe_data_source.dart'
    as _i13;
import 'package:e_commerce/features/home/data/repository/home_repository_imp.dart'
    as _i25;
import 'package:e_commerce/features/home/domain/repository/home_repository.dart'
    as _i24;
import 'package:e_commerce/features/home/domain/use_cases/get_brands.dart'
    as _i28;
import 'package:e_commerce/features/home/domain/use_cases/get_categories.dart'
    as _i29;
import 'package:e_commerce/features/home/presentation/cubit/home_cubit.dart'
    as _i30;
import 'package:e_commerce/features/products/data/data_source/product_api_remote_data_source.dart'
    as _i6;
import 'package:e_commerce/features/products/data/data_source/products_remote_data_source.dart'
    as _i5;
import 'package:e_commerce/features/products/data/repository/products_repository_imp.dart'
    as _i18;
import 'package:e_commerce/features/products/domain/repository/products_repository.dart'
    as _i17;
import 'package:e_commerce/features/products/domain/use_cases/getAllProducts.dart'
    as _i21;
import 'package:e_commerce/features/products/presentation/cubit/products_cubit.dart'
    as _i41;
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
    gh.singleton<_i7.FavouriteRemoteDataSource>(
        () => _i8.FavouriteRemoteAPIDataSource());
    gh.singleton<_i9.CartRemoteDataSource>(
        () => _i10.CartAPIRemoteDataSource());
    gh.singleton<_i11.AuthLocalDataSource>(
        () => _i12.AuthSharedPrefLocalDataSource());
    gh.singleton<_i13.HomeRemoteDataSource>(
        () => _i14.HomeAPIRemoteDataSource());
    gh.singleton<_i15.AuthRepository>(() => _i16.AuthRepositoryImpl(
          authRemoteDataSource: gh<_i3.AuthRemoteDataSource>(),
          authLocalDataSource: gh<_i11.AuthLocalDataSource>(),
        ));
    gh.singleton<_i17.ProductRepository>(() => _i18.ProductRepositoryImp(
        remoteDataSource: gh<_i5.ProductsRemoteDataSource>()));
    gh.singleton<_i19.CartRepository>(
        () => _i20.CartRepositoryImp(gh<_i9.CartRemoteDataSource>()));
    gh.singleton<_i21.GetAllProducts>(
        () => _i21.GetAllProducts(gh<_i17.ProductRepository>()));
    gh.singleton<_i22.FavouriteRepository>(
        () => _i23.FavouriteRepositoryImp(gh<_i7.FavouriteRemoteDataSource>()));
    gh.singleton<_i24.HomeRepository>(() => _i25.HomeRepositoryImp(
        remoteDataSource: gh<_i13.HomeRemoteDataSource>()));
    gh.singleton<_i26.Login>(
        () => _i26.Login(authRepository: gh<_i15.AuthRepository>()));
    gh.singleton<_i27.Register>(
        () => _i27.Register(authRepository: gh<_i15.AuthRepository>()));
    gh.singleton<_i28.GetBrands>(
        () => _i28.GetBrands(homeRepository: gh<_i24.HomeRepository>()));
    gh.singleton<_i29.GetCategories>(
        () => _i29.GetCategories(homeRepository: gh<_i24.HomeRepository>()));
    gh.factory<_i30.HomeCubit>(() => _i30.HomeCubit(
          gh<_i29.GetCategories>(),
          gh<_i28.GetBrands>(),
        ));
    gh.singleton<_i31.AddToCart>(
        () => _i31.AddToCart(gh<_i19.CartRepository>()));
    gh.singleton<_i32.ClearCart>(
        () => _i32.ClearCart(gh<_i19.CartRepository>()));
    gh.singleton<_i33.GetCart>(() => _i33.GetCart(gh<_i19.CartRepository>()));
    gh.singleton<_i34.RemoveFromCart>(
        () => _i34.RemoveFromCart(gh<_i19.CartRepository>()));
    gh.singleton<_i35.UpdateProductQuantity>(
        () => _i35.UpdateProductQuantity(gh<_i19.CartRepository>()));
    gh.singleton<_i36.AuthCubit>(() => _i36.AuthCubit(
          gh<_i26.Login>(),
          gh<_i27.Register>(),
        ));
    gh.factory<_i37.CartCubit>(() => _i37.CartCubit(
          gh<_i33.GetCart>(),
          gh<_i31.AddToCart>(),
          gh<_i32.ClearCart>(),
          gh<_i34.RemoveFromCart>(),
          gh<_i35.UpdateProductQuantity>(),
        ));
    gh.singleton<_i38.AddToFavourite>(
        () => _i38.AddToFavourite(gh<_i22.FavouriteRepository>()));
    gh.singleton<_i39.GetFavourite>(
        () => _i39.GetFavourite(gh<_i22.FavouriteRepository>()));
    gh.singleton<_i40.RemoveFromFavourite>(
        () => _i40.RemoveFromFavourite(gh<_i22.FavouriteRepository>()));
    gh.factory<_i41.ProductsCubit>(
        () => _i41.ProductsCubit(gh<_i21.GetAllProducts>()));
    gh.factory<_i42.FavouriteCubit>(() => _i42.FavouriteCubit(
          gh<_i39.GetFavourite>(),
          gh<_i38.AddToFavourite>(),
          gh<_i40.RemoveFromFavourite>(),
        ));
    return this;
  }
}
