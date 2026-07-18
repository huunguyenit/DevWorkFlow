<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptStockBalance">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"/>
      <footer v="Từ/đến ngày" e="Date from/to"/>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>

    <field name="ma_px">
      <header v="Phân xưởng" e="Shop"></header>
      <items style="AutoComplete" controller="SFCShop" reference="ten_px%l" key="1 = 1" check="1 = 1"/>
      <clientScript><![CDATA[<Encrypted>&LvJqgbD8Ez2iFIn+GVZ4oW0X2qRxB3wWA+OjPy/KwsytGyZ7bS/jvYMgnvzgoLkacJq71vYxcauShMzU5IuF6i9FnljEOExfijLmExFIu08=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_px%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho">
      <header v="Kho" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="(('{$%c[ma_px]}' = '') or (('{$%c[ma_px]}' &lt;&gt; '') and exists(select 1 from sfdmxuong b where dmkho.ma_kho = b.ma_kho and b.ma_px like rtrim('{$%c[ma_px]}') + '%'))) and status = '1'" check="(('{$%c[ma_px]}' = '') or (('{$%c[ma_px]}' &lt;&gt; '') and exists(select 1 from sfdmxuong b where dmkho.ma_kho = b.ma_kho and b.ma_px like rtrim('{$%c[ma_px]}') + '%')))"/>
    </field>
    <field name="ten_kho%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt">
      <header v="Mã vật tư" e="Item Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_vt">
      <header v="Loại vật tư" e="Item Type"></header>
      <items style="AutoComplete" controller="ItemType" reference="ten_loai_vt%l" key="status = '1'" check="1 = 1" information="ma_loai_vt$dmloaivt.ten_loai_vt%l"/>
    </field>
    <field name="ten_loai_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt">
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
    <field name="loai_bc" dataFormatString="1, 2" clientDefault="2" align="right">
      <header v="Loại đối chiếu" e="Comparison"></header>
      <footer v="1 - Vật tư nhập kho, 2 - Vật tư nhập xưởng" e="1 - Central Storage Receive, 2 - Shop Floor Storage Receive"></footer>
      <items style="Mask"/>
    </field>
    <field name="mau_bc" external="true">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir" height="162">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="110100: [ma_px].Label, [ma_px], [ten_px%l]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110100: [loai_vt].Label, [loai_vt], [ten_loai_vt%l]"/>
      <item value="11011-: [nh_vt].Label, [nh_vt], [nh_vt2], [nh_vt3]"/>
      <item value="111000: [loai_bc].Label, [loai_bc], [loai_bc].Description"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>

    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDBaaV766j4XqVMPTsxBNLQww3q08fuNcQISGpOyZtsSlqM4jcsZWivfG60vkKufBEJGSlnksyOdWTCoflgLXgSaTy91Hhu6IaVoLqVnD2H2uldnXgM479ttfa5wizQkAbm3OSxQ1F/wFrFbH8S+j2UZTCscb72wifDTWB/WR+Pa/hlGEsTKFTqmAn2CX4JJ6oF1qIrRfV54A1IYJJ0iQOTB6K8iB2NMPtUCkqGx50kkHihzWmIOSHh8Xg/4MIrh9w==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGm589nGw3hgv2TNtZkkZj9PkaC1rqAwOgJ0qbuVn8iP+uVSrXMdAt4vLeVnhT5AbiFOmBruEzSJAFQyXZPhZN1RJc86gcFKD5yBMEPJCMJ0e/tQWwY6QPnNX0PeK9guBR7l2rYu50ES7zKqCFKf1BlRxWUKbB6Ls8eJD6eYMEZrzcd/HqvrtlETBUKzfaDUOo5pxZN/zWSGSyfMcXliGLirZnGO3Jfxwp5taW2jAbddPszP3ao9+ph8Ofg34N7B5dlJzWM9lZALX2hpTOHX5Fw=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>