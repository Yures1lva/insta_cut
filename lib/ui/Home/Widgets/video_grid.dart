import 'package:flutter/material.dart';
import 'package:insta_cut/ui/Home/Models/video_part.dart';

class VideoGrid extends StatelessWidget {
  final List<VideoPart> videoParts;
  final Function(int) onVideoTap;

  const VideoGrid({
    super.key,
    required this.videoParts,
    required this.onVideoTap,
  });

  @override
  Widget build(BuildContext context) {
    if (videoParts.isEmpty) {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        alignment: Alignment.center,
        child: const Text(
          "Nenhum vídeo selecionado.",
          style: TextStyle(color: Colors.white60),
        ),
      );
    }

    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics:
          const NeverScrollableScrollPhysics(), // Evita conflitos de scroll
      itemCount: videoParts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1, // Mantém os cards quadrados
      ),
      itemBuilder: (context, index) {
        final video = videoParts[index];

        return GestureDetector(
          onTap: () => onVideoTap(video.id),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(video.thumbnail),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Positioned.fill(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(115, 83, 83, 83),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        video.isPosted
                            ? Icons.refresh
                            : Icons.cloud_upload_outlined,
                        size: 32,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        video.isPosted
                            ? "Clique para postar novamente"
                            : "Clique para postar",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
