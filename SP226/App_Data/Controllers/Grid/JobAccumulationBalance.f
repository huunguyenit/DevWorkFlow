<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY CommandWhenBalanceBeforeInit SYSTEM "..\Include\Command\WhenBalanceBeforeInit.txt">
  <!ENTITY XMLStandardBalanceToolbar SYSTEM "..\Include\XML\StandardBalanceToolbar.xml">

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "JobAccumulationBalance">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'JobAccumulationBalance.xlsx', @description = N'Vào số phát sinh lũy kế đầu kỳ của các vụ việc'
else select @filename = 'JobAccumulationBalance2.xlsx', @description = N'Input Job Accumulation'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="vlkvv" code="nam, ma_dvcs, tk, ma_vv" filter="&FilterCheckAccessUnit;" order="nam, ma_dvcs, tk, ma_vv" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Vào số phát sinh lũy kế đầu kỳ của các vụ việc" e="Input Job Accumulation"></title>
  <subTitle v="Cập nhật số phát sinh lũy kế đầu kỳ của các vụ việc: thêm, sửa, xóa..." e="Add, Edit, Delete Input Job Accumulation"></subTitle>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="80" hidden ="true" >
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="tk" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ma_vv" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Mã vụ việc" e="Job"></header>
    </field>
    <field name="ten_vv%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên vụ việc" e="Description"></header>
    </field>

    <field name="lk_no" width="120" allowSorting="true" type ="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="true" align="right" aggregate="Sum">
      <header v="Lũy kế nợ" e="Dr. Amount"></header>
    </field>
    <field name="lk_co" width="120" allowSorting="true" type ="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="true" align="right" aggregate="Sum">
      <header v="Lũy kế có" e="Cr. Amount"></header>
    </field>
    <field name="lk_no_nt" width="120" allowSorting="true" type ="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="true" align="right" aggregate="Sum">
      <header v="Lũy kế nợ nt" e="FC Dr. Amount"></header>
    </field>
    <field name="lk_co_nt" width="120" allowSorting="true" type ="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="true" align="right" aggregate="Sum">
      <header v="Lũy kế có nt" e="FC Cr. Amount"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="nam"/>
      <field name="ma_dvcs"/>
      <field name="tk"/>
      <field name="ma_vv"/>
      <field name="ten_vv%l"/>

      <field name="lk_no"/>
      <field name="lk_co"/>
      <field name="lk_no_nt"/>
      <field name="lk_co_nt"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHaiulWcsIm0meA7PpfmDyv3BPLEZvoR2NLhI47wVe8PtgD/jD3frTScf0ZsVYqD/3vTdZEUmBbrNs2scP8mw+gk/JaPa3z7vdfO3BTzHXHUQnyZIOP/ES7bPOFyHPC0LrM9npgBZDfMp958X08aD3bcieb+NS51RSggVtZf5hUnwrrOn5qtRFGsNy99jxWXW0vR6DVUYU496obN8vgGgZb1I2uofe0mdeGJZZ+u4bv8tMY7YJqkASpLLR+S5IUaLz+DcVkcPHsAuU6p4SHiuDIsDdDc+13UpfWd90YGxnpWAO8L3a6SWprXBI1PZUGZOLRoaoSnsqPMg5HisvvSE3uAdElA/yaGbaGrG0VeWeaDVg==</encrypted>]]>&TransferID;<![CDATA[<encrypted>%yLooQnL9xQeLYF/0lD7RzhlBeKFPUh1YYJWbF6e2x8x4+SUNgOW33E/MYH5H4XVS3oid5fIPk+DmC4ni33QBh7ciaS+dtdIQo5yOo0U4NU5k55gv2aNcDTmrWN9s8An+rEcEbCK/EXyBLFPqOyivM2RDvdirBdqSazDdZE0HxajJmmGp5WHe9vIF7r34Ockrw4P9Y7MAJVPzwv2A28Q3B2po3fvviIWBA74evBwOAbh/agRV1J6ucIZORrRQwQUTHMAVxbBTWqnFRFke7mhOWftIhHiZW/sRx4f84/DJ8SEGXkRmTyEFrn/GJe2nL8nHYP2wTjpMusbnzoxloT8/QhirqP0R0hAA5GZ/AEGIFusXWhI2JhGeIbIL+pr8j9XkR+UnEo8hlar2YHlZVxfUqZrGD7Uor+vfg6xMZocdyBCfuiSF64Yup010PKvO3yfV</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OVZ/lGi73Z3+ZRKkfj1/5vsMjVVc6mRTCV6Re7apKS+EfuAmgT3c5yZETmH7j26D3K5YV6/Rl5CvjyyPu8h+mA=</encrypted>]]>&TransferID;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfNMZVmAnUfHytctuF/1kYqA7PwkYMsYDFv2KIYAaWt9Z6hqy8YFmSBTfypYHR7/T+CmvrKKEhYYWQMAkhqUEYFQ=</encrypted>]]>&TransferID;<![CDATA[<encrypted>%v1A2DmqcSpxbgUfkUnvJavRF2IYtE0bavROW9ROLyOZBskuL1c82SQBqgHOhno/KqU4JKiA86p43yjQasgkzApSuu543T0ptAk52TAlHtLBO8BZDUizr3j7TIsB+bMW9L/6OHRtH1FDmrndbsMQTGQ==</encrypted>]]>&TransferID;<![CDATA[<encrypted>%v1A2DmqcSpxbgUfkUnvJaphyrcjOgwd+1PavZBzs5gJAiqQHbHSlf6VbThprhyvoZp7E+woIgqA3gU/ZFpnENOUUMxemIvsmheT9UNLLe+hmxxL9YVLg3WcUxsb91Boa</encrypted>]]>&TransferID;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfIeVkwsumXazuM4SZLvv/LRIELktwOgoK6yPJHY2g7UpBpRzMlsxjdD8Molsjk/T3eyhhkyrEFndXyKqXQ4aeH4=</encrypted>]]>&TransferID;<![CDATA[<encrypted>%v1A2DmqcSpxbgUfkUnvJap2NvILMNw+3X+teeLUShp0eavlj0yxmxoW1c86dxslXn1vskfaDUfKYfMyq8lI2eOlBuJO+wwBQssTBjOghsO9SeDaIm/4wjoka1s6I8z7OBipftkoKuT+JkCY1PrPkp+YVn5FIgtWURSTHCeJiIRIPV6/Exc2msp2n9pEh4cUAjj4qwZbuzevgSwq+4eRKXMeXH5VuVPRNM+tlNVS+eABOrOxYeCO4bSljuxyKHD0HgsgsvVTSL99xueDyrz/LDw==</encrypted>]]>&TransferID;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfCP296pKBalKUNxwEp9xtIW9Lds48Wa4AHLxs876XGOo8KGbOnjOQbUdZsk0qEDLyTVnvbpAnXQTrKBDTfWrqbVh8MUHj5TW/NDKrkaM4OWZ+S7j1O8y5Wwu5SQY2C+aBHnYALayCEUyjI1Kkyd1kS/FRGGh5IbL4S/8c36bIbgyzjjaTdrwFc6N/oUrq2LbRyP4Pn38PHpd7rIkeV+anujFXFt/I90bQbvMrbZIp2oB7axf6NWtd2oYMWdRnizWlMsOjJz+zeSb/OFmVaFRams3L/pU6shAChWAUQdQnSuVxJCFTdV3PEpNpupg/KxQAfacAgaRgJeRPeP21RxRdw2C47K5MAXvLyYe4muUe1fFi1S91EbB4eC9wyzV63qXfA==</encrypted>]]>
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
      <title v="Toolbar.New" e="Toolbar.New"/>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"/>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"/>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"/>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
    <button command="Aggregate">
      <title v="Toolbar.Aggregate" e="Toolbar.Aggregate"></title>
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

    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>