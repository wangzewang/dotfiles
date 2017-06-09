#!/usr/bin/python
import os
import sys
import requests
import random
import datetime

parentdir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, parentdir)

MAC_SCRIPT = """
/usr/local/bin/wallpaper ~/.wallpaper/%s.jpg
"""

def set_wallpaper(pic_name):
    os.system(MAC_SCRIPT % pic_name)

def get_wallpaper():
    hdr = {'User-Agent': 'super handsome boy'}
    data = {'keyword': 'landscape', 'sorting': 'random'}
    try:
        r = requests.get('https://wallhaven-api.now.sh/search', params=data, headers=hdr, timeout=10)
        res = r.json()
        print r.url
        page = random.randint(0, res['totalPages'])
        data = {'keyword': 'landscape', 'sorting': 'random', 'page': page}
        r = requests.get('https://wallhaven-api.now.sh/search', params=data, headers=hdr, timeout=5)
        print r.url
        res = r.json()
        i = random.randint(0, len(res['images']))
        j = 0
        for r in res['images']:
            if j == i:
                pic_id = r['id']
                break;
            else:
                j += 1
        r2 = requests.get('https://wallhaven-api.now.sh/details/%s' % pic_id, headers=hdr, timeout=5)
        res2 = r2.json()
        wallpaper = res2['fullImage']
    except:
        wallpaper = None
        pass
    return wallpaper


if __name__ == '__main__':
    os.system('rm -rf ~/.wallpaper/download_*')
    pic_name = "download_pic_"+str(datetime.datetime.now().strftime('%m-%d-%H-%M-%S'))
    wallpaper = get_wallpaper()
    if wallpaper:
        print wallpaper
    else:
        wallpaper = get_wallpaper()
    os.system('/usr/local/bin/wget %s -O ~/.wallpaper/%s.jpg' % (wallpaper, pic_name))
    set_wallpaper(pic_name)
    # res = os.popen('/usr/local/bin/wallpaper').readlines()


