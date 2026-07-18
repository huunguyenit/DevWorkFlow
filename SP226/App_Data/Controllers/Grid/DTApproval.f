<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
  <!ENTITY Tag "cast(0 as bit) as tag">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="m57$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="BPT" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Duyệt đề nghị thu tiền" e="Customer Payment Request Approval"></title>
  <subTitle v="Duyệt đề nghị thu tiền: duyệt, hủy, bỏ duyệt..." e="Approve, Cancel, Undo..."></subTitle>
  <partition table="c57$000000" prime="m57$" inquiry="i57$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

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
    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" clientDefault="0" readOnly="true" allowFilter="&GridVoucherAllowFilter;" aliasName="a" aggregate="Sum">
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
      <field name="t_tien_nt"/>
      <field name="ma_nt"/>
      <field name="ma_md"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75wyrblg9x/LWUjMXc68hO8lFoGROL73KN5o2AEhJRXylmpSfT4y33ZDwCpzZFr/G1bOwChISHFUsJNthpWr7XIZbiIl856ZMPm2xRzTa8IbTSBs+yprrLMiTlaqzdUNFUNthi2MXiUhORyFqO/OwzOfS0f7wRuComeQRjYcy/ylW</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL752oIkrhw06NMA4tARqlWRFtNglwCH8oSlal1M2LzqwT24nu0CdpyXfYwG/ew0rSel8APEQITI8oLkUy9rwfOHXU=</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL751aPG5ZlCbh/OAmOyxMqzxsso4/yjlt1sGLOYM0hoYNrdYevGtpflZ2O5CPBASQV9C4J7h5c1u/kPMOFdOQWp1Q=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RnPOk4/Y3nsWUD3MREeGY9DCQXP33RKWlJpcj9KSMJsEyC8iWbylkidnVhrVVQ3pLiLcldOfyNulmlYqt4xaxd78+2C6l1KlhckTnVUiODcbskE8v7cbxm25H/b2MCcuOCpRfBPIWoXUtpBmn23LBE=</Encrypted>]]>&Tag;'<![CDATA[<Encrypted>&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</Encrypted>]]>
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