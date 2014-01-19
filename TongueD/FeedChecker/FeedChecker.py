__author__ = 'sysferland'
from BeautifulSoup import BeautifulSoup
from difflib import SequenceMatcher as SM
import urllib2, ordereddict, sys, cymysql, time, re


class FeedChecker:
    def __init__(self):
        print ""


    def check_feeds(self, ffserver_IP, ffserver_port, sql_host, sql_u, sql_p):

        cur = self.sconn.cursor()
        while 1:
            self.sconn.commit()
            time.sleep(1)
            html = urllib2.urlopen("http://"+ffserver_IP+":"+ffserver_port+"/stat.html")
            soup = BeautifulSoup(html.read())
            i = 0
            ii_f = 0
            jump = 0
            stats = {"stats": {}}
            all = soup.findAll("table")
            len_supply = len(all)
            for supply in all:
                i += 1
                if i == 1:
                    ii = -1
                    # Streams
                    stats['stats'].update({"Streams": {}})
                    for row in supply.findAll("tr"):
                        iii = 0
                        ii += 1
                        if ii == 0:
                            continue
                        for item in row.findAll(text=True):
                            if str(item) == " ":
                                continue
                            if jump > 0:
                                jump -= 1
                                continue
                            comp = SM(None, str(item), "index.html").ratio()
                            comp2 = SM(None, str(item), "stat.html").ratio()
                            if comp == 1.0 or comp2 == 1.0:
                                jump = 7
                                continue
                            if ii not in stats['stats']['Streams']:
                                stats['stats']['Streams'].update({ii: {}})

                            stats['stats']['Streams'][ii].update({iii: item})
                            iii += 1
                else:
                    if i != len_supply:
                        # Feeds
                        ii_ = -1
                        if "Feeds" not in stats['stats']:
                            stats['stats'].update({"Feeds": {}})

                        stats['stats']['Feeds'].update({ii_f: {}})
                        for row in supply.findAll("tr"):
                            iii = 0
                            ii_ += 1
                            if ii_ == 0:
                                continue
                            for item in row.findAll(text=True):
                                if str(item) == " ":
                                    continue
                                if jump > 0:
                                    jump -= 1
                                    continue
                                comp = SM(None, str(item), "Stream").ratio()
                                if comp == 1.0:
                                    jump = 4
                                    continue
                                if ii_ not in stats['stats']['Feeds'][ii_f]:
                                    stats['stats']['Feeds'][ii_f].update({ii_: {}})

                                stats['stats']['Feeds'][ii_f][ii_].update({iii: item})
                                iii += 1
                        ii_f += 1
                    else:
                        ii = -1
                        # Connections
                        stats['stats'].update({"Connections": {}})
                        for row in supply.findAll("tr"):
                            iii = 0
                            ii += 1
                            if ii == 0:
                                continue
                            for item in row.findAll(text=True):
                                if str(item) == " ":
                                    continue
                                if jump > 0:
                                    #jump -= 1
                                    continue
                                comp = SM(None, str(item), "index.html").ratio()
                                comp2 = SM(None, str(item), "stat.html").ratio()
                                if comp == 1.0 or comp2 == 1.0:
                                    continue
                                if ii not in stats['stats']['Connections']:
                                    stats['stats']['Connections'].update({ii: {}})

                                stats['stats']['Connections'][ii].update({iii: item})
                                iii += 1

            temp = {}
            i = 0
            #print stats['stats']['Connections']
            for key, conn in stats['stats']['Connections'].items():
                if len(conn) < 8:
                    del stats['stats']['Connections'][key]
                    continue;
                temp.update({i: {}})
                temp[i].update(conn)
                i += 1
            del stats['stats']['Connections']
            stats['stats']['Connections'] = {}
            stats['stats']['Connections'].update(temp)

            used_streams = {}
            i = 0
            for conn in stats['stats']['Connections'].values():
                re1='.*?'	# Non-greedy match on filler
                re2='(\\(.*\\))'	# Round Braces 1
                rg = re.compile(re1+re2,re.IGNORECASE|re.DOTALL)
                m = rg.search(conn[1])
                if m:
                    continue

                used_streams.update({i: {'feed':conn[1], 'dest':conn[2], 'http_stat': conn[4], 'sent': conn[7]}})
                i += 1
            used_streams = ordereddict.OrderedDict(sorted(used_streams.items(), key=lambda t: t[1]))
            for key, stream in stats['stats']['Streams'].items():
                #print "--------------"
                flag = 0
                for key, used in used_streams.items():
                    if SM(None, stream[0], used['feed']).ratio() == 1.0:
                        #print "Feed " + str(stream[9]).strip() + " in use, Insert/Update its Data"
                        flag = 1
                        try:
                            cur.execute("INSERT INTO `tongue`.`feeds` (`feed`, `feed_server`, `in_use`, `dest`, `http_stat`, `sent`) VALUES (%s, %s, 1, %s, %s, %s)", (str(stream[9]).strip(), ffserver_IP+":"+ffserver_port, str(used['dest']), str(used['http_stat']).strip(), str(used['sent']).strip()))
                            sys.stdout.write("(+)")
                            sys.stdout.flush()
                        except cymysql.MySQLError:
                            cur.execute("UPDATE `tongue`.`feeds` SET `in_use` = 1, `dest` = %s, `http_stat` = %s, `sent` = %s WHERE `feed` = %s", (str(used['dest']), str(used['http_stat']).strip(), str(used['sent']).strip(), str(stream[9]).strip() ))
                            sys.stdout.write("[+]")
                            sys.stdout.flush()
                        self.sconn.commit()
                        del used_streams[key]

                        break
                if flag == 0:
                    #print "Insert/Update Unused Feed: "+str(stream[9]).strip()
                    try:
                        cur.execute("INSERT INTO `tongue`.`feeds` (`feed`, `feed_server`, `in_use`, `dest`, `http_stat`, `sent`) VALUES (%s, %s, 0, '', '', '')", (str(stream[9]).strip(), ffserver_IP+":"+ffserver_port ))
                        sys.stdout.write("+")
                        sys.stdout.flush()
                    except cymysql.MySQLError:
                        cur.execute("UPDATE `tongue`.`feeds` SET `feed` = %s, `in_use` = 0, `dest` = '', `http_stat` = '', `sent` = '' where `feed` = %s", (str(stream[9]).strip() , str(stream[9]).strip()))
                        sys.stdout.write("-")
                        sys.stdout.flush()
                    self.sconn.commit()
                    continue