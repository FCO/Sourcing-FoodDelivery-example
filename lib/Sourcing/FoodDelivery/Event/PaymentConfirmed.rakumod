use Sourcing;

unit event Sourcing::FoodDelivery::Event::PaymentConfirmed;

has Str $.order-id is required;
