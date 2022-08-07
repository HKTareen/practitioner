class Chat {
  String? id;
  String? modifiedBy;
  String? fromUser;
  String? text;
  bool? isUser;
  String? createdAt;
  String? formatedMessageData;
  int? headId;
  bool? isCurrentUserMessage;
  Chat(
      {this.id,
      this.modifiedBy,
      this.fromUser,
      this.text,
      this.isUser,
      this.createdAt,
      this.formatedMessageData,
      this.headId,
      this.isCurrentUserMessage});
}