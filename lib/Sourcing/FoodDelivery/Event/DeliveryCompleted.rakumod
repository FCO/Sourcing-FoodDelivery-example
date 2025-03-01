use Sourcing;

unit event Sourcing::FoodDelivery::Event::DeliveryCompleted;

has Str $.order-id      is required;
has Str $.delivery-code is required;
