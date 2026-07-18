<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>

  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>

    <field name="tk">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1" />
    </field>
    <field name="ten_tk%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" allowNulls="false">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" reference="ten_dvcs%l" controller="Unit" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_dvcs%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing" >
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRdq+JMvaYUwdjDYqWqhq1Ue3L/pIwFjuH5RtgeMwJBiAXFImn/hu/8e8S33wgmUajGTeLp7m2blr0XgQV/4GU5R/zgAv2klCYeaYEp09qMx4qJqEhcZK43CjP7ip8xYE7TFLFLCxOqvpdJd7NM8lkgcgfgtdkpZyFu3B/ET15yDkuo9AiETDKLv3QLaBGTY6Aei0zTf63QSLtfrxlhmzzM+U/TPFYabUCJScMZtvEp+RA6WattciErUErrN8qYeDTxTk7KBgw8Ue2ImlEFsJQe51UTaea2yWThYl4/AbB6</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbGi4Bt8vpl5t7FW+BIvzcAbXde3Qrtui/VRCW+E2iFOPVNNsfh9/WN/7xf8YgfkYblfuqx2dHqz1yiCSa2tvLADp7rrNEuipyxkeeETRuzrYIC684x2OystkuiuWJ1ELoZaySs3Nn3O8UyhorHmGhnwLN/53uNsjeDrKrON0Tdk+JTsGP5uAxvUoQI/F1/5OviH66cdznDyqTgQh7vOnHhNm0SSWWfxR25Ccc8FOiCZAxIU8Cz5iHEyxEJYEEebOnem+bDLoAjhEBBzmICviTXaz7wXYJPFm03aewx7eCn1/wSUoip/hNYCTysnqHePSClXGzwgH6nVGsVfzJtdBexCdTPx3Ea5hWcmG89InTai03zu0aLSaThZGbAV2R8ejv5iKRv7qDBl64XzmEE6b6LRePM89XVsJVykkEaT7dG23Zzk5+p0bnLYFWN80H1cUsVTAv1oqssM4fcU2sR7fu2WRjEMggnnHKglFTY06nMSw==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>