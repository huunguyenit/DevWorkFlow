<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir table="hrca$000000" code="stt_rec_nv" order="stt_rec_nv" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Sao chép theo nhân viên" e="Copy By Employee"></title>

  <fields>
    <field name="ma_bp2" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hreDepartment" reference="ten_bp2%l" key="status = '1'" check="1 = 1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99I9uB4+Nhkf3VOM/lkG7FE1qRmgXLPJNYuarng0nTzBQoAjTQP/DfYv/OsAYsD9vFXxxbgG7A5ioMndgqh8LjwM=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_bp2%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv2">
      <header v="Danh sách nhân viên" e="Employee List"></header>
      <items style="Lookup" controller="hrEmployee" key="bp_ref like case when '{$%c[bp_ref2]}' &lt;&gt; '' then '{$%c[bp_ref2]}%' else '''' end and status = '1'" check="bp_ref like case when '{$%c[bp_ref2]}' &lt;&gt; '' then '{$%c[bp_ref2]}%' else '''' end"/>
    </field>
    <field name="type" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Kiểu sao chép" e="Type"></header>
      <footer v="1 - Chép đè, 0 - Không" e="1 - Overwrite, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left" readOnly="true">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left" readOnly="true">
      <header v="Đến ngày" e="Date to"></header>
    </field>

    <field name="ma_bp" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vtr" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="bac_ql" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="employeeID" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="bp_ref" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="bp_ref2" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 10, 60, 100, 230, 0, 0, 0"/>
      <item value="110010111: [ma_bp2].Label, [ma_bp2], [ten_bp2%l], [tu_ngay], [den_ngay], [bp_ref]"/>
      <item value="110000111: [ma_nv2].Label, [ma_nv2], [ma_bp], [ma_nv], [bp_ref2]"/>
      <item value="111000111: [type].Label, [type], [type].Description, [ma_vtr], [bac_ql], [employeeID]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMUMGaUb9sqzhcvJsBEUvrgp0AnpU8DVe+4+BWbD7oij3sxIgGh2apaD5P13InfJQMn6zPWLqcupJHEtbCfXzk/r70zc2bRfQDwHLWlXO1hu</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMt1oHfmSZ/Mwp4FHr/BqIwU6IWZf14ZJGRqEJfRetBxJBlpx2d4NukmMBZaYnWTZpMQ7VytRNHFUikrREe9gJffCeYXTU+yDHRIB7YeIUDv</Encrypted>]]>
      </text>
    </command>

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssTzqMI4HZEaHd24iL+EorCSvJswn6+XHpefTdX4ErEIxUTRwF6eibn/1TJ06lNh8P6jG5fn+ucXIphhRMEzWBdslyymEt6tNBt1mqV2BycZSBZj56NXemhAh7mtVh1qgI5TYOHob/DZeunDMLQCPotj</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2ETHfkvrzc7igZ66pK5uEPH/g/vCEl/es1YorZv7KY8VOvTomdGAsanuHi3NEzZ/Z+GlL7nKrmVgLa6sU7vJp45M30NrtqfVNwDrbO4mQLMtvlWsAMOMkQAS9oXdC2cvAMOnYKF47BNRsPBNSO1YQVg78mQhFH5xfrke8UVOC4VVfzQsSZJn0KTtBibqeNp2vaj6tdI9MYvfaIZhcydtfBVEIUd1snuD6Al/8WBx6NWeDDMKCdw+QmUrUdk9+6BdSl27B0ZCMfoUqNUMp9+LI9BtN12UMKUGh8KRmf81MXaLU0R0ll2Xby+DGxBm2+Xmgfg==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtZ4U1jXLSDdXIUZ789fJPaT5rBwcz8nyt7BEayDZd7zgKyqmIJdXDWEghwDgM0vlV8mF0znBrzrmjVSUivPIYQlMGm0wnIKGBVskuB6fI/58MrN1aRjokLtaQ+1V+MhxbijpPo2br9wnBNUirdkltBU3uv+8gVAVIqJlbYmUJ4Wl0xYK6IKdbOGctasSQinNRu0nBGCKMrwb0fRLuSV2YKvqKE9qVpTK14t7Rk2QLQ1pvwqVH8MVFR9avxgcF8NY9xg02C8btuH6k3Q8HFjQxPC4ymUrMpHcm/ZVQ2JkO8Kl05B+zmAt+DFiUknO7f6OtVczqbnRw3DXcwEBDEl2/ooEVJp4t53Kg64DSNDTAvr+Pr6kscm+oRc3CcV5RT3ev5hadOmSuiYuTtAdNHDTHwtkhdmUiSHKJr9vasmEKFfoorQcxQJeLt+WjzV+rp0daQe649wYK9zi1/WlzvmuFQQuflFZjNs8xAgbNlyvcHCPmOMNTPHM5xTtESLMWQ+ymcgFo9lGjOGCCBlw5hhSM7gVtMRwqz92G1bKs3s663bJlOEfQo4vymOEGEYS0ZpB3xGGAb3XbZ7RkJvhrU4wqPY=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Reference">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/oKUmX0302sbDhc8SCfv6qyS+57AZX9OCiqrO8xBUUDDla/S+iis315fb8H1wy3bNUsmpPt7PJrYyq6X4mptNX3DKas7BI64B2LRp1VJOARoAZuWnTSKjK6ZADNk39h7HTzNiwidGjIdhXsb2Qgt6PVLzN/Pj4zjcge+JV5MdQg</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>