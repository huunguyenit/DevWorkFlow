<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY UploadTyle "ReportLogo">
]>

<grid table="v20logos" code="logo_id" order="logo_id" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Thiết lập biểu tượng cho mẫu in" e="Set Logo for Report"></title>
  <subTitle v="Cập nhật biểu tượng" e="Edit Logo"></subTitle>
  <fields>
    <field name="logo_id" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Mã biểu tượng" e="Logo Code"></header>
    </field>
    <field name="logo_name%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên biểu tượng" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="logo_id"/>
      <field name="logo_name%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHYIQZJPFw3tX9GexUGcZbX6S3+4XmMR2ZPqag4eh19tbTDodgh5KSjbvqbTbEZQWN6JqOcx/hecqfldtHxPkQA=</Encrypted>]]>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtXzbQrSh4yzrH2nmccB0eypjpU8C6bTPBpMC+FtL0Aj3RMBcSuMiq7/eWRFLT+y82i2YLUzn/TyhadAuioPU2Bw4FUg3FRR9MYh36bdl9HcdqgJ8j+Wvm5CeIyNqSv+m8GQ6dqnEPZ2c74ySEEJgSl8GbLM7JtmL0XPOuzTEFiMXoVSlWTSshFhpi5wo9JaDpvf6FOngeWKU5LbpdoF3lP5BKcOl9J0BctANKRajKN/ZWPhV0CpdAuzPqfJM8uHgWwRwxSxKUyHCjIODxEEtxkFyBuy4GozVZot/Rn3zCQ3idcCZZZhGnMXYPIdKepZdPQZSmqa//Ksq5F2TZpBANhxa1MorFw3oDtBjke0WaNIDaQ5C3xdGFr8NsdvqiNE8E6gDjAgvrtgCHHMdbrDrARd7vlcl/qkjgqLQAzw3CnX2nw09FIS2EjkiMF0h1jUaGWa9jOtbF2vMapCJGVRhEmTN60WOQVDmHTd1CwAPeBLSxBITz/nU/6xz+SEApOdM3A==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="SetDefaultImage">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0gMbFCgv5cej6V8MtvUF8r4Bld6hZL9KiOKQgTmPuDpFQ2gRiWnO+UPyGi/C+kHugB4xlLkiJLk6efY+S5bTPDAZcYvOY3bcEnDCXtj+1TP8pYX6wSU13s1WRcHIoxq6yjyHS849ZVv8jg+achmaRA14hK7OU0CCsNwIX8xU5i75Q==</Encrypted>]]>&UploadTyle;<![CDATA[<Encrypted>&4Z3iXjUo/EHcYSchZnZy5T2a+mCNauEQl+vz17SAty0QDDIqZDCDcHbaACk7B+utoPI3uf3sG29x6Mx6aG4Y85m0qeXu0MApLGlC99z6bI3qPT48VMOvJsHmIGQ7BpgRnB9UUWtGyrW8x3QclTsJdQ==</Encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuzCnsqtjflUXappYn6EBzZgHLFXWz/II9Sx0J9O+Afbg+zF6SQPz5BAL9UNjYmcaE5bzZLHZX7KyTTMFGUqsqGLE/mXyov4lnwQsNNF80Isu84jPzOdymKiYLVZwpon5ODmLMEeffIOKk2bGxceX1X9thEnUWyKCTtD9waMPaEAMR9Smo5QGGWjgaVp4bSvBSskoiOL5ScpYF2VIdbPPx2k=</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="New"></title>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Edit"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Delete"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="View"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="SetDefaultImage">
      <title v="Thiết lập biểu tượng$$90" e="Change the default Logo$Change...$90"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>