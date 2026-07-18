<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
  <!ENTITY Tag "cast(0 as bit) as tag">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="m56$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="BN1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Duyệt chi" e="Payments Approval"></title>
  <subTitle v="Duyệt chi: duyệt, hủy, bỏ duyệt..." e="Approve, Cancel, Undo..."></subTitle>
  <partition table="c56$000000" prime="m56$" inquiry="i56$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

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
    <field name="ma_dvcs" width="100" allowFilter="&GridVoucherAllowFilter;" readOnly="true">
      <header v="Đơn vị" e="Unit"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="&GridVoucherAllowFilter;" readOnly="true">
      <header v="Ngày" e="Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_ct" width="100" align="right" readOnly="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}" allowFilter="&GridVoucherAllowFilter;">
      <header v="Số" e="Number"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_kh" width="100" aliasName="a" allowFilter="&GridVoucherAllowFilter;" readOnly="true">
      <header v="Mã khách" e="Customer ID"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_kh%l" width="300" external="true" aliasName="b" allowFilter="&GridVoucherAllowFilter;" readOnly="true">
      <header v="Tên khách" e="Customer Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowFilter="&GridVoucherAllowFilter;" readOnly="true" aliasName="a" aggregate="Sum">
      <header v="Tiền" e="Amount"></header>
      <query>&InsertCommandFilter;</query>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" width="100" allowFilter="&GridVoucherAllowFilter;">
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
      <field name="ma_dvcs"/>
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
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75wyrblg9x/LWUjMXc68hO8lFoGROL73KN5o2AEhJRXylmpSfT4y33ZDwCpzZFr/G1bOwChISHFUsJNthpWr7XIZbiIl856ZMPm2xRzTa8IbTbtleiJKDwkH9pvDhZ51ER3IrPHZA1zx/+o32R8/AYnNLZYmEHwFfAhWBYnWQy8wM</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75wpFuySwFJFQ5ESDG+nQafrf1mbpnGPT3FLoFymsryxpFhPu7+ZNRipNSL2SKVFQhsegdlu3wzcYtimHx6rfBrQ=</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL751fXsfZpsDSbkoa3u5CbgvDBcTBcE/s/A7evpGSFjC/z7U1KI8JqY5rLntScQCqpiit6F52CE9PcX/CnuyjMWGE=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22SYQOH1YD8XrGDS65QFgZEiZYqcZJtnmbERdgDjH/TV3aG6ld+LYSYh6q0nvgLSvzlvPy05oT2ULpExKZx7Onm0xe9xJY7FnJFr4FI44PvdahHXYB23UnU/WejrtTMsgTg==</Encrypted>]]>&Tag;'<![CDATA[<Encrypted>&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</Encrypted>]]>
      &JavascriptReportInit;
    </text>
  </script>

  <queries>
    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5EZGzXsNOvxp2yZ6ySsJabPsrTjvnx9z04VR7SBXt4SxIts08Ws5SqPeqDyTFWfcSq/1pWoueUJ7VLvRPPt974XEnyrzZnEEWpE0YK+5k4BjFBIwgLSNtivPgaZVP57BEhvQ/sfPx7+ctdzYWyVuhb0G0gy3eCqeMcw+AK/dwHzJgo7HfmDzbGh2vQ1bg3slCv+KiTzUHfQIK9z6fTVg5zAG1bHNpxRLcFyxQWRqXgG+UQxDEwNJ92pHQM4paq1/q/ZzOZNM7FqAk2l3iKX5tY3teLNCkpqzWch/PMhKxm3517It5JmF58uoE3EciI1RYSrcN20wCgzbQsbdLYDKfOItFQjw7oY9kC9K9t+PewHyBfn9UaoPE7RzBtyIJyzILnwNZIZ0mdjv5OcStG5bWKWuKEmfkeuKin9Dig1GE/AObFlgMGwgWlb8mMkDCMYs7G/HEXvpOl8ArQKNhhd9shzKehUioWqdlBR5D8XrTyC7B49PYQV/hURI3JXm7Fc6YKRxfPyRwVEvWcSgIH3ZMbsJbZkenWbNqcwWN8cppBZXljpG5aChReirTjXbSwxZ6UaRaC8LAVuQ16jc2MNJPOGsEo3DWaksfsoy9lR9tRjpX177o0xtkkGHVx2Px9bhkkIyJ15w0/x+Wfgxs2xPc2BrqpYEFBNxGWlAbb26pSWpiFXKrqDa8FtmjMWSiCqPEs32jGXgWFbBaQaaCkXHvaQkvFH1rbEVOP57OTUgTxbwuDbUSwUCyLjaTc125fUGBcG+SYwuA+tYkUlxjZqCVJCtMRl4olpjw7562676cL2ABjUMTVfcB48cZh3BIgZBIKYHyhTFGu5MEXHVZ907Xs=</Encrypted>]]>
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
      <title v="Duyệt$" e="Approve$"></title>
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