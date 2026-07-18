<?xml version="1.0" encoding="utf-8"?>

<grid table="" code="" order="" type="Detail" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <fields>
    <field name="ngay_bd" type="DateTime" dataFormatString="@datetimeFormat" width="100" readOnly="true">
      <header v="Ngày bắt đầu" e="Start Use Date"></header>
    </field>
    <field name="so_dh" width="100" align="right" readOnly="true">
      <header v="Số đơn hàng" e="Order No."></header>
    </field>
    <field name="ten_nguon" width="300" readOnly="true">
      <header v="Loại đơn hàng" e="Order Type"></header>
    </field>
    <field name="dien_giai" width="300" readOnly="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="ngay_ht" type="DateTime" dataFormatString="@datetimeFormat" width="100" readOnly="true">
      <header v="Ngày hoàn thành" e="Due Date"></header>
    </field>
    <field name="so_luong" width="100" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="cong_suat" width="100" type="Decimal" dataFormatString="@CapacityNumberViewFormat" readOnly="true">
      <header v="Công suất sử dụng" e="Capacity Used"></header>
    </field>
    <field name="t_cong_suat" width="100" type="Decimal" dataFormatString="@CapacityNumberViewFormat" readOnly="true">
      <header v="Tổng nhu cầu" e="Total Capacity Req."></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_vt" width="100" readOnly="true">
      <header v="Mã vật tư" e="Item Code"></header>
    </field>
    <field name="ten_vt" width="300" readOnly="true">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ngay_bd"/>
      <field name="so_dh"/>
      <field name="ten_nguon"/>
      <field name="dien_giai"/>
      <field name="ngay_ht"/>
      <field name="so_luong"/>
      <field name="cong_suat"/>
      <field name="t_cong_suat"/>
      <field name="ma_vt"/>
      <field name="ten_vt"/>
    </view>
  </views>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22T4sekuVvhBMzEuAXr7ZmMNrlmsdkXuOoHGrZD/YlNSt</Encrypted>]]>
      </text>
    </query>
    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cC2azatXlxy9FaJt8akemxanAbaU81WHrF576e6bUNdAmUdZUi/VllfefoRgA5XWb4MNHUXJP/hvEHNs7a7IsQ+UB8+hngyTkG7B9F222Gi3T/Goe//6IgRrSh2uoHADw==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDFspc9Xr50bp+urTEHN/GFGeLdGIbkkJb3oLe7FZ3FsMNgr1K3OL7GgQoumwW/SuXhX1ia2WVroet1WxjFMkWacPvdfEog3k/51XmEAxxwa</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtY/1gKd7CUnuOuMLEvLiFcbnOgAgWfGee+KIA+/P71o/dgdFMWniTeDkuccMiFGMDV9IZw7jDbSOqHYl/VE+2yx7X4YQEjTQXy0L2nfpSen2gnYk5G8qV8xt4ST9VIoDBb5ilEOGcOeH/W3coE3tOuD43x9GOsrTpIQ8TUerEkvrkP+n7OtJJ6P1b40Ql95KyCaRnqahSXYMLr+PgKHRDY85W7yNJj2+G7GRKGRPH7DdvyF3noUxZJbIGyozDEDXo748S9jtKWL7GipuFibKAVI3xRNSHmCII2BX50Wcvd+wqjiIKzPsUBwiCKVhmetIfyPSzBygglBW0fIsCsLqQ+ntedgCO1xCKQZ9VAFUJ6LtJoJA7SeC0BdJyjpz7TOGq68sAqk00CS2NJ0vn2hc6v0XbzR5k0bERTKQJ8kSv5wIAtHnOdQWZ2meoxik/2jfUw==</Encrypted>]]>
    </text>
  </script>

  <toolbar>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>