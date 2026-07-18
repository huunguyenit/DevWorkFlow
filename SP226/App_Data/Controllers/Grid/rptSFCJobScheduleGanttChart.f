<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bảng kế hoạch tiến độ yêu cầu sản xuất" e="Job Schedule Gantt Chart"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="sysprint" type="Decimal" width="0" hidden="true">
      <header v="In" e="Print"></header>
      <items style="Numeric"></items>
    </field>

    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_lsx" width="0" hidden="true" allowSorting="true" allowFilter="true">
      <header v="Yêu cầu sản xuất" e="MO/WO/Operation"></header>
    </field>
    <field name="ma_cd" width="0" hidden="true" allowSorting="true" allowFilter="true">
      <header v="Mã công đoạn" e="Code"></header>
    </field>

    <field name="kieu_cd" type="Decimal" width="0" allowSorting="true" hidden="true">
      <header v="Kiểu công đoạn" e="Type"></header>
      <items style="Numeric"></items>
    </field>

    <field name="ngay_bd" type="DateTime" width="0" hidden="true" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày bắt đầu" e="Start Date"></header>
    </field>
    <field name="gio_bd" width="0" hidden="true" allowSorting="true" allowFilter="true">
      <header v="Giờ bắt đầu" e="Start Time"></header>
    </field>
    <field name="ngay_kt" type="DateTime" width="0" hidden="true" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày kết thúc" e="End Date"></header>
    </field>
    <field name="gio_kt" width="0" hidden="true" allowSorting="true" allowFilter="true">
      <header v="Giờ kết thúc" e="End Time"></header>
    </field>

    <field name="so_ngay" type="Decimal" width="0" hidden="true" allowSorting="true">
      <header v="Số ngày" e="Days"></header>
      <items style="Numeric"></items>
    </field>
    <field name="so_gio" type="Decimal" width="0" hidden="true" allowSorting="true">
      <header v="Số giờ" e="Hours"></header>
      <items style="Numeric"></items>
    </field>
    <field name="cd_truoc" width="0" hidden="true" allowSorting="true" allowFilter="true">
      <header v="Công đoạn trước" e="Previous"></header>
    </field>
    <field name="cd_sau" width="0" hidden="true" allowSorting="true" allowFilter="true">
      <header v="Công đoạn sau" e="Next"></header>
    </field>


    <field name="x_name" width="0" hidden="true" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="x_paint" type="Decimal" width="0" hidden="true" allowSorting="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="x_paint_day" width="0" hidden="true" >
      <header v="" e=""></header>
    </field>
    <field name="x_off_days" width="0" hidden="true">
      <header v="Ngày nghỉ" e="Off Days"></header>
    </field>
    <field name="x_colors" width="0" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="so_luong" type="Decimal" dataFormatString="#.000" width="0" hidden="true" allowSorting="true">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"></items>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="sysprint"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcP6+NXGtejN0jj8CT+reNlRA+zlGwSjh/h9/pv3uQ1bB+EslocZDdW05OBOOVvarWjHhNZ2CeZvCHnAy/O2QYXw=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcOID/tKl7KygxsBqfJjp536TIBikxi5EwXg4UqSkvI5TUHqxohnKs4xpzjoBYOJ+hf5vOYZ/gkUM3DMXx6Dxm3M=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&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</Encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7Rdo8vfiIRFO4lxP0rNsJtQtEiVFl0UXsTaJnvpVgH8Osw6CbcASUXZU7+Yrp23GOU7Jx4zQxjjIXDDnkU0QdrQUFyuGG7w+7sk6SCEH5bPUbq9ww5A9h3gRUBhKYAnazQOvZ/0Io23fX6NJDV+8qHCH6lmTEVV4QoXNqzh9gzKqqx4yhBvaj00by1r6rATbpXW2afntIDdUBfLonjACcM=</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Option">
      <title v="Tùy chọn$$150" e="Option$$150"></title>
      <menuItems>
        <menuItem commandArgument="Mode0">
          <header v="Hiển thị mặc định" e="Display Default" />
        </menuItem>
        <menuItem commandArgument="Mode1">
          <header v="Hiển thị màu sắc riêng theo hoạt động" e="Display Colors by Individual Bars" />
        </menuItem>
        <menuItem commandArgument="Mode2">
          <header v="Hiển thị liên kết giữa các hoạt động" e="Display Combine Symbol between Bars" />
        </menuItem>
      </menuItems>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
  </toolbar>
</grid>