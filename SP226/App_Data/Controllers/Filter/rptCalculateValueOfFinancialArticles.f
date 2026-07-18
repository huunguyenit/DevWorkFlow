<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>

  <fields>
    <field name="tu_ky" dataFormatString="#0" type="Decimal" allowNulls="false">
      <header v="Từ kỳ" e="Form Period"/>
      <footer v="Từ kỳ/năm" e="Period/Year from"/>
      <items style="Numeric"/>
    </field>
    <field name="tu_nam" dataFormatString="###0" type="Decimal" allowNulls="false">
      <header v="Từ năm" e="Year from"/>
      <items style="Numeric"/>
    </field>
    <field name="den_ky" dataFormatString="#0" type="Decimal" allowNulls="false">
      <header v="Đến kỳ" e="To Period"/>
      <footer v="Đến kỳ/năm" e="Period/Year to"/>
      <items style="Numeric"/>
    </field>
    <field name="den_nam" dataFormatString="###0" type="Decimal" allowNulls="false">
      <header v="Đến năm" e="To Year"/>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" onDemand="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="161">
      <item value="120, 30, 40, 30, 100, 230"/>
      <item value="111: [tu_ky].Discription, [tu_ky], [tu_nam]"/>
      <item value="111: [den_ky].Discription, [den_ky], [den_nam]"/>
      <item value="110010: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6aT45fUUYtbmQe33CA/J/ZJbkJfh0qEzc7pyec535z51r7meoXzJFbFMTn8kbOPIafhmo8nXJsiMbXB39mihEgYJOX9oOoNljQJbPosKbRwVJzKO2DWhWd5yghiHNjkuEEM20e0irKQfUfIuPtPsKG5GT4vbPGREEAQsmcy70eM4MaaWTYsmycIWmrATQc1ceq+2s+YN79+L9isjO/ZzTFU=</encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7Km0dPcpP3WEHPRCYQOYrarGNaCXKQZqBqooA/e60XTUuwEQIEqm2WIbnNX3xF5UHcujZlJTCLCcQw05gTE65Q/fgwON5UoJHW3J/jnSMR/ihFPHEQz47Sc9ZiWZxMaDMN5ywX4OFQCYZ1T64f58mvuI=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYlBO1TchDX3wJQH+G8C8hk++lkbqnqXxb6eeqC1/k1a7N5rsDRZKXEWxPBXCsg1VCSJ9PmhfrSF5Dvk1fRRXRYUlmS8x+HqJaVbuLIexZc+JoddSVlNAzC5mDM2grHQ/0b65rUtBnjQPGz9UZUAMzUFswV9+fHGRusywruXSP4WcXXnDPOrgnQ2WJojcxGD8XIjCsXPtnl6ThUUF/UzoCStyauZRVYalwGphMFcWscNGJBBL4D1JH0U0wT3vlVPCSaRCHQkg8c2s7QWHoG3ATGOBEBjKbL5hqXB212p+T7JZEgWlF/Vt20OX7LYFttZ1AYsnQ329FdmI99/5U5Uysb3UgGW5mIyGY2qTy0HZOQQo3rjVAwa0YvLdBt20A+SJpdyxzOx3F0P97CRJbU3c3tqG9KoD0QhfoNhSt3t1PPFCC6UXpGCqx3JHLREkzVZ7Utek1EJNl+L3PtJBYVgt6n60OO1xKRYeTgDzYGVP7fVZzQ4yrkpHL9MZQDQl/HX5d/dsnjHVjdPToxoAmQy/pqmEA6ZKlc+KXZnauHxgiUxltIZO0Hnci1Y5wYVR5t8rrFZ83n+uzUIkOco2UijsVwfXfBQJ6n2dD4b/HLmPDKCobfeiMaK2SYraQGhwnG5WKHlRvfPVxMRmKLHMVDr7eY8cep5Jvw7EQdpegJ49iDahOSnePgONLD0YLBPhXXUhgIlVOve0SFy2YMnlTCk7ZhcG+ajBT4wig4jEXBX/7obTNO5BX7AIqCnhOmPuJu7dNBu7FgoQG9vHdbVjDTWzY32q3RYfxudhYQRiE6jlF2UCq6kFqwEsiRvtebUJ5YbciNMxz/4Vd9/aK8NzQ9XKBNyqPkP5E1l7bpayArPx3i1wwF3UC6pKa+vpPk0QbttXkPz4EpgY9VcXIOv16Fu4DezjrDWA1tgQTKHILvUDCYsjFasbelCaBDqNZRzknX2lOPlKdkSbITVAwz2z7CqCTyeU6tGijpI23oo6qEtJxbgZCyOno+hLHoeqEVUxjzmnN22HFcZBf2u6YC/8S4wKQuvHXB23Fxa/EA9N56Zisvi4=</encrypted>]]>
    </text>
  </script>
</dir>