<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
  <!ENTITY TransferID "rptPrintGLTran">

  <!ENTITY % PrintRight SYSTEM "..\Include\PrintRightGrid.ent">
  %PrintRight;

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" code="stt_rec" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Phiếu kế toán tổng hợp" e="General Voucher"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="tag" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
    </field>
    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="ma_ct" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" width="100" align="right" allowSorting="true" allowFilter="true" readOnly="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Số" e="Number"></header>
    </field>
    <field name="dien_giai" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="t_ps_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Column;" readOnly="true" aggregate="Sum">
      <header v="Tổng phát sinh" e="Total Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Mã nt" e="Currency Code"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tag"/>
      <field name="stt_rec"/>
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="ma_ct"/>
      <field name="so_ct"/>
      <field name="dien_giai"/>
      <field name="t_ps_no_nt"/>
      <field name="ma_nt"/>
    </view>
  </views>

  <commands>
    &XMLWhenGridShowingPrintRight;

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL755u2xcm+ZIPR2yjQaCrpFediiV1f7we7zXVySD7VYofePQokWSethRAf38MlgREipn4605eBMJImgjVcX0PABHFBqrn2mkVisrY5AHdjX3tW</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL758FqqnKB3SEYOg/Qz+yjr8iPaG86vSLQtOIrnsmFxh2G+2UhsQJ6hXc/CvJMtkFs7/BhD0kOX5TluRI80/1yibc3zZr+Tz4QbKNOxHQxDlPR</Encrypted>]]>
      </text>
    </command>
    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75ymtyW99MDOuhUekZt9uT78ikk9b1xhrsXTzfCswY+SnbvrIz671oYMgyYnTPfuMCKzOZP1qQjwtmRd+NOBvMmg=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtWNR9/wgMN1ihxLV9mIkT13IHnKFEuf3iItxtkODNqevg2BvCQJh7SpyljlNK7fzDhBgAYL+RdNFvuL1xCL1hoPxCMByl52ka8luSEoa6ZtoSLztUTyUxNJejwXTcEb7/hzOamQ1TpVvcCdDlr4LCFeLLsJtDh+7dAQv/lvfkcipDf5+lbBV/HAdNP3uR4Ix12dN1bGKijAzmXR/4zeEXeWAfCZvxdvQ5Y367ZsLKre1b6EmdzT4mcg2ZMzk2IOEoaiae7UyOTcjCWfFDxTy5hEnG3LcolSViRxPQ3ChGtoznVbvsm0yHtNiymjNrlraSJNIlRixWjwV1b/LmeaWTBzcQp7kFMoj6wfscoDlpkZEfBZ9sQk+RTXMSZ2CXArNT4G9TlllLs6hGhAt8vLyiMSLn1+GXRX6q+S/zAx4yRHeDek62dQl6mMilNr4RkQvLQ==</Encrypted>]]>
      &JavascriptReportInit;
      &ScriptTagReport;
      &PrintRightScript;
    </text>
  </script>

  &XMLStandardReportToolbar;

</grid>