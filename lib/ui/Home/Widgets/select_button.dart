import 'package:flutter/material.dart';

class SelectButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const SelectButton({required this.label, required this.onTap});

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
        onPressed: onTap,
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
          label,
          style: const TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
