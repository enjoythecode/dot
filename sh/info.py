# general info script for my personal use

import datetime as dt
import astral
from astral.sun import sun

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
