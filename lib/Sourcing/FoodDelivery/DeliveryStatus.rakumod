use Sourcing;
use Sourcing::FoodDelivery::Event::OrderCreated;
use Sourcing::FoodDelivery::Event::OrderAccepted;
use Sourcing::FoodDelivery::Event::DeliveryStarted;
use Sourcing::FoodDelivery::Event::DeliveryCompleted;
use Sourcing::FoodDelivery::Event::OrderDelivered;

unit projection Sourcing::FoodDelivery::DeliveryStatus;

has Str      $.order-id    is aggregation-id;
has Str      $.status       = "";
has DateTime $.last-status .= now;
has Str      $.delivery-code;

method summary is query{ :sync } {
	%(
		:$!order-id,
		:$!status,
		:$!last-status,
		:$!delivery-code,
	)
}

multi method apply(Sourcing::FoodDelivery::Event::OrderCreated $_) {
	note "apply OrderCreated";
	$!status        = "placed";
	$!last-status   = .timestamp;
	$!delivery-code = .delivery-code;
}

multi method apply(Sourcing::FoodDelivery::Event::OrderAccepted $_) {
	note "apply OrderAccepted";
	$!status        = "preparing";
	$!last-status   = .timestamp;
}

multi method apply(Sourcing::FoodDelivery::Event::DeliveryStarted $_) {
	note "apply DeliveryStarted";
	$!status      = "collected";
	$!last-status = .timestamp;
}

multi method apply(Sourcing::FoodDelivery::Event::DeliveryCompleted $_) {
	note "apply DeliveryCompleted";
	$!status      = "delivered";
	$!last-status = .timestamp;
}

multi method apply(Sourcing::FoodDelivery::Event::OrderDelivered $_) {
	note "apply OrderDelivered";
	$!status      = "done";
	$!last-status = .timestamp;
}
