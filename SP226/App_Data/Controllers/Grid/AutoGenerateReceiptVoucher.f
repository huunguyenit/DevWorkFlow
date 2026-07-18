<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\Tag.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Tạo phiếu thu từ hóa đơn" e="Auto generation of receipts from sales invoices"></title>
  <subTitle v="%v. Từ ngày %d1 đến %d2..." e="%v. Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="tag" type="Boolean" width="60">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
    </field>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="100" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="so_ct" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'" align="right" readOnly="true">
      <header v="Số" e="Number"></header>
    </field>
    <field name="ma_kh" width="100" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh" width="300" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
    <field name="t_tt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" clientDefault="0" readOnly="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" width="100" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="Currency Code"></header>
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
      <field name="ma_kh"/>
      <field name="ten_kh"/>
      <field name="t_tt"/>
      <field name="ma_nt"/>
      <field name="ma_ct"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2QCGsNq+TB6vNEWCuu7qD5+XVB2Hoyfa2MxlBjvCiiGVQGnbSyf+QJFwH4mKvpkUwOTyOGVe0tKdYtmi8G/P6dcqfOVc17PulUSHC8t7eBPUA3A1aVrLeGEPtmOBye4+ZmpR5ycnpnBjTgsdBiQeUuV5VZrm2oCHnZDNEjMKh5M3/4JH+25JU2hRR1CoBBGhbi9M9BhhFqiilcMxz4Ai/cIzaKO4uguLMkFLY1R1hSNfL/11v2ofq/3v7tzDWIIW5PbimSXWXcxpM5RBL3BsdtTgCnYpbpbkULSa3jYkOfQjZ0t4aZWBhgWU7t+XevsrQ==</Encrypted>]]>
      </text>
    </command>

    <command event ="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcA96D/CrGDxu98EdiXk1LqFP0wYUIx0N/p8HPTsWZpNnuF64akQZYUrtL+X3o24FApzTpNWVlOPF8BUaynTQ/92Xm6PjDhaC5S1dDJYmnEP3</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFC0f6aKQ6P+aBE2M+Rt4jaQZbxmV0wgcI0gZUf+YpebjVgDJSDq1xqzVfBuy9wYyiUaTtin1bLBYr6kQwrnnDbApt0sQk87XzPlRgd4SupMSWmVjJxjPd6K6pirCamMTw==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtWIWBFwRqwe2kGfgA7NVDCuMY/TDZtsW7+lskJ7DGodOWR6YHbkUJz8wqDusi2qHzZkCL45D4Te34n7/WhUXXw2jGKEdicPCQqR6OxPQcByzyMyzAcyh8VPUlqx2h3mZ1ahgHgvZzzTvfX3js6LIyOaA8uwJjIRzRvFLVwYHvXXN8ChJEGzsh3eV0X7cbkotpNBHX5XbTt4A0H2YJDPZPPnMUosBY44cHKOK8kaIFjYm07yEj5YsylnV3QHmDAN/eo6AHWnR+SGsgiq3zWuibYs83CJbW9UDR0TYquCgc4ua/6NANWrPFQoT9NLdwOKwIapAcdbD67Sg7OIZ1Lf/R0vyI2Ocp2aG7F0X69HIn94nsQRMD1bzgxhzsG4r99upfkVn5rPQgbY7tfOmFPCl0vZcOya7yWs9vZUWQmFi92rN8NoKlnUlieoFkSTjlW5A2Mh7/QxdozNDnwIIiNbyhM1vIISZ+Vf47IhBT7bDqxFTwDEzcQh8ZsDCnMv3mlGmbA==</Encrypted>]]>
      &JavascriptReportInit;
      &ScriptTagReport;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7x3hzVjb+R6o+3hwXnmae14JAkAufuEojlgYrzY6gVLLIF+0R030DpWClvBbmneyDjQUmbZRj2AxXs9ZNoetXHe0AKOXuriOmtkeKb3R13xhn3hcA4DIEkJdYloH4N7OJMNDPmlAFD+eeyg+Vxt9mTAPJfwtWoyTzyrD5L+oWN5CtPe2wSQWVOIIamUuk4fDXQXWPy2hCAqWSY1P0oapFmZkkas5V1e5Pzm9SscmJFwEKpgD2+GiS6B9wwa0Qx76Q==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="CreateReceipt">
      <title v="Tạo phiếu thu từ hóa đơn$Tạo phiếu thu từ...$120" e="Auto generation of receipts from sales invoices$Generation...$120"></title>
    </button>
    <button command="Edit">
      <title v="Cập nhật diễn giải ngầm định (Ctrl + E)$Cập nhật diễn giải...$120" e="Update description with default value (Ctrl + E)$Update"></title>
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