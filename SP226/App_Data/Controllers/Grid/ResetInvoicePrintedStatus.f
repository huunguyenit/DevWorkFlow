<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật lại tình trạng in hóa đơn" e="Reset Invoice Printing Status"></title>
  <subTitle v="Ngày hóa đơn từ %d1 đến %d2, chứng từ: %s..." e="Date from %d1 to %d2, Voucher: %s..."></subTitle>
  <fields>
    <field name="ma_dvcs" width="100" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="ma_ct_in" width="60" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="so_ct" width="80" align="right" allowSorting="true" allowFilter="true">
      <header v="Số" e="Number"></header>
    </field>
    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh" width="300" external="true" allowSorting="true" allowFilter="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" width="80" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="Currency"></header>
    </field>
    <field name="status" width="100" allowSorting="true" allowFilter="true">
      <header v="Tình trạng" e="Status"></header>
    </field>

    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="ma_ct_in"/>
      <field name="so_ct"/>
      <field name="ma_kh"/>
      <field name="ten_kh"/>
      <field name="tien_nt"/>
      <field name="ma_nt"/>
      <field name="status"/>

      <field name="stt_rec"/>
      <field name="ma_ct"/>
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtV+3CO2k9UGA9k03+vmFFFobGUnhwXmtkFvkz1zQcjIv4gXoLupGDStGiq3dVzs4+d87yW+wG/mLxKvHjYsiAYcBJ0uXb6NecIYGo6G6irqmJN/LQi2U9VIndCMb58jRqLWAKl59rBU/WtUkiUUiB1Hks/FWI/yhtXlrN4ypaqesw5/KWTprha+rrprEGSpZDb7ePR3l9NZENPeYJeEMcDFWc3YI5jN/snChZ5xdnA2mQTl64+ic17PqcF7zl+L9t7TbUEis0CetWJSh7UYPfyrjSJFfEsQoYwF30SL+MGilEp6XIEYA2jE+3EQHEyW6YmBrQSnkHOzLgz78XA296Nm8GZn5SDAk9BoTp4KqsKFmgpsan15GVTGLbFvEDORemlmQ1Ems8yJQ8Lj4f9y+4LkB7Emd5q7tJBbznV1pPuuPXT5FTdWBRUFkfVTbSk4LtuNgZxxSsPpdSOQTsEE5gU8SYeV/+4eVS5LBIK/xAaBEmc8zt6oHVFv/mGureyS873Xngu+Fj1n1e96AnVBmkjLFy4uYL2yc9V5iG3rXmQx02JGA1lBqWSm374l26KMwLzD6ijCW6E25xuOgOd+Kli6rLT/jgLrdQD6VsVdn3PJIrLUJJaMwgtRv1KCyN68HyGWZ/wcr0XEi5pUe0zrha4u9oef2vcY5KnLVmBv3kkJy9v9Xwc+kuytXS5iMVeJ2uM2E/hL7qlH28fdkJHAuccNoQfUvJXHiK3x+FrhN/dmNhkkQkXUqtbt1g5BSX9tRFNEJi0XDKtiT5Nhl+PffIW/qLyIe9+75nctPVHPnqO5EUw/OwjwWwJXKc91U6xNnbTHX5iFMTkSAsVqm1jAvwaYBI4yl1wMTrPLPyXUyw1EOAC4WECPsMyxRIFSAB8WOnLXK+2UodjniUUYwyp8oaHbobdlnHiB0sxMR8cnBcMYIdWXQl/T9yff632TZ/nqZcwOzhZAFmJXOTK3uFHQmJ2Z/J2CXGXaRfeK1Ii3BwMThtLftHIDx+GQ6fUUrbt+9dbxjPsMHPWuQ/3NM9RiOgC0EYJ2nEFF3kOl0FRq2pkEGYvmF/DeScVN6FWCihppSKQ==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id ="Reset">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1+Pgf9NIWpQIcrgh/QGVisvpD4tWnlYWslB3o9t3Aq4IUrB38IJ8uWRH/xQZGLtqUYwPHoXDlIK+zS65vom5evi2i00c9e142SwegFSFmPo2k+H4aAGvCfEi4cqvOMYg36LUv82HM+enOdXxIitsLCycoeWQK3028YFmb0EAfR7AJpTmqgx0WgtvuEwFpV7f7dVEUuP4MLWM3gP6yYRU6Nkwwp0nz10nqr/+SbRdUwIonkum3OGXYFxekLOI/mS7dhkYR8cFyRcTzkh/Hp6waz+m0acJQ82MbOiH1fF/vF8</Encrypted>]]>
      </text>
    </action>
  </response>


  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6+1l5r4B2+cpPDe9T2Zng4iIkhf6ANVP5XepHuUUh8zQEO3gLZc2+IXkiNje56udLmkN9k8/UN6U7A59DYMGd/FgwvgnrxUAdQlPlH1yQ17aHyaXVwJ+0ce3k6f7sIGI0uiGyJ688EJ5UbS9eUl00Z0VlZkYVgw//HEQxO8m7FDt7Le8vjIrXVENETYlG2DMA==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Reset">
      <title v="Cập nhật lại tình trạng in$$90" e="Reset$"></title>
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