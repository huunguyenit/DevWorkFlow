<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
  <!ENTITY % DetailTax SYSTEM "..\Include\DetailTax.ent">
  %DetailTax;
  <!ENTITY % EIOptions SYSTEM "..\Include\EIOptions.ent">
  %EIOptions;
  <!ENTITY % Discount SYSTEM "..\Include\Discount.ent">
  %Discount;
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
  <!ENTITY % EINote SYSTEM "..\Include\EINote.ent">
  %EINote;
]>

<grid type="Report" code="ma_dvcs, ma_ct, ngay_ct, so_ct, stt_rec" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Phát hành hóa đơn điện tử" e="E-Invoice Registration"></title>
  <subTitle v="Đơn vị %u1 - %u2, ngày chứng từ từ %d1 đến %d2, chứng từ %s1 - %s2..." e="Unit %u1 - %u2, Voucher Date from %d1 to %d2, Voucher %s1 - %s2..."></subTitle>
  <fields>
    <field name="tag" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct" type="DateTime" width="80" readOnly="true" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày ct" e="Invoice Date"></header>
    </field>
    <field name="so_ct" width="80" readOnly="true" align="right" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'" allowSorting="true" allowFilter="true">
      <header v="Số ct" e="Invoice Number"></header>
    </field>
    <field name="ngay_ct1" type="DateTime" width="80" readOnly="true" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày thay thế" e="Replacement Date"></header>
    </field>
    <field name="so_ct1" width="80" readOnly="true" align="right" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct1]', Value: '[stt_rec1]'}, Script: 'beforeDrillDown(this);'" allowSorting="true" allowFilter="true">
      <header v="Số thay thế" e="Replacement Number"></header>
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
    <field name="stt_rec1" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct1" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="chuoi_ngay" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tag"/>
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ngay_ct1"/>
      <field name="so_ct1"/>
      <field name="ma_kh"/>
      <field name="ten_kh"/>
      <field name="tien_nt"/>
      <field name="ma_nt"/>
      <field name="stt_rec"/>
      <field name="stt_rec1"/>
      <field name="ma_ct"/>
      <field name="ma_ct1"/>
      <field name="chuoi_ngay"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&sp4+hMHegg2EZffLn/pV+2dksMt9j7wwNqHRccL6gW51ChQF3V9ER5ZiqYbdt/Focqv3AVGHOsbjkfD4ZE76of5H+1LqzhTYeMKnCq6lXtwipdkD503Je20w/H3onLj3w6XQr3gjGkOW40BMUUMh2fzae5U9T6wo5iRjdlVFt4ZcjKcallhuxiimaAdZnIaWJFH0DrIfymTM6kXNzsvR2vgVGDG1wE6rc5CqXaY0trvLIP3njLzIxSiDWzoPQ6uCeI1LtW3U/AC30LMstxAQC+UEOflmyeanHfxpx7Ju8OSWplSVpHLyUENmIVZP1JhCeu+lfmvtbPGyMc5NI8003f2bkriOszL3EcAnIIu3SM6LiYXN8Z9OsSJqNJN5nm/Vqh9SXUa2NPTg/efXrQuVyYne2yQF/xx1FxViL7Ry1sBaHQbDBw4PtRMzlQTVc5LHhqmpPKt1g8uF9tGFaTRZNLMu+eJYtCxvekkVGqh2wZlSdh649aMYRmUkylxyvu0/hE7YXeongcG5XLJr8PehNywXTWZq8lgmp8dyrY5c0I/zD7oJzBujxzXFFNqXy9H0</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL758FqqnKB3SEYOg/Qz+yjr8h3tT+3qw3HwDrw8v9yB6FvcuzdSR9Q5G7mwrshy1v9YVNj++5xekz36uWCKUGBg6QShbn1VwcdyieNzMEpBHb5</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75ymtyW99MDOuhUekZt9uT78ikk9b1xhrsXTzfCswY+SnbvrIz671oYMgyYnTPfuMCKzOZP1qQjwtmRd+NOBvMmg=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&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</Encrypted>]]>&DetailTaxFlag;&EICustomerAuthentication;&DiscountFlag;&EINoteFlag;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6KNEYAY7GL0u9tgNIwmqJkKSZxlUNTf+mytBO3HiXQoDui8CSyAi5dI4vX4HKJEzpPoLnGB5TnXS4XQwR+ITge23pG3F2Wfx990F5ZnfOBM2ldAz0lMc4S+0A6u9S1s1+F4d4OEUj8yt/sjnYgDoptkaNn7wM4tN1Ko6dh270nDjA8rCcOziCKln5P1NpkjAqvAbm7HSsgk2/CuamwciTZ9bqDQi2lDck0P8iOWl02yOQcWr1JYjYPmSw5zUPwx2FEsU5ictZnhaHvamdx9MXegXJotwqZGESMn8yVZbAkAiXNAolNGP4o+q4vYEJgDIYdDqqWMvPscIR6VucL90pm8eedtGNvc0z7JRpGsbfNEV7sVU3q14yfAZmnpNb3JvGmNiZJ9lVuk3nlY6D+UTRBZPioNktWAeZbGVAKRVJ91R7TvzKKeXBBL5nNh5g1506YYpWd3qXACRFwRHDbZAxx/oJgGNyMSTI9tPFgnjpfpbDkgsG4l5y7yf2KCSHw5rpO1jalQ3NICeu6fyzZeVINxgRNbe/FywNm2z24Gquryw64UIFtIQ/SN4aR3WDS74uxOLW0h/pVHA3GxGbEQmrK8IoBtlXx6wvP/NKvhb4YrxX1PIVVUbUaKFFWWTYhyFcL/GChF63fyuX5GtBsbxDEvMut/S06Ztd6ZfzIkTomdtg07d7SpM2ONhhj3hL9slu0XY6N8O6AExrRsdsQqeL/wQswHQZYaQiKdHjHMkee+kSkRtH9K2M9Nr1gGPTTt+6JI49Yom7sqKV3l7bqyy1b0HpKvh/pvGI0zlljXHnUHA4bQuvPySdDICrcs1Q9QlbKj8sqZnnDz8MEqvpQM8Z4oehnhJ1KTupVYT7ih66gOy</Encrypted>]]>&DetailTaxFlag;&EICustomerAuthentication;&DiscountFlag;&EINoteFlag;<![CDATA[<Encrypted>&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</Encrypted>]]>
      &JavascriptReportInit;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1ItxitPhcFkKiMQ0BcX1CNWp7Y2JAEAhqFmCTyhC7lnOW8lVBE8O9fDtFl8rUevaWtC5iKlg4URvxASg4C8iWj2aZoTwieIy97rvJRpYHEcRHGsBFqiXKITE7PFMGZ8DSaM1Xb88RQsHMCKr6KpcmnTwpWZoyBbiwqS4MfEajvcmFA+Sv72Y6sTyTh96Glh7CPnVel6fGhAa6MineUzfR773Fh9aDM8FXvnfOXmqYnD7DGRPfpnEVkSKH3vdbXcLg==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Print">
      <title v="Toolbar.Print" e="Toolbar.Print"></title>
    </button>
    <button command="Release">
      <title v="Phát hành, điều chỉnh hoặc thay thế hóa đơn$$90" e="Release$"></title>
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