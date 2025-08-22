// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_restaurants_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(FetchRestaurants)
const fetchRestaurantsProvider = FetchRestaurantsProvider._();

final class FetchRestaurantsProvider
    extends $AsyncNotifierProvider<FetchRestaurants, List<RestaurantModel>> {
  const FetchRestaurantsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchRestaurantsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchRestaurantsHash();

  @$internal
  @override
  FetchRestaurants create() => FetchRestaurants();
}

String _$fetchRestaurantsHash() => r'603249487faebadba1b8c192cfe18f59399b3b68';

abstract class _$FetchRestaurants
    extends $AsyncNotifier<List<RestaurantModel>> {
  FutureOr<List<RestaurantModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<List<RestaurantModel>>, List<RestaurantModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<RestaurantModel>>,
                List<RestaurantModel>
              >,
              AsyncValue<List<RestaurantModel>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
