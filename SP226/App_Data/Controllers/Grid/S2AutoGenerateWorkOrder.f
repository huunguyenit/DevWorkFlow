<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\Tag.txt">

  <!ENTITY Identity "S2AutoGenerateWorkOrder">
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Tạo yêu cầu sản xuất cho lệnh sản xuất" e="Auto Generation of Work Order from Manufacturing Order"></title>
  <subTitle v="Từ ngày %d1 đến %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="tag" type="Boolean" width="60">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
    </field>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="100" readOnly="true" allowFilter="true" allowSorting="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" readOnly="true" allowFilter="true" allowSorting="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="so_ct" width="100" dataFormatString="@upperCaseFormat" allowFilter="true" allowSorting="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'" align="right" readOnly="true">
      <header v="Số" e="Number"></header>
    </field>
    <field name="dien_giai" width="300" allowFilter="true" allowSorting="true" readOnly="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="ngay_th1" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true" allowSorting="true" readOnly="true">
      <header v="Thực hiện từ" e="Actual Start Date"></header>
    </field>
    <field name="ngay_th2" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true" allowSorting="true" readOnly="true">
      <header v="Đến ngày" e="To"></header>
    </field>
    <field name="ma_ct" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tag"/>
      <field name="stt_rec"/>
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="dien_giai"/>
      <field name="ngay_th1"/>
      <field name="ngay_th2"/>
      <field name="ma_ct"/>

    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2QCGsNq+TB6vNEWCuu7qD5+XVB2Hoyfa2MxlBjvCiiGVQGnbSyf+QJFwH4mKvpkUwOTyOGVe0tKdYtmi8G/P6ez/FABxk6LPjJwdtQii9tOD+kXIJ6zJzSDwHPwQtw/K6LVqWbqVtDvssiNOPJo4tK9z9vkp6yrDhiMt3WcqHglEsZWj9JxnfAaR4G4Ny6XlfBvc/eI7jeo92MMIYS5lFmQo6o4VQPU/bsxyq7qmL654yblE82TSHxzk5jXgmqgCA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFbmGwKKj7TWl9MVMGdvkN3lhjYoeyS5Lm5OCloznxTnQ==</Encrypted>]]>
      </text>
    </command>

    <command event ="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMjEitWCiBAWcopg6nypxirG22kVK4Mqm3+MnWVjVq0Q</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFbmGwKKj7TWl9MVMGdvkN3lhjYoeyS5Lm5OCloznxTnQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMq6Xh7xds9o+3oCl00TufVGLE78mW1GUKVnWVD5XSrl</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l12P9aUpt5xNH6f9RFYkm305VUU1BrjFWi1k6tRkiF3JXeEWoEmaH89G7MOPVNQdvWoPZLvt3YarE+AL7LeefQC0=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1+yAXv+qc7cK7UbPXBD2qkEluEaeNXHJijZWk+2KKi0vFa5HLhLInXcvGND0g3il/Qd9foXuGjW2KLjmafvHmAg96eFPNd3iA2XuWhIT9QOLBuX+hUjxqW89hJp4YbE4ogBGT1nArpR+yj8UWL/HHeY=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEXiWUQ0H4vSWLEfZL3wtMAA9cvAXz3YyJErBlwgYgm+KJqn2j7wKdflbqAKLp8sGeg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1+yAXv+qc7cK7UbPXBD2qkGyaELoerfUZI+qMzKX/AGl978wA8jIQ+Gp6uTQevEFK9DjkiusAQKFJDtpAIf4tMWsEKctVEx4mCXlF0mIFMfA</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyERnOvM4NG/oV2IoQpuvFNmNJdsB6OMvyGDRDslybEqOXLNS/0Ollo4wucxE60wCPw+uy22/lVD22tf9Ndv60Zy0=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l19F5U7hVjVaEQhcY/KP8hu5UeAif+TZ8M7q57uL7GeZnaDMBG+4URj+jZTqmj97oOvmmyH3NWAwV5euvP3MXJ8uHsQ5L7ur493/3VLfM6+akj7I+hV+d5oOuzEUiGWvmvOhTgnqBuWAqdFcJBvg0G4tMduKcjRmJVpOkwhogZ1/c</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETI2WiGOq6VNUevZE9pq357DcNxnQ9HSc0BB2LwNdOowd5xhuCTqWPlyeJGmutd9k7dwE8Gc4P4qPGxTeRj4budvMZc9wHpO4xqnFZhAGGVn1pn7Gdf/+wttBIk5YEPLGamaByYcLOd8zB6rOn0yoSKYXWBFWXVbe1xw64AUTyeZWpcAUvdRNlfBqIbvfQT1WvUar3TFlMyIVJt0r8l2+USqV6BEfx4xMwBIxdwHKAwZCjqQ1u3ho3cQmmQmCeiU2mGX7LWHi/1TT+W/N41dhuso71rhL1ccgTMka79+7m3pGbwU9yrv5DHfPj5e6Q+dJA==</Encrypted>]]>
      &JavascriptReportInit;
      &ScriptTagReport;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7x3hzVjb+R6o+3hwXnmae14JAkAufuEojlgYrzY6gVLLIF+0R030DpWClvBbmneyDjQUmbZRj2AxXs9ZNoetXHe0AKOXuriOmtkeKb3R13xhn3hcA4DIEkJdYloH4N7ON1D1AxbV1DYvDYxWvhW0/mxCjWzct/fbd4JgKVRYvuSlbTLQMSeASB/f+phTY2r388tVcupMBdGaKCwuRu3oCaE620rTsVgr0cn28w39Fh9EvIgKwJpzp4JpN/c1HAmog==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="CreateWriteOff">
      <title v="Tạo yêu cầu sản xuất$Tạo yêu cầu...$120" e="Auto Generation of Work Order$$120"></title>
    </button>
    <button command="Edit">
      <title v="Cập nhật tên yêu cầu sản xuất ngầm định (Ctrl + E)$Cập nhật tên...$120" e="Update Work Order Name with Default Value (Ctrl + E)$$120"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>