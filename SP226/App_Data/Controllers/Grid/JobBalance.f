<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % SubTitleBalance SYSTEM "..\Include\SubTitleBalance.ent">
  %SubTitleBalance;
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "JobBalance">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVblOx5yHHDvSDCaIkHCkubY56IuZT4cr1X/pLX7IZnLqzGZUq6uLlX/oBpzxAFUbEmkFe/PbleaJ4rtCcwWu+7HPERVe0tG15tu/mbLPvFfTxIpktcU/4bSdow14ndEjo+VhZmyfAeUlg5AT449tT1unEqTNyd2TICZxoEy1VnEpsy8ygZeQrNGyU7m81bSLulBuBq3TEZm8mp0Bav+VfQvFastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY CommandWhenBalanceBeforeInit SYSTEM "..\Include\Command\WhenBalanceBeforeInit.txt">
]>
<grid table="vcdvv" code="ma_dvcs, tk, nam, ma_vv, ma_kh" filter="&FilterCheckAccessUnit;" order="ma_dvcs, tk, nam, ma_vv, ma_kh" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Vào số dư đầu kỳ các vụ việc" e="Job Opening Balance"></title>
  <subTitle v="&SubTitleBalance.v;Cập nhật thông tin số dư đầu kỳ các vụ việc..." e="&SubTitleBalance.e;Job Opening Balance..."></subTitle>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="80" hidden ="true" allowSorting="true" allowFilter="true" >
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" >
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="tk" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ma_vv" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" >
      <header v="Mã vụ việc" e="Job"></header>
    </field>
    <field name="ten_vv%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên vụ việc" e="Job Name"></header>
    </field>
    <field name="ma_kh" isPrimaryKey="true" width="100" hidden ="true" allowSorting="true" allowFilter="true">
      <header v="Khách hàng" e="Customer"></header>
    </field>
    <field name="du_no00" width="120" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Dư nợ" e="Debit Balance"></header>
      <items style="Numeric"/>
    </field>
    <field name="du_co00" width="120" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Dư có" e="Credit Balance"></header>
      <items style="Numeric"/>
    </field>
    <field name="du_no_nt00" width="120" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Dư nợ nt" e="FC Dr. Balance"></header>
      <items style="Numeric"/>
    </field>
    <field name="du_co_nt00" width="120" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Dư có nt" e="FC Cr. Balance"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="nam"/>
      <field name="ma_dvcs"/>
      <field name="tk"/>
      <field name="ma_vv"/>
      <field name="ten_vv%l"/>
      <field name="ma_kh"/>
      <field name="du_no00"/>
      <field name="du_co00"/>
      <field name="du_no_nt00"/>
      <field name="du_co_nt00"/>
    </view>
  </views>

  <commands>
    &SubTitleBalanceShowing;
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvm7MVgOOwo6XEBkj6E/S0JmtEZbhdWZ+Qv4C/WuRCeJOv/MZ08ZIci22aJp1jHdTPlAzRKwPT1ZiY7n2fTmld5jXWyUJFwP7GaZWYbA3EM6tOGBYZI0o6PdfstZEZGAHGWvRhuQ1PiFFAF//a+dVcS28jgCOCCE3FTdkQrYIzpE7IcdsACO/ULFX1aS5DIsVfyfc544AViOSdeJsFuXywloYOAZq7vNxR9mKZNb1n5wBG5/vULi7la/hElIRu6DwI3FzJrW6pmmLq3gL3cnNare2yLH3TRuPexuWZ3LR2wSvGURTLj8p8c/xGlVZN/R6qwTNqykjoJNoI/Hrs9Ba7xEwqBIEM6MdNShWPnVTqGEhm80yFk8HnE4hcDj24ykTGZFYv/K6VBMC+n+R7hoVkfmF8LVPe3vHYLeaBNTHymwXwBzB9rwd8Q8/Gi56k/mWrbF6JE+tm75cHDaAlHuB3crvOlS4TmnE4tJmg8HUQXLw32p0UNHkciqnlJsAO90YCrJCAC49ln7SxucYcb3rqNfGnyBygYmjG56dQBfwXGKBgIq9couPMui2ux9fyuzK4f8w0iJ2VTboVz3/z1KiUzJ6HbYxFSgmJXT2tYnw6ni4J9w87yQtfZVp1oCHJlLcyjkEZ/cD+1q5Rlq22eB62DZEoHGC2BLYESSO7a18i1WB/18n6b3WAKNDvx6T+OGBte6rHLuTRkPAuO1wW0vCdSvXzz046mOpQB0jlrnz0UpNQ==</Encrypted>]]>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QsMhJE1WhHzxQMYzOCHGGtoRsGxYkOOVrszfyhmmp7NaDwbJd47qLJIfSzWicdGU77foYxrePukgzXWp0kytFji5skwGEwkygeL+hNWtI4ik8VlV4IyLzARXfeKN8iaA2XyH7lACyQKtDfkcD0+hIa/s1u2DCWI7E8ZBTWlyaCg+oiJxr+2nqAKcJgwIuKN1VlOGSzYkezFKLRRMl1BwbvCouuQz4CYQKLxkWqcAlIwG+qOMPg5WYKOovKwUQm/j45E0mceB1usVYEHQmfN3t5zjwK/+L7PPZa/RcfDevSVRgDQVlFFAru7wLZfXBrzaIYnpeImMUHsy5z4pV9tSaXxlajMjxfTaZXlghYz/7XohHjX/I4nbTj+GbYggUNf7Ajj/tj2rMFT7MU1dXezPDo7bTTjUidAXLckN4gdFc0TrXqUvW4aGtj3zyTKtkhJ/37Syj8u1yZAC2AoiIyqHrKHzAhZtk+jTLdjzxTYN/h+C7GMV1SrJTEFjM1VvQSQRvHjdoqnYe+d9kju0Ni8Xo0VvzLDLFnk7ME7c7pMs3SM</Encrypted>]]>
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