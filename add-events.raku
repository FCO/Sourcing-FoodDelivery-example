use RedEventStore::Client;
use Sourcing::Client;
use Sourcing::Event;
use Sourcing::FoodDelivery::Event::OrderCreated;
use Sourcing::FoodDelivery::Event::PaymentInitiated;
use Sourcing::FoodDelivery::Event::PaymentConfirmed;
use Sourcing::FoodDelivery::Event::OrderAccepted;
use Sourcing::FoodDelivery::Event::DeliveryStarted;
use Sourcing::FoodDelivery::Event::DeliveryCompleted;
use Sourcing::FoodDelivery::Event::OrderDelivered;
use UUID::V4;

sub color(UInt $color, *@str) {
    "\o33[{ $color };1m{ @str.join }\o33[m"
}

sub red(*@str)    { color 31, |@str }
sub gray(*@str)   { color 30, |@str }
sub yellow(*@str) { color 33, |@str }
sub green(*@str)  { color 32, |@str }

my Sourcing::Client $s          = Sourcing::Client.new;
$s.register-class: "Sourcing::FoodDelivery::DeliveryStatus";
my RedEventStore::Client $store = RedEventStore::Client.new, 
my \DeliveryStatus              = $s.get-class-client("Sourcing::FoodDelivery::DeliveryStatus");

sub emit-and-print-summary-using-order(Sourcing::Event $event, :$order) {
    say "{ gray $event.timestamp.hh-mm-ss }: emitting the event: { yellow $event.^shortname }";

    $store.add-event: $event;
    given $order.summary {
        say "Current state: STATUS: { green .<status> }; CODE: { green .<delivery-code> }"
    }
    sleep 1
}

sub MAIN(Str :$order-id = uuid-v4) {
    say "Using order-id: { red $order-id }";

    my $order = DeliveryStatus.new: :$order-id;
    my &emit-event = &emit-and-print-summary-using-order.assuming: :$order;

    emit-event Sourcing::FoodDelivery::Event::OrderCreated.new:
        :$order-id, :user-id(1), :restaurant-id(^10 .pick) ;

    emit-event Sourcing::FoodDelivery::Event::PaymentInitiated.new:
        :$order-id, :payment-data<blablabla> ;

    emit-event Sourcing::FoodDelivery::Event::PaymentConfirmed.new:
        :$order-id ;

    emit-event Sourcing::FoodDelivery::Event::OrderAccepted.new:
        :$order-id, :restaurant-id(^10 .pick), :prepare-minutes(^100 .pick) ;

    emit-event Sourcing::FoodDelivery::Event::DeliveryStarted.new:
        :$order-id, :deliverer-id(^100 .pick) ;

    emit-event Sourcing::FoodDelivery::Event::DeliveryCompleted.new:
        :$order-id, :delivery-code("10") ;

    emit-event Sourcing::FoodDelivery::Event::OrderDelivered.new:
        :$order-id ;
}
