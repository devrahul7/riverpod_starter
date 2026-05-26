import 'package:riverpod/riverpod.dart';
import 'package:riverpod_starter/models/staff_model.dart';
import 'package:riverpod_starter/state/staff_state.dart';

//provider 

final staffViewModelProvider =
 NotifierProvider<StaffViewModel, StaffState>((){
  return StaffViewModel();
});

class StaffViewModel extends Notifier<StaffState> {
  @override
  StaffState build() {
    return StaffState();
  }

  Future<void> addStaff(StaffModel staff) async {
    state = state.copyWith(isLoading: true);

    final updatedStaff = [...state.lstStaff, staff];
    //stop for 2 seconds
    await Future.delayed(Duration(seconds: 2));
    state = state.copyWith(isLoading: false, lstStaff: updatedStaff);
  }

  Future<void> loadStaff() async {
    state = state.copyWith(isLoading: true);
    await Future.delayed(Duration(seconds: 2));
    state = state.copyWith(isLoading: false);


  }
}
