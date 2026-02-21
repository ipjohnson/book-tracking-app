import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:book_tracking_app/providers/scan_provider.dart';
import 'package:book_tracking_app/providers/book_provider.dart';
import 'package:book_tracking_app/utils/constants.dart';
import 'package:book_tracking_app/screens/book_detail_screen.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final _isbnController = TextEditingController();
  MobileScannerController? _cameraController;

  @override
  void dispose() {
    _isbnController.dispose();
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan ISBN')),
      body: Consumer<ScanProvider>(
        builder: (context, scan, _) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SegmentedButton<ScanMode>(
                  segments: const [
                    ButtonSegment(
                      value: ScanMode.camera,
                      label: Text('Camera'),
                      icon: Icon(Icons.camera_alt),
                    ),
                    ButtonSegment(
                      value: ScanMode.manual,
                      label: Text('Manual'),
                      icon: Icon(Icons.keyboard),
                    ),
                  ],
                  selected: {scan.mode},
                  onSelectionChanged: (modes) {
                    scan.setMode(modes.first);
                  },
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: scan.mode == ScanMode.camera
                      ? _buildCameraView(scan)
                      : _buildManualEntry(scan),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCameraView(ScanProvider scan) {
    if (scan.state == ScanState.found && scan.scannedBook != null) {
      return _buildResult(scan);
    }

    if (scan.state == ScanState.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    _cameraController ??= MobileScannerController();

    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: MobileScanner(
              controller: _cameraController!,
              onDetect: (capture) {
                if (scan.state == ScanState.loading ||
                    scan.state == ScanState.found) {
                  return;
                }
                final barcodes = capture.barcodes;
                for (final barcode in barcodes) {
                  final value = barcode.rawValue;
                  if (value != null && _isIsbn(value)) {
                    scan.lookupIsbn(value);
                    break;
                  }
                }
              },
            ),
          ),
        ),
        if (scan.state == ScanState.notFound) ...[
          const SizedBox(height: 12),
          const Text('ISBN not found in Google Books.'),
          TextButton(
            onPressed: () => scan.reset(),
            child: const Text('Try Again'),
          ),
        ],
        if (scan.state == ScanState.error) ...[
          const SizedBox(height: 12),
          Text(scan.errorMessage ?? 'An error occurred.'),
          TextButton(
            onPressed: () => scan.reset(),
            child: const Text('Try Again'),
          ),
        ],
      ],
    );
  }

  Widget _buildManualEntry(ScanProvider scan) {
    if (scan.state == ScanState.found && scan.scannedBook != null) {
      return _buildResult(scan);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _isbnController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Enter ISBN',
            hintText: 'e.g. 9780141439518',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: const Icon(Icons.numbers),
          ),
        ),
        const SizedBox(height: 16),
        FilledButton.icon(
          onPressed: scan.state == ScanState.loading
              ? null
              : () => scan.lookupIsbn(_isbnController.text),
          icon: scan.state == ScanState.loading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.search),
          label: const Text('Look Up'),
        ),
        if (scan.state == ScanState.notFound) ...[
          const SizedBox(height: 16),
          const Text('No book found for this ISBN.'),
        ],
        if (scan.state == ScanState.error) ...[
          const SizedBox(height: 16),
          Text(scan.errorMessage ?? 'An error occurred.'),
        ],
      ],
    );
  }

  Widget _buildResult(ScanProvider scan) {
    final book = scan.scannedBook!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (book.thumbnailUrl != null)
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              book.thumbnailUrl!,
              height: 180,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const SizedBox.shrink(),
            ),
          ),
        const SizedBox(height: 12),
        Text(
          book.title,
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
        Text(
          book.authors,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.icon(
              onPressed: () async {
                final navigator = Navigator.of(context);
                final provider = context.read<BookProvider>();
                final savedBook = await provider
                    .addBook(book.copyWith(status: BookStatus.wantToRead));
                navigator.push(
                  MaterialPageRoute(
                    builder: (_) => BookDetailScreen(bookId: savedBook.id),
                  ),
                );
                scan.reset();
              },
              icon: const Icon(Icons.add),
              label: const Text('Save to Library'),
            ),
            const SizedBox(width: 12),
            OutlinedButton(
              onPressed: () {
                scan.reset();
                _isbnController.clear();
              },
              child: const Text('Scan Another'),
            ),
          ],
        ),
      ],
    );
  }

  bool _isIsbn(String value) {
    final cleaned = value.replaceAll('-', '');
    return cleaned.length == 10 || cleaned.length == 13;
  }
}
