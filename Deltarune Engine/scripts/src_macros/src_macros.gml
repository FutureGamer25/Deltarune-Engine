#macro EMPTY_METHOD __get_empty_method()

function __get_empty_method() {
  static f = function() {};
  return f;
}
