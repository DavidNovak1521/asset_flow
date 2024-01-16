import 'package:asset_flow/utils.dart';
import 'package:build/build.dart';

class AssetBuilder implements Builder {
  @override
  Future build(BuildStep buildStep) async {
    List<String> imagePaths = [
      'assets/animations/coming_soon.json',
      'assets/images/logo.png',
      'assets/images/logo.svg',
    ];

    String fileContent = _header;
    for (final path in imagePaths) {
      fileContent += returnVariableFromPath(path);
    }
    fileContent += _footer;

    final outputId = AssetId('asset_flow', _path);

    await buildStep.writeAsString(outputId, fileContent);
  }

  @override
  final buildExtensions = const {
    r'$package$': [_path]
  };
}

const _path = 'lib/src/resources/assets/asset_flow.dart';

const _header = '''  
// GENERATED CODE - DO NOT MODIFY BY HAND

// ****************************************
// AssetFlow
// ****************************************

class AssetFlow {
''';

const _footer = '}\n';
