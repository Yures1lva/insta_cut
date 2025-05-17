import 'package:flutter/material.dart';
import 'package:insta_cut/ui/Home/Models/video_part.dart';

class VideoGrid extends StatelessWidget {
  final List<VideoPart> videoParts;
  final Function(int) onVideoTap;

  const VideoGrid({required this.videoParts, required this.onVideoTap});

  @override
  Widget build(BuildContext context) {
    if (videoParts.isEmpty) {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Center(
            child: Text("Nenhum vídeo selecionado.",
                style: TextStyle(color: Colors.white60))),
      );
    }

    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: videoParts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
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
                      image: NetworkImage(video.thumbnail), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Positioned.fill(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(video.isPosted ? Icons.refresh : Icons.cloud_upload,
                          size: 32, color: Colors.white),
                      const SizedBox(height: 4),
                      Text(
                        video.isPosted
                            ? "Clique para postar novamente"
                            : "Clique para postar",
                        style: TextStyle(fontSize: 12, color: Colors.white),
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
