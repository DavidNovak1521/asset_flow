library asset_flow;

import 'dart:io';

import 'package:build/build.dart';

part 'asset_builder.dart';
part 'utils.dart';

Builder assetBuilder(BuilderOptions options) => AssetBuilder();
