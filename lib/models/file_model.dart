class FileModel {
  final String file;

  FileModel({required this.file});

  factory FileModel.fromJson(Map<String, dynamic> json) {
    return FileModel(
      file: json['file'] as String,  
    );
  }
}
