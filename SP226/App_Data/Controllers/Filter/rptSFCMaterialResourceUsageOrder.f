<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày chứng từ từ" e="Voucher Date from"></header>
      <footer v="Ngày chứng từ từ/đến" e="Voucher Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày chứng từ đến" e="Voucher Date to"></header>
    </field>

    <field name="so_lsx">
      <header v="Lệnh sản xuất" e="Manufacturing Order"/>
      <items style="AutoComplete" controller="MO" reference="dien_giai" key="1 = 1" check="1 = 1"/>
    </field>
    <field name="dien_giai" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="ma_lsx">
      <header v="Yêu cầu sản xuất" e="Work Order"></header>
      <items style="AutoComplete" controller="SFCWorkOrder" reference="ten_lsx%l" key="status &lt;&gt; '0'&VoucherLogStatusKeyLookup;" check="status &lt;&gt; '0'&VoucherLogStatusKeyLookup;"/>
    </field>
    <field name="ten_lsx%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_sp">
      <header v="Sản phẩm" e="Product"/>
      <items style="AutoComplete" controller="Product" reference="ten_sp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_sp%l" readOnly="true" external="true">
      <header v="" e=""/>
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

    <field name="keys" hidden="true" readOnly="true" filterSource="Infinite">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="162">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="110100: [so_lsx].Label, [so_lsx], [dien_giai]"/>
      <item value="110100: [ma_lsx].Label, [ma_lsx], [ten_lsx%l]"/>
      <item value="110100: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="110001: [mau_bc].Label, [mau_bc], [keys]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDBaaV766j4XqVMPTsxBNLQww3q08fuNcQISGpOyZtsSlqM4jcsZWivfG60vkKufBEJGSlnksyOdWTCoflgLXgTpfnlR5jn5ZxbTioQz46QmWkJ/yjM4+UbVD5FVNzx6yi5K862tX7rWZ1yOF9Hzu71R84xJFQiyAzNOYglkTcEMtYKX6ibTbnqWa6Fu4bdLgi+1qAAwNzxn0F0mFior5GY5+EcPFz1P3xfcQ5ukjyaR</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGm589nGw3hgv2TNtZkkZj9PkaC1rqAwOgJ0qbuVn8iP+uVSrXMdAt4vLeVnhT5AbjW2b07xhGJW/T8tYhpeiDkW6oXiBh0jLRj9+LqPpzqA0Re+DhftgwT5ouORXFADQ2maw3kP9HGeV13oyRPXVTqzVw/stI0rCoXtvlfoSDBA2rPBYFv7+zjNNLdHVA/fwmeAjGtTursvJxuEHaLRx8vk3T+bkP0zCzcmwD2atNBg+L8yj6KFm9LNA/WIxLX7rE17MbFx7aJZTM9cb5I4I1yhtM+ED6yf9yvB869qZj07wc0RRnVfUmu6oW3oTG2bUg==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>