

import 'package:equatable/equatable.dart';

class CustomError extends Equatable {
  final String error;
  final String message;
  final String plugin;

  CustomError({this.error='', this.message='', this.plugin=''});

  CustomError copyWith({
    String? error,
    String? message,
    String? plugin,
  }) {
    return CustomError(
      error: error ?? this.error,
      message: message ?? this.message,
      plugin: plugin ?? this.plugin,
    );
  }

  @override
  List<Object> get props => [error, message, plugin];
}
