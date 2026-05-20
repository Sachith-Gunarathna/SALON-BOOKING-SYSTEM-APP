import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Our Artistry"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Hero(
              tag: 'gallery_$index',
              child: GestureDetector(
                onTap: () {
                  _showImageDetail(context, index);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: (index % 2 == 0) ? 200 : 280,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image_outlined,
                          size: 40,
                          color: theme.colorScheme.primary.withValues(alpha: 0.3),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Art $index",
                          style: TextStyle(
                            color: theme.colorScheme.primary.withValues(alpha: 0.3),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showImageDetail(BuildContext context, int index) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, animation, secondaryAnimation) => Scaffold(
          backgroundColor: Colors.black.withValues(alpha: 0.9),
          body: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Center(
              child: Hero(
                tag: 'gallery_$index',
                child: Container(
                  width: double.infinity,
                  height: 400,
                  color: Colors.white10,
                  child: const Center(
                    child: Icon(Icons.image, size: 100, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
