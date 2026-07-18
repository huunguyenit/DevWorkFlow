<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
  <!ENTITY Tag "cast(0 as bit) as tag">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="m64$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="DXA" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Duyệt đơn hàng bán" e="Sales Order Approval"></title>
  <subTitle v="Duyệt đơn hàng bán: duyệt, hủy, bỏ duyệt..." e="Approve, Cancel, Undo..."></subTitle>
  <partition table="c64$000000" prime="m64$" inquiry="i64$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct" width="80" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="&Tag;" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Ngày" e="Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_ct" width="100" align="right" readOnly="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}" allowFilter="&GridVoucherAllowFilter;">
      <header v="Số" e="Number"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_kh" width="100" aliasName="a" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã khách" e="Customer ID"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_kh%l" width="300" external="true" aliasName="b" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Tên khách" e="Customer Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="t_tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" clientDefault="0" readOnly="true" allowFilter="&GridVoucherAllowFilter;" aliasName="a" aggregate="Sum">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nt" width="100" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã nt" e="Currency Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_md" width="0" external="true" hidden="true" readOnly="true" defaultValue="'1'">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_ct"/>
      <field name="&Tag;"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="t_tien_nt2"/>
      <field name="ma_nt"/>
      <field name="ma_md"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75wyrblg9x/LWUjMXc68hO8lFoGROL73KN5o2AEhJRXylmpSfT4y33ZDwCpzZFr/G1bOwChISHFUsJNthpWr7XIZbiIl856ZMPm2xRzTa8IbTaffFx3AlM/wNcpUYJ6qGuqQKbjbOYPK+mkP9lD9+xyBUUeNG+Aqd3RiLOnoXgG4R</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75wpWdAZTe2mfPYLXlyPdVtfDmpip2ThJjho7j/P0PW/1ABHvndbgJVv+CfFTfLAwmcE6tkcLbxlajDqMZ8LTiRg=</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75wLNtTD38ol+4Hp4rn54hPIUFFvLgqBarSoo9Zkmb6hfvISvQvOw+bMQ9KMcazPq7WjcJPUQfFhh28CD+Zan45g=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VnawK4CaD54njZDOYWjXbxjD4hcTwBVM6j1kG9GF+gkekud2PntZ7d2qInOFPJOsQFchWVYWzzrbRItGDvmDie5+xtWH6Y+jWo2pBFMR7tAnIjYT2ODBNLc+QzIcNnG/gN272NTNR97Gz4Fyyfvc6E=</Encrypted>]]>&Tag;'<![CDATA[<Encrypted>&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</Encrypted>]]>
      &JavascriptReportInit;
    </text>
  </script>

  <queries>
    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQVB9fEs2vZos5s0mgPC5C7QuZHaVsA6uV4hwbO+1PIit29YDSOEKz7oQs3A9zInXHjSoHWke9PTgXSEGCNZ3SNafq5/DRFCosVC6BkqNAjvZMx/Wi1bvzK5SI2p+WQAcQXapxi454FgDVHQDXInLZK2q2dyKQr+bHt1Iy+HHUSH0a2AU5eSUF0DGDmrXIxUCT/tqyUbolLFDUo4Fk0LNTGpE3AeGryY4ff0AYXKNkfr7baToN5Mjs84DFdwdf0wZQ=</Encrypted>]]>
      </text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5EZGzXsNOvxp2yZ6ySsJaaFKh7SqivlasRRMf7f02iaBckDu3/IFLf+6SnV5B9wP0HkEO3UqFY1huL70ByQmlxJPkTfbTeFjrnCp0+GilpzS1u5mORROJH6h/ciBNgnyOK5jLoINabrVeiNqQoGNGNBWZT7kvd0O2gf3ByNcti3Gk62sRDegdV49yP7rxL3kTN6qpJeKPU1vuun6XrSlE90CkWPo7q6wXq8OXW8F9qeHkHPocaZgn4kfVpSi5OcYV4syxjCM+GDR8GMSFz8O75XRC3pqPJpNBpJxisFOvOJIfmCe8KreAOXHsqFv2QBVAzwx5+f4q6OKsbJ3iWXq/ATBTbOgSFceLPxh7BPfBAC8GvqwnS9NV0vBfZE6BUbFQU0J42JAgrRTKu2P7CdCMSZVJioyqWSwtXWvxhPBd2uZ/kJUu9eePZt2Iqjrm+RtBMi6+c/X+MPd+19KgnvqPYHo3fuoPPgeOFIZN2DqrM/NpifHj7Odk773XwwrdiUz2IramgCVXKM66jYymXtSPyEwJT3jbV4NH97qPyE6nU3XPjZ0kjo1OxHjmFDKnIzGLETGI1U+9P1JNtXVTdG38vCNRrrOZ3qOA3jxfC5bxmIjY1ZIOLX+sL7ldO9br97Y2Q7Z8M4uUCFSJiGEYuUlxY7IdWOpOGTfbjM9r6nHWHdeidFtP//NuFBHqrYH8+kIw==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5Ud+naG+CCdS8v1iq2JcN4vMJkRDJXTctMAmws4lyvXd1NcnhZELus15gHlXXymyQloxomyM2O7yGexgwdHImZMC99QKTLkNAeA178/w4ezlDQIn6bbJvULXXNhCVsof8vVEU2HqIrMIh5V70RNLa9WxO4EDRnNQZ5nAF6JQz0O2pVboXe/nj8av/xTTmWYocPQqaEKVvM1UevJCTsk69RK5OyMoQK/EuXOB7B/RUAQvcdYTyWHVN+2cmBCj5wU3dtF88aOOQfAGAOqm6FxS2Y=</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Approve">
      <title v="Duyệt$" e="Approve$$75"></title>
    </button>
    <button command="Cancel">
      <title v="Hủy$" e="Cancel$"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Undo">
      <title v="Bỏ duyệt$$75" e="Undo$"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>