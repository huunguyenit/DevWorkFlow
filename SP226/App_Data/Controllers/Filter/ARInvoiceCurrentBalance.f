<?xml version="1.0" encoding="utf-8"?>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Tính lại tổng số tiền đã thu của các hóa đơn" e="Recalculate Received Amount of Invoices"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" align="left" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="From Date"></header>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" align="left" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="To Date"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="110: [ngay_ct1].Label, [ngay_ct1]"/>
      <item value="110: [ngay_ct2].Label, [ngay_ct2]"/>
    </view>
  </views>

  <commands>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KWjuKsGpwak6RdC8cugwwhRiYHsK30BiuEP6zmYd4Z6huvqefkCSido7jOF8Pg+/ITP2q57AxlhcA36zdYzzdfnI0qPkvpcFcTUmQ5HED10wkhyfXacVc79KxdEwO9bluUNss+sEAQRWcBLX8JCwrNplhBieszyJF3yFaSoD2p6ykoavGMTmZnpeA0hN6Q1zCdAgnV6b4u0+8jiIsm7ocSBCI09eEzh3aLePHC/lPz482FOBk75TAc2WaDCAp2ewSIdBm0QixASpDSz5KN1iJbSoYWnOpLy2xxp2m54t1dYqL71TMKP4PTArsiWDX64HL7u82Qz3vrRhmNdejE+s7utBfI4DtLooD9gwZqTKZ8H</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KmRo54ol5vOnEpdrVadgaue4G44Rjq1timCWo16dVYuAANSZrL87jQVoxoW3Zw7lssiCAf2HTgmi2wvvSm66riU+OSOLJ10Qeg+EeFUVQEU4</encrypted>]]>
      </text>
    </command>
  </commands>

</dir>