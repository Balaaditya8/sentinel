import 'package:flutter/material.dart';
import 'doctor_dashboard_page.dart';
import 'patient_detail_page.dart';
import '../models/patient.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue[100]!, Colors.blue[400]!],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/sentinel_logo.png', // Path to your logo
                      height: 150, // Adjust size as needed
                    ),
                    SizedBox(height: 30),

                    SizedBox(height: 50),
                    _buildLoginButton(
                      context,
                      'Doctor Login',
                      Icons.medical_services,
                      Colors.indigo,
                          () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DoctorDashboardPage()),
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildLoginButton(
                      context,
                      'Patient Login',
                      Icons.person,
                      Colors.teal,
                          () {
                        Patient mockPatient = Patient(
                          id: '1',
                          name: 'Jane Doe',
                          age: 30,
                          gestationalAge: 20,
                          cerclageDate: DateTime(2024, 5, 15),
                          cerclageType: 'Transvaginal',
                          dueDate: DateTime(2024, 12, 25),
                          cervicalPressure: 7,
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PatientDetailPage(patient: mockPatient, isPatientView: true),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context, String text, IconData icon, Color color, VoidCallback onPressed) {
    return Container(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: Icon(icon, color: Colors.white),
        label: Text(
          text,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          primary: color,
          padding: EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}