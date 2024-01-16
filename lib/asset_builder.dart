part of 'asset_flow.dart';

class AssetBuilder implements Builder {
  @override
  Future build(BuildStep buildStep) async {
    List<String> imagePaths = await getAssetPaths();

    String fileContent = _header;
    for (final path in imagePaths) {
      fileContent += returnVariableFromPath(path);
    }
    fileContent += _footer;

    final outputId = AssetId(buildStep.inputId.package, _path);

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
