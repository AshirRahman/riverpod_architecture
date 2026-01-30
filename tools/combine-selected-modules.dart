import 'dart:io';
import 'package:path/path.dart' as path; // Required for path utilities

/// combine-selected-modules.dart
///
/// Utility script for Flutter projects to combine selected modules/folders
/// - Collects .dart files from specified folders
/// - Optional: Automatically includes dependent files by following imports (recursively)
/// - Supports package:riverpod/... and relative paths
/// - Output: tools/combined-selected-modules.txt
///
/// Run: dart tools/combine-selected-modules.dart

void main() {
  print('🔄 Combining selected Flutter modules...');

  final projectRoot = Directory.current.path;
  final libRoot = '$projectRoot/lib';
  final outputFile = '$projectRoot/tools/combined-selected-modules.txt';

  // Extensions to include
  const includeExtensions = ['.dart'];

  // Set to false if you want ONLY files directly in the selected folders (no dependencies)
  const bool includeDependencies = true;

  // -------------------------------
  // Target folders/modules to combine (relative to lib/)
  // -------------------------------
  final selectedModules = [
    // Examples – add or modify as needed
    'core/services', // Only this folder (and dependencies if flag is true)
    // 'features/auth',
    // 'core',
  ];

  // Collected files (to avoid duplicates)
  final collectedFiles = <String>{};

  // Collect initial .dart files from selected folders
  void collectInitialFiles() {
    for (final module in selectedModules) {
      final dirPath = '$libRoot/$module';
      final dir = Directory(dirPath);

      if (!dir.existsSync()) {
        print('⚠️ Path does not exist: lib/$module');
        continue;
      }

      dir.listSync(recursive: true).forEach((entity) {
        if (entity is File) {
          final ext =
              entity.path.substring(entity.path.lastIndexOf('.')).toLowerCase();
          if (includeExtensions.contains(ext)) {
            collectedFiles.add(entity.absolute.path);
          }
        }
      });
    }
  }

  // Extract import paths from file content
  Set<String> extractImports(String content) {
    final imports = <String>{};
    final regExp = RegExp(r'''import\s+['"]([^'"]+)['"]\s*;''');

    for (final match in regExp.allMatches(content)) {
      final importPath = match.group(1)!;

      // Ignore external/Dart/Flutter packages
      if (importPath.startsWith('dart:') ||
          importPath.startsWith('package:flutter/') ||
          importPath.startsWith('package:riverpod') ||
          importPath.startsWith('package:go_router') ||
          importPath.startsWith('package:supabase') ||
          importPath.startsWith('package:firebase') ||
          importPath.startsWith('package:') &&
              !importPath.startsWith('package:riverpod/') ||
          !importPath.startsWith('package:riverpod/') &&
              !importPath.startsWith('../') &&
              !importPath.startsWith('./')) {
        continue;
      }

      imports.add(importPath);
    }
    return imports;
  }

  // Resolve import path to actual file path
  String? resolveImport(String importPath, String currentFileDir) {
    String candidate;

    if (importPath.startsWith('package:riverpod/')) {
      candidate =
          '$libRoot/${importPath.substring('package:riverpod/'.length)}';
    } else {
      candidate = path.normalize(path.join(currentFileDir, importPath));
    }

    if (!candidate.endsWith('.dart')) {
      candidate += '.dart';
    }

    if (File(candidate).existsSync()) return candidate;

    final indexCandidate = '$candidate/index.dart';
    if (File(indexCandidate).existsSync()) return indexCandidate;

    return null;
  }

  // Recursively collect dependencies (only if flag is true)
  void followImports() {
    if (!includeDependencies) return;

    final toProcess = List<String>.from(collectedFiles);

    while (toProcess.isNotEmpty) {
      final currentFile = toProcess.removeAt(0);
      final currentDir = path.dirname(currentFile);

      final content = File(currentFile).readAsStringSync();
      final imports = extractImports(content);

      for (final imp in imports) {
        final resolved = resolveImport(imp, currentDir);
        if (resolved != null && !collectedFiles.contains(resolved)) {
          collectedFiles.add(resolved);
          toProcess.add(resolved);
        }
      }
    }
  }

  // Main execution
  collectInitialFiles();

  if (collectedFiles.isEmpty) {
    print('❌ No files found in selected modules.');
    return;
  }

  followImports();

  // Sort and combine
  final sortedFiles = collectedFiles.toList()..sort();

  var output = '''
# Combined Selected Flutter Modules
Generated: ${DateTime.now().toIso8601String()}
Selected modules: ${selectedModules.join(', ')}
Include dependencies: $includeDependencies

''';

  for (final filePath in sortedFiles) {
    final relative = path.relative(filePath, from: projectRoot);
    print('→ $relative');

    final content = File(filePath).readAsStringSync();

    output += '''
/* ===== $relative ===== */

$content

''';
  }

  File(outputFile).writeAsStringSync(output.trim());
  print('\n✅ Combined ${sortedFiles.length} files → $outputFile');
}

/// Run: dart tools/combine-selected-modules.dart
