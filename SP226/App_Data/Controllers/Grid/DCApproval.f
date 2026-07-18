<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
  <!ENTITY Tag "cast(0 as bit) as tag">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="m52$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="BPC" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Duyệt đề nghị chi tiền" e="Supplier Payment Request Approval"></title>
  <subTitle v="Duyệt đề nghị chi tiền: duyệt, hủy, bỏ duyệt..." e="Approve, Cancel, Undo..."></subTitle>
  <partition table="c52$000000" prime="m52$" inquiry="i52$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

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
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" clientDefault="0" readOnly="true" allowFilter="&GridVoucherAllowFilter;" aliasName="a" aggregate="Sum">
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
      <field name="t_tt_nt"/>
      <field name="ma_nt"/>
      <field name="ma_md"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75wyrblg9x/LWUjMXc68hO8lFoGROL73KN5o2AEhJRXylmpSfT4y33ZDwCpzZFr/G1bOwChISHFUsJNthpWr7XIZbiIl856ZMPm2xRzTa8IbTpioxI/e09Njjc0+u9XpDbj67SYcHByVBHf5wClaAKhZaJTIrj4LjuRToj7Ttrt92</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75zlG74HSTcjDNpi2Pk6o5BS4nvcZU2r6G5xl2uocirRIwraONm3qEq7r4Z6lQCwYq71iIvzSjdk4RZbImst4jDw=</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL759BrXEL6hval9KBesFGTuNb3ad4ndiDfoDkfKtQu+oh8CoKok3vhGa9uFFCEswq+f7jN7DnbUNIcXr9m7SDS1sw=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WXCuCk7dNZMgGQEDqxPhF2tNksX+PD7bh4K3895vOl4FW9MFv3PNLpPQOyxgAY+Z/rS3D6tFdOkob9HCe0ibcBDq0um6pPLEINBu2Pg06Gox/RSKUcV0D9B427cnpd/K4dF+ndX6XbaLAKetoeldj4=</Encrypted>]]>&Tag;'<![CDATA[<Encrypted>&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</Encrypted>]]>
      &JavascriptReportInit;
    </text>
  </script>

  <queries>
    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssSPEYXzPZ1oaRReIa4A7z5IViV5NMA7g9X11UZGYWQTlX7P+N9IaXPtswvPo3qhDI4Y2Et3IuxVA8yGOWPbXEhgvTStcahPREdZXKElpVBzvoMzJA451WBSXn/uM3juhQFuf/Ou1aSqkEpQw8x/XL3ekcDE3Hg4Up0a7dm6vYSTg9STyHRP5eWhlJgFWojijfaYlSvdV+JHUeunovb7vuLcnvsE5bKWvRbJ6ua1JMLA4ZnzRVD12Yx3L09J9IstaSM=</Encrypted>]]>
      </text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5EZGzXsNOvxp2yZ6ySsJaaFKh7SqivlasRRMf7f02iaBckDu3/IFLf+6SnV5B9wP0HkEO3UqFY1huL70ByQmlxJPkTfbTeFjrnCp0+GilpzS1u5mORROJH6h/ciBNgnyOK5jLoINabrVeiNqQoGNGNBWZT7kvd0O2gf3ByNcti3Gk62sRDegdV49yP7rxL3kTN6qpJeKPU1vuun6XrSlE9lOv+oCswrEhvG12+PHcep4jX8YsAtkbvQhhVAWofymwEls0JjnwHcfvJw0qOfZ56Ub4xzfTZwaLeZHBB6+5/ezarlMxBJlI3f9yJ7lkQOlwNwbJJihlgirnNs9/VbdpJbZ3nqpSjYiZ01FbAgZ4h7ghIR0jJcSReS/44rY6DQzU/+eTREdgmC6/vXygJKkpqwSwcxTRETkBKOaY+WU1bah21zHUf7002WM0lWXgOAVD2dBDfgSZzIKTDo6XsSa3bR4/VzwvJCDmmyPGwgsHlVaLcKD2AEy8InqnvsN6dt7S2W553Wk1wZ9Y0WSx03gYlC1v8Nio6YCksLZuDBJiTF+Fv3w9BODdJo4bIPlbZDbmQG4Y8BTEDaDagpzBhjTo4bQYIZUYJdy9ZCZnH0jGbg0KccBBi9D8i4F+OIsSDqkRp6yIC4GbzZmHrINxk+Qh5PoWSRAPo+WREhZFMlkV1ej8rQp0fOslEcjqx5WkGWFw==</Encrypted>]]>
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