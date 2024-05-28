import 'package:flutter/material.dart';

import '../../../../core/helpers/helpers.dart';
import '../../data/remote/artwork.dart';

class ArtworkCard extends StatelessWidget {
  final Artwork artwork;
  final Function(int) onPressed;
  const ArtworkCard({
    super.key,
    required this.artwork,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (artwork.imageId != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Hero(
                    tag: artwork.id,
                    child: Image.network(
                      Helpers.getArtworkImageUrl(artwork.imageId!),
                      semanticLabel: artwork.thumbnail?.altText ?? "",
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsets.only(
                    left: 12,
                    right: 12,
                    top: 8,
                    bottom: artwork.artistTitle != null ? 0 : 8),
                child: Text("${artwork.title}, ${artwork.dateDisplay}"),
              ),
              if (artwork.artistTitle != null)
                Padding(
                  padding:
                      const EdgeInsets.only(left: 12, right: 12, bottom: 8),
                  child: Text(
                    artwork.artistTitle ?? "",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => onPressed(artwork.id),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
