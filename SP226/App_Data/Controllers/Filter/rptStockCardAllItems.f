<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY Controller "rptStockCardAllItems">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\Circular\A08200\ReportCircularTypeField.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY GetReportFormLimitRight SYSTEM "..\Include\Command\GetReportFormLimitRight.txt">
  <!ENTITY SetReportFormLimitRight SYSTEM "..\Include\Javascript\SetReportFormLimitRight.txt">

  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY % ReportMargin SYSTEM "..\Include\ReportMargin.ent">
  %ReportMargin;
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"/>
      <footer v="Từ/đến ngày" e="Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>
    <field name="ma_kho" aliasName="defaultSite" allowNulls="false">
      <header v="Mã kho" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="ma_vt">
      <header v="Mã vật tư" e="Item"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="nh_vt1">
      <header v="Nhóm vật tư" e="Item Group"/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="nh_vt2">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="nh_vt3">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="tk_vt">
      <header v="Tài khoản vật tư" e="Item Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_vt">
      <header v="Loại vật tư" e="Item Type"/>
      <items style="AutoComplete" controller="ItemType" reference="ten_loai_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_loai_vt%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>

    <field name="kieu_bc" dataFormatString="1, 2" clientDefault="2" align="right">
      <header v="Kiểu in" e="Print Format"/>
      <footer v="1 - In từng trang, 2 - In liên tục" e="1 - Eject Each Page, 2 - Print Sequently"></footer>
      <items style="Mask"/>
    </field>

    <field name="ngay3" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày mở sổ" e="Date Opened"></header>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>

    &ReportCircularTypeField;

    <field name="mau_bc" clientDefault="20">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
      <items style="DropDownList">
        <item value="10">
          <text v="Thẻ kho" e="Stock Card"/>
        </item>
        <item value="20">
          <text v="Sổ chi tiết vật tư" e="Inventory Item Ledger"/>
        </item>
        <item value="30">
          <text v="Sổ chi tiết vật tư tiền ngoại tệ" e="Inventory Item Ledger in Foreign Currency"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    &ReportDataTypeField;
    &ReportMarginField;

    <field name="keys" hidden="true" readOnly="true" filterSource="Infinite">
      <header v="" e=""></header>
    </field>
  </fields>
  <views>
    <view id="Dir" height="126">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>

      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11011: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3]"/>
      <item value="110100: [tk_vt].Label, [tk_vt], [ten_tk_vt%l]"/>
      <item value="110100: [loai_vt].Label, [loai_vt], [ten_loai_vt%l]"/>

      <item value="111000: [kieu_bc].Label, [kieu_bc], [kieu_bc].Description"/>
      <item value="110---: [ngay3].Label, [ngay3]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [chon_tt].Label, [chon_tt]"/>
      <item value="110001: [mau_bc].Label, [mau_bc], [keys]"/>
      <item value="11000: [loai_du_lieu].Label, [loai_du_lieu]"/>
      &ReportMarginView;
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
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4VgkY2UQtqKs/4KsJAwSb2b1u39xHz6+9JTYG4pYzwseWLhtTBrqmZXXYnWjHA0i4x+VlaFSPZvU9Zpp5g5k33pbUJKfbug6/q3lM75xbjl51BLrtVcLmi+/Zh0BNMnALCVgOZdCzzC8MJSy7hbJmbKEU3x5ckDlHCXSRTI0zCHB</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kaM07Xa6/jgsfBLWGL2sfcnf/qpxGsTLB620BgwplLOpA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      &ScriptQueryFilterString;
      &SetReportFormLimitRight;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcU5d5UltcR8bTbfrnO2d1Kzj0Kxotys+aGVaEaLD7o49+w3/RDlKTxemu8b5AVfHWajjl/nPA3MkCygw2+nsfQVmMl1pjT3pDLf46dJUSlu9kqrUi1txUCw3xjVs/W0xTJv4vXDKkUwv7nI6lgIF5SJG2xoiUmMU0wOh8beYZRW64NtzWQqKJWBYVXY93tqSIsXC8mD3DO9cRDdr7AbxDJB4Qn3NqGbxyzNSCp6V2Nmr9WM+1sMRT1l2P16lf3My8S1wFH6oHlCmIWJDyKGRt/UdZCcEPqoR+l5cYsEWg3qbD9gDhsEdY+u8t8bYePGV4acTjfkKcSQd9dcYrnVqU9PFkHBROWozLEodQk+oAE3v6fK+PkFwBBbbJ81hsT0nLTJvx+t0me3zn5ia8x6pBBeRTzQD33KeBCFq0EqpkvxW23RGsBle7z3pKKcB0w1TtwXg89NCHdtyFLInLcWo0yI2i772+gULnKo4pReMu7bsW0lZao1JQqHmlH5F5Q+iVKtQX6l0dakFnXHofCPWVXI1GEmhmYFNmMC8k9pVqHIcffaafA7MVhIy3mgFE61lvtbcVKd5w5m0LNFbuFMIjyKnRVzAKOm5Jwz6fBRkPbwdP5MnpZWijPx05njIDz1423WLTm6ZXhjAos1LWQSvKDGUmdc6Wp6P5/PlnSDLvXvMVaCeaTihlLHIqMOHxBJlKI9inqpDBqWww2kxQM9Hh0z7eiVJaOn/D+hsXZjmmGXwxD6BYKKPKQjeO6Xs+NDxrwZ7zHctnHJWWozqwtuKXvEHCHi/GACiVua9TBMtMQ++PRUYwUxYXBXHhvXI/YrqggDP9ChHzmlsNMuQOUJ049ONfmWCeBvo3Eox4kDeOQU6o+ipw2X2inlGnB8ssdpB1/j7cHnqFHtrKqmSFeJvNpL3gOYaK0pYNWaqHtnqzVRZpw90BfBLT2OF5cLELmz8iaMd8wOAIK3hBT5mMI9NhMotSw6ftlXwJy63+SMrux02mHCGyU63g61elWiVCCb6zLBQ5tqaEL6IZT5JqL4YYD6WdPkR0/e+mSaCNDePkSc5W0boGxdIWSBXKGZGh8mTcz</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu70QZzsPaDwFs+YifbSouifiyQBkdvDG95EJTEdIt66ONpWVDr66TH2CRQHdGU5WlOATsZ4rdq1c/DU4TD/cCd/Y4NwbN76RpHIgBh0V19gh2OG82kba1xkVRUJH1dB/kTs9I1FrA92Q5lbkxo6vKO8=</Encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>