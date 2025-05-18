import 'package:flutter/material.dart';

class PasswordManagerPage extends StatefulWidget {
  @override
  _PasswordManagerPageState createState() => _PasswordManagerPageState();
}

class _PasswordManagerPageState extends State<PasswordManagerPage> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscureCurrent = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  void _toggleVisibility(String field) {
    setState(() {
      if (field == 'current') _obscureCurrent = !_obscureCurrent;
      if (field == 'new') _obscureNew = !_obscureNew;
      if (field == 'confirm') _obscureConfirm = !_obscureConfirm;
    });
  }

  void _handleChangePassword() {
    if (_formKey.currentState!.validate()) {
      // Add actual password update logic here
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Password successfully updated!')));
    }
  }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Password Manager'),
        backgroundColor: Color(0xFF4654BF),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.08),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: screenSize.height * 0.04),
                _buildPasswordField(
                  controller: _currentPasswordController,
                  label: 'Current Password',
                  obscure: _obscureCurrent,
                  toggle: () => _toggleVisibility('current'),
                ),
                _buildPasswordField(
                  controller: _newPasswordController,
                  label: 'New Password',
                  obscure: _obscureNew,
                  toggle: () => _toggleVisibility('new'),
                ),
                _buildPasswordField(
                  controller: _confirmPasswordController,
                  label: 'Confirm New Password',
                  obscure: _obscureConfirm,
                  toggle: () => _toggleVisibility('confirm'),
                  validator: (value) {
                    if (value != _newPasswordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenSize.height * 0.04),
                ElevatedButton(
                  onPressed: _handleChangePassword,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4654BF),
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Update Password',
                    style: TextStyle(
                      fontSize: screenSize.width * 0.045,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required bool obscure,
    required VoidCallback toggle,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        validator:
            validator ??
            (value) =>
                value == null || value.isEmpty ? 'Please enter $label' : null,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Color(0xFFF5F6FA),
          suffixIcon: IconButton(
            icon: Icon(
              obscure ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
            onPressed: toggle,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
