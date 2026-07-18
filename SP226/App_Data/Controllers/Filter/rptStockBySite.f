<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptStockBySite">
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
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày" e="Date"/>
    </field>
    <field name="ma_kho">
      <header v="Mã kho" e="Site"/>
      <items style="Lookup" controller="Site" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ma_vt" categoryIndex="1">
      <header v="Mã vật tư" e="Item"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>

    <field name="nh_vt1" categoryIndex="1">
      <header v="Nhóm vật tư" e="Item Group"/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="nh_vt2" categoryIndex="1">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="nh_vt3" categoryIndex="1">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="loai_vt" categoryIndex="1">
      <header v="Loại vật tư" e="Item Type"/>
      <items style="AutoComplete" controller="ItemType" reference="ten_loai_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_loai_vt%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>

    <field name="gui_ban" dataFormatString="1, 2" clientDefault="1" align="right" categoryIndex="2">
      <header v="Kho hàng gửi bán" e="Consignment Site"></header>
      <footer v="1 - Chi tiết theo kho hàng gửi bán, 2 - Gộp các kho hàng gửi bán" e="1 - Detailed by Consignment Sites, 2 - Collect all Consignment Sites"></footer>
      <items style="Mask"/>
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

  </fields>

  <views>
    <view id="Dir" height="162">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110---: [ngay].Label, [ngay]"/>
      <item value="11000-: [ma_kho].Label, [ma_kho]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11011-: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3]"/>
      <item value="110100: [loai_vt].Label, [loai_vt], [ten_loai_vt%l]"/>
      <item value="111000: [gui_ban].Label, [gui_ban], [gui_ban].Description"/>

      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
      <item value="11000-: [loai_du_lieu].Label, [loai_du_lieu]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 30, 70, 100, 100, 130">
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAPMvI3wToS9XrFl/A6NmCkYAuLuNWLaCOo2VdnnF/y/FehKBVKfRAE60ktbgXcuAHonpSU0Cvq1afl/1PziT1jLLUUacDSUabmB/yHDP0nfT1nNl5KkzGy3ltGswCrMOn1rxSHBzGOV+NLldLnq+SQ248FYTrW17TimtY7nU0TB6ZDPjNnAHGLyMzCL5MRX113dywDVsuSCsQftLm9nw14=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kaM07Xa6/jgsfBLWGL2sfcnf/qpxGsTLB620BgwplLOpA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      &SetReportFormLimitRight;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD6TbO3opaqe/n04Q34AtpZ1kFiw2I6YDJ5nIJArEF00UAQPuE7LmyvOyrWFWtbBGwDeCKaKfcnegfmtGIDFad6o3W4hCkcDwL9gKk5JaFdK0pvxKF/63pWSUlVGe2zrbZ2HHWs2K0tUtuBNEq/CMwe2PPLq5fL0o1upRsuJfYCne9tVhjXC2HPBFpZjMY00+DwyF7rPmBHFGKefTbf14TRdasJiLHxziWK75sie3Y/IhSODCc6p+YVOV+h7rSgv5Dy6QBSkzJEKoNjv2ZbLPmiHCvGL0dAKtTk2Flh0SLtu6S9mUvg2ZPAv6ljX1mpEpk3Ci9LvIsVtntc5PRQGXx19qRnLvAER9Lhx6A+QqqYjz+Lpj2qQ4JbpL73P9b4bZHBYDwA2HhaI7OeljiaeCQpBz0/3OodT7faboCJcC0U4alNa8jbHYBS/SxGuXYNhMYyiQLwhkBtcywSH1M27X2Sr2ZQPlHSEMAHKNgbzJXsg10TBNsBlAemrI0WykIgp9TxBrYYXj9znX9Gk2PEtNqsVOcZ1sNtz33KAF5WTHZFhvJYAxUEeB0b3TARFT82vORUykKxekwLXFGFE4MqKHYXhzvMtUbxm6J0AkTII7nM2immPUpVYG/D4i2d2LEe18h6eorDo384ESJrZmx6z72hZvoIIFhkFsa2CzSwo+gtGiF6mM7CNot5V3KkZueXJeRoxSbeOwFdKg6WaQ8z11zU78xtWYVJ8ls71x2NcsfAlywgSK4Ofs+HgQJKRrpl9Vy8t7xWILgr++yyw//LtC51lw1y8isEB5fP4rAutOZ0Xk4vr1l2VFCDPSXPDHVOExk+7ikkkXD9yy1apnDQqidVHxH6WmT+ScTE5HSVHfatGv/Q9XwkJQUUCeQiYFtCx18qYAILZBQB3UTaIbBxZMP7E</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>