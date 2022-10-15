import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:simple_banking/util/utils.dart';

class TransactionButton extends StatelessWidget {
  final String text;
  const TransactionButton({
    Key? key,
    required String transferUrl,
    required this.size,
    required this.text,
  })  : _transferUrl = transferUrl,
        super(key: key);

  final String _transferUrl;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            // color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(30),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Opacity(
              opacity: 0.4,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: _transferUrl,
                errorWidget: (context, url, error) => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 60,
          left: size.width * 0.36,
          child: Text(
            text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
              fontSize: SizeConfig.blockSizeHorizontal! * 4.4,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
