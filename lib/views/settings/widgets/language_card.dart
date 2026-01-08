import 'package:flutter/material.dart';
import 'package:foodpanda_clone/viewmodels/settings_provider.dart';
import 'package:foodpanda_clone/views/settings/widgets/language_selection_sheet.dart';
import 'package:provider/provider.dart';

class LanguageCard extends StatelessWidget {
  const LanguageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, provider, child) {
        return Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Language',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  GestureDetector(
                    onTap: () {
                      _showLanguageBottomSheet(context, provider);
                    },
                    child: const Text(
                      'Edit',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFE21B70),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                provider.language,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showLanguageBottomSheet(
    BuildContext context,
    SettingsProvider provider,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => LanguageSelectionSheet(
        currentLanguage: provider.language,
        onLanguageSelected: (language) {
          provider.changeLanguage(language);
        },
      ),
    );
  }
}
