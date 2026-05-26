import 'package:riverpod_starter/models/staff_model.dart';

class StaffState {
  final bool isLoading;
  final List<StaffModel> lstStaff;

  StaffState({this.isLoading = false, this.lstStaff = const []});


  StaffState copyWith({
    bool? isLoading,
    List<StaffModel>? lstStaff
  }){
    return StaffState(

      isLoading:isLoading ?? this.isLoading,
      lstStaff: lstStaff ?? this.lstStaff


    );
  }
}

//here initial is loading is true 