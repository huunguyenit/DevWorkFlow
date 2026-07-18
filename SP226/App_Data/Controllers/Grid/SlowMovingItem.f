<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % SubTitleBalance SYSTEM "..\Include\SubTitleBalance.ent">
  %SubTitleBalance;

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "SlowMovingItem">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVbdrj3MZW0S2vmq3v9teDqHEU5UvFZ01WNY9efmWX9bCJd1LnVmowQ6wmzkI7jKn14UYGCFheuxxHG+CedUIMz+vx5i3BpGrup/O8X+bGbiHyjpiqQkt3zzumPtwIq1OyZSfB/ZMII6/0YvkgLjsJzAWknyC3yQzqKcLEndcFfhDKc40Dhxp4Mg/bThYB/vjGyDutfY++YE4QDA9PY/zJDyMY330pD7huB7+si3Pb9iLw==FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY UnitTag "dmvt">
  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
  %Control.Unit.Include.Item;%Control.Unit.Ignore;
  <!ENTITY k "ma_vt">
  <!ENTITY Tag "vcdvtlc">
]>

<grid table="vcdvtlc" code="nam, ma_vt" order="nam, ma_vt" filter="&UnitFilter;" initialize="&UnitQuery;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật vật tư chậm luân chuyển đầu kỳ" e="Opening Slow Moving Item Input"></title>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvm7MVgOOwo6XEBkj6E/S0JmtEZbhdWZ+Qv4C/WuRCeJOv/MZ08ZIci22aJp1jHdTPlAzRKwPT1ZiY7n2fTmld5jXWyUJFwP7GaZWYbA3EM6tOGBYZI0o6PdfstZEZGAHGWvRhuQ1PiFFAF//a+dVcS2HAcHie+wuhq/dW9k7qfepyB/hQKY00CtKeCf84ZDO7QrJoyiqf9gfTkJBj7VE1zSzy50ZLsAWj6HK3lNNOpR5YueF8pM/g04rhAdGRFCqy5nzxVPMO9rxzyVUhuszI1XkbV1qXNtBWzC4NHFA5UH3fsrg+aLj+cfVWOYiPzQVPUU/zQhmYNpWyuyVkd4IB3GkKf1s0+Hi0Gjk8Hte4SESTrOCgWZWIWnv6oPtqperJO3wGaU5vxeh9KBX74ZY/yndxkXvd2KWTRWtvd1htfXGLFOCsDJXB6ceuDHHTriIt/+qIMnd0is5+xulQS70OnWxoEqdqogSTojQMNoBT4xL4sZJ57K8VOK9J1RrSLFmfu8HmnZhhRNcvIgU44/ASdqioznIYomns7izmp53zESIWw/xw8bC3JSrapimihFkHhPQw8YJ/rZPReRxE1QMmkq</Encrypted>]]>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QsMhJE1WhHzxQMYzOCHGGtoRsGxYkOOVrszfyhmmp7NvrfKhmXNO6IvaRye3On6Nm9NAnklkMAm6f5DrcdYIF2p3RNcVQlyXjw/RkxzSNyKOnbixC9wxA63OuG20eCrjlPNdIs3f42BJsd17eKPVOyn1uSzl63Mh609R5b0qGS1X1fR2UpQweVDDRMAf6Y2mj9p8HAhxZQP1NE7nmAMesxSpEz40Tcgn+zjv9zRhIIskIdpVNvNTbcQWbEd6raG6hz2x9eFRgoy8diM6TxR3OvhK6hR2qF0B/P4nrLcwsEnHeu6KpLLnGc/msSCGmVpBZ2iqOw1nGqpFIMLFVu3oZOPPhZ8Po9SECtzh9ffDlMbm1Ph7qdPBO2phNpGWADdM6v8ADHtF+8A7/qBPd6/8QwjYzY92NmokMiYli3G5FpZIDyPs6JUmQ9aFCVe67ZFsR8CNrIXe7pwjY9XaSZBTlni99CB8a/NVItrICW7Zh7cXiteDkdyVjSgXLSxOn4cs9O7p76EWUCYbFU7qko1YRVwpjwjpWfqA2XXYcGC/uop</Encrypted>]]>
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