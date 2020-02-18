use WebService::Discord::Webhook;

my $whurl = "https://discordapp.com/api/webhooks/678682428298231926/KhVLDB3cEjB7p3rS40_fK9Zyqy4BxLE5DZ6QGeX4aT9gF0yQHYZFaOGZqPo68aPgFNIA";

my $webhook = WebService::Discord::Webhook->new($whurl);

$webhook->get();

$webhook->execute(content => "Hi, I'm $webhook->{name}! I will be automatically posting updates from the TrafficDataHarvester. You might want to mute this channel.", tts => 1);
