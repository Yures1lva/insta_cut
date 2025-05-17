import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class SelectButton extends StatefulWidget {
  final String label;
  final Function(File) onVideoSelected;

  const SelectButton({
    required this.label,
    required this.onVideoSelected,
    super.key,
  });

  @override
  State<SelectButton> createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {
  File? _selectedVideo;
  VideoPlayerController? _controller;

  Future<void> _pickVideo() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);

    if (pickedFile != null) {
      final videoFile = File(pickedFile.path);
      setState(() {
        _selectedVideo = videoFile;
      });

      widget.onVideoSelected(videoFile); // Callback para o widget pai

      // Se quiser ver o vídeo, você pode descomentar essa parte
      // _controller = VideoPlayerController.file(videoFile)
      //   ..initialize().then((_) {
      //     setState(() {});
      //     _controller!.play();
      //   });
    } else {
      debugPrint("Nenhum vídeo selecionado.");
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          end: Alignment.topLeft,
          begin: Alignment.bottomRight,
          colors: [
            Color(0xFFD92AB2),
            Color(0xFFF93392),
            Color(0xFFFF367C),
            Color(0xFFFE2087),
            Color(0xFFFF4C61),
            Color(0xFFF72440),
            Color(0xFFFF8704),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ElevatedButton(
        onPressed: _pickVideo,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        ),
        child: Text(
          widget.label,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
