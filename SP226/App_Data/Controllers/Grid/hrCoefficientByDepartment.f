<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "hrCoefficientByDepartment">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVY5EDxeYAejjm8VkxgDQA8xuXMdsw2dJJqCIJ+GBXoneY1rbqdTRjspgrIPY4I7WVPoVelBa97M6SDY5uFEAF0Y4kZ12A2+aLpaj1I+/sqdvN3xXQc+Xjlb5MHD+scGO+LU6aGxQNkvSnNOWLaKb23R0z+oV9vnA5i1pqcJHQCO1vCAgiv6kaCEiNPpzza2PwBzrkDIQRKeVCIANyxEIhouFastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vhrhsbp" filter="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))" code="stt_rec, ma_bp, ngay_hl" order="ma_bp, ma_nv, ngay_hl desc" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật hệ số theo bộ phận" e="Coefficient by Department"></title>
  <subTitle v="Cập nhật hệ số theo bộ phận: thêm, sửa, xóa..." e="Add, Edit, Delete Coefficient by Department..."></subTitle>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên bộ phận" e="Description"></header>
    </field>
    <field name="ma_nv" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten" width="150" allowSorting="true" allowFilter="true">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>
    <field name="he_so" type="Decimal" width="100" dataFormatString="### ### ### ###.000" align ="right" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Hệ số" e="Coefficient"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ngay_hl" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
      <field name="ma_nv"/>
      <field name="ho_ten"/>
      <field name="he_so"/>
      <field name="ngay_hl"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJzymPAypqKLihYOMIv6op1ZIJgZneYoY/R/vcAaRw8YmFTiSh+TXu+RBSEfIBaDhBLLuVEGarhKVWFN6GcQfb1/EWp1yhnz+LnpO+0123TwWZqmEOqjS4/FYzigIEgMFwDgN57NL+g2gj2sb9rfh2ewUN756rzrp3LKtS+DpCqzd0=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75+7qCu9QrBT7HG2hk354cllHEScYjjJskbA2IxGGmNqYD6ycNDXtIn4aeP8L83tjp77J/dahjI1joEBCLyanSGQ7AenLikoCX/sWzfJppdq3</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtaJZuKz8QrlpWsaVbjFi0SUq80Q5ejMXvtnMTv2V5nuILLLBqT8QOv6ufKMJPDp0oGuHtbaddgwqP7vfJDVlMcRqDfs2VW4SAW2rwEZgHBZB0lGev4xTNijA/x4miwvqkXoxHvTdkrxgHADDJSV6exey4NNjovRNroXvrMVdvcXlTMsI9tqa+OUyLBbqgcc82exnVxEksSPBgvt0njQLuCxr3TfMBXYQ7+phRvWSQa/pNJEqq2ZK6KfIVlEZoYGoef7ZIHUyWKQtIipqGAxpCHQXhGAHeXpZy7pVCp0YBJsPxyC4zBtbq5o3XK0HqRpasj/JuMLIxSu+mWbNwOaQhcmr/MvHLwMEYvy/RrbsQHM2NuPDxJBqCybhqiSMZTkpgkGbEP3+D6MTLaOAP85AVdzY7XdOASxbg6N9rN13O5uG49EfdQF+ETFr3jYHJdTaS3F1O1MaqKwlJHdV9v7BzIFl0FQQUnXEJ06yhJ3/OMEZCJBxN4dYc8WJ4hdiXddoicD3JUPR7DpIiYAXFNy4wbM=</Encrypted>]]>
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
      <title v="Toolbar.New" e="Toolbar.New"/>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"/>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"/>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
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
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>