import 'package:flutter/material.dart';
import 'package:indikhan/core/theme/app_colors.dart';
import 'package:indikhan/core/theme/app_text_styles.dart';
import 'payment_screen.dart';

class BillingScreen extends StatefulWidget {
  const BillingScreen({super.key});

  @override
  State<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.slate900,
      appBar: AppBar(
        title: Text(
          'Tagihan',
          style: AppTextStyles.h3.copyWith(color: Colors.white),
        ),
        backgroundColor: AppColors.slate900,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.filter_list_rounded,
              color: AppColors.slate400,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter Tabs
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.slate900,
              border: Border(bottom: BorderSide(color: AppColors.slate800)),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildTab('Semua', 0),
                  const SizedBox(width: 12),
                  _buildTab('Belum Bayar', 1),
                  const SizedBox(width: 12),
                  _buildTab('Lunas', 2),
                ],
              ),
            ),
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildInvoiceCard(
                  context,
                  month: 'Januari 2026',
                  amount: 'Rp 250.000',
                  dueDate: '30 Jan 2026',
                  status: 'Belum Bayar',
                  isPaid: false,
                ),
                _buildInvoiceCard(
                  context,
                  month: 'Desember 2025',
                  amount: 'Rp 250.000',
                  dueDate: '28 Des 2025',
                  status: 'Lunas',
                  isPaid: true,
                ),
                _buildInvoiceCard(
                  context,
                  month: 'November 2025',
                  amount: 'Rp 250.000',
                  dueDate: '25 Nov 2025',
                  status: 'Lunas',
                  isPaid: true,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PaymentScreen()),
          );
        },
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.payment_rounded, color: AppColors.slate900),
        label: Text(
          'Bayar',
          style: AppTextStyles.button.copyWith(color: AppColors.slate900),
        ),
      ),
    );
  }

  Widget _buildTab(String text, int index) {
    final isSelected = _selectedTab == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedTab = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.slate700,
          ),
        ),
        child: Text(
          text,
          style: AppTextStyles.bodyMedium.copyWith(
            color: isSelected ? AppColors.slate900 : AppColors.slate400,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildInvoiceCard(
    BuildContext context, {
    required String month,
    required String amount,
    required String dueDate,
    required String status,
    required bool isPaid,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.slate800,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.slate700.withValues(alpha: 0.5)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    month,
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    isPaid ? 'Dibayar: $dueDate' : 'Jatuh Tempo: $dueDate',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.slate400,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: (isPaid ? AppColors.success : AppColors.error)
                      .withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: AppTextStyles.caption.copyWith(
                    color: isPaid ? AppColors.success : AppColors.error,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                amount,
                style: AppTextStyles.h3.copyWith(color: AppColors.primary),
              ),
              Icon(Icons.chevron_right_rounded, color: AppColors.slate400),
            ],
          ),
        ],
      ),
    );
  }
}
