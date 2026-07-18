<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY % Repetition SYSTEM "..\Include\Repetition.ent">
  %Repetition;
]>

<grid type="Report" filter="&Repetition.Key.001;" repetition="&Repetition.Key.002;" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bảng xác nhận công nợ lên cho nhiều nhà cung cấp" e="Suppliers AR/AP Confirmation Sheet"></title>
  <subTitle v="Tài khoản: %s, hóa đơn từ ngày %d1 đến ngày %d2..." e="Account: %s, Invoice Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="tag" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
    </field>
    <field name="stt" type="Int16" readOnly="true" dataFormatString="# ###" width="30" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_kh" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" readOnly="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_apbxncnt', Controller: 'rptSuppliersDebtConfirmationSheet', Name: '[ma_kh]', Value: '[ma_kh] + this._queryFilterString'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>

    <field name="du_dk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum" readOnly="true">
      <header v="Dư đầu nt" e="FC Opening Balance"></header>
    </field>
    <field name="nc_dk" type="Int16" readOnly="true" dataFormatString="#" width="80" allowSorting="true" allowFilter="true">
      <header v="Nợ/Có" e="Dr./Cr."></header>
    </field>
    <field name="ps_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum" readOnly="true">
      <header v="Phát sinh nợ nt" e="FC Debit Amount"></header>
    </field>
    <field name="ps_co_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum" readOnly="true">
      <header v="Phát sinh có nt" e="FC Credit Amount"></header>
    </field>
    <field name="du_ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum" readOnly="true">
      <header v="Dư cuối nt" e="FC Closing Balance"></header>
    </field>
    <field name="nc_ck" type="Int16" readOnly="true" dataFormatString="#" width="80" allowSorting="true" allowFilter="true">
      <header v="Nợ/Có" e="Dr./Cr."></header>
    </field>

    <field name="du_dk" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum" readOnly="true">
      <header v="Dư đầu" e="Opening Balance"></header>
    </field>
    <field name="nc_dk2" type="Int16" readOnly="true" dataFormatString="#" width="80" allowSorting="true" allowFilter="true">
      <header v="Nợ/Có" e="Dr./Cr."></header>
    </field>
    <field name="ps_no" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum" readOnly="true">
      <header v="Phát sinh nợ" e="Debit Amount"></header>
    </field>
    <field name="ps_co" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum" readOnly="true">
      <header v="Phát sinh có" e="Credit Amount"></header>
    </field>
    <field name="du_ck" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum" readOnly="true">
      <header v="Dư cuối" e="Closing Balance"></header>
    </field>
    <field name="nc_ck2" type="Int16" readOnly="true" dataFormatString="#" width="80" allowSorting="true" allowFilter="true">
      <header v="Nợ/Có" e="Dr./Cr."></header>
    </field>

    <field name="sysprint" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tag"/>
      <field name="stt"/>
      <field name="ma_kh"/>
      <field name="ten_kh"/>

      <field name="du_dk_nt"/>
      <field name="nc_dk"/>
      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
      <field name="du_ck_nt"/>
      <field name="nc_ck"/>

      <field name="du_dk"/>
      <field name="nc_dk2"/>
      <field name="ps_no"/>
      <field name="ps_co"/>
      <field name="du_ck"/>
      <field name="nc_ck2"/>

      <field name="sysprint"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL755u2xcm+ZIPR2yjQaCrpFediiV1f7we7zXVySD7VYofePQokWSethRAf38MlgREipn4605eBMJImgjVcX0PABHFBqrn2mkVisrY5AHdjX3tW</Encrypted>]]>
      </text>
    </command>
    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75ymtyW99MDOuhUekZt9uT78ikk9b1xhrsXTzfCswY+SnbvrIz671oYMgyYnTPfuMCKzOZP1qQjwtmRd+NOBvMmg=</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL758FqqnKB3SEYOg/Qz+yjr8iPaG86vSLQtOIrnsmFxh2G+2UhsQJ6hXc/CvJMtkFs7/BhD0kOX5TluRI80/1yibc3zZr+Tz4QbKNOxHQxDlPR</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtWNR9/wgMN1ihxLV9mIkT13IHnKFEuf3iItxtkODNqevg2BvCQJh7SpyljlNK7fzDh9ZY1e7VI/vC4TIUBLSlAJd6ZAecNCfw+WuSmG4ObcECeHYPq5UsNUYti3ExNxZot6BU0ag/w7Kjo4yoSuKJMiCwdU9vTD2QaJ1Qp5fvrPprVid6vEGtQW7cNIbgo+NwCjkl2wPk7ud7QOKyNWK75ygGz8tQindblXAdovOF6bKrA56PJfSaYnCxX4zyGAwvO05cP6EJbqz17WmKB2AitGrRGmsgyoJU7Y6y4EUiEZ+noxihowYio8ZJPKMBVxxlsffcWWq1CPXbJrsUUJKaBVValPPMMaAN6tiMMYQxz7Cts5Ay5c2rcrPYTqV792KPA31jJ3VnjK+IFS+7zwZ/M1qsC9XwP16ocwA9q6D98d/S/0td2jhC+86Rfm694Z4BLUdkUDaoNeB2pVolYlG73mvwIRVe8La+VorWS0piY12/yrtbLqzVKmB6mX1lWqrI6AKFK+5rFNvQCvNG2sxpBo=</Encrypted>]]>
      &JavascriptReportInit;
      &ScriptTagReport;
    </text>
  </script>

  &XMLStandardReportToolbar;

</grid>