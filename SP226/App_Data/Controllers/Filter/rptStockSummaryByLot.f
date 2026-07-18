<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptStockSummaryByLot">
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
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"/>
      <footer v="Từ/đến ngày" e="Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>
    <field name="ma_kho">
      <header v="Mã kho" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>

    <field name="ma_vt" categoryIndex="1">
      <header v="Mã vật tư" e="Item"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_lo" categoryIndex="1">
      <header v="Mã lô" e="Lot"/>
      <items style="AutoComplete" controller="Lot" reference="ten_lo%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_lo%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_nh" categoryIndex="1">
      <header v="Nhóm vật tư" e="Item Group"/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="ma_nh2" categoryIndex="1">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="ma_nh3" categoryIndex="1">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="ma_loai_vt" categoryIndex="1">
      <header v="Loại vật tư" e="Item Type"/>
      <items style="AutoComplete" controller="ItemType" reference="ten_loai_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_loai_vt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="bc_theo" dataFormatString="1, 2" clientDefault="1" align="right" categoryIndex="1">
      <header v="Báo cáo theo" e="Report by"/>
      <footer v="1 - Vật tư và lô, 2 - Lô và vật tư" e="1 - Item and Lot, 2 - Lot and Item"></footer>
      <items style="Mask"/>
    </field>
    <field name="kieu_bc" dataFormatString="0, 1, 2" clientDefault="1" align="right" categoryIndex="1">
      <header v="Kiểu cáo báo" e="Report Type"/>
      <footer v="1 - Nhóm theo kho, vị trí, 2 - Chi tiết theo kho, vị trí, 0 - Không xử lý" e="1 - Group by Site and Location, 2 - Detail by Site and Location, 0 - No Action"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" categoryIndex="1" clientDefault="20">
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

    <field name="nh_theo" categoryIndex="2">
      <header v="Nhóm theo" e="Group by"/>
      <items style="DropDownList">
        <item value="">
          <text v="Không phân nhóm" e="No Group"/>
        </item>
        <item value="0">
          <text v="Loại vật tư" e="Item Type"/>
        </item>
        <item value="1">
          <text v="Nhóm vật tư" e="Item Group"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="tinh_ps" categoryIndex="2">
      <header v="Tính ps điều chuyển" e="Include Transfers"/>
      <items style="DropDownList">
        <item value="0">
          <text v="Không tính phát sinh điều chuyển kho" e="No Include Transfers"/>
        </item>
        <item value="1">
          <text v="Tính phát sinh điều chuyển kho" e="Include Transfers"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="in_theo" categoryIndex="2" clientDefault="3">
      <header v="In các vật tư" e="Items Printed"/>
      <items style="DropDownList">
        <item value="1">
          <text v="Chỉ in vật tư còn tồn kho" e="Print only Items Stock"/>
        </item>
        <item value="2">
          <text v="Chỉ in các vật tư không còn tồn kho" e="Print only Items Without Stock"/>
        </item>
        <item value="3">
          <text v="In tất cả" e="Print All"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="in_sl" clientDefault="1" categoryIndex="2">
      <header v="Cột số lượng" e="Quantity Fields"/>
      <items style="DropDownList">
        <item value="0">
          <text v="Không in tổng số lượng" e="No Print Total Quantity"/>
        </item>
        <item value="1">
          <text v="In tổng số lượng" e="Print Total Quantity"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir" height="234">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110100: [ma_lo].Label, [ma_lo], [ten_lo%l]"/>
      <item value="11011-: [ma_nh].Label, [ma_nh], [ma_nh2], [ma_nh3]"/>
      <item value="110100: [ma_loai_vt].Label, [ma_loai_vt], [ten_loai_vt%l]"/>
      <item value="111000: [bc_theo].Label, [bc_theo], [bc_theo].Description"/>
      <item value="111000: [kieu_bc].Label, [kieu_bc], [kieu_bc].Description"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
      <item value="11000-: [loai_du_lieu].Label, [loai_du_lieu]"/>

      <item value="11000-: [nh_theo].Label, [nh_theo]"/>
      <item value="11000-: [tinh_ps].Label, [tinh_ps]"/>
      <item value="11000-: [in_theo].Label, [in_theo]"/>
      <item value="11000-: [in_sl].Label, [in_sl]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 20, 20, 20, 240, 130">
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMCcBHcMp7P4nk26g24rLvVfjyQAtvnW46n6FD29+Z5z4AF82WhCObXBQg2qgeIKPPkvI78vWMLghzrAbLBDAdI4m3+HvKzzjqQR0QhcaX5SHpNpC9079JmZwwYPri4fUoEax4ClJ8vbJd1FXhvuPCYyh+0JbfiKm/8fnhneUxoGwV5WtiyyJdw14W9o+moJoCSuoAvlse+NCSANOA/PvGdgiDspYHa245ROm73CL/2It530j9qJGjbqJIx78MiGVw6s5RbvdZVgY1b99AJCK1QIU5CtaSSmRxnICBA8I5KWfCzfwtzku81nTYI6NkTZKlNqchyH/NEbixgXhl7kUvfBHFupWboJeXLZWaWNJ2Tbu4zyZkVTjuZkap50TG7F+gzOP8125gWcZDmwQ2LfjifGNHVMZ4vmB/vQj2oA2YEoh18sMJeTMkrRMQ4u+ahUUDPjm/GBYf1R5mFwGLO2a9wCWrPyPw5DynpbdQn5PjfO</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kaM07Xa6/jgsfBLWGL2sfcnf/qpxGsTLB620BgwplLOpA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      &ScriptQueryFilterString;
      &SetReportFormLimitRight;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD6TbO3opaqe/n04Q34AtpZ1kFiw2I6YDJ5nIJArEF00UAQPuE7LmyvOyrWFWtbBGwBMl6g7KoHbaRqEkDW6tFiXcUZMHwMddtJxnqUKJ+fyOrVcIJVbKskg6xEFOsMRVHkmCa2aQ5wCj6VamXahD4/Ymwv3U1Bicr8xcHy81RXj01Q3GE9ekPVIcdMiNrnkN0X2DC1mimovwnRCPRrsdLAdnuU3L3EG4UbQkhsF3tmwlUlClh2bKdWtKsnpQD3c51UzEz08g8yjGxq+MGkSczp/B9SvIgmz8zoGqHRPrpqaaF7K52nE1iPAmBcUmGLCZ1Pthp+coxeySOvUowUZyhcJWv22uH8s29MSMs73hoKbNDw69zTt08pgeL4NGzc4Inof9f9jgko4rpGOo2gWHUj/QQmN+v8+6KZxLwS+1zT3ykVfwBnYFcdgx77r7B225YW8vWmCLh3rD7pG+Jnl4c22in+JhUVSldjOzBlui+u3YQxwMDT2NYD/138HEF3gj95eGQ/DZCeP69l6aIhjlpMHMpIQkEEdrBhh+53On2Sw5qysDc4yhqE8xx2Hr7XTTBfWOiOk76zPrRyUCNP9uPMzfc067t2izSVUBxEApurVKr+47DwSuoTQK5FN537nQcxaNa71Dm14/fUk3Vg0ZNyMxz3+thrZ1i/yXA9lQocPxkspR51eMmDT7sJRLU0tComEA4G41KTrnq2+Xz8APj/c59hnaa8mF7vvEx4A1a+BGSRca3lHdc5XsOeM/DDgXLCljhFkt/I21l4DDn0bI5qCcTf9cB623quQTNalTfYxiw==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>