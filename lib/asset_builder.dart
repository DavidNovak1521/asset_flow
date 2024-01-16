import 'package:asset_flow/utils.dart';
import 'package:build/build.dart';

class AssetBuilder implements Builder {
  @override
  Future build(BuildStep buildStep) async {
    final inputId = buildStep.inputId;
    final sourceContent = await buildStep.readAsString(inputId);

    String fileContent = _header;
    for (final path in sourceContent.split('\n')) {
      fileContent += returnVariableFromPath(path);
    }
    fileContent += _footer;

    final outputId = AssetId(inputId.package, 'lib/assets.dart');

    await buildStep.writeAsString(outputId, fileContent);
  }

  @override
  final buildExtensions = const {
    '.txt': ['.dart']
  };
}

const _header = '''  
// GENERATED CODE - DO NOT MODIFY BY HAND

// ****************************************
// AssetFlow
// ****************************************

class AssetFlow {
''';

const _footer = '}\n';
