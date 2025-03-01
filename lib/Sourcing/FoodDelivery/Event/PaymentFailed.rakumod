use Sourcing;

unit event Sourcing::FoodDelivery::Event::PaymentFailed;

has Str $.order-id is required;
has     $.error    is required;

