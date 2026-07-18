<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or so_the_ts in (select so_the_ts from dmts where exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = dmts.ma_dvcs and r.r_access=1)))">
  <!ENTITY CommandCheckUnitRightBeforeInit SYSTEM "..\Include\Command\CheckUnitRightBeforeInit.txt">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "FAProductionInput">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVZK5RbGKZJ3l6yLN1aVLj/I2DmAI7E1oHf6nsNCpaRN24w9XYTRmDVS/Y9mHCoz0R1aSBYKzop7PPk0qudSo700or2MwplSXh5eK5awrMJFv/wdT4lkJpDI3F8kXvgFKJU0ru6U3kCFXpd/VdCX+96sxQjg6zOYn/B1EG5cvEoS63wQLUR/QzGyzzHbo03Hf58u73uWjNAeBfom1JPh+sdXjZy7Rq8lrcG777CuFCmSxQ==FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="v20vctslts" code="so_the_ts, ky, nam" filter="&FilterCheckAccessUnit;" order="so_the_ts, ky, nam" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật sản lượng thực hiện của TSCĐ" e="Fixed Asset Production Input"></title>
  <subTitle v="Kỳ %s1, năm %s2" e="Period %s1, Year %s2"></subTitle>

  <fields>
    <field name="so_the_ts" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Thẻ tài sản" e="Fixed Asset"></header>
    </field>
    <field name="ten_ts%l" width="300" allowFilter="true">
      <header v="Tên tài sản" e="Description"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="sl_kh" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sản lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>

    <field name="ky" type="Decimal" isPrimaryKey="true" hidden="true" width="0">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal"  isPrimaryKey="true" hidden="true" width="0">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="so_the_ts"/>
      <field name="ten_ts%l"/>
      <field name="ngay_ct"/>
      <field name="sl_kh"/>
      <field name="ky"/>
      <field name="nam"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ibMbgBKX+0XSN0QTXpyMAdpCBOrXc7tBA0FETyg/t6ghjP1Y8g+UlhsLjlObvBuXORFG8odd5gVk3f9ed8QU8EuXulDdMuQikvhFbODep0pSSdRppGydArgD4vPd7RyKqBQEWtrjEyIZKd/W8oEv2oqPUQnj43RtdwLU3ov94hjr0BU3QJ8Q1/UGgyQx9+kIKZN97BBeOlM3WmPtBfjOv+aZJRunzwwYmY1H0UjjqZK9TBIY6qHIoB2hxzqefc0/kp/ZBAFPAPOwFq5LKqW92pCihmcnWvEujsW7shxPobbjQ8rstFCYXTdWXlkdO0xyoZFjGD/uDMZUvHg8rffdyDX+DpOv31/sPVwxEWVQ5BwoR4FiCEUb3JSgjVHBuoD64ND7ZY5z8C3vSDcgIWQ4KxvajEvvn7SM+Nmsx6bm8rDM=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75x3PEDkCFLZr3wKyjjhGf/BSA/UCUUxCGfQDqQHgFzRpca0P3A4X9XYsVGPqF2V9XZLLFg80XxvrcVx/9zVrI+s=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtVTd+PxdOEki9H6dL0CzAeVKEt42LDrKMjPT8BBqzcfzUgVEU1uDJXMvxPSXOvMLPOZW9cdYDFdg3gRxQjzVDhcajWz33tSGKtLH7Pt9RU+9ONIyvy7Mjwah7LQvnpiMUhOjWHrhAuJNAsVSSfoSmQ1Igfv9dSOHyuESJKUY3M5gT4zrmfUA0jKKcS6XtnxhRCDzoYprWl/Annz0LFTwe0kT88u7Ke23mR3QZk9pW0wIlgTDagHhcHa1Lup1Uk/bc2S7du++LLe8huaB4ok7VxDF1VI9+eYWJf2nXP7cvD1QTe9sSZ4ewPZ7lzrG/DPlva/IbKJhFOyyiKwvN+mk+0Mdk/Q9lFi0WfVwvwL7zcGJw8pwineVVMa4G6GN4oRE3xv4HYxEY7XCCJElfsUmGs5HsCNkUa3oPcWg/zRJglE9uUZRgNCJzBjNxrqp6WZQKuX5bwgdVnnMG5qrhVU58n9SKXxyXl7XBKxdrA51CGhZYkKWo9tbEIlVCanXWx/q/jpDY6/PPlgm+YdD8AQm6i4=</Encrypted>]]>
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
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
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