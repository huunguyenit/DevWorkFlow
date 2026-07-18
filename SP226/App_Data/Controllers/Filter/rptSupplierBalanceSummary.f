<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="tk" aliasName="defaultAPAccount" allowNulls="false">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and tk_cn = 1" check="tk_cn = 1" />
    </field>
    <field name="ten_tk%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày" e="Date"/>
    </field>
    <field name="loai_ky" dataFormatString="1, 2" clientDefault="2" align="right">
      <header v="Đầu kỳ/cuối kỳ" e="Opening/Closing"/>
      <footer v="1 - Đầu kỳ, 2 - Cuối kỳ" e="1 - Opening, 2 - Closing"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_kh" categoryIndex="1">
      <header v="Mã khách" e="Customer ID"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="(cc_yn = 1 or nv_yn = 1) and status = '1'" check="(cc_yn = 1 or nv_yn = 1)"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh1" categoryIndex="1">
      <header v="Nhóm khách 1" e="Customer Group 1"></header>
      <footer v="Nhóm khách" e="Customer Group"></footer>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh1%l" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh1%l" readOnly="true" external="true" categoryIndex="1" width="0">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh2" categoryIndex="1">
      <header v="Nhóm khách 2" e="Customer Group 2"></header>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh2%l" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh2%l" readOnly="true" external="true" categoryIndex="1" width="0">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh3" categoryIndex="1">
      <header v="Nhóm khách 3" e="Customer Group 3"></header>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh3%l" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh3%l" readOnly="true" external="true" categoryIndex="1" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" categoryIndex="1">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="tt_sx1" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <header v="Thứ tự sắp xếp nhóm" e="Group Order Type"/>
      <items style="Mask"/>
    </field>
    <field name="tt_sx2" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <items style="Mask"/>
    </field>
    <field name="tt_sx3" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <items style="Mask"/>
    </field>
    <field name="sx_theo" dataFormatString="0, 1" clientDefault="0" align="right" categoryIndex="2">
      <header v="Sắp xếp theo" e="Order by"/>
      <footer v="0 - Mã khách, 1 - Tên khách" e="0 - Customer ID,  1 - Customer Name"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="160">
      <item value="120, 30, 70, 100, 100, 100, 30"/>
      <item value="1101000: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110----: [ngay].Label, [ngay]"/>
      <item value="1110000: [loai_ky].Label, [loai_ky], [loai_ky].Description"/>

      <item value="1101000: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="1101000: [nh_kh1].Label, [nh_kh1], [ten_nh1%l]"/>
      <item value="1101000: [nh_kh2].Label, [nh_kh2], [ten_nh2%l]"/>
      <item value="1101000: [nh_kh3].Label, [nh_kh3], [ten_nh3%l]"/>

      <item value="11000--: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000--: [mau_bc].Label, [mau_bc]"/>

      <item value="1111-: [tt_sx1].Label, [tt_sx1], [tt_sx2], [tt_sx3]"/>
      <item value="111000000: [sx_theo].Label, [sx_theo], [sx_theo].Description"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 20, 20, 20, 40, 25, 100, 35, 170">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3ypD6wIWsxei97UUI0egwICDoXVdjNnZW6O5WtuqwUnU5rRVPTFwMeALn5c1iVKpYGHO34YP/BFr0XC7rM7citFs8s2xW1t3VmjsDbsb/qIl8goQ9KMQTRmCh8WghIT6bh2h5za1G9KwJfTMliCCiQdnc1V0Y8eJoC5XQJdu3CBLZTdWhmaZAVmRepr2CwUYgJW0X5ZRraBTiRssRfLVTKHyQrwJvUMfNxDDrFcd1VcGV0zjFkyd6XMJZEQtrslsTFHvHgthvGipU1/4XXoEMmpgJU72xxlLhDtV7kwDYDnm/pBFmYyyMOqH4NTzGLkuvHpQRclZasfP5GqY2QjsGWYlQSnZTHnXDUa9B/CsGS1ccKOkVskJmM/PKvrOQUKBUV26lIah9k2Q7oKkIq1G8zZNL1IEq+mxKfEGIwx1w5waTGQ+fwzlEglgZsFnJp8Aj0FhX/GBIGk2TCWilPT6ENaS1hG12tOBZTJmBIJCHYP6vpSTQT9zR2Sw2U/mWA0cw==</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EX+nmf7EB/LI6C1+yjwx9mI0KiftxZsqI+iHAn1M3wrYF8p6x/72sBFtmGRYp8emKE0M0ZKo3OHxOHY+RF0o2ncOESE/n+g9on0teAUepb8WwsKcchfurjDkh/hlDN5bKP9PtNR2F6Yp7mMAqL6bCbX47wO5ALFYI0/ArN8lwIBmapnhIUO4OBod/OTOuLBdEPj0sE+LOD/xyf4WFf0TrAT2/6oNEN9kVFEJhm6lchdsH3tiifi+0yii521V7iqslBYQqCEBQXZmelxpIuClw2gjvHGZjzMaP5lsnW+AxOFBZFIztqkFVer+7jOvK7g7WDdxX/GyjGdxumDjX3ObjuI=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD6TbO3opaqe/n04Q34AtpZ1kFiw2I6YDJ5nIJArEF00UAQPuE7LmyvOyrWFWtbBGwBG11+0Vmf4MKcYZnmyRTS4gQOQXy/OPdbk1KCUY+ozCEXici1bXsiHmr5GlzX2TOLg9oGy/p6kcV2xriRyvxhahGIvCKoqsNpfgwnnC01YjaYKi8bG6YRtRr3vIQfOh4obmhs4coIr/pmlikJlp49YceUos9DJswmLB5NpM+LgPbLBUaBbkS/t+hsqzkSSD348I3uKCg+HFrKH0ggiFMOIMqTfTck+W3vSfBJX4Iy9aCXyJcXzmpHr74M1dkCbbtt5nGzKfFImlgwiVknjBfRL7dRIP1bEEqJME9yLFmLaL4LaVc/mQdZr2PL5vlGXcrnLO27u0qbtlDbD+w4qekVDCXU1DlFheqqELZkbEwkmDq1RHrtLS05z9Mo2b5u9eLu4kPdLV+884v4J5tnC4H/KeEFMms0QAyJaCkpmDgMpIsowbYdMD8OLvZ98i344VgxCMjD8g06yOe/aQFzA7544V9yeA38RjuuTygd8CTzXcL0gfpKvvz++emuOWyxAhOVV0OVNlk2eKVM9Vf77eyYeH/Kr67KzACuo0lQT5viuRDUR+eKnM9aNIxDaVW0pts7FD0EDM4WzWhh3117vm3ZsDPCBxmdyjWsvjb/A2NUqwtWdOUIglkQkusWfXqJkI1MAgYLmbwO1oPQX8uw1pZ8gK7Dk/LpXaYR4eNbXumx9myDQYpIMRNYI6cK6Typa+eVdSYpph+khzsrVH17DrH1vhPu0VFPOct43nAjMsbXeA159Y0vKNtwffLx57OJmTDiuyCo2T3nZOORunDQxHM3tpumeepCTNWFjOqWbOTJWds73MSZ8KlY64DuY1nGHT9U=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu70QZzsPaDwFs+YifbSouifiyQBkdvDG95EJTEdIt66OvFJinP2Kyzj3jT0QRsptEHtd10cbh2SrPylIFj5NaMJwNlKL+MBMKVEzcTeSSvdTUxI3AFWOieIppRCsHZTGQdw76fQIA+YYN9rrtvA+G96tWO4qFyTDUIFrESeDKcsI</Encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>