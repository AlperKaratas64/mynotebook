import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mynotebook/data/services/register/register_service.dart';
import 'package:mynotebook/views/register/register_controller.dart';

import '../../../test_observer.dart';

class MockRegisterService extends Mock implements RegisterService {}

void main() {
  late RegisterController _controller;
  late RegisterService _registerService;

  setUp(() {
    _registerService = MockRegisterService();
    _controller = RegisterController((_registerService));
  });

  test('isLoading changes', () {
    final TestObserver<bool> loadingObserver =
        _controller.isLoading.testObserver;
    const String username = 'alper';
    const String email = 'a@gmail.com';
    const String book = 'serenad';
    const String password = '12345';

    _controller.callingRegisterService(username, email, book, password);

    expect(loadingObserver.history, containsAllInOrder([true, false]));
  });
}
