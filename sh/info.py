# general info script for my personal use

import datetime as dt
import astral
from astral.sun import sun
import hashlib, datetime, struct, requests, re, sys

# adapted from
# https://geohashing.site/geohashing/Implementations/Libraries/Python
def calculate_geohash():
    w30 = 0 # apparently this should be 0 if I'm west of -30 longitude and 1 otherwise
    date = datetime.date.today()
    url = (date - datetime.timedelta(w30)).strftime("http://carabiner.peeron.com/xkcd/map/data/%Y/%m/%d")
    djia = requests.get(url).text
    if 'Not Found' in djia:
        return None, None
    sum = hashlib.md5("%s-%s" % (date, djia)).digest()
    lat, lon = [x/2.**64 for x in struct.unpack_from(">QQ", sum)]
    return lat, lon

def astral_stuff():
    # https://astral.readthedocs.io/en/latest/
    austin = astral.LocationInfo("Austin", "United States", "America/Chicago",
            30.266, -97.733)
    timezone_delta = -5.0

    city = austin

    # suntimes today
    stoday = sun(city.observer, date = dt.datetime.today(), tzinfo=city.timezone)

    sunrise = stoday["sunrise"]
    noon = stoday["noon"]
    sunset = stoday["sunset"]
    now = dt.datetime.now(dt.timezone(dt.timedelta(hours=timezone_delta)))

    def fmt_datetime_with_difftext(x):
        hhmm = x.strftime("%I:%M %p")
        delta = (x - now).seconds
        dhour = str(abs(delta) // 3600).rjust(2)
        dminute = str((delta % 3600) // 60).rjust(2)
        dsecond = str(delta % 60).rjust(2)

        dtext = f"{dhour}h {dminute}m {dsecond}s"

        if delta < 0:
            return f"{hhmm} [{dtext} ago]"
        elif delta > 0:
            return f"{hhmm} [in {dtext}]"
        else:
            return "JACKPOT!!"
        print(delta.seconds)

        return hhmm

    greeting = "Good late-night"

    if now > sunrise:
        greeting = "Good morning"

    if now > noon:
        greeting = "Good afternoon"

    if now > sunset:
        greeting = "Good evening"

    print()
    print(f"{greeting}, {city.name}!")
    print()
    print((
    f'Sunrise: {fmt_datetime_with_difftext(sunrise)}\n'
    f'Noon:    {fmt_datetime_with_difftext(noon)}\n'
    f'Sunset:  {fmt_datetime_with_difftext(sunset)}\n'
))
    # sunset today
    # sun at top today
    # daytime today
    # daytime tomorrow

astral_stuff()

print()

lat, lon = calculate_geohash()
if lat is None:
    print("Hmm, today's geohash coordinate is not known yet.")
else:
    print(f"Today's coordinates are {lat}, {lon}")
