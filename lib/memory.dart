class Memory {
  static const operations = ['%', '/', 'x', '+', '-', '='];
  String result = '0';
  bool _operationUsed = false;
  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  String _operation;

  applyCommand(String command) {
    if (command == 'AC') {
      _clear();
    } else if (command == 'DEL') {
      _deleteEndDigit();
    } else if (operations.contains(command)) {
      _setOperation(command);
    } else {
      _addDigit(command);
    }
  }

  _setOperation(String operation) {
    if (_operationUsed && operation != '=') {
      _operation = operation;
      return;
    }

    if (_bufferIndex == 0) {
      _buffer[0] = double.parse(result);
      _bufferIndex++;
    } else {
      if (operation == '=' && _buffer[1] == 0) {
        _buffer[1] = double.parse(result);
      } else if (operation != '=') {
        _buffer[1] = double.parse(result);
      }
      _buffer[0] = _calculate();
      var temp = _buffer[0].toString();
      result = temp.endsWith('.0') ? temp.replaceAll('.0', '') : temp;
    }

    if (_operation != '=') _operation = operation;

    print('${_buffer[0]} $operation ${_buffer[1]}');

    _operationUsed = true;
  }

  _calculate() {
    if (_operation == '%') return _buffer[0] % _buffer[1];
    if (_operation == '/') return _buffer[0] / _buffer[1];
    if (_operation == 'x') return _buffer[0] * _buffer[1];
    if (_operation == '+') return _buffer[0] + _buffer[1];
    if (_operation == '-') return _buffer[0] - _buffer[1];
  }

  _addDigit(String digit) {
    if (_operationUsed) result = '0';

    if (result == '0' && digit != '.') {
      result = '';
    }

    if (digit == '.' && result.contains('.')) {
      digit = '';
    }

    result += digit;
    _operationUsed = false;
  }

  _deleteEndDigit() {
    result = result.length > 1 ? result.substring(0, result.length - 1) : '0';
  }

  _clear() {
    result = '0';
    _bufferIndex = 0;
    _operationUsed = false;
    _operation = null;
    _buffer.setAll(0, [0.0, 0.0]);
  }
}
