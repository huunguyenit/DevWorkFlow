<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Thẻ công cụ dụng cụ" e="Tool &amp; Supply Card"></title>
  <subTitle v="Kỳ %d1 năm %d2..." e="Period %d1 Year %d2..."></subTitle>
  <fields>
    <field name="tag" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<encrypted>%wLn1SXGDs39WFPeKEFTBo1TA/FPU50fQ+29BCE0grzmFl/iXXjQIk5UPIx/v1lcsr/fISeKKTbZbTjn5IGjl5A==</encrypted>]]></clientScript>
    </field>
    <field name="ma_dc" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Mã công cụ" e="T&amp;S Code"></header>
    </field>
    <field name="ten_dc%l" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tên công cụ" e="Tool &amp; Supply Name"></header>
    </field>

    <field name="ngay_tang" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Ngày tăng" e="Inc. Date"></header>
    </field>
    <field name="ngay_pb0" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Ngày pb" e="Distr. Date"></header>
    </field>
    <field name="so_ky_pb" type="Decimal" dataFormatString="# ###" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Số kỳ pb" e="Distr. Periods"></header>
    </field>

    <field name="tk_dc" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tk công cụ" e="T&amp;S Acct."></header>
    </field>
    <field name="tk_pb" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tk phân bổ" e="Distr. Acct."></header>
    </field>
    <field name="tk_cp" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tk chi phí" e="Expense Acct."></header>
    </field>

    <field name="ma_bp" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Bp sử dụng" e="Using Dept."></header>
    </field>

    <field name="nh_dc1" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Nhóm 1" e="Group 1"></header>
    </field>
    <field name="nh_dc2" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Nhóm 2" e="Group 2"></header>
    </field>
    <field name="nh_dc3" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Nhóm 3" e="Group 3"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tag"/>

      <field name="ma_dc"/>
      <field name="ten_dc%l"/>

      <field name="ngay_tang"/>
      <field name="ngay_pb0"/>
      <field name="so_ky_pb"/>

      <field name="tk_dc"/>
      <field name="tk_pb"/>
      <field name="tk_cp"/>

      <field name="ma_bp"/>

      <field name="nh_dc1"/>
      <field name="nh_dc2"/>
      <field name="nh_dc3"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiAs+YSzfYKOfO+hWI2kdfJ87IrmR4PX5kPQXV0B8ABfH5x76afAmDjMZ00T+E6vkQ9Nj4+3nYyzGCM3pCuD6XOLxica6nHcOCtV0V2D9EgjL</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiDw+aSIFSY6T3tgzVT/d0aY/se1CwG+YS7lL4/+7Pnzs1+y8GlY/syjSQrc6GaHC6Fn7WLdnXr4+uRr7cFRskjgwVXVXhzgK3Ruz391QGem+</encrypted>]]>
      </text>
    </command>
    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiKmTUTkOGngmMGuyruR/Y0WBhrdS65DIANVeKx6UyG3oHHk0CQ0QkKKdpIJRv1XXRfXkgp1HirSB+N3y3V5mTGw=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70PRghbr+9p1xCeuNkC36aW69l+7h9+9TFBW4nW0AaKEbfiwbUgHh0crFeM5HUgcLIvC1/AkEat/PrKz2lF7xB0vJFGYPgSP/hMV41jk51IvCItmDq+cQu4WJOwcR1ytDELwdc4+0fHNIH36evvuYgpNNlQudkonSLU9rgROuVEa1yFXfJmJPrUqV3+Ynf10zs4/eYbTqcGHn//x4fKvRp+PowGOCl0XHgZAYML0r82iBmfvknSN7vaDdSQ1JuCTf2hoXhKW+2imQ1QdEMSW5/UPsMLEN6yGLmWWGs66j882TLUVD5Q3Bueoc1h5n9vlRinam7Cp0x/6Hrl33cxhZ3nMfKU6DjOMDnmdG7xPx2S4/8iwOuE08bhrHNxjfrVdrVpxs5PoB3ehunbYJjsIW3hsdRNw7fpgCvs1Zyk87etGocEa+R9AI3IwfHxlmJmflkcUU9JQ74pd8/kRnuIHsGbylOHQZuUi/6wCh9P3T/i/XZL0DFNte19AeMI8dMHGtwg==</encrypted>]]>
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