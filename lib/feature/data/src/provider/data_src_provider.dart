import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data_src.dart';

part 'data_src_provider.g.dart';

@riverpod
DataSrc dataSrc (Ref ref) {
  return DataSrc();
}