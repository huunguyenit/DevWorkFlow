<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" code="ma_dvcs, ma_ct, ngay_ct, so_ct, stt_rec" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh sách hóa đơn" e="Invoice List"></title>
  <subTitle v="Đơn vị %u1 - %u2, ngày chứng từ từ %d1 đến %d2, chứng từ %s1 - %s2..." e="Unit %u1 - %u2, Voucher Date from %d1 to %d2, Voucher %s1 - %s2..."></subTitle>
  <fields>
    <field name="ngay_ct" type="DateTime" width="80" readOnly="true" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày" e="VC Date"></header>
    </field>
    <field name="so_ct" width="80" readOnly="true" align="right" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'" allowSorting="true" allowFilter="true">
      <header v="Số chứng từ" e="Number"></header>
    </field>
    <field name="ma_kh" width="100" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh" width="300" external="true" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" readOnly="true" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" width="80" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="Currency"></header>
    </field>

    <field name="ma_dvcs" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="chuoi_ngay" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ma_kh"/>
      <field name="ten_kh"/>
      <field name="tien_nt"/>
      <field name="ma_nt"/>
      <field name="stt_rec"/>
      <field name="ma_ct"/>
      <field name="chuoi_ngay"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL755u2xcm+ZIPR2yjQaCrpFefnYcJvcpIPOT/I7Rco4jL5aK0Hzqyh+jSWOAXFYDypSIXo7AENCTZ48u8dlOCiSi8=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL758FqqnKB3SEYOg/Qz+yjr8gbAtT/vmJfZmlPtU3L4mNIsPSbhCY2N/H3WOSbkn9u2dXlU0VEpdak0gCXz6SVebhTKJg2kR112N4WQh+1m7IG</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtYlSiM/Edxd7qrZpTolmqK83TsUaoUV25spgqw9FMh+sMCEpm2wx0Wqhqw2ccg+pkI1q/2kN+TcyQ8F+stABmTP0lEqsd3AftraXV/Q6hKlOfYRjqs1N3Oul45oLAj8QIoLtu3jQQj18m5AA+4b7ZPuzLQXyuPtMTYpOTJlC3tUJEv9k2gd9cpx238cy7HfMsVUyv34o8v13uaV+90VyO82B2OwzwmOrd8bsqHRyMP6coVnwlbNv2BlptsdJyNqFck64HOqitONUpCpbzMYU1x5fv0kdxwfNQSNQ67k1rclfuNlOOHMf7ayOea5naWGznl0Uh1nA65KvAdIuxHnk4L44n2ezXDnZJ2qGOptYtcI1P1aCQst6T7MxlUApiGxDXr+y8dtLzwaP0BvTHbdGwI9P4ln1m9PLM9opTh8Hs9mi+uHBb1yHnRW5GEgN2sZoCA8rCZfgbxw1mfCq28vYhGT/MAvqu+xJKRSkBkoVcF5HU0rInisbfM0BghtUDLkDViWPRygLbPWaBuDXTTi/pzxe9lQ/b5yflanz47TUU9MqrjKJ/rs7r7XqK+86AlZswtkq/gDpyLSPP/g3L/O/nRqzo+o5S50Ty8kEw1Bedkm45AvXGmob1mW9vauiwYhVdtSOzOY+Rm1w5kd3OkaR4qMwmFVfkau9/9fDd0O0RfjQZarvXknTbUO5ORgCc5s06Q==</Encrypted>]]>
      &JavascriptReportInit;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwLkgQRQVeVPHXymANGcqoXdb8CO34oEp3FtKb6v6KL8Rh49k4jy6LgtliFr3KU1xKSNjvttiAT6kgV8DvJ2kqZ67YBmYsCyyJa6QhwVO3rdT+3ZbLNQrvggD3DtlLr4FQU1xbiqxwNurYH0PN+geyPb6Eiousw7NnKCZdkI7LXbrGvvK38bEgURcAd3IDH7Cv6bh7GK27lZGymhLwDVWTE=</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Cancel">
      <title v="Hủy hóa đơn$$90" e="Cancel$"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>