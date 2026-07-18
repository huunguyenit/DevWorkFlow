<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "Account">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVaqpq8prl8JScESyYTLAFuUcU2rBq8ugEnxcU5OGSyT/LdFYjq41bF3HX0356S6L9nReMMrvp3KCB+DXEPl0eZUszWkzizUlXVSHjqXxP6+ce6PuEWLN+B7Fx3pnSmXPpwXjL06try8I+NGl04rky8Oz0h1hZD+jB2eaE+CNAVrKA==FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
  %Control.Unit.Include.Account;
  %Control.Unit.Ignore;

  <!ENTITY k "tk">
  <!ENTITY Tag "dmtk">
]>

<grid table="dmtk" code="tk" order="tk" filter="&UnitFilter;" initialize="&UnitQuery;" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục tài khoản" e="Chart of Accounts"></title>
  <subTitle v="Cập nhật tài khoản: thêm, sửa, xóa..." e="Add, Edit, Delete Account..."></subTitle>

  <fields>
    <field name="tk" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ten_tk%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tài khoản" e="Description"></header>
    </field>
    <field name="ma_nt" width="80" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="Currency"></header>
    </field>
    <field name="loai_tk" type="Byte" width="80" allowSorting="true" allowFilter="true">
      <header v="Loại tk" e="Type"></header>
    </field>
    <field name="tk_cn" type="Byte" width="80" allowSorting="true" allowFilter="true">
      <header v="Công nợ" e="AR/AP"></header>
    </field>
    <field name="tk_sc" type="Byte" width="80" allowSorting="true" allowFilter="true">
      <header v="Tk sổ cái" e="GL Account"></header>
    </field>
    <field name="tk_me" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk mẹ" e="Parent Account"></header>
    </field>
    <field name="bac_tk" type="Byte" width="80" allowSorting="true" allowFilter="true">
      <header v="Bậc tk" e="Level"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tk"/>
      <field name="ten_tk%l"/>
      <field name="ma_nt"/>
      <field name="loai_tk"/>
      <field name="tk_cn"/>
      <field name="tk_sc"/>
      <field name="tk_me"/>
      <field name="bac_tk"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJzGQNBS7eyvH3MP8fpFa7Jd5WIMn1vh/l8wM9JfYmJgiez2yVo9E46jA1ERaXAcE68hZ7ajjYW/pW5+TxKwunLqaDYOW7FnPlQeBPH5mxwa7aIJL9ogIYQO2z/4500FMs3PkXgiMeBzZQbot2W43FwGw==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL753ZOxbIC+LxbnrSHSw7x7wObkPS2H/Bx4sZhA2uYq2nGvDFzd4RWXLmwgc3k4lAkrqBSb8y/ZKu8bw12Es+n/4c=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtXzbQrSh4yzrH2nmccB0eyrlYN8OTNcRdp+JCKSIPlm+JbW8DzZMCnEatvfkrwEHjNmVijgise8kM7ToCcTlsAKwkI8JTzzs1Dhh5Bvh2/bFseB5zGkV2eE4TAcXVCgButFD07Aef9YodqY8JpByNHBq1Rr+XAmC/T0LKnpDX05qsdLBXh9MpUeO+KMd+ovfFi6h2nM6Zh8oEDWQUZEJYd9N5d4cTalCK7sFEDkmN6WRHb/j8W5mbgiNMZxfIAsH38F8UmWZ2wHeqUUWRUXhySHqxgx0eskp72rxlvPZFepLXsk1S1VWYl0KwFrRAvyO2AHCKfHpNBeGwv2CXt4U6QEv5zv22wOcUYAZLBFjSuMFKaaoVNFGuGm4oEKBeIs3HC6g7XRiTH+ppQ2chqkpUdKjxW9KXnYPubPSNcTV/rXCJh7dNq468+gD22zX7NXxzqlv9k+bsbvopx/vGWDgLFARhdAXBgcVGyFDqXcHPmNWHXzkLdfZhUV83OJLy7ZCYA==</Encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7Q2ZgN87qIJvPvG6Hzq8L9loaCflvmvkNH8VLZ2CkRZovJCEiJ6AR3gqMbkiE31/Oc3ZzMUpRFDqWVExQBJV+Zr88IlDe/oSzZRA1t8b0/0w3BqTKi7PnWnO02iO/Cwi4Gr5JH1yfJJpAAx17dZWFyA05PJJcj/N8dU0K9UVDsl</Encrypted>]]>
    </text>
  </css>

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>
  </response>


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