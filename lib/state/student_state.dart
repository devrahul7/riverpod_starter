
import 'package:riverpod_starter/models/student_model.dart';

class StudentState {
  // make it loading
  final bool isLoading;
  final List<StudentModel> students;

  // constructor to get data of isloading and students
  StudentState({required this.isLoading, required this.students});

  // starting default value will be
  StudentState.initial() : isLoading = false, students = [];

  // if we want to copy only few values reset remain
  StudentState copyWith({bool? isLoading, List<StudentModel>? students}) {
    return StudentState(
      isLoading: isLoading ?? this.isLoading,
      students: students ?? this.students,
    );
  }
}