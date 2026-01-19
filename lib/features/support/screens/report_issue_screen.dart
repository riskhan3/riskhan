import 'package:flutter/material.dart';
import 'package:indikhan/core/theme/app_colors.dart';
import 'package:indikhan/core/theme/app_text_styles.dart';
import 'package:indikhan/core/widgets/buttons/custom_buttons.dart';

class ReportIssueScreen extends StatefulWidget {
  const ReportIssueScreen({super.key});

  @override
  State<ReportIssueScreen> createState() => _ReportIssueScreenState();
}

class _ReportIssueScreenState extends State<ReportIssueScreen> {
  String? _selectedCategory;
  final List<String> _categories = [
    'Internet Lambat',
    'Kabel Putus',
    'Modem Rusak/Mati Lampu',
    'Tidak Bisa Konek',
    'Lainnya',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pusat Bantuan',
          style: AppTextStyles.h3.copyWith(color: Colors.white),
        ),
        backgroundColor: AppColors.accent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.history_rounded, color: Colors.white),
            onPressed: () {}, // Navigate to history
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Laporkan Gangguan', style: AppTextStyles.h2),
              const SizedBox(height: 8),
              Text(
                'Tim teknis kami akan segera membantu Anda.',
                style: AppTextStyles.body.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 32),

              // Category Dropdown
              Text(
                'Jenis Gangguan',
                style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.textSecondary.withOpacity(0.3),
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: _selectedCategory,
                    hint: Text(
                      'Pilih Masalah',
                      style: AppTextStyles.body.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    icon: const Icon(Icons.keyboard_arrow_down_rounded),
                    items: _categories.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: AppTextStyles.body),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedCategory = newValue;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Description Area
              Text(
                'Deskripsi Masalah',
                style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              TextFormField(
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Jelaskan detail kendala yang Anda alami...',
                  hintStyle: AppTextStyles.body.copyWith(
                    color: AppColors.textSecondary.withOpacity(0.5),
                  ),
                  filled: true,
                  fillColor: AppColors.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.textSecondary.withOpacity(0.3),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),
              PrimaryButton(
                text: 'Kirim Laporan',
                icon: Icons.send_rounded,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Laporan Berhasil Dikirim!')),
                  );
                },
              ),

              const SizedBox(height: 40),

              // Recent Tickets Section
              Row(
                children: [
                  const Icon(
                    Icons.history_edu_rounded,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: 8),
                  Text('Riwayat Laporan Terakhir', style: AppTextStyles.h3),
                ],
              ),
              const SizedBox(height: 16),
              _buildTicketCard(
                id: '#TKT-001234',
                issue: 'Internet sangat lambat sejak pagi',
                status: 'Open',
                date: '20 Okt 2023, 10:30',
                statusColor: AppColors.warning,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTicketCard({
    required String id,
    required String issue,
    required String status,
    required String date,
    required Color statusColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.textSecondary.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
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
              Text(
                id,
                style: AppTextStyles.caption.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  status,
                  style: AppTextStyles.caption.copyWith(
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            issue,
            style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Text(date, style: AppTextStyles.caption),
        ],
      ),
    );
  }
}
