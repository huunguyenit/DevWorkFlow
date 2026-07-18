<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;
]>

<grid table="sfdmcumcv" code="ma_ccv" order="ma_ccv" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục trung tâm công việc" e="Work Center List"></title>
  <subTitle v="Cập nhật trung tâm công việc: thêm, sửa, xóa..." e="Add, Edit, Delete Work Center..."></subTitle>

  <fields>
    <field name="ma_ccv" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Trung tâm cv" e="Work Center"></header>
    </field>
    <field name="ten_ccv%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên trung tâm cv" e="Description"></header>
    </field>
    <field name="ma_bp" width="100" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>

    <field name="tg_ca1" type="Decimal" allowSorting="true" allowFilter="true" dataFormatString="@HourViewFormat" align="right" width="100">
      <header v="Thời gian ca 1" e="Hours Shift 1"></header>
      <items style="Numeric"/>
    </field>
    <field name="tg_ca2" type="Decimal" allowSorting="true" allowFilter="true" dataFormatString="@HourViewFormat" align="right" width="100">
      <header v="Thời gian ca 2" e="Hours Shift 2"></header>
      <items style="Numeric"/>
    </field>
    <field name="tg_ca3" type="Decimal" allowSorting="true" allowFilter="true" dataFormatString="@HourViewFormat" align="right" width="100">
      <header v="Thời gian ca 3" e="Hours Shift 3"></header>
      <items style="Numeric"/>
    </field>

    <field name="nc_ca1" type="Decimal" allowSorting="true" allowFilter="true" dataFormatString="### ###" align="right" width="100">
      <header v="Nguồn lực ca 1" e="Resource Units Shift 1"></header>
      <items style="Numeric"/>
    </field>
    <field name="nc_ca2" type="Decimal" allowSorting="true" allowFilter="true" dataFormatString="### ###" align="right" width="100">
      <header v="Nguồn lực ca 2" e="Resource Units Shift 2"></header>
      <items style="Numeric"/>
    </field>
    <field name="nc_ca3" type="Decimal" allowSorting="true" allowFilter="true" dataFormatString="### ###" align="right" width="100">
      <header v="Nguồn lực ca 3" e="Resource Units Shift 3"></header>
      <items style="Numeric"/>
    </field>

    <field name="sl_may" type="Decimal" allowSorting="true" allowFilter="true" dataFormatString="## ###" align="right" width="100">
      <header v="Số lượng máy" e="No. of Stations"></header>
      <items style="Numeric"/>
    </field>
    <field name="nc_cai_dat" type="Decimal" allowSorting="true" allowFilter="true" dataFormatString="## ###" align="right" width="100">
      <header v="Đội cài đặt" e="Setup Crew"></header>
      <items style="Numeric"/>
    </field>
    <field name="nc_th" type="Decimal" allowSorting="true" allowFilter="true" dataFormatString="## ###" align="right" width="100">
      <header v="Đội vận hành" e="Run Crew"></header>
      <items style="Numeric"/>
    </field>
    <field name="tg_cho" type="Decimal" allowSorting="true" allowFilter="true" dataFormatString="@HourViewFormat" align="right" width="100">
      <header v="Thời gian chờ" e="Queue Time"></header>
      <items style="Numeric"/>
    </field>
    <field name="hieu_suat" type="Decimal" allowSorting="true" allowFilter="true" dataFormatString="###.00" align="right" width="100">
      <header v="Hiệu suất (%)" e="Std Efficiency"></header>
      <items style="Numeric"/>
    </field>
    <field name="hs_sd" type="Decimal" allowSorting="true" allowFilter="true" dataFormatString="###.00" align="right" width="100">
      <header v="Hệ số sử dụng (%)" e="Std Utilization"></header>
      <items style="Numeric"/>
    </field>
    <field name="pt_lich" width="100" allowSorting="true" allowFilter="true" align="right">
      <header v="Phụ thuộc lịch" e="Use Calendar"></header>
    </field>
    <field name="cs_gh" width="100" allowSorting="true" allowFilter="true" align="right">
      <header v="Công suất giới hạn" e="Critical Work Center"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_ccv"/>
      <field name="ten_ccv%l"/>
      <field name="ma_bp"/>

      <field name="tg_ca1"/>
      <field name="tg_ca2"/>
      <field name="tg_ca3"/>

      <field name="nc_ca1"/>
      <field name="nc_ca2"/>
      <field name="nc_ca3"/>

      <field name="sl_may"/>
      <field name="nc_cai_dat"/>
      <field name="nc_th"/>
      <field name="tg_cho"/>
      <field name="hieu_suat"/>
      <field name="hs_sd"/>
      <field name="pt_lich"/>
      <field name="cs_gh"/>
    </view>
  </views>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"></title>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>