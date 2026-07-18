<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir table="vdmtbnsd" code="ma_quyen, user_id" order="ma_quyen, user_id" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc dữ liệu" e="Filter Data"></title>
  <fields>
    <field name="ma_quyen" onDemand="true">
      <header v="Quyền sử dụng" e="Access Right"></header>
      <items style="AutoComplete" controller="NotifyAccessList" reference="ten_quyen%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_quyen%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="name" onDemand="true">
      <header v="Người sử dụng" e="User"></header>
      <items style="AutoComplete" controller="UserGroup" reference="comment%l" key="user_yn = 1 and status = '1'" check="user_yn = 1"/>
    </field>
    <field name="comment%l" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 230"/>
      <item value="1110: [ma_quyen].Label, [ma_quyen], [ten_quyen%l]"/>
      <item value="1110: [name].Label, [name], [comment%l]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIXJw+y6RDyH7TGtu639WBSP0vG9LUzyuk1EG5RMzbIjml9PAbgbMqbu1H64HLqG6NVCB8EPLqF5MGlguhvAlTKQH3J3nadeDQEMQkbjgDeg</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHmttEt3N+Un1w4Vt8hY+oQc6wnpYLOnIuMD5E47cshg9xbMTYr0Y1xKFBugFGx8HGwsOoCdym8NSViklwsS/21TJOq/cQruW+eIUp2MJhdw</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9Ge+QSms2Uij978RkGV9TnfujKPrfuTOBE8OZlqaWBO6f7+9Vkm8iohapYQkzfsVAqV+tLhZ/k1QCuqVkklT+MTU2Y5qHofMwC8F+Q+7YvvODpMguPPaBTe75j8B2CrFz+83U7R4XbcnnX/4W4nHN+IdfcRdZ2j8cXSNQPFOITvrWbgRYSOxyMuowUTLxUm1VAb91A5WGt6kanEfXVKuYKOz0MWpD9kH2W0J0tH+NFh</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtdCZ0og3+rn/xGOd9dNjdtetroCZ/8rz+0tqbgd2J8Gv0ZFo1Uo2NxhRt6epwWlyh3oXJ/0qVDuUG75WrSxTME2s5yt4mscKuHWlYhT/3G7jqccr7kH1HwcCHzPm5tgMo1MqMyTmT0HMJOy7z2MZclcbp1Wu58JfYkRR3DCzfT+O4u60i+yqEnUvbB6lMcM/SNhsrEPFxfloD7Y8wM3ZMs6X374h2OVKubHuKeBwoqHwAQ5jqKIogy3E5saYcaTUzvviRsuNmM8z7CJM9EIsNi19QojVHsaptTV7kkmRykP8SY+TLAp7GPWXuBW7xdZqok9IIw2ty8Lzh9cEOTcYRsWX6Khubvnz74NMiotupTx8TcV9FO5ShO3g9XJbgaKJePMoUegp6WepOxIZZVSgnkM2fEy3yTeXmvduywaEo6kjIvtntCi0nKbA3Sgeh5rZIUpN4Qp1Z0UxX+jy9g0mPYe+MhxIdja5I/P+IoBbW0K49sAmHD6DTje+A+WAMsBeH/wvDnCAa57aNRsS7nKOzM8pNwgSKJ21QS6kJhejNPHg0+tqUAu0/DjMTySfuIEvG6C4BylUQG9DyHW8FN89UqlQFGFYxQoeXbzN5i1LWmx9LRRtCvR7pzvVyroMlEtEZwTvy78l26RKnmYg2W85IjqEYY2O7LaF/eObHWq5J0E9aPfh4DFIF3hUTBuA2MmQhdX0OF1RfsS7tQ/71W0vw3w=</Encrypted>]]>
    </text>
  </script>
</dir>