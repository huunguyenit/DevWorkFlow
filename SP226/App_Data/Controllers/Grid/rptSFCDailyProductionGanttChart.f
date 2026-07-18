<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bảng tiến độ thực hiện yêu cầu sản xuất" e="Daily Production Gantt Chart"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="sysorder" type="Decimal" width="100">
      <header v="Sắp xếp" e="Order"></header>
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

    <field name="ngay_bd_th" type="DateTime" width="0" hidden="true" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày bắt đầu" e="Start Date"></header>
    </field>
    <field name="gio_bd_th" width="0" hidden="true" allowSorting="true" allowFilter="true">
      <header v="Giờ bắt đầu" e="Start Time"></header>
    </field>
    <field name="ngay_kt_th" type="DateTime" width="0" hidden="true" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày kết thúc" e="End Date"></header>
    </field>
    <field name="gio_kt_th" width="0" hidden="true" allowSorting="true" allowFilter="true">
      <header v="Giờ kết thúc" e="End Time"></header>
    </field>
    <field name="so_ngay_th" type="Decimal" width="0" hidden="true" allowSorting="true">
      <header v="Số ngày" e="Days"></header>
      <items style="Numeric"></items>
    </field>
    <field name="so_gio_th" type="Decimal" width="0" hidden="true" allowSorting="true">
      <header v="Số giờ" e="Hours"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ty_le_th" width="0" hidden="true" allowSorting="true" allowFilter="true">
      <header v="Tỷ lệ (%)" e="Rate (%)"></header>
    </field>

    <field name="x_name" width="0" hidden="true" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="x_paint" type="Decimal" width="0" hidden="true" allowSorting="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="x_paint_th" type="Decimal" width="0" hidden="true" allowSorting="true">
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
    <field name="so_luong_th" type="Decimal" dataFormatString="#.000" width="0" hidden="true" allowSorting="true">
      <header v="Số lượng th" e="Quantity"></header>
      <items style="Numeric"></items>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="sysorder"/>
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

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
  </toolbar>
</grid>