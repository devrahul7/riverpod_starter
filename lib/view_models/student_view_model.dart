import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_starter/models/student_model.dart';
import 'package:riverpod_starter/state/student_state.dart';

final studentViewModelProvider =
    NotifierProvider<StudentViewModel, StudentState>(() => StudentViewModel());

class StudentViewModel extends Notifier<StudentState> {
  @override
  StudentState build() {
    // initially 0 and  empty garne
    return StudentState.initial();
  }

  Future<void> addStudent(StudentModel student) async {
    // after adding
    state = state.copyWith( isLoading: true, ); // load garaune yei bela state lai pani copy garne
    await Future.delayed(const Duration(seconds: 2)); // load for 2 secs
    final updatedStudents = [...state.students, student];
    state = state.copyWith(
      isLoading: false,
      students: updatedStudents,
    ); //state lai update garaune
  }

  Future<void> removeStudent(int index) async {
    state = state.copyWith(isLoading: true);
    await Future.delayed(const Duration(seconds: 2));
    final updatedStudents = List<StudentModel>.from(state.students)
    ..removeAt(index);
    state = state.copyWith(isLoading: false, students: updatedStudents);
  }


  Future<void> loadStudents() async {
    state = state.copyWith(isLoading: true);
    await Future.delayed(const Duration(seconds: 2));
    state = state.copyWith(isLoading: false);  // load student after 2 secs
  }

  Future<void> clearStudents() async {
    state = state.copyWith(isLoading: true);
    await Future.delayed(const Duration(seconds: 2));
    state = state.copyWith(isLoading: false, students: []);
  }
}