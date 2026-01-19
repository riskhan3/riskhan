import 'package:flutter/material.dart';
import 'package:indikhan/core/theme/app_colors.dart';
import 'package:indikhan/core/theme/app_text_styles.dart';
import 'package:indikhan/core/services/api_service.dart';
import 'package:indikhan/features/auth/screens/login_screen.dart';
import 'package:intl/intl.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ApiService _apiService = ApiService();
  String _name = 'Pelanggan';
  String _email = '...';
  String _phone = '...';
  String _address = '...';
  String _joinedAt = '...';

  @override
  void initState() {
    super.initState();
    _fetchProfile();
  }

  Future<void> _fetchProfile() async {
    try {
      final response = await _apiService.getProfile();
      if (response.statusCode == 200) {
        if (mounted) {
          setState(() {
            _name = response.data['name'] ?? 'Pelanggan';
            _email = response.data['email'] ?? '...';
            _phone = response.data['phone'] ?? '-';
            _address = response.data['address'] ?? '-';

            if (response.data['createdAt'] != null) {
              try {
                final date = DateTime.parse(response.data['createdAt']);
                _joinedAt = DateFormat('d MMMM yyyy').format(date);
              } catch (e) {
                _joinedAt = '-';
              }
            }
          });
        }
      }
    } catch (e) {
      // Handle error cleanly
    }
  }

  Future<void> _logout() async {
    await _apiService.logout();
    if (mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.slate900,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Profile
            Container(
              padding: const EdgeInsets.fromLTRB(24, 60, 24, 32),
              decoration: const BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  // Avatar with person icon placeholder
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppColors.slate800,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.3),
                        width: 3,
                      ),
                    ),
                    child: const Icon(
                      Icons.person_rounded,
                      size: 50,
                      color: AppColors.slate400,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(_name, style: AppTextStyles.h2Light),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'ID: #PLG-${_name.isNotEmpty ? _name.hashCode.toString().substring(0, 5) : "12345"}',
                      style: AppTextStyles.captionLight,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  _buildSectionCard(
                    title: 'Informasi Akun',
                    children: [
                      _buildInfoRow(Icons.email_outlined, 'Email', _email),
                      _buildDivider(),
                      _buildInfoRow(
                        Icons.phone_android_outlined,
                        'Telepon',
                        _phone,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  _buildSectionCard(
                    title: 'Paket Aktif',
                    children: [
                      _buildInfoRow(
                        Icons.wifi_rounded,
                        'Paket',
                        'Fiber Ultra 100 Mbps',
                      ),
                      _buildDivider(),
                      _buildInfoRow(
                        Icons.calendar_today_rounded,
                        'Aktif Sejak',
                        _joinedAt,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  _buildSectionCard(
                    title: 'Alamat Pemasangan',
                    children: [
                      _buildInfoRow(
                        Icons.location_on_outlined,
                        'Alamat',
                        _address,
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Settings Menu
                  _buildMenuItem(
                    icon: Icons.edit_outlined,
                    label: 'Edit Profil',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Icons.lock_outline,
                    label: 'Ubah Password',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Icons.notifications_outlined,
                    label: 'Notifikasi',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Icons.help_outline,
                    label: 'Bantuan',
                    onTap: () {},
                  ),

                  const SizedBox(height: 24),

                  // Logout Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton.icon(
                      onPressed: _logout,
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.error),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        foregroundColor: AppColors.error,
                      ),
                      icon: const Icon(Icons.logout_rounded),
                      label: const Text('Keluar Aplikasi'),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Versi Aplikasi 1.0.0',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.slate500,
                    ),
                  ),
                  const SizedBox(height: 80), // Bottom padding for nav
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.slate400),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.slate800,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.slate700.withValues(alpha: 0.5),
            ),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: AppColors.primary, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.slate400,
                ),
              ),
              const SizedBox(height: 2),
              Text(value, style: AppTextStyles.bodyMedium),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Divider(
        color: AppColors.slate700.withValues(alpha: 0.5),
        height: 1,
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.slate800,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.slate700.withValues(alpha: 0.5)),
      ),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.slate700.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: AppColors.slate400, size: 20),
        ),
        title: Text(label, style: AppTextStyles.bodyMedium),
        trailing: const Icon(
          Icons.chevron_right_rounded,
          color: AppColors.slate400,
        ),
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
