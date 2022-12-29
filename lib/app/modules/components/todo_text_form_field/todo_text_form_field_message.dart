enum TodoTextInputMessageType { ERROR, SUCCESS, HELPER }

class TodoTextInputMessage {
  const TodoTextInputMessage(this.message,
      {this.todoTextInputMessageType = TodoTextInputMessageType.HELPER});
  final String? message;
  final TodoTextInputMessageType? todoTextInputMessageType;
  static TodoTextInputMessage error(String message) {
    return TodoTextInputMessage(message,
        todoTextInputMessageType: TodoTextInputMessageType.ERROR);
  }

  static TodoTextInputMessage success(String message) {
    return TodoTextInputMessage(message,
        todoTextInputMessageType: TodoTextInputMessageType.SUCCESS);
  }

  static TodoTextInputMessage helper(String message) {
    return TodoTextInputMessage(message,
        todoTextInputMessageType: TodoTextInputMessageType.HELPER);
  }

  static TodoTextInputMessage none = const TodoTextInputMessage(null);
}
