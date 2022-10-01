import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:crypto_ui/core/enums/e_file_type.dart';

class InRowButton extends StatelessWidget {
  const InRowButton({
    Key? key,
    required this.title,
    required this.fileType,
    this.iconData,
    this.imagePath,
  })  : assert(fileType == eFileType.Icon && iconData != null ||
            fileType == eFileType.Image && imagePath != null),
        super(key: key);

  final String title;
  final eFileType fileType;
  final IconData? iconData;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            print(title);
          },
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.4),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: fileType == eFileType.Icon
                ? Icon(
                    iconData,
                    size: 24,
                    color: Colors.white,
                  )
                : Image.asset(
                    imagePath!,
                    width: 24,
                    height: 24,
                    fit: BoxFit.contain,
                  ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(title,
            style: GoogleFonts.manrope(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              height: 24 / 14,
              color: Colors.white,
            )),
      ],
    );
  }
}
