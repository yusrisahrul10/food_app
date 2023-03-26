import 'package:flutter/material.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      left: 20,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xffC3211A),
            boxShadow: const [
              BoxShadow(
                offset: Offset(2, 2),
                blurRadius: 1,
                color: Color.fromARGB(82, 0, 0, 0),
              )
            ]),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 20,
          ),
          color: Colors.white,
        ),
      ),
    );
  }
}