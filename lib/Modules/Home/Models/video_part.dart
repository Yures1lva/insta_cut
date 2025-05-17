class VideoPart {
  final int id;
  final bool isPosted;
  final String thumbnail;

  VideoPart(
      {required this.id, required this.isPosted, required this.thumbnail});

  VideoPart copyWith({int? id, bool? isPosted, String? thumbnail}) {
    return VideoPart(
      id: id ?? this.id,
      isPosted: isPosted ?? this.isPosted,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }
}
