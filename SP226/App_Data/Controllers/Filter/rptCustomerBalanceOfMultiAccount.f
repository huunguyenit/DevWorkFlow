<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
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
    <field name="tk" categoryIndex="1">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="tk_cn = 1" check="1=1" />
    </field>
    <field name="ten_tk%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" categoryIndex="1">
      <header v="Mã khách" e="Customer ID"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_kh%l" external="true" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh1" categoryIndex="1">
      <header v="Nhóm khách" e="Customer Group"></header>
      <items style="AutoComplete" controller="CustomerGroup" key="status = '1' and loai_nh=1" check="loai_nh=1"/>
    </field>
    <field name="nh_kh2" categoryIndex="1">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="CustomerGroup" key="status = '1' and loai_nh=2" check="loai_nh=2"/>
    </field>
    <field name="nh_kh3" categoryIndex="1">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="CustomerGroup" key="status = '1' and loai_nh=3" check="loai_nh=3"/>
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
    <view id="Dir" height="137">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11011: [nh_kh1].Label, [nh_kh1], [nh_kh2], [nh_kh3]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>

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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuxqslv2MwFNW6mUOu6MR1pRfyrBWBgQVnDgIMyq7XwNGM5svNRNWVMUO74wVRTU2kV06hdPakJZSNjsDG2Ku9igvFxhBY+k3zJKgsaiOWEF39BZc9yh6WBjZCJMu1NoiQqRyrSZ4O1K79j6NrsI6vVcYqlX+6laM/aFGnbNdliuMTa00HJGxkN0i6L76A+pbsgwGYbZIsquGr74P0P2bJyTkScHaO4+ctRleuN0GrLEG2FCdiiy3YBCQn8FfZ9ZrL31XLzsY+sHxpT3NKWvnxSqUn1E+NGehFjDlFG4+gjujjoBkvYPHrj6dQ8s8XxcIrX7/arioGp9k0qf7j2bLUKomy47ajg53bFQ2qe2kOFE3akHW1DxPGzY0rbrGaSBlAYtXctHr5nQuz653UumhodaSzgBZlPs6A14d/YEpsUSU</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EeKL7qb/04iuraroARBQeYbTAeKU1SRCWUXisbykImIgmfvDMeiPPvRi7OZBLduVfMkCzbtHvEV3w8EILJnY6mVMSJZw7eKUuD1qIDl42p+kUjvfxwjhbZnmrdVzITPFhwD5RdEQrFdyLIRlzeAXwyxnydUFv72d8MC27c4+bIxDbgxyFxstAUOSeO77A35tLZo5e1Jrawc1uuf2sRjPoM3EujBGt4+d4lHBg8pNS1PLiVNW/owjB6tedu6R1o0R2YtE+5dr8DF0hphhxKB2tgfccSSqPssDHeK4QOLDtZQumUeXoWq04xa/kEpbCXiCFtvljx1quJq6VOXCdlx8hPQ=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD6TbO3opaqe/n04Q34AtpZ1kFiw2I6YDJ5nIJArEF00UHS3kY3miLmR6xKl1hPCEm4aqU5lkXPJM9kdtoXMA1LEg97o2u9ehyw6EXYckt8p8d0eFb9HBxyNymCyKBTrisxi/btjvC0qv+Q5Rh6YCDi39Zc4LU4O/aKYMBOuNmwBPc4F5DXRgQ0JRWIr6mMFtmzsN45DLfKMCBtzh6d1jQcetCrBpc5671PioeQvH+7ce9tn0anm4WXhH1BFfWWrhHUBlZjDSqjUH2Hkb31yPDh05orpmgqtQTWVJUdH7KMB9zpfOoKD2m7Uis0G/AuxswXJvch8iw41FUKADotH/Fu/H7OAY3y8Kn3utaiKHfJ+JEZUW3bxPpUoPOACZjGxO1ibA7PVLo9MUJK9SiiFjF19XbtTnayP4XkIL0LIpNn+C7USvLcNR/O0tzvKZjgeAONh4KG5mCquTByjr+eFRMmB5hJn4dD40Ipv8yzijRfOWy+d0M+1ann35M8N41/qmp3CNZZRrPFKWq6hAjcm/1zSlTNLsSsJrdtgyrVoHUKwopKR/se2V8wHwhwqDXD1wBDVYJd/qr0HzS7jGufjC+z4uoLcw0JJqQf+qVvf2Kn/8hK1ECRWLUsWmrpyuBacvIIf7hWW0VS5OJKKn/vplR1W</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>