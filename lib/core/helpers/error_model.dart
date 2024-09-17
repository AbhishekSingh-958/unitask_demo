import 'dart:convert';

ErrorResponse errorResponseFromJson(String str) =>
    ErrorResponse.fromJson(json.decode(str));

String errorResponseToJson(ErrorResponse data) => json.encode(data.toJson());

class ErrorResponse {
  bool? success;
  Error? error;

  ErrorResponse({
    this.success,
    this.error,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        success: json["success"],
        error: json["error"] == null ? null : Error.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "error": error?.toJson(),
      };
}

class Error {
  int? code;
  String? type;
  String? info;

  Error({
    this.code,
    this.type,
    this.info,
  });

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        code: json["code"],
        type: json["type"],
        info: json["info"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "type": type,
        "info": info,
      };
}
