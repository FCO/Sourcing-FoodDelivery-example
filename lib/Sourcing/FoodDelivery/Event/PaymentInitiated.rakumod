use Sourcing;

unit event Sourcing::FoodDelivery::Event::PaymentInitiated;

has Str $.order-id     is required;
has     $.payment-data is required;
