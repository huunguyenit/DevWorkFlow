<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckRight "(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))">

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "hrLaborContract">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVb89szvKRjD4A/hpNb0VbK46631jEyjCjlTyR4ilW0vDvw8zypkKxp90GB9BXOvtgpPRW5lbmm8epMSoyCztrCCjDeb3nDQ8QGaZO3a74heACltwRiDpUZClGGn31Fu7fsDL8GFHasB3bI6AAkVIDj7GrJQKjQK7ojmcTh/rksM5g==FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vhrcthd" code="stt_rec, ngay_ky_hd" order="ma_nv, ngay_ky_hd" filter="&FilterCheckRight;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật hợp đồng lao động" e="Labor Contract"></title>
  <subTitle v="Cập nhật hợp đồng lao động: thêm, sửa, xóa..." e="Add, Edit, Delete Labor Contract..."></subTitle>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ky_hd" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="&GridListAllowFilter.Column;">
      <header v="Ngày ký hđ" e="Date Signed"></header>
    </field>
    <field name="ma_nv" width="100" allowFilter="&GridListAllowFilter.Column;">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten" width="150" allowFilter="&GridListAllowFilter.Column;">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>
    <field name="ten_bp%l" width="300" allowFilter="&GridListAllowFilter.Column;">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="so_hdld" width="100" allowFilter="&GridListAllowFilter.Column;">
      <header v="Mã số hợp đồng" e="Contract No."></header>
    </field>
    <field name="loai_hd" width="100" allowFilter="&GridListAllowFilter.Column;">
      <header v="Loại hợp đồng" e="Contract Type"></header>
    </field>

    <field name="ngay_hl_tu" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="&GridListAllowFilter.Column;">
      <header v="Hiệu lực từ ngày" e="Effective from"></header>
    </field>
    <field name="ngay_hl_den" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="&GridListAllowFilter.Column;">
      <header v="Đến ngày" e="Effective to"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_nv"/>
      <field name="ho_ten"/>
      <field name="ten_bp%l"/>
      <field name="so_hdld"/>
      <field name="loai_hd"/>
      <field name="ngay_ky_hd"/>
      <field name="ngay_hl_tu"/>
      <field name="ngay_hl_den"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket; <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJzymPAypqKLihYOMIv6op1ZNXsEAd1jR4YpF0qpZtf1PJ46QKe+qVK9rXlO748Co9xT2aGkUMtU9WYCCNc/2RTRPyWTJ683yVCQuuXg2QZlfR/cUEtP7xFQVc11l/TZUi9Vk7cgj3ji1mtZEkCTATJzA==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDL0Vn3RtPrrqwZqzR1yh8bPp4H+WUdTO0EwMTOSsUchfAPwunf+D4hukc2OVhTCxpq1RNV0ntAxSd4azOQz6XagpO+cfKEE+wIa1Iv/p5Ae</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUl2VW3H4uCHtziBTb2LLcLPr0IcdPkddAvg19PZpKnEz0ZExOTfsF7GGRKORXVJUC92jPs6YGTPbD3f8M1dO9ohE5v/4ynCWWx2/gNTIg6td/IJrpTkyAd6lWOYOa6ooESIDVpMxJqthXG/8VlrSZXRLvfweNszy+h6Tsq/jiPG5gUG+rkMbBZm58m7NfWq/0qnOFqDDwkMb6NlrHS1hfbeQDVK0Jdpfhi3ku4KTwh0caN+B7NOooGKP/9acblNkG9n5antDtAkNKIBbS/Ys19rr/XNPxNm5tRRoXjrPlgiqKyVvRxl2U58p3+Iw3VpHMNZalUvtzroP4SCdKFgJ5c2VFMTBnOVLseEwCQ0Z3MrJ74hhXWBP7D+uI4/yqs0U9wbOhrJlPkuXsUlxchP2EvDarNUSpEQUrhuYyODMSZ198aP0WMMGFHoSdIgSs5HygsyESnJ1YesnJHCSUCXV/y3SI4Cu7/0JHMj7Ug1d7DvhpafTFBKjMRqAuFyXh6rvmrUM+NS/s54WrNQoy6uAaU=</Encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7Q2ZgN87qIJvPvG6Hzq8L9loaCflvmvkNH8VLZ2CkRZovJCEiJ6AR3gqMbkiE31/Oc3ZzMUpRFDqWVExQBJV+Zr88IlDe/oSzZRA1t8b0/0w3BqTKi7PnWnO02iO/Cwi4Gr5JH1yfJJpAAx17dZWFyA05PJJcj/N8dU0K9UVDsl</Encrypted>]]>
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

    <button command="-">
      <title v="-" e="-"/>
    </button>

    <button command="ImportData">
      <title v="Lấy dữ liệu từ tệp..." e="Import Data from File..."></title>
    </button>
    <button command="Download">
      <title v="Tải tệp mẫu..." e="Download Template File..."/>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>