import 'dart:math';

String generateId() {
  const characters =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  Random random = Random.secure();

  return List.generate(4, (index) {
    int randomIndex = random.nextInt(characters.length);
    return characters[randomIndex];
  }).join('');
}
