

import '../../address_model.dart';

abstract class SearchCepState {
  
}

class InitialSearchCepState extends SearchCepState {
  
}
class LoadingSearchCepState extends SearchCepState {
  
}
class SuccessSearchCepState extends SearchCepState {
  final AddressModel address;
  SuccessSearchCepState({
    required this.address,
  });
}

class ErrorSearchCepState extends SearchCepState {
  final String message;
  ErrorSearchCepState({
    required this.message,
  });
  
}
