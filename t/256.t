use strict;
use warnings;
use Test::More tests => 68;
use Digest::BMW qw(bmw_256 bmw_256_hex);

my $len = 0;

while (my $line = <DATA>) {
    chomp $line;
    my ($msg, $digest) = split '\|', $line, 2;
    my $data = pack 'H*', $msg;
    $digest = lc $digest;

    if ($len and not $len % 8) {
        my $md = Digest::BMW->new(256)->add($data)->hexdigest;
        is($md, $digest, "new/add/hexdigest: $len bits of $msg");
        is(bmw_256_hex($data), $digest, "bmw_256_hex: $len bits of $msg");
        ok(
            bmw_256($data) eq pack('H*', $digest),
            "bmw_256: $len bits of $msg"
        );
    }

    my $md = Digest::BMW->new(256)->add_bits($data, $len)->hexdigest;
    is($md, $digest, "new/add_bits/hexdigest: $msg");
}
continue { $len++ }

__DATA__
00|82CAC4BF6F4C2B41FBCC0E0984E9D8B76D7662F8E1789CDFBD85682ACC55577A
00|3BC189D17196A63286956B6F2CD5B67349AEC314B71050E539077C5CB4942DB2
C0|977A57C469CBD2EF4480F565FE8C5CA5DABC909BF90603D53E13EC9F6734FBBC
C0|8B6D58BB696FCD46988C01F638781837D50C71EEA7CEBC11FC98721CDF89383F
80|54B972682432FC73D82AC3FBAA1D20AFBC644793D8BFF6F8DDB1CBAE61E2C6FD
48|38EEEEE886C37D3ADA24E6E418F18F10FE79AF6705A16626DBD73A6B970FCE10
50|BD2F4DD897C8B6C3538DD7E9643E4A67195D7F208FCF9F53EDFD40AF00C1457B
98|7C92D4C2BC250BB4F340F9C2B92213231B369F04CF847B0AFECBD9BDB3DAE8BF
CC|F71289CD66D22657801AE25F5DB946F6D2CC9884D70080D84282A5EF083CB70F
9800|21FE03808917D992F58682932905FA27807B56424F154C71793E9F757CBF4BC9
9D40|1C82A9A75184CA5CD788D30C9D0F15DA6E06DA071A72607AD39742F6783D1711
AA80|B5CE16B053E2D21871D0DD79E2CEC11113D98692DB785E29E981F5A606D1C5F0
9830|731CF7BF44842694C1AA15B43E0166E5263DA5683C4D41306621900D0A6F42EA
5030|CE754408946CE866A05DE365EAFBF038AF4CA7A3661521D4D64576D2DA1F613E
4D24|41CF96069F04E90ECF0A534CF4FD49F7161BAE7E2EAADA8A7393A4DC9E2010EB
CBDE|2E005E6F99C6270EAB08563D71B6241501D8AA09213F982278BF544FAC1C5D43
41FB|8F7A69E19A65F1148D02DE5E2BF784974E6CF3335CD2B2D07BC3B88463D2BE3C
4FF400|305F6FAB9331EC02B99FE0F8FDE211DBFB745906A71BE4E3FF37503E35D08779
FD0440|C6AAF37629A17B089410EAFA6A923A5CDBDB3BE9F939A25DB1B6CD5AB7693198
424D00|818128806EAD7DA2C7E322BA1BC7D8120EDC5E6AB82C2634279D7D13E7007A8D
3FDEE0|82220993A1BACD960022AFC66B87B96F5B6154C28DD8A60FD374702B1AD5F71F
335768|A54790062F6054EBBA2064633D5D3270AA65B3C0741299167DA68B2AACFEB7EB
051E7C|145752A98B4B6CA9EBCFAB099B643CDCB679A9CF718AA92AA83A14866F6C71C7
717F8C|22537FC781B679E4BF20453E45E0DAE482930E5563DA9F916DE3C3496C6F9645
1F877C|AFC964B8EC55FC0BF5880008E484C85CC08F85F10BC9DEA42249412C376EBA0D
EB35CF80|2D388A108E7AE151527ACFF402E827DE9ABD14B5F5318D95D7775DD301EA4640
B406C480|FDECFF3518882FE84A35A1DD1DB8AEF84F04508F390E17C95F0D061226AAFE0D
CEE88040|EAC58046C91F51212BBFFBBBECEC6EABE9BC2116232F7611C326620959107AE9
C584DB70|4443420EA8BB6C47AC3BD50ECF20F14720555785462C885E0839C60F6FD3E221
53587BC8|8A2B8BFFDA3CFB6BC6DB8DA089F9D51ECB4AD6E230A8D40C476F459315EF4DAE
69A305B0|0145736EB044BA5B8E1D1426C76DB2395EE6C88B97DAAB45AB29B1A91A52D66D
C9375ECE|D04CFE947D5C7AD2F7A5396E0FEC9EB23754A05D4B2D867B35B6CCCCA6F8B9D6
C1ECFDFC|B4234843E79FC032EFF83C144767D6C1CB37BBABA601563B0D972D2F7881E759
8D73E8A280|FFA798C57701C401B93D7E4BEBDECA16A0CD3EE0019426810CD8F3FC9A46C8EC
06F2522080|C727E1ABE938D17D3ADDD71D744C7080E6D856F8E2BC2E23FDF4F463FA26C783
3EF6C36F20|40B40ECCCF0870D82BF191E9D47D432983AB1E67D8759167A4D53BBB0D0C4BA7
0127A1D340|BFAF3914FEB4CCC5F5456B81C1FE7F81E82BF2AE6DBB891FB3D6581815D14E78
6A6AB6C210|9978128120CE07FCA1376A9CA88AD7D53C4FADE801150B6FC21B1154BE4EAACB
AF3175E160|55029F9C7A2A319735429C8CD5D83EF8C400C622D881C322842222DB054CB18F
B66609ED86|D5EE66B6D6D1BF5E0BF8EC611B2D7B8741D2DDAFC3A23D4D5763399F4E00F848
21F134AC57|5CAAEAFEC0A19B9AF5911FA620D0CCF151E67B0D1FAB29992BAA98B1C3ACF64D
3DC2AADFFC80|90278009B70277993C50724077F8B4C78311D95507E003AB1661A1DCCF939AD2
9202736D2240|F7430A40AEE07FD9B2CE68FF0E82D8AAF6CFDD2DC1A49C35F2F4D8DEF422E27D
F219BD629820|EA7B9380E117265D53A89A6653F3EB596FA227A5C6CEAE2C78AB5753529622B8
F3511EE2C4B0|95E2795A9BE6D061CB56DE78099BB445A2B0D97342164F853EC6525FC928AF7D
3ECAB6BF7720|F5C5D5F3258E6210BF081F1DF1C1BCA81E51E9954C80144F23867775EAC4206F
CD62F688F498|DFEB4E4D24CAB1D64D169235B0A1CEC47C2D1BD669AE7910CA15DBE9E7F6610D
C2CBAA33A9F8|3CAFF31187D120E510F8CA5FAB214EFA512CA9D5BE260943319EBBB79F4AEA45
C6F50BB74E29|23DCC23964DA5416DDCA4989F35C19A0BAB19916A788BC6A5418D4D66809E31D
79F1B4CCC62A00|C514F4E9B7A298406AEF301D3CD2512517A9410985B3F46F3FE9D7D523F1B516
