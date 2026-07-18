<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "hrAMCriteria">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVaU8p375qIr8kYJQ0pvm9es3AW1jlMcvD1ja2S6Ykhd9VoDnpYxKgQsqOhDQsX8kgZQTWqgwxRDZvXju0UwIWGF1yNlPu9E0B9kidep3ROdQW6iAa4tf3qrTFqu83PiOJ0o4HAqHHEZOrR2/6u25gAaoqgH3+J7iSP4+fuHEPKaFyxCXm9C7TbbEYuEFYu1o4Y=FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vhrkbctdg" code="stt_rec" order="stt_ref, stt_vtr, ma_vtr, stt_nv, ma_nv, nam, ky" filter="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo chỉ tiêu đánh giá" e="Appraisal Criteria"></title>
  <subTitle v="Cập nhật chỉ tiêu đánh giá: thêm, sửa, xóa..." e="Add, Edit, Delete Appraisal Criteria..."></subTitle>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" width="100" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ten_nv" width="150" allowFilter="true">
      <header v="Họ và tên" e="Full Name"/>
    </field>
    <field name="ten_bp%l" width="300" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="ten_vtr%l" width="150" allowFilter="true">
      <header v="Vị trí công việc" e="Job Position"></header>
    </field>
    <field name="ky" type="Decimal" dataFormatString="##" width="60" allowFilter="&GridListAllowFilter.Number;">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="##" width="60" allowFilter="&GridListAllowFilter.Number;">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="stt_ref" width="0" hidden="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="stt_vtr" type="Decimal" external="true" defaultValue="0" width="0" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_vtr" external="true" defaultValue="''" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_nv" type="Decimal" external="true" defaultValue="0" width="0" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_nv"/>
      <field name="ten_nv"/>
      <field name="ten_bp%l"/>
      <field name="ten_vtr%l"/>
      <field name="ky"/>
      <field name="nam"/>
      <field name="stt_ref"/>
      <field name="stt_vtr"/>
      <field name="ma_vtr"/>
      <field name="stt_nv"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJzymPAypqKLihYOMIv6op1ZLAweIA0ykVeE+kwtN9jmCGVxn6bAhwa93yza4iAnlywB9yPzu2bzKV6TYYV1SjWEdz0DuYTLvLRXdtNlnQl6UM1iSwyNfS+mr/OIU+Ogtu3rdBzwbnAnW59uSdioLNmlg==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL752FxNr+eTcY27nKbOj4ny6RbZdF07caWqIFGPvt2Cqr5DoHLYs8KrNoERMPl24Xp1XU/cIbFpdMQ4yFsRhKVYkQ=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJteUAe7/XrB1upPOeWwhxC61f196JgkZiXnid7hDxUzlBgEHeZpqOw/tr1F9iqlD39y9NU0ZI7CTnAJutmfVvYQzvXL6S0NxNflTAvjXUV6iD/AND/PKmhOFcZQ3ijXYMX4y7XQakZi/fDwr/8SFCwfAP+gmDJOtaj2QM9eqijBTDhpoabeRH0WfZjwikACcgAylptnNuDa+PCrqJqIl45FiZIme7GQn1yfLl8+SLQ3j+rKyWDy/e+erdjzS6u6xY9qyqw3NkDvXM+7/3CGYLqjEksKCMMJ2CBeFFRcIBu6bqIw2cBVpclrHFnU9mQTYtYjVX7BhhKw9nujKjB0GiVBqyozIbapFdNBAcGsqy4dDMv1ROVkNFl8kU6uP1XO962CBf96kbvb+nk0xytKeiR6mYITNhR6dVubEEBnZs9Mg6QexTtMVCgtt5C5cLe5RqHhCTOItNYXKu5v7GplNnFvuheBCiE5j+pQSKTgM18OpgDqd7HDi+fcpCgb3wFtUvkQ==</Encrypted>]]>
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

    <button command="Clone">
      <title v="Toolbar.Copy" e="Toolbar.Copy"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
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

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7Q2ZgN87qIJvPvG6Hzq8L9loaCflvmvkNH8VLZ2CkRZovJCEiJ6AR3gqMbkiE31/Oc3ZzMUpRFDqWVExQBJV+Zr88IlDe/oSzZRA1t8b0/0w3BqTKi7PnWnO02iO/Cwi4Gr5JH1yfJJpAAx17dZWFyA05PJJcj/N8dU0K9UVDsl</Encrypted>]]>
    </text>
  </css>
</grid>