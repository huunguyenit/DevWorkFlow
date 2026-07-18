<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\ProcessLockedDate4Unit.txt">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Bút toán phân bổ định kỳ" e="Periodic Transaction"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth()+1">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()" allowContain="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit(s)"></header>
      <items style="Lookup" controller="Unit" key="((@@admin = 1) or (ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and (r_new = 1 or r_edit = 1 or r_del = 1 or r_access = 1)))) and status = '1'" check="((@@admin = 1) or (ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and (r_new = 1 or r_edit = 1 or r_del = 1 or r_access = 1))))"/>
    </field>
    <field name="keys" hidden="true" inactivate="true" filterSource="Infinite">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130, 0"/>
      <item value="11----1: [ky].Label, [ky], [keys]"/>
      <item value="11---: [nam].Label, [nam]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB7kWGXteUkkIuFbGcTPpDcE9ajFKwmqyVZcsTpkG+fL0ZZAPPIB9kjN2n9AM7nUK6GHLw6g54Wap4uJBtHQfp62WqZG7n7l33DCadnNTCzS+</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUF3HXHrbxuY4LuPOohUGPKdRF681Z2ytPu/d50B0e5lZ80e4lyWd1eIdxmCs48U12H33ClNR9kRx69oywleF8gCZcfA8Cj/OiV5wKdT8xaKL7hZ1YaZMBbOt44NTBInNXSh2oObAW+bFP2NY8fAadLLoXt1dX+UElqAPTd3vIvgbK4oKX/WqXuvkVoX5P8DvkoQ0TKqgW8a32CqA+/UFHJlwiDKXOwMxLQ2B+tY3n8594UU/PFazwOtk50LA61Kv5P7cVuKft4FA9QujNM75PQDTPKHQ/nHvtdupkryL69/4jIIQUDdXTWoB8aa93UIY9yBmUd5bVv7+o96fYD7SCG9dYsqB7X9aT5tt0ll63czAG87TPBlXl/z12CiQN3gz1VDOdkJ+zjMNYxftoYiFhPK5dUwsQhgSbKh9ybKsLNMkUkH0mYGjNXRXQ0SJvURmBXwyU+f6aYddO/1yM65Z4rIkrAYWSOswaUe74cEmgIwKv+ZLMixBqqG9SKZuNzX+62zmZVSIAGxW07xdlOigcKnGHofC+VYVk95bGi+cZFDfQ9+TLMcixJW+REx0UFI8UybW+dnmElptDeOZQpG31dw3OAd4gt9AgY6R1DscSaL+IgLksFu4v06s308EH0Y8ji16d264tbMbEHY3c5N54u0sXeCxRuU6vHP/323OhCaLtMjXEjMWobtc1j0/3nqiBV5p8cj4BlYubizCem/z4wN6BqluOTPh1R4yx8infag4VkWkS7qzbwHjYC3dNb7Z7kocK8VWRy0i6mQIW+K43LWCnA1Knu5ixkDWGyJzH1LJ30dm6IlRRkkLx2paYNWZa</Encrypted>]]>
    </text>
  </script>

</dir>