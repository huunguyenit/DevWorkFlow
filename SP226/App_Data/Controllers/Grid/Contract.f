<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "Contract">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uA7YWGRIKnI9x0tKN5yf5nWMX1S41inKp0JTWfM4tDVnkin4NCbSgFmfUZrBd3GfWLiZsnEc7aKMBuI3Z7hM1NMeEBgRO/JcAjTZ3dmyi98pXz9d6nub9B8gaVOhvyoKqnoxBVtNvl7fJRFl+EKMsaNPrpaGRbGtGFrKp2WGkLenL+gbNRdSyaD15/0ZBPF+z5b51l9cNBDBz6b1v7PB0hqP+Lkz7gH8BeuISb9br7vidzZ3PeocvvRI0zfjOuLRKpZp+vVW2QvGJdbw+nTnfUhrHvIwuIH7nNLyF71fIgEdEpHEGLcEDtPLCJN8qYxBu7InPba4zTQ8L3Lqr7WlXWNVBkQZwKLqnmwg5CikaXgLCBUwVs4lCAwNKR6SbS5Uvcq+2wSap6ua5lIb7mn+KEw==FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
  %Control.Unit.Include.Contract;
  %Control.Unit.Ignore;

  <!ENTITY k "ma_hd">
  <!ENTITY Tag "dmhd">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="dmhd" code="ma_hd" order="ma_hd" filter="&UnitFilter;" initialize="&UnitQuery;" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục hợp đồng" e="Contract List"></title>
  <subTitle v="Cập nhật: thêm, sửa, xóa..." e="Add, Edit, Delete Contract..."></subTitle>

  <fields>
    <field name="ma_hd" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã hợp đồng" e="Contract"></header>
    </field>
    <field name="ten_hd%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên hợp đồng" e="Description"></header>
    </field>
    <field name="ngay_hd" type="DateTime" width="100" dataFormatString="@datetimeFormat" allowFilter="&GridListAllowFilter.Number;">
      <header v="Ngày ký" e=" Date Signed"></header>
    </field>
    <field name="ngay_hd1" type="DateTime" width="100" dataFormatString="@datetimeFormat" allowFilter="&GridListAllowFilter.Number;">
      <header v="Ngày bắt đầu" e="Start Date"></header>
    </field>
    <field name="ngay_hd2" type="DateTime" width="100" dataFormatString="@datetimeFormat" allowFilter="&GridListAllowFilter.Number;">
      <header v="Ngày kết thúc" e="Finish Date"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_hd"/>
      <field name="ten_hd%l"/>
      <field name="ngay_hd"/>
      <field name="ngay_hd1"/>
      <field name="ngay_hd2"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJz9aasU3wp31K3P5sP6289GWJKzImmcPLVO1uubpHqtMVyX5SlmUmwTFnnuwY0ezs/D/fq7Isz35dSy6MHgalphDJpxMyuZabXXUhpsL7P6yW3F7klZM960CvmcuLmHaP90rq0bZBRwfcuX5qBJF+xPw==</Encrypted>]]>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtXzbQrSh4yzrH2nmccB0eyrlYN8OTNcRdp+JCKSIPlm+IcYCcq0JryN9lL4gL7CCtQmCQeubjs/fdcp6VE4fPibUqQDRss0KU5MZkILXPP2Z9YzqtsYmcUl05oOk1cwRo7eTD75utrAEFe3tqxh9Xh06TnWsa1VHxMSxVxOeP6dRjZLjnlRtyYWYvp7qH/HyHWE2+7zEg7un+fi57XoIQqgSwsu2QY/n6uJ4NiuHYgR4FcOEFGeLj8scA7ApLWM1BbIGgSev69oYkHq9rUcQEY+lnFUJX5b2NlBf20Wi0jdILhaSjpOsAtzm/XfRAOi1sIlqSb+b8U9vaosO1aOeu4VXi86vbNhHKGa0dQtyePonIAQIy6g2BO5bda9vCHO6VrnzydUfypo1IUzxW3R2a/BtJacl47FyYXZGzSkP2oIsVX3OuAHDJWHhexzNkCBhBlnGKZrRKHSGN2TKKySAMhPq4y3fq4jkUrrrVqBb1uHs82IEy5ATDx3yV7AXw6y4yQ==</Encrypted>]]>
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