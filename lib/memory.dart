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
    if (_operationUsed && operation == _operation) return;

    if (_bufferIndex == 0) {
      _bufferIndex = 1;
    } else {
      _buffer[0] = _calculate();
    }

    if (operation != '=') _operation = operation;

    result = _buffer[0].toString();
    result = result.endsWith('.0') ? result.split('.')[0] : result;

    _operationUsed = true;
  }

  _calculate() {
    switch (_operation) {
      case '%':
        return _buffer[0] % _buffer[1];
      case '÷':
        return _buffer[0] / _buffer[1];
      case 'x':
        return _buffer[0] * _buffer[1];
      case '+':
        return _buffer[0] + _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      default:
        return 0.0;
    }
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

    _buffer[_bufferIndex] = double.tryParse(result);
    _operationUsed = false;
  }

  _deleteEndDigit() {
    result = result.length > 1 ? result.substring(0, result.length - 1) : '0';
  }

  Memory() {
    _clear();
  }
  
  _clear() {
    result = '0';
    _bufferIndex = 0;
    _operationUsed = false;
    _operation = null;
    _buffer.setAll(0, [0.0, 0.0]);
  }
}
