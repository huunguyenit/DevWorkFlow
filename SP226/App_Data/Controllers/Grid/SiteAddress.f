<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "SiteAddress">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'SiteAddress.xlsx', @description = N'Danh mục địa chỉ nhận hàng'
else select @filename = 'SiteAddress2.xlsx', @description = N'Receiving Address List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="dmdc" code="ma_dc" order="ma_dc" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục địa chỉ nhận hàng" e="Receiving Address List"></title>
  <subTitle v="Cập nhật thông tin địa chỉ nhận hàng: thêm, sửa, xóa..." e="Add, Edit, Delete Receiving Address..."></subTitle>

  <fields>
    <field name="ma_kho" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã kho" e="Site"></header>
    </field>
    <field name="ma_dc" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã địa chỉ" e="Address"></header>
    </field>
    <field name="ten_dc%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên địa chỉ" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_kho"/>
      <field name="ma_dc"/>
      <field name="ten_dc%l"/>
    </view>
  </views>


  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJzzTIuRPhhF9Km3YgAb/Lt/wn6J2Oa1/fSL/8jHBYrsjepWf5xypXal6rR/VO29VH0CKJCHWRiZZ6gP7pKbm1EYO/mBmlrq8i7TfNl+4i7yFoJfe3RrvEeiigf1qh7dpWjvu3Krglm9EUwWx31lXh6hg==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75x8HtcelOzFdzA/EdFoQ7eLCGNOK0pK2gR79hEoak3wLocGWtdxGdUjg6t7+qFPXfaMSSpG/s2LAonWgb6UuqrQ=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ5PKn0oG8vr2qOsu8GOAf3Hv8BB97u5ISuQ38k5SAJBJIGHMy5+EkTBO0I9rQzrj71BPd5z4ov3MyazoSfzAZPBT/SnXC5HHyF+CHZK9tPHyn11yG8N9KgsvxJRJPT3N80jyMI38ivVM4OmI9GYF2bYdDZj/w4WbAzvwWbhfKkE7fwEjkXT9F1JrMH83u1Fd65hhnX2tWbF5xQa3kyGnqoDa0DJFcgvQ1ysxHzTmbhg0m1ohkPaHvyRful6yHuBZNa/QMF9JFxfFTihUNegJfxtc+ZME93s0nbwpY/8daZ0jBwI9gxXGaknnvaXjFnlCOVSh6VLhxpkI9qEYLDERhpBc4Ze9uSe3ap7ozj39eyEQIr4FGPO2lRbPTl0wTWqgnDUe1g8Js1cCBkOcbj7ypDaDpN5DP55WQY8GUyPtS8VZ8fhZwxctGNHqEqsk3lZkmgVGrv7/J1V5DKRCacHCsp04ncCzU7JlistaoJZqJW2UHFs1NjYj9ZSvb0k3woKF3zTfpxIJNXia8WOFRhXIyLi9Vj5+41i8VU++tuuoiFuXeqQI8PjxE3qKdVXWJmx/sg=</Encrypted>]]>
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