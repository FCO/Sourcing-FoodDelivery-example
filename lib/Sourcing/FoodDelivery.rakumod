unit class Sourcing::FoodDelivery;


=begin pod

=head1 NAME

Sourcing::FoodDelivery - an example of usage of Sourcing (a Raku framework to create event sourcing systems)

=head1 SYNOPSIS

=begin code :lang<text>

$ raku -Ilib add-events.raku
Using order-id: 34393764-6231-4436-a338-623961626130
16:20:10: emiting the event: OrderCreated
Current state: STATUS: placed; CODE: 31
16:20:11: emiting the event: PaymentInitiated
Current state: STATUS: placed; CODE: 31
16:20:13: emiting the event: PaymentConfirmed
Current state: STATUS: placed; CODE: 31
16:20:14: emiting the event: OrderAccepted
Current state: STATUS: preparing; CODE: 31
16:20:15: emiting the event: DeliveryStarted
Current state: STATUS: collected; CODE: 31
16:20:16: emiting the event: DeliveryCompleted
Current state: STATUS: delivered; CODE: 31
16:20:17: emiting the event: OrderDelivered
Current state: STATUS: done; CODE: 31

=end code

=head1 DESCRIPTION

Sourcing::FoodDelivery is an example of usage of Sourcing (a Raku framework to create event sourcing systems)

=head1 AUTHOR

Fernando Corrêa de Oliveira <fco@cpan.org>

=head1 COPYRIGHT AND LICENSE

Copyright 2025 Fernando Corrêa de Oliveira

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
