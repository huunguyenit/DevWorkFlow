<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" code="so_the_ts" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Biên bản đánh giá lại TSCĐ" e="Fixed Asset Reappraisal Report"></title>
  <subTitle v="Kỳ %d1 năm %d2..." e="Period %d1 Year %d2..."></subTitle>
  <fields>
    <field name="tag" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
    </field>
    <field name="so_the_ts" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Số thẻ ts" e="FA Code"></header>
    </field>
    <field name="ten_ts" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tên tài sản" e="Description"></header>
    </field>
    <field name="ngay_mua" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Ngày tăng" e="Incr. Date"></header>
    </field>
    <field name="ngay_kh0" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Ngày tính kh" e="Depr. Date"></header>
    </field>
    <field name="so_ky_kh" type="Decimal" dataFormatString="# ###" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Số kỳ khấu hao" e="Depr. Periods"></header>
    </field>
    <field name="tk_ts" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tk tài sản" e="FA Account"></header>
    </field>
    <field name="tk_kh" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tk khấu hao" e="Depr. Account"></header>
    </field>
    <field name="tk_cp" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tk chi phí" e="Expense Acct."></header>
    </field>
    <field name="ma_bp" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Bộ phận sử dụng" e="Using Dept."></header>
    </field>
    <field name="nh_ts1" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Nhóm ts 1" e="FA Group 1"></header>
    </field>
    <field name="nh_ts2" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Nhóm ts 2" e="FA Group 2"></header>
    </field>
    <field name="nh_ts3" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Nhóm ts 3" e="FA Group 3"></header>
    </field>

    <field name="nguyen_gia_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;" readOnly="true">
      <header v="Nguyên giá nt" e="FC Original Cost"></header>
    </field>
    <field name="gt_da_kh_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;" readOnly="true">
      <header v="Gt đã khấu hao nt" e="FC Accum. Depr."></header>
    </field>
    <field name="gt_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;" readOnly="true">
      <header v="Gt còn lại nt" e="FC Current Value"></header>
    </field>
    <field name="ma_nt" width ="100" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="FC"></header>
    </field>
    <field name="ty_gia" type="Decimal" allowFilter="&GridReportAllowFilter.Number;" dataFormatString="@exchangeRateViewFormat" width ="100">
      <header v="Tỷ giá" e="Ex. Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="nguyen_gia" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;" readOnly="true">
      <header v="Nguyên giá" e="Original Cost"></header>
    </field>
    <field name="gt_da_kh" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;" readOnly="true">
      <header v="Gt đã khấu hao" e="Accum. Depr."></header>
    </field>
    <field name="gt_cl" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;" readOnly="true">
      <header v="Gt còn lại" e="Current Value"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tag"/>
      <field name="so_the_ts"/>
      <field name="ten_ts"/>
      <field name="ngay_mua"/>

      <field name="ngay_kh0"/>
      <field name="so_ky_kh"/>
      <field name="tk_ts"/>
      <field name="tk_kh"/>
      <field name="tk_cp"/>
      <field name="ma_bp"/>

      <field name="nh_ts1"/>
      <field name="nh_ts2"/>
      <field name="nh_ts3"/>

      <field name="nguyen_gia_nt"/>
      <field name="gt_da_kh_nt"/>
      <field name="gt_cl_nt"/>

      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="nguyen_gia"/>
      <field name="gt_da_kh"/>
      <field name="gt_cl"/>

    </view>
  </views>

  <commands>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtWNR9/wgMN1ihxLV9mIkT13IHnKFEuf3iItxtkODNqevg2BvCQJh7SpyljlNK7fzDjGUbkMs+ODBCZLOeMNXn4144BY58le249jfvlw06jmpHHPjPfwQIlIz3zcykRHHbKzKYJ7We306I1J8jmwKUBKrqqoK3GQLPAOonGgVPo/9WCBqUcNrTs3OI/f2F/UFaU1u/o8R0Ng2EDp8WokBJP1DHRa3NYl0YewyakuKd+MkyFlYvdIz7qjj36ECu5YLAfqjJzSMSmXzmfZl3tzQnk9yUVR8DwkhGVl6auOr5GGBepGx9DqEgc31ilL9w41HZq+p+QS2JMHDlhkNWm1gq/+A/w76chAeumzin+OF6J63CtjW57oVVeZ43l3684wcaTJaaHpxG2na1JqZC57EvfitiA+vybVChYiIR41Bx+29/Eh+R4ctxN547n9xKytyyQ==</Encrypted>]]>
      &JavascriptReportInit;
      &ScriptTagReport;
    </text>
  </script>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Print">
      <title v="Toolbar.Print" e="Toolbar.Print"></title>
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