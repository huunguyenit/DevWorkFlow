<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\Circular\A08200\ReportCircularTypeField.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;
  <!ENTITY % ReportMargin SYSTEM "..\Include\ReportMargin.ent">
  %ReportMargin;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tk" allowNulls="false" aliasName="defaultARAccount">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and tk_cn = 1" check="tk_cn = 1" />
    </field>
    <field name="ten_tk%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false" aliasName="defaultARCustomer">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="(kh_yn = '1' or nv_yn = '1') and status = '1'" check="(kh_yn = '1' or nv_yn = '1')"/>
    </field>
    <field name="ten_kh%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="date_open" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày mở sổ" e="Date Opened"></header>
    </field>
    <field name="isdetail" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Chi tiết theo mặt hàng" e="Detailed by Goods"/>
      <footer v="1 - Có chi tiết, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="isbalance" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Tính số dư" e="Balance"/>
      <footer v="1 - Có tính số dư, 0 - Không tính số dư" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    &ReportCircularTypeField;
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
    </field>
    &ReportMarginField;
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>

      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="110---: [date_open].Label, [date_open]"/>
      <item value="111000: [isdetail].Label, [isdetail], [isdetail].Description"/>
      <item value="111000: [isbalance].Label, [isbalance], [isbalance].Description"/>

      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [chon_tt].Label, [chon_tt]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
      &ReportMarginView;
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3ypD6wIWsxei97UUI0egwICDoXVdjNnZW6O5WtuqwUn0m4kcz7NWVa39niOwofmvSaYeYyqQHFD8/jPkBYU5kvKA87D9N0WOkApZ301OO3N6CpcE5rs5gswL/pyGJrmAhDhdUPYEoMTB1DofWzpPEyXaLuSarHB6gf+7dxwmbVH+FJOKPMcT8vnpR9UFF7RKMlTzgLdoqZbulzQhO6QlJ+5nA3WjGzz0hLmTnaxAq9grfY66Pe2eKAvAUHpHx82N81ZxPjhp5rL3sgXcOzHsGObKbOgaL0SB2Pm8WT6hAiGPr6vFe1bsKgJrikhYoGH8+5vSZbq7CzaS5lx1YthtkKr5GkM5uh8pE0rA1YEOpvgVhRq/4OdCFN8z1/u0beEv3Lwn2PgvIfOVJgb/VLpDhge5QSmdPgE7PcYdL+ez9lyom1c+l/atTjdPc7bt8Y2LpuPv2TprODbFFxFqXViSvUt73Wjnlk5snen0/ntbZu0yTc3QNjCCgj3o1v1/6dawpxN+4SrKtvpmOlbwfmZw+6O8wTIomNszFU6VHIhocWBaBPdOreP0PKWTFESiKaL9bNqW6JbEW4oVrHB3Bc1tx4euzbvJ+ltau/a38Us5Lj8Ha2PkBKP+X35msyv1wUByW5SwrlL2pWIB8qxHXpHoyo=</Encrypted>]]>
        &ReferenceParameters;
        &ReportMarginProcessing;
      </text>
    </command>
  </commands>
  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdDqS2nZpjMFZD+ajcJqY6S0MraksmenqXt2vjKyhYADTAN8k603T01iM8FyPlNPl1WMI6kgjgjRD/FW1Q3ikp743ZC4kKgqqCP9P+nXYl8fqdfkbcKkAH7v5GBdf3V1SQq/UV7N0MEHVIYYcdFlGVbjalBHhxQQpVGa5YItTqlt3LM2eKzBeLD4brAeFRzRy7ryjHnbYpCCsfiIiFvIzo+kBIkXz3ww0ViIlDlHogvnIjn3i6sWdC8h2ZR8MwaskqjEM1Nb7tDYsdXqQQzpAuaik0dEHRd4WS5rs65pIV9gkQOKMYdqFgjt4c5r1UdTRDbsaclagXUyeK5BoVoks0hSofYPfjMer9pVt72ieL5tUiCUbkFX4lShKco0h3AQ0rAz6T+BNFrjulCAus1FUTd8yoScvM+F51XHlK21FiCrj8aKo26+KSFXGnzsk3Z8HRrTiRp5O5QvTXHatSTkcv7jAmgYeRr1vXdUKG7Ho7X9iLZe4s+WL3GW3qmja8A3aInbUZLCneO5sgqZvkpC7E99nGCPPnuHyx/dQeCRvW0V1KwJbOlQgmaCHTYPnYndnrrW/G7wamifcFHDvDanCmGoc8JfcT18KuFvOoPcjJZgBza40fZUJJ5Y0eslxHWBWVhxKJDDujpnXv1WHNhptk+Vg7xryiJ61ibCbu5dEZoUdN09+B9ERgoTLwggtiH6fdXVucoZDr3SPpP3xsO82eh9hL0wSAh4BRC+sRdHK3sYTk7CVojB64v2/Ka9XRX63OJYG47ayA8ak6krGFCu90n8WG276ZiQqeXbmlMbfEbAn5jJFqlVtWj/N2AeuH1bzvwPvRqPiOoLxlDJHY2N49HUvZ6Y7ZRbrl+uYOc0vcDuIiSdFxZph7ww7QMSd3tImMQ7jrRVx9dvDdRR2sweqXxcjWArobhbutwuClDKrgJIDfGUOrlARtuXF03b1+O8MIVImK5eHLhu6YH36mIsPuS+J2j/ymnYMk94ii6RSMxct63EyhinorDaDbF6Rz2O9yLVWEoK0TfY/hqRmO1AZS8f5Bgxw7a0QBfDX6lwZtCx5roMX4KeuOfq4+oDYHCThD6HzC2ubrGa/Jz1tuAum7YDqtdby2996DPAoCKCWXTkqAXsoV6MweOCUDi3ZRdb9cQ==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu70QZzsPaDwFs+YifbSouifZ+Z8xb2vrymO7L8l1iONMshIBb8irW1YDA7cu+DB6ur11JOuGhj1b0YBXP2XIrznWtDX7nCPm8raIcGqV2RNAf/sP4a9d05bIuC8aZFPACReSn6Yh6f15Zlo7HwfBY7yav8Y00c9ooROw8QjMyGzjMq657SUpxeCdV3tCeBYOFQ==</Encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;

</dir>