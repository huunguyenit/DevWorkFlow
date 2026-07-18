<?xml version="1.0" encoding="utf-8"?>

<dir table="dmctks2" code="user_id, ma_ct" order="user_id, ma_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khóa số liệu theo chứng từ" e="Voucher Locking"></title>
  <fields>
    <field name="name" dataFormatString="X" allowNulls="false" external="true" defaultValue="''" allowContain="true">
      <header v="Người sử dụng" e="User"></header>
      <items style="AutoComplete" controller="UserGroup" reference="comment%l" key="@@admin = 1 and admin = 0" check="@@admin = 1 and admin = 0" information="name$userinfo2.comment%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99AXw5MsedR0swKZZ1X9sU1nIpHPhMTdq7rheAe6C3YqTp0V5r0JQ2Z1ofaZermIz+Q==</Encrypted>]]></clientScript>
    </field>
    <field name="comment%l" external="true" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="user_id" isPrimaryKey="true" type="Decimal" hidden="true" allowContain="true">
      <items style="Numeric"></items>
    </field>
    <field name="ma_ct" isPrimaryKey="true" allowNulls="false">
      <header v="Chứng từ" e="Voucher"></header>
      <items style="AutoComplete" reference="ten_ct%l" controller="Voucher" key="wedition &lt;&gt; '9' and voucher_yn = 1 and status = '1'" check="wedition &lt;&gt; '9' and voucher_yn = 1" information="ma_ct$dmct.ten_ct%l"/>
    </field>
    <field name="ten_ct%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ks" type="DateTime" allowNulls="false" dataFormatString="@datetimeFormat">
      <header v="Ngày khóa sổ" e="Locked Date"></header>
    </field>
    <field name="user_yn" external="true" defaultValue="1" hidden="true" allowContain="true">
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330, 0"/>
      <item value="1111: [name].Label, [name], [comment%l], [user_id]"/>
      <item value="1111: [ma_ct].Label, [ma_ct], [ten_ct%l], [user_yn]"/>
      <item value="11--: [ngay_ks].Label, [ngay_ks]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDHwyWdnnAsOePGxNOFkX1ckpXBGN+CTzTFZ67lEOuvDpQGgJflrxT+eQQ65bNnRu7hegmt7B8OZmY8UOT3BY5o=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcI0P/H+AZcpPJ+89k+Mq/qfy7Lu3dAh0vq8L8tEZFoexUq2vPeLfyMMVAlROSy6kSqyQ6/KOI6k+9Fu6E8JCUVY=</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2IFUTeYgCI+m73yMqsqvhVfK/NCPDhMSW1bAIXdU+QckZVgeFDw1lvwzbW4aQLPjIwaS6ACvBtbFKkH8K44onDq//wP9L6RECYZlDoAlCwfP2Iwl0Bko+dd9T1mcRaadaRCAROFEKyP0/+Hh2jYQzAYhW5DF1kifxbi9kltF9tsiM/E+C+Zi1HVHXu8ILweQM4jb0WItrhiBSDCmxulpTE4VQ0a/EI0HH32HLt/hEspqThm5jlYwjrlYMU8D03bEzNij9/pzcgVPj3SFsZ/zj4MN35kiw1Mr6s6sFpp6zN+ONwUJnYHcTTCzWWsa5zmhlCLizOBcSoK2oFMr0wrqvNvtOszUOYV3gVmZy/kYTpr0EQuPmu4oztbliieMYzxcFnY9IrQ6TV2qUQwB0NlQwkdpbFpp3+fBQAAP3QwH4kaeCSpRFHjDHzOTjAaFfbDuFCvEYRxn50egNf8C6BnB4+3IpAeP3ssAvFQuY7Rhi99g==</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WtJF1Oh/s+pAZVy8P7PyYUDPpIynElV3UzGXmiEhxCHQQWY4Img6j96OrhuDpmmdojgBjgBMMQRAkwrAGtgz4SGuUrtN4h6r/2jGt2L3JgvIMWZW22NhyM9WCSLun2ZTc/2oUIrelEyAnrZm5i9excDtxhXvMSgFIUzZuyeStuh6WvuwsD5IMyjJPDf+Fueepsz4jHW8h83m/R1t+vLB7Bgq0Gm1EBb0EqFlIEepiStntZeSB1iw2AjpM67k6m5drRdLlPUJfHo9ggR68+x0bGVPPSa8y7oXewo/7qVlOcM</Encrypted>]]>
      </text>
    </command>


    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN20ji/gwivLiTaD/AJ0heO4xV2MCXI99ApiPqd3z+aU+D+IKVKBqCz/Z3S7J9n0YO6ii7dpAVjOGzGsyRUpqgCGVqjjig9DXxXX1z/CXaGz8v/s33Zvh455lqxilEoaSIGmKM/lM5mAZAcdewv4uuJ7I7h3ogLfAMPq4sbl10yClznQBZWydHJylNs44msrKWw/Yefk03KxsgqfdRt8f898SQLR4I8eL8NW2L4O9XRyFjm63Ybx1Aq85+OTOOkk9RSR9e3+e7HipWh2/WE1TXxF</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGJVXX1HOkuzBfoVThGjOSDTfc8PxYCovfM8KpPn0c3fMKu0TzZeaTdRmsZK5bE+kCYP5TygVW/nXw5ckkKyyFDG78Ue2q/f+Ya33dEUNGebqhyj9ECcFUbDNzJICpuIXNU6LLoqoU5oHkfMjkej7nY+q++x3xITtP7Bx6sfNOr5ealGAQtAKMAOJcHRuOvN1FXBEmMxdyF+GaQ13nVrhS9sTiSWVpShL7SlJjeEE8TkbrOWpCPkt0M9T7cc3Oj3Vx5NyxJhSNlCCAQ3cF9HPcph51hDk8B/plJlTcq+wi899BqnCWiCgsWO2eUHmidteBOyP/MVruYGTTLdkwO3Y0GdQNnF73bbBVgDuXy2i7StH56g929vbmOgkbNv3crltub+vm8SPpSCZzt4b6jMa0w=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp9ozwmNWaFXFGEKfmQZvzteTKVCQcnP/RuzmGg8ekXrsq/fXvoV0y1iedHe8Dvp3RiVjhzYthUIR9Sgczp9U0esfFgeNXClwQnX1ymqlq/ZRJlORdd77MNJocw6qOnuZdDmy2msC9y4Kv0xtKoXL4OF5rVmNtYQbrkegM/T681FS89gK3agUm8Ng02PrJoc2b3TGlCR4jSVmPaHsSH/FAKQhrJ4btVYNU2Nky74wczyELvuUSRrWvB1EfCUGdwiDb5WUE2ALHtuv+BzkwCuX3xa1kdfyn0zpgcEWhajE2EERo1uHJy0BeLNwx1dqIRjNOzmQz5HUe97UYix7lZKtuBevBL/Eo62tLO+1Kl+YD+Hd0Icb6moNYSJfR8V/EfCv7O8Wwjxdpwzv6PypZgPnIwph6TgSYWeMu3IYX0Qr6nxYQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGJVXX1HOkuzBfoVThGjOSDTfc8PxYCovfM8KpPn0c3fMKu0TzZeaTdRmsZK5bE+kCYP5TygVW/nXw5ckkKyyFDG78Ue2q/f+Ya33dEUNGebqhyj9ECcFUbDNzJICpuIXNU6LLoqoU5oHkfMjkej7nY+q++x3xITtP7Bx6sfNOr5ealGAQtAKMAOJcHRuOvN1OQaYUN06NKzL8xXURosXvhmVIDebvAx1OlSY+Loh8/VhRfbqLMvspoqggSChCLKx0wjefGMs5AwKRBzriYavOtTjAmh958ejCV+bd3edCc6cAT2qwFTo6wwYD3ZqZRM6XRedvUvoyeLNqJhTE+Brw/z2M846EYPrzpREyIY9NT4YWA0iKNM9iC+LiDjAZBxNKPIwDQM4WEsphg6+dU98GcjzkFtwc+ijjUDl7D4mJqQ</Encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMux7Mh05BTjhtCUATF6j6r0Z8HhV4E7a0zLzVuf1oam/lAYrwccdwgQa9OYA3DbERB+3HeuI2qV+XxkGPl2A6/r4p0am3RtlSUHNskN/C7Ch/FZW0jVuE8kenggW7/r3vA295bzozofij1IdUAa3CCCRWhT0wPPfYJyLWlXQ+xo0++RibicfzCg3V1a7nWhYgvBcI4gvYtmfURFdsg+BmmkjqZ8LHnENeLp022nbq9EdIgTvzqZ9MBxSiELgzoG6+8K4dmm5Rvck8M3/K2q8xoktF7dd88nriw2ImnJN7J8VDQNSyiHJPn4DLWcrc+LB0bqr5kPdN5SVMjsNrxSjC2nGKa+MqiRxNgdzAKCJUng63ajDIydxvAFK8+jERyY74fcfh3ixvfIRAvF+RIaNQLFs1dYs1rZ3bFb11+gn5Kg7xF5DxjbobFtICbuwpPIVZdQ==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtT4EZcNjRRJi8iXNg7cdd/iYnCUKwRzBAeQSnhb5yG8Rqk+EkiaFSXsFmnSiijtoETgQZ8ud8sjz/LGkDePbhMtb53vQIcNhcs1oAAA73+i6r99CO7/SvJFaneKLBs2jyR9eJFxTSt6w/s5dD6dHflyxfNH3ILSOve4j4ilfv/RP7hx6g7wqOmOJ28eK03oF3uykr5/eearDRFSCR8KCv7rcs9PbimIs/5EM+4EDkV9S3dwbOpVNfG+xDuwYlpEIw1UMII5PlTVbDIhk1a173000KhJFSES4ichZjTrdNO+nanUE/2xUAMe2UYfPx3Qveds886TTvwUsJGtW4lkAgmU=</Encrypted>]]>
    </text>
  </script>


  <response>
    <action id="GetUserID">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4axea3rs9GcwsMhUWTvo9nfXnlW5hQgEeyZG9SNz6jyDb2ssSnAoC8dpo5+yf3FbIhX22tHWRXslgTkw/YyMkKzcY4KJmtM+MAjmzsH+uycpJVXVYt0FSRAkP8p8Nlkbo=</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>