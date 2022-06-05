#!/bin/bash
echo "Getting Root Domains"
rm -rf ~/bounty-monitor/root_domains
mkdir -p ~/bounty-monitor/root_domains
wget https://raw.githubusercontent.com/projectdiscovery/public-bugbounty-programs/master/chaos-bugbounty-list.json -O ~/bounty-monitor/root_domains/chaos-bugbounty-list.json
wget https://raw.githubusercontent.com/arkadiyt/bounty-targets-data/master/data/wildcards.txt -O ~/bounty-monitor/root_domains/wildcards.txt
cat ~/bounty-monitor/root_domains/chaos-bugbounty-list.json | jq .programs[].domains[] | cut -d '"' -f2  | /root/go/bin/anew -q ~/bounty-monitor/root_domains/domains.txt
cat ~/bounty-monitor/root_domains/wildcards.txt | sed 's/\*,//g' | sed 's/\.\*//g'| sed 's/\*//g' | /root/go/bin/anew -q ~/bounty-monitor/root_domains/domains.txt
cat ~/bounty-monitor/root_domains/domains.txt | grep -v swisscom.ch | grep -v customdomains.oktapreview.com | grep -v wingo.ch | grep -v rate-limited-proxy | grep -v google-proxy | grep -v 'mail-' | grep -v backblaze.com | grep -v  mail.aliyun.com | grep -v  algolianet.com | grep -v  relay.skype.com | grep -v  infra.lync.com | grep -v dedicated.lync.com | grep -v vk.me | grep -v search.line-apps.com | grep -v sophos.com | grep -v stanford.edu | grep -v liquidweb.com | grep -v pixiv.net | grep -v sharepoint.com | grep -v codefi.network | grep -v planethoster.net | grep -v telenet.be | grep -v mailjet.com | grep -v mailgun.net | grep -v cloudflare.com | grep -v cisco.com | grep -v algolia.net | grep -v 1688.com | grep -v alibaba.com | grep -v alixpress.com | grep -v alimama.com | grep -v aliyun.com | grep -v taobao.com | grep -v tmall.com | grep -v amazon.com | grep -v 4th.att.com | grep -v 5th.att.com | grep -v 6th.att.com | grep -v 7th.att.com | grep -v 8th.att.com | grep -v atlassian.net | grep -v gateway.centrify.com | grep -v centrify.com | grep -v chaturbate.com | grep -v oob.ikarem.io | grep -v meraki.com | grep -v cloudflareworkers.com | grep -v sf.net | grep -v sjc.dropbox.com |  grep -v elstc.co | grep -v etsy.com | grep -v alibabacloud.com | grep -v aliexpress.com | grep -v dingtalk.com | grep -v highwebmedia.com| grep -v cloudflareaccess.com | grep -v t-systems.com | grep -v net.dropbox.com | grep -v paper.dropbox.com | grep -v edmodo.com | grep -v aws.found.io | grep -v accountkit.com | grep -v facebook.com | grep -v whatsapp.net | grep -v files.com | grep -v github.com | grep -v goodrx.com | grep -v hosting24.com | grep -v imgur.com | grep -v grepolis.com | grep -v innogames.de | grep -v invisionapp.com | grep -v dev.jivosite.com | grep -v lastpass.com | grep -v livestream.com | grep -v icq.com | grep -v icq.net | grep -v innocraft.cloud | grep -v live.com | grep -v microsoft.com | grep -v office365.com | grep -v nordvpn.com | grep -v opera.technology | grep -v ovh.com | grep -v betfair.se | grep -v pantheon.io | grep -v booth.pm | grep -v sonyentertainmentnetwork.com | grep -v postmates.com | grep -v priceline.com | grep -v pythonanywhere.com | grep -v quora.com | grep -v samsung.com | grep -v outfra.xyz | grep -v myshopify.com | grep -v binance.com | grep -v securegatewayaccess.com | grep -v network-auth.com | grep -v elastic-cloud.com | grep -v fetlife.com | grep -v filezilla-project.org | grep -v youtube.com | grep -v blogger.com | grep -v harvestapp.com | grep -v elvenar.com | grep -v innogames.com | grep -v legalrobot-test.com | grep -v challonge.com | grep -v live.net | grep -v office.com | grep -v newrelic.com | grep -v opera.com | grep -v opsgeni.us | grep -v pintrest.com | grep -v secnews.gr | grep -v semrush.net| grep -v slack.com | grep -v smartsheet.com | grep -v cyberoam.com | grep -v equalizerproject.com | grep -v soundtrap.com | grep -v spotify.net | grep -v statuspage.io | grep -v takeaway.com | grep -v qq.com | grep -v trello.services | grep -v cloud.gov | grep -v gsa.gov | grep -v tweakblogs.net | grep -v pscp.tv | grep -v vanillaforums.com | grep -v rivals.com | grep -v vhx.tv | grep -v workbox.dk | grep -v vk.com | grep -v yelp.com | grep -v travis.zapier.com | grep -v zandex.com | grep -v zendesk.com | grep -v freshdesk.com | grep -v harvard.edu | grep -v nih.gov | grep -v software.nokia.com | grep -v eventbrite.com| grep -v checkpoint.com | grep -v salesforce.com | grep -v huaweicloud.com | grep -v spe.sony.com | grep -v nike.com | grep -v soonr.com | grep -v huawei.com | grep -v surf.nl | grep -v cig.chase.com | grep -v alaskaair.com | grep -v freshservice.com | grep -v fireeye.com| grep -v station.sony.com | /root/go/bin/anew  -q ~/bounty-monitor/root_domains/hosts
cat ~/bounty-monitor/root_domains/hosts | /root/go/bin/anew -q ~/bounty-monitor/bug-bounty-list.txt
