// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_src_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(dataSrc)
const dataSrcProvider = DataSrcProvider._();

final class DataSrcProvider
    extends $FunctionalProvider<DataSrc, DataSrc, DataSrc>
    with $Provider<DataSrc> {
  const DataSrcProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dataSrcProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dataSrcHash();

  @$internal
  @override
  $ProviderElement<DataSrc> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DataSrc create(Ref ref) {
    return dataSrc(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DataSrc value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DataSrc>(value),
    );
  }
}

String _$dataSrcHash() => r'21c71bd32199d8b8930dc54bbe7f8c6dadf2a39f';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
