<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
]>

<grid type="Report" code="so_the_ts" valid="" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Biên bản thanh lý CCDC" e="Tool &amp; Supply Liquidation Report"></title>
  <subTitle v="Kỳ %d1 năm %d2..." e="Period %d1 Year %d2..."></subTitle>
  <fields>
    <field name="tag" type="Boolean" width="60">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<encrypted>%wLn1SXGDs39WFPeKEFTBo1TA/FPU50fQ+29BCE0grzmFl/iXXjQIk5UPIx/v1lcsr/fISeKKTbZbTjn5IGjl5A==</encrypted>]]></clientScript>
    </field>
    <field name="so_the_ts" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Mã công cụ" e="T&amp;S Code"></header>
    </field>
    <field name="ten_ts" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tên công cụ" e="Tool &amp; Supply Name"></header>
    </field>
    <field name="ngay_mua" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Ngày tăng" e="Incr. Date"></header>
    </field>
    <field name="ngay_kh0" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Ngày pp" e="Distr. Date"></header>
    </field>
    <field name="so_ky_kh" type="Decimal" dataFormatString="# ###" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Số kỳ phân bổ" e="Distr. Periods"></header>
    </field>
    <field name="tk_ts" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tk công cụ" e="T&amp;S Account"></header>
    </field>
    <field name="tk_kh" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tk phân bổ" e="Distr. Account"></header>
    </field>
    <field name="tk_cp" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tk chi phí" e="Expense Acct."></header>
    </field>
    <field name="ma_bp" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Bộ phận sử dụng" e="Using Dept."></header>
    </field>
    <field name="nh_ts1" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Nhóm 1" e="Group 1"></header>
    </field>
    <field name="nh_ts2" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Nhóm 2" e="Group 2"></header>
    </field>
    <field name="nh_ts3" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Nhóm 3" e="Group 3"></header>
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
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiAs+YSzfYKOfO+hWI2kdfJ87IrmR4PX5kPQXV0B8ABfH5x76afAmDjMZ00T+E6vkQ9Nj4+3nYyzGCM3pCuD6XOLxica6nHcOCtV0V2D9EgjL</encrypted>]]>
      </text>
    </command>
    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiKmTUTkOGngmMGuyruR/Y0WBhrdS65DIANVeKx6UyG3oHHk0CQ0QkKKdpIJRv1XXRfXkgp1HirSB+N3y3V5mTGw=</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiDw+aSIFSY6T3tgzVT/d0aY/se1CwG+YS7lL4/+7Pnzs1+y8GlY/syjSQrc6GaHC6Fn7WLdnXr4+uRr7cFRskjgwVXVXhzgK3Ruz391QGem+</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70PRghbr+9p1xCeuNkC36aW69l+7h9+9TFBW4nW0AaKEbfiwbUgHh0crFeM5HUgcLImRkgUe4dLOFKtU59OqXqdEsQTJlPYJi2OvSOMxS3BMaSNR/ts/8pxM3oXATFYr9WNXJIfTmS8v47jGI3vvRBrWw/LBYTl59OsJwMKKDBnVfdkmcJdsPMWGz4gZPe/HL7GrO6NTDhIGKzz/Vvzq1iJ/8XhLA4Q/B2FSS0sHeZ6R7EZuULu7MlV+JXL2nFn1357OQ99nvNj1UO9EIxuN2mSLSdhsdw2b6FB8M5M5iLWy5kvx3D+WAis/wSNF7zLCtJBZ7/YfuHn5NlFYbP84UI/wYO+PDsy6kpYDKHTso66KriPyupVelG/Yaji9l/iqtK+jJNZB+ntrZ85hJQba0KtOuty7OWPtEfq6ekGzkrAlgOXwAPlFGAkccUgF8fw8zgscS46KmHSxoRyaXDncGu0+Po3fyE1sfYzZiVaLeY8GjWQTCq3yu/wLPkNneXrnp0New1O2FU6ErvSYowfCb79w=</encrypted>]]>
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