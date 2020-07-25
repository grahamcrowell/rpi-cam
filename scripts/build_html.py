
#!/usr/bin/env python3
from mako.template import Template
from datetime import datetime

template = """
<title>Nico Cam</title>
<h1>${datetime}</h1>
<img src="http://grahamcrowell.com/nico/latest.jpg" width="1000">
"""

dst = "/home/pi/Pictures/nico/index.html"
# dst = "mock-sync-folder"

with open(dst, 'w') as out:
    mytemplate = Template(template)
    out.write(mytemplate.render(datetime=datetime.now(tz=tzinfo()).isoformat()))