import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
// Define the Cubit class for managing isList state
class DashboardCubit extends Cubit<bool> {
  // Initialize the Cubit with an initial state. For example, false.
  DashboardCubit() : super(false);

  // Method to toggle the value of isList
  void toggleIsList() {
    emit(!state); // Emit the opposite of the current state
  }

  // Method to explicitly set the value of isList
  void setIsList(bool value) {
    emit(value); // Emit the provided value
  }
}