import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  final String userRole;

  const SignupScreen({super.key, required this.userRole});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  // Common Fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Patient Fields
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _medicalHistoryController = TextEditingController();

  // Doctor Fields
  final TextEditingController _specialtyController = TextEditingController();
  final TextEditingController _qualificationController = TextEditingController();
  final TextEditingController _licenseIdController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _availabilityController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _ageController.dispose();
    _genderController.dispose();
    _medicalHistoryController.dispose();
    _specialtyController.dispose();
    _qualificationController.dispose();
    _licenseIdController.dispose();
    _locationController.dispose();
    _availabilityController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Later: Submit to Firebase
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Sign-up info captured (mock).")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isPatient = widget.userRole == "Patient";

    return Scaffold(
      appBar: AppBar(title: Text("Sign Up as ${widget.userRole}")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Common
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Full Name"),
                validator: (value) => value!.isEmpty ? "Required" : null,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value!.isEmpty ? "Required" : null,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: (value) => value!.length < 6 ? "Min 6 characters" : null,
              ),
              const SizedBox(height: 20),

              if (isPatient) ...[
                TextFormField(
                  controller: _ageController,
                  decoration: const InputDecoration(labelText: "Age"),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? "Required" : null,
                ),
                TextFormField(
                  controller: _genderController,
                  decoration: const InputDecoration(labelText: "Gender"),
                  validator: (value) => value!.isEmpty ? "Required" : null,
                ),
                TextFormField(
                  controller: _medicalHistoryController,
                  decoration: const InputDecoration(labelText: "Medical History Summary"),
                  maxLines: 3,
                ),
              ] else ...[
                TextFormField(
                  controller: _specialtyController,
                  decoration: const InputDecoration(labelText: "Specialty"),
                  validator: (value) => value!.isEmpty ? "Required" : null,
                ),
                TextFormField(
                  controller: _qualificationController,
                  decoration: const InputDecoration(labelText: "Qualifications"),
                ),
                TextFormField(
                  controller: _licenseIdController,
                  decoration: const InputDecoration(labelText: "License ID"),
                ),
                TextFormField(
                  controller: _locationController,
                  decoration: const InputDecoration(labelText: "Location"),
                ),
                TextFormField(
                  controller: _availabilityController,
                  decoration: const InputDecoration(labelText: "Availability"),
                ),
              ],

              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.blue,
                ),
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
