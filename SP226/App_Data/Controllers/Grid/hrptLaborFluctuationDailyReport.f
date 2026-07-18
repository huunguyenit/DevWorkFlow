<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Repetition SYSTEM "..\Include\Repetition.ent">
  %Repetition;
  <!ENTITY Controller "hrptLaborFluctuationDailyReport">
]>

<grid type="Report" filter="&Repetition.Key.001;" valid="systotal = 1" repetition="&Repetition.Key.002;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo tình hình lao động hàng ngày" e="Daily Labour Report"></title>
  <subTitle v="Ngày báo cáo: %d..." e="Report Date: %d..."></subTitle>
  <fields>
    <field name="ma_bp" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên bộ phận" e="Description"></header>
    </field>
    <field name="ld_dk" type="Int16" dataFormatString="### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Lđ đầu kỳ" e="Beginning"></header>
    </field>
    <field name="ld_tang" type="Int16" dataFormatString="### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Tăng mới" e="New Employ."></header>
    </field>
    <field name="ld_dc_tang" type="Int16" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Chuyển đến" e="Transfer in"></header>
    </field>
    <field name="ld_tong_tang" type="Int16" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Tổng lđ tăng" e="Increase"></header>
    </field>
    <field name="ld_nghi" type="Int16" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Nghỉ việc" e="Job Leaving"></header>
    </field>
    <field name="ld_dc_giam" type="Int16" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Chuyển đi" e="Transfer out"></header>
    </field>
    <field name="ld_tong_giam" type="Int16" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Tổng lđ giảm" e="Decrease"></header>
    </field>
    <field name="tong_ld_hd" type="Int16" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Tổng lđ hiện diện" e="Present"></header>
    </field>
    <field name="tong_ld_vang" type="Int16" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Tổng lđ vắng" e="Absent"></header>
    </field>
    <field name="chitieu_01" type="Int16" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="" e=""></header>
    </field>
    <field name="chitieu_02" type="Int16" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="" e=""></header>
    </field>
    <field name="chitieu_03" type="Int16" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="" e=""></header>
    </field>
    <field name="chitieu_04" type="Int16" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="" e=""></header>
    </field>
    <field name="chitieu_05" type="Int16" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="" e=""></header>
    </field>
    <field name="chitieu_06" type="Int16" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="" e=""></header>
    </field>
    <field name="chitieu_07" type="Int16" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="" e=""></header>
    </field>
    <field name="chitieu_08" type="Int16" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="" e=""></header>
    </field>
    <field name="chitieu_09" type="Int16" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="" e=""></header>
    </field>
    <field name="chitieu_10" type="Int16" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_bp"/>
      <field name="ten_bp"/>
      <field name="ld_dk"/>
      <field name="ld_tang"/>
      <field name="ld_dc_tang"/>
      <field name="ld_tong_tang"/>
      <field name="ld_nghi"/>
      <field name="ld_dc_giam"/>
      <field name="ld_tong_giam"/>
      <field name="tong_ld_hd"/>
      <field name="tong_ld_vang"/>
      <field name="chitieu_01"/>
      <field name="chitieu_02"/>
      <field name="chitieu_03"/>
      <field name="chitieu_04"/>
      <field name="chitieu_05"/>
      <field name="chitieu_06"/>
      <field name="chitieu_07"/>
      <field name="chitieu_08"/>
      <field name="chitieu_09"/>
      <field name="chitieu_10"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9Ge+QSms2Uij978RkGV9TnKb2PhGvAybH+Swwm6OQl5XavlQfx2ShVtNhglY+0RFr+/e/xnhl2ZwzTrQYPM98aCf4etjs1zVbnWjUXQRQ/u/ZIlsQ6jmobkqvdAqqfu2zxjUts4EHvwMOT182wPTA3ImB5cuZW1Hb/9Aj1n2vA0iUjh39diOffLD2aZHq+Ib/2h+xeKBuCNmhkrICVMLRFH8kB4fZnPCuYsN7T7azBR9m8CV47Jq8XLUFFjOQeDnYx3hjU1IX8Ld8W6Skfy/UIFuF6l6KOCaOhj4d2TNpCsT3aMoEIvbWu3QbTlqkuN7Q==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BMVn4pmeBRSRI1xgt2TZH/46rQaDgnQzZIvmOEvvtiGqSRnb3jnXmcZamywq5cDUiMFWRwi6IiinsAZKHRntrN5EoN7Xol450KDPpP0MFPGVqQyzr/t7wbSLYcUy9uvICQ==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UssBP7mLwPvpIyeVnFY1WGIFudObEg0WpytXvCOVW+K</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BIpTeNUg5nOdbDiFaB3eSwSM7WwCNnsNwlbbZ4lBWFZJvyyvNe7vMQgZoLOs5PBx2YRF1pOFCqoqHZWJC61EoO1rTPlAEhdFyOkFVS4D6uJplMCJPHtloRaS5pufQjmRtn1gRGNLxNBGRyJra5vGtYNAennocy97srfN6ICmOYF+Mnjzn6me+eaBJwzHHtBA53M9ll1wO7aSjXm6PMJKINRuoxWsrLN4strVbbbdgVMqnY+0JVRoNz+ZJ5RQTQfBlTl2hhOf2JSr3Qb1vIs7t/yUXyUNgW/BAGZYaAQkXThOxA4Rj85F/6o1Z2soEakKsSTNw0tMyYBcc3SQ7BmcTs67bXbuxVS3k0XQaN4Pg3c9</Encrypted>]]>
    </text>
  </script>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Print">
      <title v="Toolbar.Print" e="Toolbar.Print"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>