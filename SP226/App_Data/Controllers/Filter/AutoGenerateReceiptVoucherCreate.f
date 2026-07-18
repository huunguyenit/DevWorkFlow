<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY % DetailTax SYSTEM "..\Include\DetailTax.ent">
  %DetailTax;
]>

<dir id="0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Tạo phiếu thu từ hóa đơn" e="Auto generation of receipts from sales invoices"></title>
  <fields>
    <field name="typeReceipt" allowNulls="false">
      <header v="Chứng từ" e="Voucher"></header>
      <items style="DropDownList">
        <item value="1">
          <text v="Phiếu thu" e="Cash Receipt"/>
        </item>
        <item value="2">
          <text v="Giấy báo có" e="Bank Credit Advice"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;<![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99GCmlEZha13RFCVMajieJSEv/rDZOwEKwmBTB5I8Z1RfVJ9K99/ciXuGHO5v2UJ3qZi2u4HBktcIZdHpP2ft3Ao=</Encrypted>]]></clientScript>
    </field>

    <field name="dien_giai" maxLength="100">
      <header v="Diễn giải" e="Description"/>
    </field>

    <field name="tk" allowNulls="false">
      <header v="Tài khoản nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l"/>
    </field>

    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_quyen" onDemand="true">
      <header v="Mã quyển" e="Book Code"/>
      <items style="AutoComplete" controller="VoucherBook" reference="ten_quyen%l" key="status = '1' and ((ma_dvcs = '') or (ma_dvcs = @@unit)) and ((convert(smalldatetime, '{$%c[ngay_ct1]}', 103) &gt;= ngay_hl_tu or ngay_hl_tu is null) and (convert(smalldatetime, '{$%c[ngay_ct2]}', 103) &lt;= ngay_hl_den or ngay_hl_den is null)) and ma_nk in (select ma_nk from v20dmctnk where ma_ct = (case when '{$%c[typeReceipt]}' = '1' then 'PT1' else case when '{$%c[typeReceipt]}' = '2' then 'BC1' end end) and (lstuser = '' or charindex(rtrim(@@userName) + ',', replace(lstuser, ' ', '') + ',') &gt; 0))" check="((ma_dvcs = '') or (ma_dvcs = @@unit)) and ((convert(smalldatetime, '{$%c[ngay_ct1]}', 103) &gt;= ngay_hl_tu or ngay_hl_tu is null) and (convert(smalldatetime, '{$%c[ngay_ct2]}', 103) &lt;= ngay_hl_den or ngay_hl_den is null)) and ma_nk in (select ma_nk from v20dmctnk where ma_ct = (case when '{$%c[typeReceipt]}' = '1' then 'PT1' else case when '{$%c[typeReceipt]}' = '2' then 'BC1' end end) and (lstuser = '' or charindex(rtrim(@@userName) + ',', replace(lstuser, ' ', '') + ',') &gt; 0))" information="ma_nk$v20dmnk.ten_nk%l"/>
    </field>

    <field name="ten_quyen%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>

    <field name="status" inactivate="true" clientDefault="2">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập chứng từ" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Chuyển KTTH" e="1. Release Later"/>
        </item>
        <item value="2">
          <text v="2. Chuyển sổ cái" e="2. Release"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="keys" readOnly="true" filterSource="Infinite">
      <header v="" e=""></header>
    </field>
    <field name="typeInvoice" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="maxLength" type="Int16" readOnly="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1100--1: [typeReceipt].Label, [typeReceipt], [ngay_ct1]"/>
      <item value="1100001: [dien_giai].Label, [dien_giai], [maxLength]"/>
      <item value="1101001: [tk].Label, [tk], [ten_tk%l], [typeInvoice]"/>
      <item value="11010-1: [ma_quyen].Label, [ma_quyen], [ten_quyen%l], [ngay_ct2]"/>
      <item value="1100--1: [status].Label, [status], [keys]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMh9W/u/PWX3uj7WUu4cEfZVHO2wdn31rH08y/v//6iHlOg8epLQT0sGV1r0WsBSMzij/JmOgAQbwvbF/bwUKc2pjz3VSItngvKpoTI3RSWi</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6vwF1B7d1GySFdWppW9fqaMOg5G8iQnsDUnx+RdclahRcPAmaon9Hp8LJGBOFC7+/p78qRN6ZPSddmaimF4/BO/F+oYTSe+sO1TpUrJAXo/jddvqz4C0Vs2Dlz+i7Pqx9KkQBqaxiTQoJc/eMx/4ha8fjlS7KLtmO6yVIUeV9hmawSWr6hkufi5y/0Yiv4/K8QmM4CI61XM4DAbQLNVFKspoWGNrRG1sRZ0fmFMR5eS5izI+v21pDAt0+0AlvNZB8/0lplI2nLEvlumH6attd5Jp3eeMQjVynIQwfOVrahsqqXlw5Wv+/xKGn/WqYjulg9Et5GFz7uAmlYa192e2vwEaqp4mQH3+/mPt6A+Y6KlCG4m33rJtMZtcSUriYIHN19LZEcapcTf21cDH5EVqRnNbX1qi51A42OzpNMqI6CPCLeH0wfDjoIOCYiHVmW2dH2jh10irPApN1k5NRs+yQwMkB867Oh/w7vST8/ZbrZCzZUUFsBuQkBTHdnunO10aFa+awQ7ebPltTHtEfNCx7epy2LNLnJCXsS+Y2leUgVQG+NLXtR/zNruIErtSNqyoF2pClt1yTfPLqbxqJ6h/hc51MjPLYEOhGrKyIhfg//zCJOYTL4XqvVaMhx8uFj5ZFbnhsfy8xbOlTEfMKN0t4Y=</Encrypted>]]>&DetailTaxFlag;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPyesbTF39aNZH2I0ih4WlHYW6Z6Y46XYoNVRh0ZZmdaz7tx097xdvmnWQC3Cdwxw4I14WPQQit6jxLKOiqbzff3QtPjZ83Lon/LxmVXLVgh5R0MEQJdL55WDOK6AZ8pVQOIjDxqS0kJzqUS8g7DKsYfTgESCr9dNb1Ift6Ml/apj/6pNlo8e2PfNtj//eW3dw==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22St+IV3li90hg2N5VSLrPK3F20qsTyo0dPNEa/BwEKJq65A1M+TqSm4IxbNPGVhJV0mHt9m8pFT0qUi5bqCgAJoN735Bz+5YUGMSgtNDZxT/U6YgBTj4FG6YygODoE2GWLL8xNyu8FJTj0WA44WQX9MyUyojHB/6TjJuHOuqOgr741VW6WOyPREU+6j1srRzNoCxzpogdlR7MaSvec7l42e6axVC6Od9Waco6rjtHk9kn/NsBLeWiHa8rfgcbqMP43c7TwL+PW3VJFOHstJr6iOiYEZPbeBH4e2ddmveMPmhqAQtLCWqVTdgMv1oUC6n/2Z3pACIn/fj1Mp1Nomo8TSlyCFc2TFdWCpHxDtY84DhYX3ed/5P4S/+xGcfCr7sVGalC5J/hZV4Zgv6y4il2fre1PnFTTPMybR2KMZdH2LATDZWxwF/SWB8dbqVX3KC9lBrHzbCdqwi8KNCAey/m9J4vPqMexqVV/T9O1Kpd115</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>