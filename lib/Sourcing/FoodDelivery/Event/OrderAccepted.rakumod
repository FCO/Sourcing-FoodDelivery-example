use Sourcing;

unit event Sourcing::FoodDelivery::Event::OrderAccepted;

has Str  $.order-id        is required;
has UInt $.restaurant-id   is required;
has UInt $.prepare-minutes is required;
