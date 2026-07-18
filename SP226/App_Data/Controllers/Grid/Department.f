<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "Department">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVbVa8gM+i52+182lSayuLbarfWbOiB3kLywadTX+d594Pi5P8/u4wzfXxOXdMAjRNFSZTazpeeximWxmsj2WeB3LKy+uikulMQRtQ4sxWDV6Kiswqbk1E3ePD31kBHHYH7/dWUTsKInibvgwxE6xqS3CSuOAP43E6osijuENwk3NQ==FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
  %Control.Unit.Include.Department;
  %Control.Unit.Ignore;

  <!ENTITY k "ma_bp">
  <!ENTITY Tag "dmbp">
]>

<grid table="dmbp" code="ma_bp" order="ma_bp" filter="&UnitFilter;" initialize="&UnitQuery;" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục bộ phận" e="Department List"></title>
  <subTitle v="Cập nhật bộ phận: thêm, sửa, xóa..." e="Add, Edit, Delete Department..."></subTitle>

  <fields>
    <field name="ma_bp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên bộ phận" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJz9whcuIyInxKJYt13XWKsupXhDqr7xoZ0AoCpN/95ZVIdCu10/Q2gdlC9MG6GVUX6DSnLMjzMaLXz3xBXC9BKrltg8F08wDLuKA8ibv7zFLQD1R3i9khWnVF+rpNqJy4EDaMZ6ntTIUWjaJxMVzCuCQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75xRt/cKFLam7y/utk9CrMOQDxJ1rRh6W/YM5fq4icbK9+flKEQAhs26TVsSngCXuFpGFcRouE2wfQv/wyrnasIU=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtVtqDUzLCq5HfJxx36E7q5VrTOyfIm+3ZsnWgrc/oCLZrPEW04fAo3npUNWHfjCvGifPfp0fbe1EJFuXXBA/tq7ZEVW6/AotM+DvI5WcGry8mDyUq7vgXvpK4HIcCmFjpCcJh26pzGAgKU/5MMx5ZtsV0bFMizHs9ABtAFliBf0wo5qfvBX8p+k6zn0b9AZ+GyBlwgAt3nVHCksoHDElvY+CDOPWY4yT5ep72PBpLmLXiEstV6tMuiUqo2OPMjTIgSYI2cdrsquJkG7m5T5914PBieCBhw+OZbXXfCzer/Uor8FcVQHOWLEDBP1gk1WBIqtlWwVuAC8iCqmyq5TZkGuboR5X1BEDqN2QlsdH9grP26J/w2H2xZfE6ypQ1pe18aXz1xZODflyBkJm73Tn7NDxFUiw8DMQkFrDui4uWCyMItjr85DVTEv850HOovCXTS9hztkTQTM/p4ZyaNjdnrkt7WzfpnE5kvCRhZ1h1zttFbi08kRxDCnaja0S+eiBJA==</Encrypted>]]>
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