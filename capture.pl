use DateTime;
use Getopt::Std;
use WebService::Discord::Webhook;
  
getopts('i:t:');

my $whurl = "https://discordapp.com/api/webhooks/678682428298231926/KhVLDB3cEjB7p3rS40_fK9Zyqy4BxLE5DZ6QGeX4aT9gF0yQHYZFaOGZqPo68aPgFNIA";

my $webhook = WebService::Discord::Webhook->new($whurl);

$webhook->get();

for (1..$opt_t) {
  my $dt = DateTime->now;
  system(qq{ffmpeg -i "http://mcleansfs1.tdotstreaming.com:1935/rtplive/R1_011/playlist.m3u8" -t $opt_i -c copy -bsf:a aac_adtstoasc "../footage/$dt.mp4"});
  system("ffmpeg -ss 30 -i ../footage/$dt.mp4 -vframes 1 -q:v 2 /var/www/html/screenshots/$dt.jpg");
  my %image;
  $image{image}{url} = "http://144.91.120.5/screenshots/$dt.jpg";
  $webhook->execute(content => "Footage $dt.mp4 finished downloading.", embed => \%image);
}
