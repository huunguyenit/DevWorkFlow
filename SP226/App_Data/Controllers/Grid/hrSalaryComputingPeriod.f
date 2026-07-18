<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vhrky" filter="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))" code="nam, ky, ma_bp" order="ma_bp, ky, nam" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo kỳ tính lương" e="Salary Computing Period"></title>
  <subTitle v="Khai báo kỳ tính lương năm %y: mới, sửa, xóa..." e="Add New, Edit, Delete Item Year %y..."></subTitle>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="0" hidden="true">
      <header v="Năm" e="Year"></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã bộ phận" e="Department"/>
    </field>
    <field name="ten_bp%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên bộ phận" e="Description"></header>
    </field>
    <field name="ky" isPrimaryKey="true" type="Decimal" width="60" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Kỳ" e="Period"></header>
    </field>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Từ ngày" e="Date from"></header>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="so_ngay" type="Decimal" dataFormatString="##.00" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Số ngày" e="Regular Days"/>
      <items style="Numeric"></items>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="nam"/>
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
      <field name="ky"/>
      <field name="ngay_tu"/>
      <field name="ngay_den"/>
      <field name="so_ngay"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJzymPAypqKLihYOMIv6op1ZAvTOoH6XsCYUW1/M3g/Gf/oAxoqGhSqaDaVk/i4Pj0koYRMAF6nIl/9WNesiCU1+28USP/SoUIrn5nFbwLGkzZixVFOvJZn9GHrRAhNfW+P</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGcVcOtUJBsfXq5uYTl2UepHpg27ooSKhl8GDEc/M7xGtKjcgKg6EK2PucE7ZyWLp7DUc5YXGPCPUFCk3gcOVWf3HjrVCWCncsbvRHp20mXy</Encrypted>]]>
      </text>
    </command>
  </commands>


  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtYKc9UHG51b5d76kJ0rlA6RTIObT8v2cIOQEq0fBT/TfSVHAk5vltQBrUfK2OFPZyKfazC8cm71RVIxG0U6C0Lqeo7zrEwIN6hwG8yfcREfU8s08fWD61Jpyz9ccAxitPC/9eMbqBFiCE9TI3dXdzNLgysBbLG/nKaA0RdYIiI/I3H7tb7lC1pOWQ/zmzbW1LAYJ/guiRy9+5438lHwugCmDfL8qTQdNlkthq1WtZn9DnAACPCbuuZT1QSFF5mMhszccGdH91rVY5Kv6R9ToKfAJ9a3/faqcyRuNbg53KfBs2sutvCK3h8KKORZ1CCJhaCp2iKl7sEeBM/JNEL0tjItBKfHsOMNm7MBJ4rS+unTVAC4LPgWwVCv3hOTqQQSmng==</Encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuw+1efvUiRGkTGh/egK88O/bRvJ/kVMwRFOSkfZfo+BOtZA24zh84H5CcHGlSaIzsL7ay38NR1oNe+IM1/UTB6MYzJaIHfdc8Rwuqs9lAO6gy4Xbq/HtYH02ZMbQ6EIpxSdz8ziAwOj3AirAOPijwI7z+NIWtvRUxdv7lqeHbqWH7XqJrxmzjKwMhjpDnHe/XaILMBDKrW0Si0peqSZ1XaZ9UMocFWhtILRJaQ+lfVBTiNdVc9U8+qdhwpwXJmi1Rw==</Encrypted>]]>
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
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="CreatePeriod">
      <title v="Tạo kỳ theo tháng$$90" e="Create Period$$90"></title>
    </button>
    <button command="CopyYear">
      <title v="Sao chép số liệu năm trước$$90" e="Copy Data of Previous Year$"></title>
    </button>
    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>