use Sourcing;

unit event Sourcing::FoodDelivery::Event::DeliveryStarted;

has Str  $.order-id     is required;
has UInt $.deliverer-id is required;
