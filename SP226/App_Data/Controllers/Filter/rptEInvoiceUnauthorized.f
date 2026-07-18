<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY f "ma_ct in ('HDA', 'HD1', 'HD2', 'HD4', 'HD5', 'HD6', 'PXC', 'PXD', 'HD7')">

  <!ENTITY % EIOptions SYSTEM "..\Include\EIOptions.ent">
  %EIOptions;
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày hóa đơn từ" e="Invoice Date from"></header>
      <footer v="Ngày hóa đơn từ/đến" e="Invoice Date from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày hóa đơn đến" e="Invoice Date to"></header>
    </field>
    <field name="so_hd1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="Hóa đơn từ số" e="Invoice No. from"></header>
      <footer v="Hóa đơn từ/đến số" e="Invoice No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_hd2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="Hóa đơn đến số" e="Invoice No. to"></header>
      <items style="Mask"></items>
    </field>
    <field name="ma_ct" allowNulls="false" aliasName="defaultEIVoucher">
      <header v="Mã chứng từ" e="Voucher Code"></header>
      <items style="AutoComplete" controller="Voucher" reference="ten_ct%l" key="&f; and status = '1'" check="&f;"/>
    </field>
    <field name="ten_ct%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt">
      <header v="Ngoại tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="maxLength" type="Int16" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="1101-1: [so_hd1].Description, [so_hd1], [so_hd2], [maxLength]"/>
      <item value="110100: [ma_ct].Label, [ma_ct], [ten_ct%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cRzC0R/mVFkg2soK2z4V6l2EDTL15yNUljTFEwnLXnGQliNurgK0fmqKUOtQzbEsKb8yxxoJYsJW1WAp6CbTZjPY4y/70xwT0QSyMR9dh35y0iTorUb75tKh5ha2KSYr/Q53upQQqiwdhSQY54NuGBxE/M21kIkm301EzRqCVHg</Encrypted>]]>&EICustomerAuthentication;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR7w6CA+ePhgKY0rOMzrqZ4xw=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdOAE7rf7u4jURSPNN4P/B7ZOfA6PRh1wzNOF3/XyvO3k6WZk8/g63Ih449AH0UKN9VlBL7JCAE6oLR+ypa9lbWs1TSj9lrMR659MGMSEjFC39PlK5FAjWiUaG+70zthFpXiei0oc642DiYHxA7D0b+ArxyyfS5bYxC764gZo/CJZ+8ilUud88nIppOaj9OPyK9IT1kxRKkC4qyQtJ1iLrOSSXgaAkwwWiX00L1QQ6jQdWHNQhBUM+tbXKSKy7xUCw9ygUSQJaPe5CgcHnsZCY6cvGujfZv4aVsQhYg7kp8z3ES+gdlZltgE+OIuiIWcnXCnIEPnxFhAJanNF7S+Su8+EGfeYGRcTBZmXMW71bj2X7rXbe+CoXCQ0lXe16YeGsJXhQ9Dnkqu02USIRX6K+D7l7UXghugZyfpDJg8iZg5t0QBQ3EpwkKVxLUw5ega6BQbQYe8N72DDWtRHrHeqCRQhf/xYLjC7pSTIFj17UlkOWmPF8d4isVmebmpqHklxamRPvAr6d9QYEiZFSjUODqMeqaELbaAuxDZiJNJJ9iol2mNTkhBHewsq1keg01Yfu5+vF10H9m7Nfxi0CvMNLrJaUGpA3AKoOyFQykoBSUIAwH6SoG8koH8BT1/DSDWQagiU9UrX7ewXsNgCA3ZI/OvVVcHp7D11X8rjhQD+AGYQtqlIKK7GUBk+A9OVsDTHXMGBPcgPSO69YOWPn00izFM=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyI8ZCcQblE8Np3nK/w5LUGuwA4vdYDEyJ/POluhKA03h0yFUzmUF7Z9V7sW1Ztk8lSm0qwGoDxxme408QrYurVo5Z/AFvWldaR8LYK4IUb6ihN4vC+My0hgmmLXLER9a31gVZL0qwaWlOx5A4K7trs=</Encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>