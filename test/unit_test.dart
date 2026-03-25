import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mission_5_wanderly/core/errors/failure.dart';
import 'package:mission_5_wanderly/core/helpers/validator_helper.dart';
import 'package:mission_5_wanderly/data/sources/auth_firebase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'unit_test.mocks.dart';

@GenerateMocks([FirebaseAuth, UserCredential])
void main() {
  late MockFirebaseAuth mockFirebaseAuth;
  late MockUserCredential mockUserCredential;
  late AuthFirebaseImpl authFirebase;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockUserCredential = MockUserCredential();
    authFirebase = AuthFirebaseImpl(mockFirebaseAuth);
  });

  test('User Login', () async {
    when(
      mockFirebaseAuth.signInWithEmailAndPassword(
        email: 'heiya@gmail.com',
        password: 'Qwerty@1',
      ),
    ).thenAnswer((_) async => mockUserCredential);

    final result = await authFirebase.userLogin('heiya@gmail.com', 'Qwerty@1');
    expect(result, mockUserCredential);
  });

  test('User Login Exception', () async {
    when(
      mockFirebaseAuth.signInWithEmailAndPassword(
        email: 'heiya@gmail.com',
        password: 'Qwerty@1',
      ),
    ).thenThrow(
      FirebaseAuthException(code: 'wrong-password', message: 'Login Failed'),
    );

    expect(
      () => authFirebase.userLogin('heiya@gmail.com', 'Qwerty@1'),
      throwsA(isA<AuthFailure>()),
    );
  });

  test('User Signup', () async {
    when(
      mockFirebaseAuth.createUserWithEmailAndPassword(
        email: 'heiya@gmail.com',
        password: 'Qwerty@1',
      ),
    ).thenAnswer((_) async => mockUserCredential);

    final result = await authFirebase.userRegister(
      'heiya@gmail.com',
      'Qwerty@1',
    );
    expect(result, mockUserCredential);
  });

  test('Password Validation', () {
    expect(ValidatorHelper.password(''), 'Password is required');
    expect(
      ValidatorHelper.password('Qwerty'),
      'Password must be at least 8 characters',
    );
    expect(ValidatorHelper.password('Qwerty@1'), null);
  });
}
