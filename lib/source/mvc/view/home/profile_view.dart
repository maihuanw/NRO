import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Thông Tin Tài Khoản',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Account Information Section
            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildInfoRow('Tên Đăng Nhập', 'maihuan'),
                  SizedBox(height: 16),
                  _buildInfoRow('Địa Chỉ E-Mail', 's7huan37@gmail.com'),
                  SizedBox(height: 16),
                  _buildInfoRow('Ngày Đăng Ký', '2025-09-23 11:25:16'),
                  SizedBox(height: 16),
                  _buildInfoRow('Ngày Cập Nhật', '2025-09-24 10:33:04'),
                  SizedBox(height: 16),
                  _buildInfoRow('Số Tiền Hiện Có', '0 ₫'),
                  SizedBox(height: 16),
                  _buildInfoRow('Tổng Tiền Đã Nạp', '0 ₫'),
                ],
              ),
            ),

            // Change Password Section
            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thay Đổi Mật Khẩu',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Current Password
                  _buildPasswordField(
                    'Mật Khẩu Cũ',
                    'Nhập mật khẩu cũ',
                    _currentPasswordController,
                  ),
                  SizedBox(height: 16),

                  // New Password
                  _buildPasswordField(
                    'Mật Khẩu Mới',
                    'Nhập mật khẩu mới',
                    _newPasswordController,
                  ),
                  SizedBox(height: 16),

                  // Confirm Password
                  _buildPasswordField(
                    'Xác Nhận Mật Khẩu',
                    'Nhập lại mật khẩu mới',
                    _confirmPasswordController,
                  ),
                  SizedBox(height: 24),

                  // Change Password Button
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        _handleChangePassword();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF4A5A4A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Đổi Mật Khẩu',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 15,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField(String label, String placeholder, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: true,
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: TextStyle(
              color: Colors.grey[400],
              fontSize: 15,
            ),
            filled: true,
            fillColor: Colors.grey[50],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(0xFF4A5A4A)),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ],
    );
  }

  void _handleChangePassword() {
    String currentPassword = _currentPasswordController.text.trim();
    String newPassword = _newPasswordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();

    if (currentPassword.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty) {
      _showMessage('Vui lòng điền đầy đủ thông tin');
      return;
    }

    if (newPassword != confirmPassword) {
      _showMessage('Mật khẩu mới không khớp');
      return;
    }

    if (newPassword.length < 6) {
      _showMessage('Mật khẩu mới phải có ít nhất 6 ký tự');
      return;
    }

    // Thực hiện đổi mật khẩu ở đây
    _showMessage('Đổi mật khẩu thành công');

    // Clear form
    _currentPasswordController.clear();
    _newPasswordController.clear();
    _confirmPasswordController.clear();
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Color(0xFF4A5A4A),
      ),
    );
  }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}