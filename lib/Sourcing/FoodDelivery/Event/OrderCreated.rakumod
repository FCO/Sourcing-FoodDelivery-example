use Sourcing;
use UUID::V4;

unit event Sourcing::FoodDelivery::Event::OrderCreated;

has Str  $.order-id      = uuid-v4;
has Str  $.delivery-code = (1 ..^ 100)>>.fmt("%02d").pick;
has UInt $.user-id       is required;
has UInt $.restaurant-id is required;
has Str  %.item{Str};
