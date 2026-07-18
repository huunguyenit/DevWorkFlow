<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
]>

<grid type="Report" code="stt_rec" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Sơ yếu lý lịch" e="Curriculum Vitae"></title>
  <subTitle v="%s..." e="%s..."></subTitle>
  <fields>
    <field name="tag" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<encrypted>%wLn1SXGDs39WFPeKEFTBo1TA/FPU50fQ+29BCE0grzmFl/iXXjQIk5UPIx/v1lcsr/fISeKKTbZbTjn5IGjl5A==</encrypted>]]></clientScript>
    </field>
    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten_nv" width="150" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Họ và tên" e="Employee Full Name"></header>
    </field>
    <field name="ten_bp" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="vi_tri" width="150" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Vị trí công việc" e="Position"></header>
    </field>
    <field name="ngay_sinh" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Ngày sinh" e="Date of Birth"></header>
    </field>
    <field name="ten_ttnv" width="150" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tình trạng" e="Status"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tag"/>
      <field name="stt_rec"/>
      <field name="ma_nv"/>
      <field name="ho_ten_nv"/>
      <field name="ten_bp"/>
      <field name="vi_tri"/>
      <field name="ngay_sinh"/>
      <field name="ten_ttnv"/>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70PRghbr+9p1xCeuNkC36aW69l+7h9+9TFBW4nW0AaKEbfiwbUgHh0crFeM5HUgcLIvC1/AkEat/PrKz2lF7xB0uxPXfwkmKbgBewix5GeQ22SV9/lyJk7vNtdDu/cDKP1TUm42p9AafUE7OX1cyDSniUVXiQ0G/jdl5mDrUe6Ge9uaIUJM7MzydCJFNo7ke1T3w5tha/ye4SeBsKyAGioitSJ0ASnDYD7wq3jCaOQzUkcyhMRwrQdzd2HGMqNKpUq2WV8fHMf46DC7RpQtHx2YskvpJwZ8IxcEYHRp7fpScQxC5o8I8Ace4Az3Hauf1QfwdteVCAFnFEN1nOKHe0YUVRahTr8dLXBNnM3j6FV8T+lNo9ccFZtvvDczNrkyhhJiZQ4Y1Z9WNCePFoSDR+8ZKCp4GmNcp1XxYaNDlvLoHGUsoKf3fUWHdwNDdnmV5gODK8vVl3rojJjK81XSHXrsOZedFi9h8GxrKrLgo67//6vnpxuZz2GiCFuhldxYeNog==</encrypted>]]>
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