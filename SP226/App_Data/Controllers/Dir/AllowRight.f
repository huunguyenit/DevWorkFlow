<?xml version="1.0" encoding="utf-8"?>

<dir table="userinfo2" code="name, id" order="name, id" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="quyền truy cập" e="User Right"></title>
  <fields>
    <field name="name" isPrimaryKey="true" hidden="true" readOnly="true" dataFormatString="@upperCaseFormat">
      <header v="" e=""></header>
      <footer v="&lt;div id=&quot;treeviewPanel&quot; style=&quot;width: 542px; height: 480px;&quot; &gt;&lt;/div&gt;" e="&lt;div id=&quot;treeviewPanel&quot; style=&quot;width: 542px; height: 480px;&quot; &gt;&lt;/div&gt;"></footer>
      <items style="Mask"></items>
    </field>
    <field name="id" type="Int32" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="flag" external="true" defaultValue="0" allowContain="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="r1" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="r2" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="r3" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="r4" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="r5" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="r6" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="r7" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="r8" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="r9" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="r10" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="r11" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="r12" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="r13" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="r14" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="r15" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 100, 130"/>
      <item value="10000111: [name].Description, [name], [id], [flag]"/>
      <item value="111111111111111: [r1], [r2], [r3], [r4], [r5], [r6], [r7], [r8], [r9], [r10], [r11], [r12], [r13], [r14], [r15]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf/ckpAo0/H/URcTCmqyL6SELW2rrMvAvGar3RqvUzwXQkLEmS75PrZW5gYmlOkVIkT0BAagbOUlctCKmz7kQM8euR90xwKMn9acoHtJ/tfE0RTMHwg/W0nsIJI5IoZt++Q==</encrypted>]]>
      </text>
    </command>
    
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Zr2y5pKQTNobdB3ru1GxH9EOPDITmfqYvcXhQn8DwvK5aKcg2ZL4k2xOHhBpJkdIKprxdS+UGy+u07Fw+mfOPmdIRSc7g7/j4B80S9xKYUrQkpR4aihBEF42eqJB6ZHaZJCOwJy9Ug4e4zc2zPOIlxzukiaqBf/QTJZP66sbJzCOeAu2yZMj4v/4euGsECFXQ==</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf17SB624yUQlLPN9Ubj+9HwdSdd+5+qRrULzRJ4h8PlYaxd71HU72GrP4ApdfvtMvvNxeQ/aDBt3QE2f3fLTSV4=</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70JUGaBu1BDltEZQ7rukebSI14IcDFJs4ciCJD9gwVF7h2c9U0oYJyoHJ8fnavGvV6k9uyqL0ZDG/7Fi6l4d1GyBRtantngM0D3Uy7yyQ/QJJIxqEUVDf+fgf4E6m83nib8Yjp6cdWrWV+bGNlLqRcp0sdKrKSDEYevqXVCwzBwoWD0es/DXaLlwQv83jCGRf33dE4uh1hjafrBU93AV1v+AmqmyQdQh1MmEVFKyiGM0j</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+Zx1yDyahjHjZsk8BYfRxLd0rRTloFqOVegRUt7265Hv1TjB8Hzej1xMZBBCYykQhg3eaCO6umqDKZXtStIVXNWbWBJwcI5IlfMW/7gxq+DQOb67kCvWdOhfrUgcdwJQerkAMOlmXBfPu1HwHz0u48elzhI4zGUcpxjoA1w9rsyj64x8kPIq1/J6xi7WBcUpjmoxJ0EtPRzl/ZgmHp8z2di/jiRSrF2pvy1/eYjrDfM0sD1h833gKLuU9F71ILlQsmqmANL3cXsHULJGArh9wyVY67DPFvfqwOacBCizCU/xtkZIzVKGXDlzeGFocIgEUrdS7REoeSBh5WaZ6gDF9DyaFtMBaxKr6F3kxV98tmmv6hUlkqA2EBvvjzbt/p6noIWgdVwGnPoCcCegVgxx55yeU3cKf37XtF+tHWNmrCVTmodKTZ7c2lYo2VU8xuBpJeka+4ahlnBBqh/PMOpYZ6yNwd0rmowUvpAn5uBI8OnEM5rYaWi3A9t+r+7WswFWNcqDvHrU+bqlKS7GHkIy+F+2K6I+OyrAXNHpOvjaB+q6ZLxL6+llUMfy3XdooWuPcUEPEkA+7Sjljvm2VrccYmN8vZaz3Rhv5U2zDwDKpvIiOWs9sbmTbcnQ9xCICaNr5xeuL6OH3Ac35zoQmvaZ/MAcK71Sqfi2/W/h40oJDUEgY5VEteXoOqg9jjfvV19dzVvatMFW/omO3sERUIdvm/O5SNrkcZnZeGQY4Is1orVTZLoRLpes/Bgmvy2nDKIwDef5B6AkNfmAy+Z2dE+CNgqvX4QXw43r8NfQa0zEnad</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%dUxtAbG76hDnHEpXdcWHx2Qs+0tWXconatdmGK9nADg=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KXS4vuR9ZD+wIst6qi7fjnwXMVEQgBgd1hTnmRmEdChMlcgxnA8QUcipcbMlLSSMEg7FuHKeDieyrPuG33HqAe8u9VyamYwEQf3Clamu8nwZASDwVtnwhMXAQS/4SGHSyPp4RNZrh1kS/M5+Rmyr/jwPR3oTkbJY/0TT3mKtasLg8FHxbBQ0oeKJNTjVIdMU7okxCmzHR6XKIcUiZRHwKV+QRSyCdlD2nNkItFwKeQMFnEjjZQISHNTPPyOa8bTp2/8NtedLujR0NY2wkWabuvXiBAeiQdZR4zjjHwyKna4/9s312qfopBUQi/mbKDDSfQAUXpgD6o6UWJm7+8P29PuU1GQH7u4sU3g2WBeOXK84KK5YYnbQHc1hSnzkICYS0BMph6C32uTk+PLiq/4Bqg4JK8/0fyK4qxzA3Y8OLT0JP/OrKoEXHZN6nh+J98rY/9TEdswdFCZ3CArLk67Pm/j4q5RpWUVFAY2XrB92zMAM/BiSHHhPGXL/arH1sh0GuHTflIxW3pGDy3tVqD4p91H2KWyGukIJ7L1duPTUbf/Z8TEK2HmTfyVpE1yVf3g1kV6jxU1GHHH1l0+URjl44FX3+Xtc7BYQtCjGJB1Yhtm3xTxoZw1TrZu1giVbNq+kW3MyHAZX9UVGdfDYJCr5MUV4ZNFx+z8cNDzW21QSBmrabxRG4CKXBiKkAhDa25oN8xb4WDRiX/NysXzX0Vb+Ru8GcFd6Nh1Wo+pRvex+1fm</encrypted>]]>
    </text>
  </script>


</dir>