<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vhrdktangca" filter="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))" code="ma_ca, ma_ca_ct, ngay_tu, stt_rec" order="ma_nv, ngay_tu, ma_ca, ma_ca_ct" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Đăng ký tăng ca cho nhân viên" e="Employee Overtime Register"></title>
  <subTitle v="Đăng ký tăng ca cho nhân viên: mới, sửa, xóa..." e="Add New, Edit, Delete Item..."></subTitle>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" width="100" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten" width="150" allowFilter="true">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>
    <field name="ngay_tu" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true">
      <header v="Từ ngày" e="Date from"></header>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="ma_ca" width="100" isPrimaryKey="true" allowFilter="true">
      <header v="Mã ca" e="Shift Code"></header>
    </field>
    <field name="ma_ca_ct" isPrimaryKey="true" width="100" allowFilter="true">
      <header v="Chi tiết ca" e="Detailed Shift"></header>
    </field>
    <field name="so_phut_tt" type="Decimal" dataFormatString="###.00" width="100" allowFilter="&GridListAllowFilter.Number;">
      <header v="Số phút tối thiểu" e="Minimum Minutes"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_gio_td" type="Decimal" dataFormatString="###.00" width="100" allowFilter="&GridListAllowFilter.Number;">
      <header v="Số giờ tối đa" e="Maximum Hours"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_ly_do" width="100" allowFilter="true">
      <header v="Mã lý do" e="Reason Code"></header>
    </field>
    <field name="ten_ly_do%l" width="300" allowFilter="true">
      <header v="Tên lý do" e="Reason Name"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_nv"/>
      <field name="ho_ten"/>
      <field name="ngay_tu"/>
      <field name="ngay_den"/>
      <field name="ma_ca"/>
      <field name="ma_ca_ct"/>
      <field name="so_phut_tt"/>
      <field name="so_gio_td"/>
      <field name="ma_ly_do"/>
      <field name="ten_ly_do%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJzymPAypqKLihYOMIv6op1ZAUwux+crkOEVYxfka3tsEhf+bLOUQtRpUUbKPlH54m4WNyPSWrAoFlVS8/u67zuefuZNQkxhZ3n6H9K4FGHsGPpeM0kwyD/zgYIUpRn4fz/</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN5zf8chxzJIaUPW9138BJPSIC3QOl1B9OoIqGcu9bT42OR+51HNksrJ0GNs5Bhg3reb0YIxFkuX/OKj/J7CU+FpSvVDVqtsKxZ8G8E4gPxi</Encrypted>]]>
      </text>
    </command>
  </commands>


  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0zU8wFbBLdZztRuEJ6O530rkQJAwZ6KVFGqs46HUxeI0s0Rr6byQxndcys+W9d9/teqiUB2Ps0h0HPeaukb4cHqI6+zGm2r44f9PIxXsdTJroN9ok7szc80U/v42OF5pkVduh2ECjiI4Pi8rwdanVmiwpnxS3HF8LnCzs/tf5/CR1CGyLk2o67BXWuSyvaZzyAoHuzfdaeqJMVCq843lqtUy+qhp5Kj48yLeusTsZx8wfobloLJ+GpyE7lHb/rGajbSaPI4ZAHXPEtLv55OhwNXOYrrWGhjtqjhb+UCOnrruGsLJD7FXrPKprx57A/PpBELUsgmwxFOlQdVa6ZcY90k1w3EYZHLhH/DYDbIPLJ2h9UZ2JqRRf3l/+ByRv4xg==</Encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuy8OFql9ak5+K1wPY1SjWoXZPEp8KZbJeXmX9U5h2TDr1H+bnZHxY0Il82OZNzaKCD0UvCVUkswIeRKOtENjrtfYiRl+rU8gBoQDycfhk8vBKl1qXpfQ7gRHv2f1Zlm5B0RMDYNsVxXkwieGckVejaZfyo/IDz0zER9ed1Oz7OR7CMyqwEAIWjc7/2CXznH3AZtbw8vuKx50FSv0IHsrkZA=</Encrypted>]]>
    </text>
  </css>
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
    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Register">
      <title v="Đăng ký cho bộ phận$" e="Department Overtime Register$"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>