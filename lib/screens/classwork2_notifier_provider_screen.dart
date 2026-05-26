import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_starter/models/staff_model.dart';
import 'package:riverpod_starter/view_models/staff_view_model.dart';

class Classwork2NotifierProviderScreen extends ConsumerStatefulWidget {
  const Classwork2NotifierProviderScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _Classwork2NotifierProviderScreenState();
}

class _Classwork2NotifierProviderScreenState
    extends ConsumerState<Classwork2NotifierProviderScreen> {
  final TextEditingController _fNameControlller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // ✅ FIX: use variables instead of controllers
  String? selectedGender;
  String? selectedDepartment;

  @override
  Widget build(BuildContext context) {
    final staffState = ref.watch(staffViewModelProvider);
    final staffVM = ref.read(staffViewModelProvider.notifier);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.deepPurple.shade800,
              Colors.deepPurple.shade400,
              Colors.purple.shade300,
            ],
          ),
        ),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Classwork 2 - Notifier',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller: _fNameControlller,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      labelStyle: const TextStyle(color: Colors.white70),
                      hintText: 'Enter full name',
                      hintStyle: const TextStyle(color: Colors.white38),
                      filled: true,
                      fillColor: Colors.white.withValues(alpha: 0.15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: DropdownButtonFormField<String>(
                    value: selectedGender,
                    dropdownColor: Colors.deepPurple.shade700,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Gender',
                      labelStyle: const TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Colors.white.withValues(alpha: 0.15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(Icons.wc, color: Colors.white70),
                    ),
                    hint: const Text(
                      'Select gender',
                      style: TextStyle(color: Colors.white38),
                    ),
                    items: const [
                      DropdownMenuItem(value: 'Male', child: Text('Male')),
                      DropdownMenuItem(value: 'Female', child: Text('Female')),
                      DropdownMenuItem(value: 'Other', child: Text('Other')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 16),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: DropdownButtonFormField<String>(
                    value: selectedDepartment,
                    dropdownColor: Colors.deepPurple.shade700,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Department',
                      labelStyle: const TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Colors.white.withValues(alpha: 0.15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(
                        Icons.business,
                        color: Colors.white70,
                      ),
                    ),
                    hint: const Text(
                      'Select department',
                      style: TextStyle(color: Colors.white38),
                    ),
                    items: const [
                      DropdownMenuItem(value: 'IT', child: Text('IT')),
                      DropdownMenuItem(value: 'CS', child: Text('CS')),
                      DropdownMenuItem(value: 'EC', child: Text('EC')),
                      DropdownMenuItem(value: 'ME', child: Text('ME')),
                      DropdownMenuItem(value: 'CE', child: Text('CE')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedDepartment = value;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 32),

                /// ✅ Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final student = StaffModel(
                            fname: _fNameControlller.text,
                            gender: selectedGender ?? '',
                            department: selectedDepartment ?? '',
                          );

                          staffVM.addStaff(student);
                        }
                      },
                      icon: const Icon(Icons.person_add),
                      label: const Text('Add Student'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: Colors.white.withValues(alpha: 0.15),
                    elevation: 0,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: staffState.lstStaff.map((staff) {
                          return SizedBox(
                            width:
                                double.infinity, // makes text take full width
                            child: Text(
                              '${staff.fname} (${staff.gender}, ${staff.department})',
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(color: Colors.white),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),

                const Expanded(child: SizedBox()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
