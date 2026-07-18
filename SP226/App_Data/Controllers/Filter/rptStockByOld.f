<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptStockByOld">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY GetReportFormLimitRight SYSTEM "..\Include\Command\GetReportFormLimitRight.txt">
  <!ENTITY SetReportFormLimitRight SYSTEM "..\Include\Javascript\SetReportFormLimitRight.txt">
  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>
    <field name="loai_ky" dataFormatString="1, 2" clientDefault="2" align="right">
      <header v="Kỳ phân tích" e="Analysis Period"></header>
      <footer v="1 - Ngày, 2 - Tháng" e="1 - Day, 2 - Month"></footer>
      <items style="Mask"/>
    </field>
    <field name="thoi_gian" type="Decimal" dataFormatString="# ##0" clientDefault="3">
      <header v="Thời gian phân tích" e="Analysis Time"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_kho" categoryIndex="1">
      <header v="Mã kho" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_vt" categoryIndex="1">
      <header v="Mã vật tư" e="Item"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="loai_vt" categoryIndex="1">
      <header v="Loại vật tư" e="Item Type"/>
      <items style="AutoComplete" controller="ItemType" reference="ten_loai_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_loai_vt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>

    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="20" categoryIndex="1">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu in chỉ có số lượng" e="Quantity Form"/>
        </item>
        <item value="20">
          <text v="Mẫu in số lượng và giá trị" e="Quantity and Values Form"/>
        </item>
        <item value="30">
          <text v="Mẫu in số lượng và giá trị ngoại tệ" e="Quantity and FC Values Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    &ReportDataTypeField;

    <field name="nh_theo" categoryIndex="2" clientDefault="">
      <header v="Nhóm theo" e="Group by"/>
      <items style="DropDownList">
        <item value="0">
          <text v="Không phân nhóm" e="No Group"/>
        </item>
        <item value="1">
          <text v="Loại vật tư" e="Item Type"/>
        </item>
        <item value="2">
          <text v="Nhóm vật tư" e="Item Group"/>
        </item>
      </items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99I+KMgPNz07pZCHEPUE4q3LC4ORZ26bVTqIX9ZeyvpFUwIaGGVRGNDIw6ffwxRDdZw==</Encrypted>]]>&OnSelectionOutline;</clientScript>
    </field>
    <field name="tt_sx1" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <header v="Thứ tự sắp xếp nhóm" e="Item Group Order Type"/>
      <items style="Mask"/>
    </field>
    <field name="tt_sx2" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <items style="Mask"/>
    </field>
    <field name="tt_sx3" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="162">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110: [ngay].Label, [ngay]"/>
      <item value="111000: [loai_ky].Label, [loai_ky], [loai_ky].Description"/>
      <item value="110: [thoi_gian].Label, [thoi_gian]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110100: [loai_vt].Label, [loai_vt], [ten_loai_vt%l]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
      <item value="11000: [loai_du_lieu].Label, [loai_du_lieu]"/>

      <item value="11000: [nh_theo].Label, [nh_theo]"/>
      <item value="1111: [tt_sx1].Label, [tt_sx1], [tt_sx2], [tt_sx3]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 25, 25, 25, 225, 130">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnZPRiKEfPKjxHBmJnvU1lVtlo+1Oh7odASSFZnsPBg9Zo+rjYXqzXYFeMYQpMONV0=</Encrypted>]]>&GetReportFormLimitRight;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcM0GUti1kCp50u/Joaj4mLrRFBFrkg61EVyh0XGpA19zx05m0tH1OgdPSKya+jhQB92mZjn9Ot4aMXMuRM9wUx/xclTHT0ytQP5YzsDNDeJ2</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterClosing;

    &XMLWhenFilterQuerying;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9Ge+QSms2Uij978RkGV9TnGDPNRfG3RLSraAWcCrRTyWEKmbe+uVbKME2K6arOL8AkjDtBDpiQJo9dlxBO239KBP7/h2z/ecmqfV94fmSa1BKEZNMmZ4dmNLGJDILUHQwDVHpAh40yNzzP5FGGtZCJ+XV5zVY0a/ia+PSKBA+FBIpDO7hm0/ALD5xwcmYBq4FyWngJBKo6auphxiz7CnTx2T3lGav6FotEfvME7cZ8AxJ89H2t7swIOJPwO/aaaAua0SfP76AuT4rSMjHjdKHwbi2NUee4d75caVouR1drh+Nc/eNTsVVMSx4RT+yV5YcJNhKccZLb2jFy19Cr2DsG/OEPB/RwmoWdiW9KjiQ49d42yvQqPlt/ZCLT5a+2SltFXORK3VnWrzKFDJhXwPi9EvglYw4TgvzwmPHXJSQXE2Ce1NHz7hub9EC+8W9K0gKuRMytEeCH+K6PoUq3CU1KH8ZBAW6g+hS+JelS35XBJl+DWc5m2l7WjFlEYhgTMAzdYn8GB4G94UqSXakolOnW+/BbVox+t3yb+isWjtBfg</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kaM07Xa6/jgsfBLWGL2sfcnf/qpxGsTLB620BgwplLOpA==</Encrypted>]]>
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
      &JavascriptReportFilter;
      &OutlineEntry;
      &ScriptQueryFilterString;
      &SetReportFormLimitRight;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtWAh8JTZcziZCG2on2ZWLl439b+vSq+OnSYZFzdng1hLp+JQfVx5HW5IwgFXUCaddTsp7U9ZWx0GkOx7zNT+wHycKe5vriSgMXKap4dpTXObe60rfvRU8uLls/4o2eXGMS9U7IBZl3fbfp7eLKfjTM3T00LzetkYbE/fiHixCOamXMnPwH23ook+Mfi3/RsiXXtmXEDzioBJLjvNBOLGpWaKxBdzovUiO6dAliX247iZckBeB2bLVk372P1dTlyUuXQxy+GcqmaAIgXGbQvBeNo2NGGgxmPwyEHVXTUpQ5ekt2mNxHmuNA7ZNhdMZFrHWjdcmW/leuyaKDKxqiOFuZDTx4dkAU05ol7HuQZFvbujEXWqlkTdqbcSJk8+lP/4gCFiUlEecRVW+vQy4AFQlO8fdQBAe6Sp3u+Wj4lxBid5JVDF3GhBDVhQfEqKDIxcmrRN7PDBk/vFAOETQ8eWWPbbk8m8scsco6OJxU9G31UqsA9HlMFVo999f68VsCOBXgOGUsH/sfEE1Y7D59Xr3H5/MgKiubyI8GcykkPk0KWZ3nEp7TWvw0prg/XEvPY5zt7kPta9gv1mz9wHB0SWKyhkpgOZ1451tmwRzsDaNdDisXajFrwarutL48ZYFK2EzaQ1qy77zCfSDpmLvJXRoSvPdkeZv2Vww/a00WxRaU5GEA/24DuUpTRiqD8n3LrCEb8qfjDx12bbXly0dgpmGJY99wIR4snxNesbpunvipd/UbCzFjmadCq4zyMElvwNSijLGgBMGgvnIxbuVOOENfmx3ZpXUZo24hxsUXOoHFb1M4PrC9POHkgg45DRGsHH9URvhoXPX+vBluuwsQLsosqG5lmWwU6Gp8klAC/eOgMxE6fDgSw4pCyY/PTHfowjIDG6304+cdQ87B0svcYPXUw=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>