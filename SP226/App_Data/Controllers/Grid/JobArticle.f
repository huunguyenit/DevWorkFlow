<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "JobArticle">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'JobArticle.xlsx', @description = N'Danh mục chỉ tiêu vụ việc, công trình'
else select @filename = 'JobArticle2.xlsx', @description = N'Job Article List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="v20dmvvct" code="ma_so" order="ma_so" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục chỉ tiêu vụ việc, công trình" e="Job Article List"></title>
  <subTitle v="Cập nhật chỉ tiêu vụ việc, công trình: thêm, sửa, xóa..." e="Add, Edit, Delete Job Article..."></subTitle>

  <fields>
    <field name="ma_so" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Chỉ tiêu" e="Article"></header>
    </field>
    <field name="chi_tieu%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên chỉ tiêu" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_so"/>
      <field name="chi_tieu%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFU8QRbQvrioBkrcKl7GWKfN1rDHR45GJIdnHFmOiwy+Zw=</encrypted>]]>&TransferID;<![CDATA[<encrypted>%yLooQnL9xQeLYF/0lD7RzhlBeKFPUh1YYJWbF6e2x8x4+SUNgOW33E/MYH5H4XVS3oid5fIPk+DmC4ni33QBh9HjUIuFztt1TA43i1dJGGIs6NxvoBwSwJqvPtPmMuBrj8sODbbDAtmUyDNiCrMDFw==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiNUBrsXOTrexuecQHR5XLyfd3kHcx9PBC5W/ZcNTQHpTpkISQyXMhNQlRuLd4dfJ0AUUF/EsLSDBKP87WxEYYm4=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OVZ/lGi73Z3+ZRKkfj1/5vsMjVVc6mRTCV6Re7apKS+EfuAmgT3c5yZETmH7j26D3K5YV6/Rl5CvjyyPu8h+mA=</encrypted>]]>&TransferID;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfNMZVmAnUfHytctuF/1kYqA7PwkYMsYDFv2KIYAaWt9Z6hqy8YFmSBTfypYHR7/T+CmvrKKEhYYWQMAkhqUEYFQ=</encrypted>]]>&TransferID;<![CDATA[<encrypted>%v1A2DmqcSpxbgUfkUnvJavRF2IYtE0bavROW9ROLyOZBskuL1c82SQBqgHOhno/KqU4JKiA86p43yjQasgkzApSuu543T0ptAk52TAlHtLBO8BZDUizr3j7TIsB+bMW9L/6OHRtH1FDmrndbsMQTGQ==</encrypted>]]>&TransferID;<![CDATA[<encrypted>%v1A2DmqcSpxbgUfkUnvJaphyrcjOgwd+1PavZBzs5gJAiqQHbHSlf6VbThprhyvoZp7E+woIgqA3gU/ZFpnENOUUMxemIvsmheT9UNLLe+hmxxL9YVLg3WcUxsb91Boa</encrypted>]]>&TransferID;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfIeVkwsumXazuM4SZLvv/LRIELktwOgoK6yPJHY2g7UpBpRzMlsxjdD8Molsjk/T3eyhhkyrEFndXyKqXQ4aeH4=</encrypted>]]>&TransferID;<![CDATA[<encrypted>%v1A2DmqcSpxbgUfkUnvJap2NvILMNw+3X+teeLUShp0eavlj0yxmxoW1c86dxslXn1vskfaDUfKYfMyq8lI2eOlBuJO+wwBQssTBjOghsO9SeDaIm/4wjoka1s6I8z7OBipftkoKuT+JkCY1PrPkp4MJ61idfFB0PQGPuQO+jct4+MUlNOn1Ybac1QsbztjetzprGzczhNCkjBAs8ht2cGl9WJ70farz/okEkRrU8qVpu8vcs1Hg4vcN3E+wiaz7mVrdH/RA9mn2FI7Jv19FvA==</encrypted>]]>&TransferID;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfCP296pKBalKUNxwEp9xtIW9Lds48Wa4AHLxs876XGOo8KGbOnjOQbUdZsk0qEDLyTVnvbpAnXQTrKBDTfWrqbVh8MUHj5TW/NDKrkaM4OWZ+S7j1O8y5Wwu5SQY2C+aBHnYALayCEUyjI1Kkyd1kS/FRGGh5IbL4S/8c36bIbgyzjjaTdrwFc6N/oUrq2LbRyP4Pn38PHpd7rIkeV+anug522yuRvfDvtFYU+/ulCjlR45pj+Gl1tuMzR9hr6gTfEY20wo8Z7ZURUNe8J9Osf5oPe/LLl2pWHT1IKCM8Syd4+NpyPl2qpNBmCEA59XRG4RNYRmLbewGtHl6jNgbkovXf1oacKaq/fWQH+jUzkRK</encrypted>]]>
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