enum TodoNoteFieldMessageType { ERROR, SUCCESS, HELPER }

class TodoNoteFieldMessage {
  const TodoNoteFieldMessage(this.message,
      {this.todoTextInputMessageType = TodoNoteFieldMessageType.HELPER});
  final String? message;
  final TodoNoteFieldMessageType? todoTextInputMessageType;
  static TodoNoteFieldMessage error(String message) {
    return TodoNoteFieldMessage(message,
        todoTextInputMessageType: TodoNoteFieldMessageType.ERROR);
  }

  static TodoNoteFieldMessage success(String message) {
    return TodoNoteFieldMessage(message,
        todoTextInputMessageType: TodoNoteFieldMessageType.SUCCESS);
  }

  static TodoNoteFieldMessage helper(String message) {
    return TodoNoteFieldMessage(message,
        todoTextInputMessageType: TodoNoteFieldMessageType.HELPER);
  }

  static TodoNoteFieldMessage none = const TodoNoteFieldMessage(null);
}
