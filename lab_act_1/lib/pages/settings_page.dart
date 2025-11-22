import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int _selectedThemeIndex = 0;
  int _selectedFontIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8EAF6),
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(fontWeight: FontWeight.w300, letterSpacing: 1)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black87,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const Text(
                  'Appearance',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 20),
                // Theme Selection with Neumorphic cards
                _buildNeumorphicSection(
                  'Theme',
                  Icons.palette_outlined,
                  Column(
                    children: [
                      _buildSegmentedOption(
                        'Light',
                        Icons.wb_sunny_outlined,
                        0,
                        _selectedThemeIndex,
                        (index) => setState(() => _selectedThemeIndex = index),
                      ),
                      const SizedBox(height: 10),
                      _buildSegmentedOption(
                        'Dark',
                        Icons.nightlight_outlined,
                        1,
                        _selectedThemeIndex,
                        (index) => setState(() => _selectedThemeIndex = index),
                      ),
                      const SizedBox(height: 10),
                      _buildSegmentedOption(
                        'System',
                        Icons.settings_suggest_outlined,
                        2,
                        _selectedThemeIndex,
                        (index) => setState(() => _selectedThemeIndex = index),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                _buildNeumorphicSection(
                  'Font Size',
                  Icons.text_fields_outlined,
                  Column(
                    children: [
                      _buildSegmentedOption(
                        'Small',
                        Icons.text_decrease,
                        0,
                        _selectedFontIndex,
                        (index) => setState(() => _selectedFontIndex = index),
                      ),
                      const SizedBox(height: 10),
                      _buildSegmentedOption(
                        'Medium',
                        Icons.text_format,
                        1,
                        _selectedFontIndex,
                        (index) => setState(() => _selectedFontIndex = index),
                      ),
                      const SizedBox(height: 10),
                      _buildSegmentedOption(
                        'Large',
                        Icons.text_increase,
                        2,
                        _selectedFontIndex,
                        (index) => setState(() => _selectedFontIndex = index),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'More Options',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 20),
                _buildNeumorphicTile('Language', Icons.language_outlined, 'English'),
                const SizedBox(height: 12),
                _buildNeumorphicTile('Privacy', Icons.privacy_tip_outlined, 'Manage'),
                const SizedBox(height: 12),
                _buildNeumorphicTile('Storage', Icons.storage_outlined, '1.2 GB'),
              ],
            ),
          ),
          // Minimal Back Button
          Container(
            margin: const EdgeInsets.all(20),
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.deepPurple.shade400, Colors.purple.shade600],
                  ),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_back_ios, color: Colors.white, size: 16),
                    SizedBox(width: 5),
                    Text(
                      'BACK',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNeumorphicSection(String title, IconData icon, Widget content) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFE8EAF6),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.9),
            offset: const Offset(-6, -6),
            blurRadius: 15,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(6, 6),
            blurRadius: 15,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.deepPurple.shade400),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          content,
        ],
      ),
    );
  }

  Widget _buildSegmentedOption(
    String label,
    IconData icon,
    int index,
    int selectedIndex,
    Function(int) onTap,
  ) {
    bool isSelected = index == selectedIndex;
    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? Colors.deepPurple.shade400 : const Color(0xFFE8EAF6),
          borderRadius: BorderRadius.circular(15),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.deepPurple.withOpacity(0.3),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.7),
                    offset: const Offset(-3, -3),
                    blurRadius: 8,
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(3, 3),
                    blurRadius: 8,
                  ),
                ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.deepPurple.shade300,
              size: 20,
            ),
            const SizedBox(width: 15),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
              ),
            ),
            const Spacer(),
            if (isSelected)
              const Icon(Icons.check_circle, color: Colors.white, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildNeumorphicTile(String title, IconData icon, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFE8EAF6),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.9),
            offset: const Offset(-5, -5),
            blurRadius: 12,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(5, 5),
            blurRadius: 12,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.deepPurple.shade400),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(width: 10),
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey.shade400),
        ],
      ),
    );
  }
}
