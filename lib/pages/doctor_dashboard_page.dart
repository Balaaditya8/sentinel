import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../models/patient.dart';
import 'patient_detail_page.dart';

class DoctorDashboardPage extends StatelessWidget {
  final List<Patient> patients = [
    Patient(
      id: '1',
      name: 'Jane Doe',
      age: 30,
      gestationalAge: 20,
      cerclageDate: DateTime(2024, 5, 15),
      cerclageType: 'Transvaginal',
      dueDate: DateTime(2024, 12, 25),
      cervicalPressure: 7
    ),
    Patient(
      id: '2',
      name: 'Emily Smith',
      age: 28,
      gestationalAge: 18,
      cerclageDate: DateTime(2024, 6, 1),
      cerclageType: 'Transabdominal',
      dueDate: DateTime(2025, 1, 10),
      cervicalPressure: 30
    ),
    Patient(
        id: '3',
        name: 'Samantha',
        age: 35,
        gestationalAge: 20,
        cerclageDate: DateTime(2024, 6, 1),
        cerclageType: 'Transabdominal',
        dueDate: DateTime(2025, 1, 10),
        cervicalPressure: 30
    ),
    Patient(
        id: '4',
        name: 'Elise Perry',
        age: 40,
        gestationalAge: 21,
        cerclageDate: DateTime(2024, 6, 1),
        cerclageType: 'Transabdominal',
        dueDate: DateTime(2025, 1, 10),
        cervicalPressure: 30
    ),
    Patient(
        id: '5',
        name: 'Anne',
        age: 28,
        gestationalAge: 21,
        cerclageDate: DateTime(2024, 6, 1),
        cerclageType: 'Transabdominal',
        dueDate: DateTime(2025, 1, 10),
        cervicalPressure: 30
    ),
    Patient(
        id: '6',
        name: 'Scarlett',
        age: 37,
        gestationalAge: 19,
        cerclageDate: DateTime(2024, 6, 1),
        cerclageType: 'Transabdominal',
        dueDate: DateTime(2025, 1, 10),
        cervicalPressure: 30
    ),
    Patient(
        id: '7',
        name: 'Reese',
        age: 25,
        gestationalAge: 20,
        cerclageDate: DateTime(2024, 6, 1),
        cerclageType: 'Transabdominal',
        dueDate: DateTime(2025, 1, 10),
        cervicalPressure: 30
    ),
    Patient(
        id: '8',
        name: 'Jennifer',
        age: 26,
        gestationalAge: 18,
        cerclageDate: DateTime(2024, 6, 1),
        cerclageType: 'Transabdominal',
        dueDate: DateTime(2025, 1, 10),
        cervicalPressure: 30
    ),
    Patient(
        id: '9',
        name: 'Kate',
        age: 34,
        gestationalAge: 17,
        cerclageDate: DateTime(2024, 6, 1),
        cerclageType: 'Transabdominal',
        dueDate: DateTime(2025, 1, 10),
        cervicalPressure: 30
    ),
    Patient(
        id: '10',
        name: 'Rachel',
        age: 33,
        gestationalAge: 23,
        cerclageDate: DateTime(2024, 6, 1),
        cerclageType: 'Transabdominal',
        dueDate: DateTime(2025, 1, 10),
        cervicalPressure: 30
    ),
    Patient(
        id: '11',
        name: 'Pam',
        age: 32,
        gestationalAge: 22,
        cerclageDate: DateTime(2024, 6, 1),
        cerclageType: 'Transabdominal',
        dueDate: DateTime(2025, 1, 10),
        cervicalPressure: 30
    ),
    Patient(
        id: '12',
        name: 'Jay',
        age: 28,
        gestationalAge: 21 ,
        cerclageDate: DateTime(2024, 6, 1),
        cerclageType: 'Transabdominal',
        dueDate: DateTime(2025, 1, 10),
        cervicalPressure: 30
    ),
    // Add more sample patients here
  ];

  DoctorDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Sentinel', style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black87),
            onPressed: () {
              // Implement search functionality
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          itemCount: patients.length,
          itemBuilder: (context, index) {
            return PatientCard(patient: patients[index]);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Add new patient functionality
        },
      ),
    );
  }
}

class PatientCard extends StatelessWidget {
  final Patient patient;

  const PatientCard({Key? key, required this.patient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PatientDetailPage(patient: patient)),
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                patient.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Age: ${patient.age}'),
              Text('Gestational Age: ${patient.gestationalAge} weeks'),
              SizedBox(height: 8),
              LinearProgressIndicator(
                value: patient.gestationalAge / 40,
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}