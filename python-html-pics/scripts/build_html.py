from datetime import datetime, tzinfo
import pytz
from mako.template import Template


template = """
<title>Nico Cam</title>
<h1>${datetime}</h1>
<img src="http://grahamcrowell.com/nico/latest.jpg" width="1000">
"""

ts = datetime.now(tz=pytz.timezone('US/Eastern')).isoformat()

dst = "/home/pi/Pictures/nico/index.html"
# dst = "mock-sync-folder/index.html"

with open(dst, 'w') as out:
    mytemplate = Template(template)
    html = mytemplate.render(datetime=ts)
    print(html)
    out.write(html)