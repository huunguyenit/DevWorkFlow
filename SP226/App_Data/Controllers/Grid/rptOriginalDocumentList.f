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

<grid type="Report" valid="systotal = 1" filter="&Repetition.Key.001;" repetition="&Repetition.Key.002;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bảng tổng hợp chứng từ/Sổ chi tiết" e="List of Original Documents"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>

  <fields>
    <field name="tag" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_ctgs" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Ngày ctgs" e="Batch Date" />
    </field>
    <field name="so_ctgs" width="100" allowSorting="true" allowFilter="true" align="Right" readOnly="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_glgsso3', Controller: 'rptOriginalDocumentList', Name: '[so_ctgs]', Value: '[so_ctgs] + String.fromCharCode(253) + [ngay] + this._queryFilterString'}, Script: 'beforeDrillDown(this);'">
      <header v="Số ctgs" e="Batch No."></header>
    </field>
    <field name="dien_giai" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="Tien" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" align="Right" aggregate="Sum" readOnly="true">
      <header v="Tiền" e="Amount"></header>
    </field>
    <field name="Tien_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" align="Right" aggregate="Sum" readOnly="true">
      <header v="Tiền nt" e="FC Amount"></header>
    </field>

    <field name="sysprint" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="sttkey" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>
  <views>
    <view id="Grid">
      <field name="tag"/>
      <field name="ngay_ctgs"/>
      <field name="so_ctgs"/>
      <field name="dien_giai"/>
      <field name="Tien_nt"/>
      <field name="Tien"/>

      <field name="sysprint"/>
      <field name="sttkey"/>
      <field name="ngay"/>
    </view>
  </views>
  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL755u2xcm+ZIPR2yjQaCrpFefsrrnZ5850Zuzj/DLFYURukRxhOr5mB8vYN7KRBrPeadHC7k26RBcK/XpY8HyedfKmdevklx3VH+3gbqvfrxkO</Encrypted>]]>
      </text>
    </command>
    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75ymtyW99MDOuhUekZt9uT78ikk9b1xhrsXTzfCswY+SnbvrIz671oYMgyYnTPfuMCKzOZP1qQjwtmRd+NOBvMmg=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL758FqqnKB3SEYOg/Qz+yjr8j3aAZwuyjS3R4kj/nwZGgl1HFgrEjinrzmE4eDd6ic50oQeeaqm1FCSwfR+mXI7xBgDwk7obhvpIdCGcATTRJL</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtWNR9/wgMN1ihxLV9mIkT13IHnKFEuf3iItxtkODNqevg2BvCQJh7SpyljlNK7fzDgLreDcHarvVXNm+mUYhoqll+RBKbuul6UWhvVXFMgHZwC/hasEWdYS8VLiDOMETnCA7m8C4JEln7qMzTyzHN6I5RPG1fx/AZ80MvnmSRPGp7WGX4Kju+WhOLoN/LAFqBw7wjeyKoqp/LxX3kCCUwCE03i29VVnMlz1DzZKEY7Db6PI078vLjENn8YfM4Af6YK8FM8/+8zhNXTETOSI8Y7XTE+bhfs0XdNSmuZPx84vdgSjsj0iv1vhm8gMaC0n8R7RWMBeIdAQbM6sI3pxXmAH27xOAV1hCB/TPGDM/lAXsiv9LYY+MB5+6YIItPAOmLPgplQekAvl9a2Af7WEL9Pu5UZTmmqO3Tze2GEsWzy9kXeihgGWDpurArCr6m1ZOXxAWZYkY8FMBwNILB01y/PxnoANnZzI5TfHQ5QMfQjRVgXoAaRu0gsF/OP0nO3+G7fYdAX9tw0Ue+aFvBrbmnIY=</Encrypted>]]>
      &JavascriptReportInit;
      &ScriptTagReport;
    </text>
  </script>

  &XMLStandardReportToolbar;

</grid>