import 'package:flutter/material.dart';

class MyButtonWidget extends StatelessWidget {
  //const MyButtonWidget({super.key});
  final String text;
  final Color color;
  final Function onPress;
  const MyButtonWidget({
    super.key,
    required this.text,
    required this.color,
    required this.onPress,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        color: color,
        height: 40,
        elevation: 0,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide.none,
        ),
        onPressed: () {
          onPress();
        },
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
