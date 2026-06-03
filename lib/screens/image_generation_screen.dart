import 'package:flutter/material.dart';

class ImageGenerationScreen extends StatefulWidget {
  const ImageGenerationScreen({super.key});

  @override
  State<ImageGenerationScreen> createState() => _ImageGenerationScreenState();
}

class _ImageGenerationScreenState extends State<ImageGenerationScreen> {
  final promptController = TextEditingController();
  final styles = ['Realistic', 'Anime', 'Cartoon', '3D', 'Sketch'];
  String selectedStyle = 'Realistic';
  String result = '';

  void generate() {
    setState(() {
      result = promptController.text.trim();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Image Generation')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Prompt',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: promptController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Describe your image',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Style',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: styles.length,
              itemBuilder: (context, index) {
                final style = styles[index];
                final selected = style == selectedStyle;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedStyle = style;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: selected ? Colors.blue : Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      style,
                      style: TextStyle(
                        color: selected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: generate,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('Generate'),
          ),
          const SizedBox(height: 24),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: result.isEmpty
                  ? const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.image, size: 80, color: Colors.grey),
                        SizedBox(height: 8),
                        Text('Image preview',
                            style: TextStyle(color: Colors.grey)),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/images/treez_enterprise_logo.jpeg',
                            height: 160,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text('$selectedStyle: $result'),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
