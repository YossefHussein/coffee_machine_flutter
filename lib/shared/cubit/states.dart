abstract class AppState {}

class AppInitial extends AppState {}

// to remove error 'quantity' less zero
class QuantityNotToZero extends AppState {}

// less the coffee quantity
class AddingQuantity extends AppState {}

// less the coffee quantity
class LessQuantity extends AppState {}

// those class for change checkBox
class ChangeCheckBoxCream extends AppState {}
class ChangeCheckBoxChocolate extends AppState {}
