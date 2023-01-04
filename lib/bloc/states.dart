abstract class AppState {}

class AppInitial extends AppState {}

// to remove error 'quantity' less zero
class QuantityNotToZero extends AppState {}

// less the coffee quantity
class AddingQuantity extends AppState {}

// less the coffee quantity
class LessQuantity extends AppState {}

// to remove error if quantity equal 0
// change 'withChocolateCheckedPrice' and 'withCreamCheckedPrice'
class QuantityIfZeroAndAdditions extends AppState {}

