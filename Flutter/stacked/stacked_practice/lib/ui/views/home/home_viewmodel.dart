import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CounterViewModel extends BaseViewModel {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    // _snackbarService.showSnackbar(
    //   message: 'This is a snack bar',
    //   title: 'The title',
    //   duration: Duration(seconds: 2),
    //   onTap: (_) {
    //     print('snackbar tapped');
    //   },
    //   mainButtonTitle: 'Undo',
    //   onMainButtonTapped: () => print('Undo the action!'),
    // );
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }
}
