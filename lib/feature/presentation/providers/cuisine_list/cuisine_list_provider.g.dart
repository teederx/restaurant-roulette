// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cuisine_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(CuisineList)
const cuisineListProvider = CuisineListProvider._();

final class CuisineListProvider
    extends $NotifierProvider<CuisineList, List<CategoryModel>> {
  const CuisineListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cuisineListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cuisineListHash();

  @$internal
  @override
  CuisineList create() => CuisineList();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<CategoryModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<CategoryModel>>(value),
    );
  }
}

String _$cuisineListHash() => r'6ab67a749db05c0c58af95a7da2e88607dd1bc21';

abstract class _$CuisineList extends $Notifier<List<CategoryModel>> {
  List<CategoryModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<CategoryModel>, List<CategoryModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<CategoryModel>, List<CategoryModel>>,
              List<CategoryModel>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
