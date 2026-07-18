<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % SubTitleBalance SYSTEM "..\Include\SubTitleBalance.ent">
  %SubTitleBalance;

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "SlowMovingItemPhysical">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVbsHGqoaSpIhBmE6gLe3Vkoaa0HV69KahxGWKZ95I7LG6R3l/HU+gV8N0NioIgjiIIMEOb8EGJMLG65rnctjKKSJT8jm3Wx2xa4N1UtHEL5woew2VzjtnYGD9MDSAX5AuFFCSoigO70s3qizL/V2kzaNHzpdTnhSLnp4mG/am7yPIARefxmtTilc0IRH7CzBlrv+FjN3XkGApdnkGhekeyU1k1OUc78MaRBMCHqK0yRN6GKngDvwQllqPxrAWCzvVwQ+b34gIruACzO4TxRE9mYFastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY UnitTag "dmvt">
  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
  %Control.Unit.Include.Item;
  %Control.Unit.Ignore;

  <!ENTITY k "ma_vt">
  <!ENTITY Tag "vcdvtlc2">
]>

<grid table="vcdvtlc2" code="nam, ma_vt" order="nam, ma_vt" filter="&UnitFilter;" initialize="&UnitQuery;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật vật tư chậm luân chuyển đầu kỳ thực tế" e="Physical Opening Slow Moving Item Input"></title>
  <subTitle v="&SubTitleBalance.v;Cập nhật thông tin: thêm, sửa, xóa..." e="&SubTitleBalance.e;Add, Edit, Delete Information..."></subTitle>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="0" hidden="true" dataFormatString="####">
      <header v="Năm" e="Year"></header>
    </field>
    <field name="ma_vt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã vật tư" e="Item"></header>
    </field>
    <field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên vật tư" e="Description"></header>
    </field>
    <field name="ngay_nhap" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày nhập cuối" e="Last Receipt"></header>
    </field>
    <field name="ngay_xuat" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày xuất cuối" e="Last Issue"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="nam"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="ngay_nhap"/>
      <field name="ngay_xuat"/>
    </view>
  </views>

  <commands>
    &SubTitleBalanceShowing;
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvm7MVgOOwo6XEBkj6E/S0JmtEZbhdWZ+Qv4C/WuRCeJOv/MZ08ZIci22aJp1jHdTPlAzRKwPT1ZiY7n2fTmld5jXWyUJFwP7GaZWYbA3EM6tOGBYZI0o6PdfstZEZGAHGWvRhuQ1PiFFAF//a+dVcS2HAcHie+wuhq/dW9k7qfep7xYES7clAM2iLXkD5QHnMyWTLlQPFzbtXf9BO8S95E2EUvTZOon8Ex89qbT+thTFF8so+HdHFYoCkpEc4YqLun+jRFd9n2DTXsoz8U+Xme9viRqP+RFarB3ogv6bggUB0y2fGEnvJUyhUeU+Kb9YCTIvBGys6GZOWE/bW6cryD54OELIpMl2OJIVqaG7WSC/rRflD/RDc720g+PHxKLoc+SKrpPkDUsG1k0NmSQr6gCVtncBTD7CuQo7t/cF9E5seZ1+CmCFOAsmMzY8Z6S8zCZRw1+KMLzzHUXKWDD1R9j0XgW7VHATOG/HYrVyJLIvLgNsQeMLTdVA/G3gn1sQDafn23bYf3hr5NgzlQK+giAnkOplFUKpQ0b8vC2weoG2sAVvGEh7mfXf6LQD3kgHM+XfwXTBm95in+BAI6LiHs81Po3kJnDAJ/NuzJVKqYwMA==</Encrypted>]]>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QsMhJE1WhHzxQMYzOCHGGtoRsGxYkOOVrszfyhmmp7NvrfKhmXNO6IvaRye3On6Nm9NAnklkMAm6f5DrcdYIF2p3RNcVQlyXjw/RkxzSNyKOnbixC9wxA63OuG20eCrjlPNdIs3f42BJsd17eKPVOyn1uSzl63Mh609R5b0qGS1X1fR2UpQweVDDRMAf6Y2mj9p8HAhxZQP1NE7nmAMesxSpEz40Tcgn+zjv9zRhIIsIbGIWhMk0JqqEe1N4CIJxTHGrMCL95HNKbDBIgN5eQdm2Wg75mvbW4UZMd2EnQ6Gx4QxcNKA+jzfe9n81GD0iygjQPWThWBGu2puX0H5YBvkuYD7gKod9J7OXXphJTs2LnYUpi7qn/DmEfzM1BqdIKIQfVuTQqeUvgN1mwL8Yzxcr7jKD+R24UAAnbF7jR3tOgKW+XfrEKJEaR7eZe4xSiLhmhJtjO7ZjoEJ833KCHh+50kAFNKEuCcHOIoFAjH3KOqB0u4yblbHVeO2i/zPVYLnweiwoSWdwSCWFONbbBF/reWz8pTQVwetw63z1zvL</Encrypted>]]>
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