import 'dart:io';

class UploadRequest {
  final File file;
  final String? fileName;
  final int? lifetime;

  UploadRequest({
    required this.file,
    this.fileName,
    this.lifetime = 5
  });
}