<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckRight "(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))">

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "hrAppendixOfLaborContract">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVapzn5lV7IacU1XkwdzjfzR0vVx/bap2Snsiba2z23wvvEhRk3pDRw1+tOkSm20avfIWN6KBCpwr2e901yF7uhRr5s397VlXE0zqOiGPuxQuNt9rEnm/sUbzN+Sa/gdAM6hmJFfkjPGHNIwZ71Hr/29A3MdUPaz15hgQnbyg4sWsnXQpys1+u7kH1xqDA0dYSSmNceZLQexMpV2Tt7cOHfgFastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vhrplhd" code="stt_rec, ngay_ky_plhd" order="ma_nv, ngay_ky_plhd" filter="&FilterCheckRight;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật phụ lục hợp đồng lao động" e="Appendix of Labor Contract "></title>
  <subTitle v="Cập nhật phụ lục hợp đồng lao động: thêm, sửa, xóa..." e="Add, Edit, Delete Appendix of Labor Contract ..."></subTitle>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ky_plhd" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="&GridListAllowFilter.Column;">
      <header v="Ngày ký" e="Date Signed"></header>
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
    <field name="ma_so_hdld" width="100" allowFilter="&GridListAllowFilter.Column;">
      <header v="Mã số hợp đồng" e="Contract No."></header>
    </field>
    <field name="so_plhd" width="100" allowFilter="&GridListAllowFilter.Column;">
      <header v="Mã số phụ lục" e="Appendix No."></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_nv"/>
      <field name="ho_ten"/>
      <field name="ten_bp%l"/>
      <field name="ma_so_hdld"/>
      <field name="so_plhd"/>
      <field name="ngay_ky_plhd"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket; <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJzymPAypqKLihYOMIv6op1ZEM64BV2OHLcPY+ET1Z306DsW2TuLfNc+LH5m5nxWzuCELUex9MIC8nehdJnwpz1LUhdA9Wf6aO3ZIiwK0d2MGe/mEAYw7JFqbuBYThhMOBPTOyW7qkwql4ghsvdMrtUZA==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcOID/tKl7KygxsBqfJjp534upnIBwPJ/G33uivztVWQjFo2RF++q35EZXK7JR6xUn+tqI0uFX8m0ZbYTcq3GXd9tDJ7Z6AggdArTdicIXubB</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtZQi3uFja7SNjfBPp9DUVcc2zQJmzVVWE9BiKJDoJ34UJ5zQNfmHodeJgm6KHBJvU3iuAe7YH4Gb34whvHACsbn8n7KOJs+UB2MaIzefjiKXpxFum2iiND0fEly0dxjb1Ztaromu5aoiXXWZ0lgpm9U08Kp7pS6wabQd787SKwIedZUEy4qw4OploHLdNBzyCwX0hiqxbN0at5V8YXPhaL6TI1Y4qf35d3yKkjLhqgfxjWwO7b7L6iFwLwnyINtr0c/DqL/2s0X/4oZ4NBcOIiXm+Yiso8752M8krtA3Y+7EzqcD7J1+Of0iETiB9Inw28n5oZPW36yjiCje2hDACK/J34ygl2mVJ3lrLxbGpnrvMvjVymQe8WtJictnKTnCr7EoR798X3PGA9ATvi2CpC4yksY1Ko5Q1Em27bE91SDNZ0Khem8UHAONoEagpVZd4CcUFPKXo+cRJlUloQ1Jo7PvOjhX7MEDKJ0b7Jd+NuUsE9CHCS4dswExrOhyp0MeB92Vwsm3euTjYtDoAIVOC58=</Encrypted>]]>
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