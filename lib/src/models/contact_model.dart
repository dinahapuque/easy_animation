class ContactModel {
  final int id;
  final String name;
  final String imageUrl;
  final String role;
  final String bio;

  static int counter = 4;

  ContactModel({
    this.id,
    this.name,
    this.imageUrl,
    this.role,
    this.bio,
  });
}
