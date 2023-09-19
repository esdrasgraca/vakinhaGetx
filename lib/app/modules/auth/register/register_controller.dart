// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burger_mobile/app/core/constants/constants.dart';
import 'package:vakinha_burger_mobile/app/core/mixins/loader_mixin.dart';
import 'package:vakinha_burger_mobile/app/core/mixins/messages_mixin.dart';
import 'package:vakinha_burger_mobile/app/core/rest_client/rest_client.dart';

import 'package:vakinha_burger_mobile/app/repositories/auth/auth_repository.dart';

class RegisterController extends GetxController
    with LoaderMixin, MessagesMixin {
  final AuthRepository _authRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  RegisterController({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  void onInit() {
    loaderListener(_loading);
    messageListener(_message);
    super.onInit();
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      _loading.toggle();
      final userModel = await _authRepository.register(name, email, password);
      _loading.toggle();
      GetStorage().write(Constants.USER_KEY, userModel.id);
            
    } on RestClientException catch (e,s) {
      _loading.toggle();
      log('Erro ao registrar usuário', error: e , stackTrace: s);
      _message(MessageModel(
        tittle: 'Erro',
        message: e.message,
        type: MessageType.error,
      ));
    } catch (e, s) {
      _loading.toggle();
      log('Erro ao registrar usuário', error: e , stackTrace: s);
      _message(MessageModel(
        tittle: 'Erro',
        message: 'Erro ao registrar usuário',
        type: MessageType.error,
      ));
    }
  }
}
