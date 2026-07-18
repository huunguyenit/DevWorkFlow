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
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4UeNokiaIQfc+ZrE7utdfDl9HP3iVbAUdlPSoDJg5Wb2L8OkE2q8cATs2XGCQowO3t7mfXJz+YFvyTTUWilAWzJK/KHdVeIO+mIq2ME83S4ubJDaHbWUFVs0KmL5hlyO8A==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAUcxlrvlDwAWCDj2IT+fvJ/wx9ERYIhQaNcIuHcJEdTvRyMqb/wEZpUUCYt2MBh3qvNWiZ+fwbHRRY9KM6+5WXzWBYuw8S6q/aetU2mIuVe</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtcSeftPU2E01Un9fv1JwPLzWAfWoGnRDcWn85qfstGCYRdb89dc6pmmnEKdseNffdpgjO6PtzCkM0RORfEWSR6OtzgLZSXKiM7c4hXn5LgLPyJOhgw/ziGryjbvW4YJRjWvnpNIU63QXMbatkf+2fhlW6iBMncTrM/43creoUfrWJnizObzKJLjHkLYwLar4i4psaVRUwiUo350MyE1dbODUb9mYxfCxBmzca+1RSMpi3aYolCqEyEiLva3RUedis0dGf8+AGG7rlbUnTG1dFRe/8WLxYGZmxcvzyXycEppzIzQrsKd1R3i01YpI5d6xI/c2E7juXshEAnRqCHCik8+HDBCuU87q/O3pp5yHiKS9NUGneTuXgKYjSE3NMUK2ljsjMhG1+QwqWiw/lbjXliplJ7dCp1aqMpimPMhRGe8RbT08aYFWRh6zA++zPE7hF6mkkbt6Ij657qB/vaDG3sk=</Encrypted>]]>
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