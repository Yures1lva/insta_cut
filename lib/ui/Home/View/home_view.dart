import 'dart:io';

import 'package:flutter/material.dart';
import 'package:insta_cut/ui/Home/Models/video_part.dart';
import 'package:insta_cut/ui/Home/Widgets/select_button.dart';
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
          thumbnail: 'lib/assets/imgs/logo.png',
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

  void _handleVideoSelected(File video) {
    // Aqui você chama o corte ou qualquer outra lógica depois
    print('Vídeo selecionado: ${video.path}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Corte. Poste.\nSimples assim",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 20),
              SelectButton(
                label: videoParts.isEmpty
                    ? "Selecione um vídeo"
                    : "Selecionar novamente",
                onVideoSelected: _handleVideoSelected,
              ),
              const SizedBox(height: 20),
              Expanded(
                  child: VideoGrid(
                videoParts: videoParts,
                onVideoTap: togglePostStatus,
              )),
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
