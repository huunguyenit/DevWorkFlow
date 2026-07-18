<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "BudgetArticle">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'BudgetArticle.xlsx', @description = N'Danh mục chỉ tiêu ngân sách'
else select @filename = 'BudgetArticle2.xlsx', @description = N'Budget Article List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">

]>

<grid table="dmctns" code="ma_ct" order="stt, ma_ct" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục chỉ tiêu ngân sách" e="Budget Article List"></title>
  <subTitle v="Cập nhật chỉ tiêu ngân sách: thêm, sửa, xóa..." e="Add, Edit, Delete Budget Article..."></subTitle>

  <fields>
    <field name="stt" width="0" hidden="true" type="Decimal">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_ct" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã chỉ tiêu" e="Article Code"></header>
    </field>
    <field name="ten_ct%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên chỉ tiêu" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_ct"/>
      <field name="ten_ct%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFU8QRbQvrioBkrcKl7GWKfN1rDHR45GJIdnHFmOiwy+Zw=</encrypted>]]>&TransferID;<![CDATA[<encrypted>%yLooQnL9xQeLYF/0lD7RzhlBeKFPUh1YYJWbF6e2x8x4+SUNgOW33E/MYH5H4XVS3oid5fIPk+DmC4ni33QBh7cs2SKobjZXRTHz79KBOYI=</encrypted>]]>&TransferID;<![CDATA[<encrypted>%yb3r8nYg0FPwFXMJ1/oFI7200INbRFwrRV1ygt8qMKFvYMS2nnkKHRJzehg/NGQyg5N95QkHSh1LGHn1Ue+VCg==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfw0r+aDZxD7/z8Jv5YIeUV+OeTAEHcDk8ww3LDINf00I</encrypted>]]>&TransferID;<![CDATA[<encrypted>%yb3r8nYg0FPwFXMJ1/oFI7200INbRFwrRV1ygt8qMKE20EXTgh9XJJPm24pIYE1L</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hlsFSWtQoZoVp8MFPktHxcE</encrypted>]]>&TransferID;<![CDATA[<encrypted>%g6LJuSQbeDI2wEReHbGoSkRHl33Je114jeqA24ohK7vHi/mhXHnjLIhQUGeTkHGlKznHFHWFpbi4Ru3gPE5GsA==</encrypted>]]>&TransferID;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfNMZVmAnUfHytctuF/1kYqA7PwkYMsYDFv2KIYAaWt9Z6hqy8YFmSBTfypYHR7/T+CmvrKKEhYYWQMAkhqUEYFQ=</encrypted>]]>&TransferID;<![CDATA[<encrypted>%v1A2DmqcSpxbgUfkUnvJavRF2IYtE0bavROW9ROLyOZBskuL1c82SQBqgHOhno/KAthsx+PITRgNweZL0gWkNNWhP7UhKAlmWpItmtAjlFo=</encrypted>]]>&TransferID;<![CDATA[<encrypted>%g6LJuSQbeDI2wEReHbGoSq/Jl3OeCuxrSy7iVx74cEhwJ7t0TKZEFhdw6izTR016ugC+9WaP7GcafycbfsDW2cSAAWYaokn/TLVBKNAMxIA=</encrypted>]]>&TransferID;<![CDATA[<encrypted>%v1A2DmqcSpxbgUfkUnvJaphyrcjOgwd+1PavZBzs5gJAiqQHbHSlf6VbThprhyvoZp7E+woIgqA3gU/ZFpnENOUUMxemIvsmheT9UNLLe+hmxxL9YVLg3WcUxsb91Boa</encrypted>]]>&TransferID;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfIeVkwsumXazuM4SZLvv/LRIELktwOgoK6yPJHY2g7UpBpRzMlsxjdD8Molsjk/T3eyhhkyrEFndXyKqXQ4aeH4=</encrypted>]]>&TransferID;<![CDATA[<encrypted>%v1A2DmqcSpxbgUfkUnvJap2NvILMNw+3X+teeLUShp0eavlj0yxmxoW1c86dxslXn1vskfaDUfKYfMyq8lI2eOlBuJO+wwBQssTBjOghsO9SeDaIm/4wjoka1s6I8z7OBipftkoKuT+JkCY1PrPkpyKpanEhtFpkwvpVu68rVR8=</encrypted>]]>&TransferID;<![CDATA[<encrypted>%GjSIQlRagCSZCeYS4EEaTXvw6Fv4HWC1Dro3gNXTDKqj/pvSxr9Qqd0VCY1V4o9bpJ5gwepVgqKFCAPHTAS5YqA5z23bsMz8wQG86eGNjGRBoXcj8NAF8MC4QoCsUdzSk8hWNUbyj3O01So7TBaSyQ==</encrypted>]]>&TransferID;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfCP296pKBalKUNxwEp9xtIW9Lds48Wa4AHLxs876XGOo8KGbOnjOQbUdZsk0qEDLyTVnvbpAnXQTrKBDTfWrqbVh8MUHj5TW/NDKrkaM4OWZ+S7j1O8y5Wwu5SQY2C+aBHnYALayCEUyjI1Kkyd1kS/FRGGh5IbL4S/8c36bIbgyzjjaTdrwFc6N/oUrq2LbRyP4Pn38PHpd7rIkeV+anug522yuRvfDvtFYU+/ulCjlR45pj+Gl1tuMzR9hr6gTfEY20wo8Z7ZURUNe8J9Osf5oPe/LLl2pWHT1IKCM8Syd4+NpyPl2qpNBmCEA59XRG4RNYRmLbewGtHl6jNgbkovXf1oacKaq/fWQH+jUzkRK</encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6ZHdyNxAoKPNwZiKsTaXEz4GRPUxY9/57uWluglpeePR5U1WuzYrYVtV5AmZ0PeC5MVgb7Xidsw19MNRH4oW+PH0v9JuYS92Wb/9Rfs2SbeLxKxV/u2UFLn+y0oIz4hphK6tzhnD2zTkAxMQL3vWpimctSEiufgOgwj4W1QR6AtH</encrypted>]]>
    </text>
  </css>

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfz6e414K5THbJPKTpTCXK/0Soy/gsPLzbDunHmOYjOYz5znFkiGNhRte4WM40R4ZHA==</encrypted>]]>
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