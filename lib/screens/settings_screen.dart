import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:book_tracking_app/providers/settings_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _controller = TextEditingController();
  bool _obscure = true;
  bool _saved = false;

  @override
  void initState() {
    super.initState();
    final current = context.read<SettingsProvider>().apiKey;
    if (current != null) {
      _controller.text = current;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Google Books API Key',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 4),
          Text(
            'Required for book search. Get a free key from the Google Cloud Console.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _controller,
            obscureText: _obscure,
            decoration: InputDecoration(
              labelText: 'API Key',
              hintText: 'AIza...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: const Icon(Icons.key),
              suffixIcon: IconButton(
                icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off),
                onPressed: () => setState(() => _obscure = !_obscure),
              ),
            ),
            onChanged: (_) {
              if (_saved) setState(() => _saved = false);
            },
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: () async {
              await context
                  .read<SettingsProvider>()
                  .setApiKey(_controller.text);
              setState(() => _saved = true);
            },
            icon: const Icon(Icons.save),
            label: const Text('Save'),
          ),
          if (_saved)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                'API key saved. Search will use it immediately.',
                style: TextStyle(color: Colors.green[700]),
              ),
            ),
        ],
      ),
    );
  }
}
