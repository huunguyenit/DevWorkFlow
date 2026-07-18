<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY UnitTag "">
  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
  %Control.Unit.Include.Item;
  %Control.Unit.Include.Customer;
  %Control.Unit.Ignore;
  <!ENTITY k "">
  <!ENTITY Tag "vdmck2">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY FieldsList "ma_ck, ma_kho, ma_kh, nh_kh1, nh_kh2, nh_kh3, nh_kh9, ma_vt, nh_vt1, nh_vt2, nh_vt3, nh_vt9, so_luong, ma_nt, ngay_hl">
]>

<grid table="vdmck2" code="&FieldsList;" order="&FieldsList;" filter="&UnitFilter;" initialize="&UnitQuery;" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Cập nhật chiết khấu, giảm giá" e="Discount Detail"></title>
  <subTitle v="Mã chiết khấu: %s1 - %s2" e="Discount Code: %s1 - %s2"></subTitle>

  <fields>
    <field name="ma_ck" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_kho" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã kho" e="Site"></header>
    </field>

    <field name="ma_kh" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
    <field name="nh_kh1" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Nhóm khách hàng 1" e="Customer Group 1"></header>
    </field>
    <field name="ten_nh_kh1%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhóm khách hàng 1" e="Customer Group Name 1"></header>
    </field>
    <field name="nh_kh2" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Nhóm khách hàng 2" e="Customer Group 2"></header>
    </field>
    <field name="ten_nh_kh2%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhóm khách hàng 2" e="Customer Group Name 2"></header>
    </field>
    <field name="nh_kh3" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Nhóm khách hàng 3" e="Customer Group 3"></header>
    </field>
    <field name="ten_nh_kh3%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhóm khách hàng 3" e="Customer Group Name 3"></header>
    </field>
    <field name="nh_kh9" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Nhóm khách tính giá" e="Customer Price Class"></header>
    </field>
    <field name="ten_nh_kh9%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhóm khách tính giá" e="Customer Price Class Name"></header>
    </field>

    <field name="ma_vt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên hàng" e="Item Name"></header>
    </field>
    <field name="dvt" width="80" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="so_luong" isPrimaryKey="true" type="Decimal" dataFormatString="@quantityViewFormat" width="100" clientDefault="0" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Số lượng từ" e="Quantity from"></header>
      <items style="Numeric"/>
    </field>
    <field name="nh_vt1" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Nhóm vật tư 1" e="Item Group 1"></header>
    </field>
    <field name="ten_nh_vt1%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhóm vật tư 1" e="Item Group Name 1"></header>
    </field>
    <field name="nh_vt2" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Nhóm vật tư 2" e="Item Group 2"></header>
    </field>
    <field name="ten_nh_vt2%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhóm vật tư 2" e="Item Group Name 2"></header>
    </field>
    <field name="nh_vt3" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Nhóm vật tư 3" e="Item Group 3"></header>
    </field>
    <field name="ten_nh_vt3%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhóm vật tư 3" e="Item Group Name 3"></header>
    </field>
    <field name="nh_vt9" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Nhóm hàng tính giá" e="Item Price Class"></header>
    </field>
    <field name="ten_nh_vt9%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhóm hàng tính giá" e="Item Price Class Name"></header>
    </field>

    <field name="ma_nt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã ngoại tệ" e="Currency Code"></header>
    </field>

    <field name="tl_ck" type="Decimal" dataFormatString="#0.00" clientDefault="0" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tl chiết khấu" e="Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_ck" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" clientDefault="0" width="120" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tiền chiết khấu" e="FC Discount Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="ngay_hl" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Hiệu lực đến" e="Effective to"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_ck"/>
      <field name="ma_kho"/>

      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="nh_kh1"/>
      <field name="ten_nh_kh1%l"/>
      <field name="nh_kh2"/>
      <field name="ten_nh_kh2%l"/>
      <field name="nh_kh3"/>
      <field name="ten_nh_kh3%l"/>
      <field name="nh_kh9"/>
      <field name="ten_nh_kh9%l"/>

      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="so_luong"/>
      <field name="nh_vt1"/>
      <field name="ten_nh_vt1%l"/>
      <field name="nh_vt2"/>
      <field name="ten_nh_vt2%l"/>
      <field name="nh_vt3"/>
      <field name="ten_nh_vt3%l"/>
      <field name="nh_vt9"/>
      <field name="ten_nh_vt9%l"/>

      <field name="tl_ck"/>
      <field name="tien_ck"/>
      <field name="ma_nt"/>
      <field name="ngay_hl"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL757NBlE7bcEeTFsksIMTIkFYm0DWR4aVBXiOmYvjuqIokE3Nk+6aFkeMMvpmemmPpwi7I23RXYFpYyRxh5Y68HFs=</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75xRt/cKFLam7y/utk9CrMOQgUyV36qcu7TGhKUR69q7hksBrn6cv5vcZkj/JXu3XDyDpUbJPcQnSogWjSCyNorU=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUtNUG/CeO0PxnIlmCZGi3Tr7X7vgfzu2mBjW+fUY/6gLssnYOmkFjH/vqgO4pteA9HA/1B+U+BvJUci80qpd/kcyksmgSypnedb+yrsWBiCquB96iWRWrqMfGNOo4sbfVKkqzamvP6yEm8bdePPndjxd4dUI50mMswkUirMfees+p0ra5bfJB3+vf9x6GjnAKatXM53iwxdkdr8QbYzhFA5dQrxA+1YVEIDtGxFwYkFxQjKOiRG0VD1M5lomdrMBtSejE6DoRFMwyYrRBBfb4g3yIs6jo82sP4JW2QEoeFGhDv+qwfLE6boBo08Pet65ixndqj8qQ9CdLVS5et0F3TlE5UFo+2lcma3tAy/TxUe9ZG2SpmmKhqkwygLBL6QO7tN1wRdrv1VZGp81QW6yKaxK8bBPhmGlC4zq+HIBXNvapmH/9BjbaOlHNZoVs7ihzBJESfoHEkm8PQnLQvSWzo=</Encrypted>]]>
    </text>
  </script>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"></title>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
  </toolbar>
</grid>