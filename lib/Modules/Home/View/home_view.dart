import 'package:flutter/material.dart';
import 'package:insta_cut/Modules/Home/Models/video_part.dart';
import 'package:insta_cut/Modules/Home/Widgets/select_button.dart';
import '../widgets/video_grid.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<VideoPart> videoParts = [];

  void handleVideoSelected() {
    // Simulação: vamos adicionar 4 vídeos fakes
    setState(() {
      videoParts = List.generate(
        4,
        (index) => VideoPart(
          id: index,
          isPosted: false,
          thumbnail: 'https://via.placeholder.com/150', // imagem fictícia
        ),
      );
    });
  }

  void togglePostStatus(int id) {
    setState(() {
      videoParts = videoParts.map((video) {
        if (video.id == id) {
          return video.copyWith(isPosted: !video.isPosted);
        }
        return video;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Corte. Poste.\nSimples assim",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              SelectButton(
                label: videoParts.isEmpty
                    ? "Selecione um vídeo"
                    : "Selecionar novamente",
                onTap: handleVideoSelected,
              ),
              const SizedBox(height: 20),
              Expanded(
                  child: VideoGrid(
                      videoParts: videoParts, onVideoTap: togglePostStatus)),
              const SizedBox(height: 16),
              Text.rich(
                TextSpan(
                  text: "Para os ",
                  style: TextStyle(color: Colors.white54),
                  children: [
                    TextSpan(
                        text: "Androids ",
                        style: TextStyle(color: Colors.greenAccent)),
                    TextSpan(text: "que o Instagram esqueceu."),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
