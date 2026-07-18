<?xml version="1.0" encoding="utf-8"?>

<grid table="ctns4" code="ma_ns, stt_rec0" order="ma_ns, line_nbr" type="Detail" freezeColumns="3" id="" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""/>
  <subTitle v="" e=""/>
  <partition table="ctns4" prime="ctns4" field="" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="doi_tuong" allowNulls="false" width="100" dataFormatString="1, 2" defaultValue="1" clientDefault="1" align="right">
      <header v="Đối tượng cư trú" e="Resident Kind"></header>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZejwuG3FXgKty2XZyo2w8rFbG/C64vplnumEhYJPb4fKsqmDaEt8ScYPayi1zs1BLXjDMJMnmg/KEAIDVnkd9n0=</encrypted>]]></clientScript>
    </field>
    <field name="tinh_thue_yn" allowNulls="false" width="100" dataFormatString="1, 0" defaultValue="1" clientDefault="1" align="right">
      <header v="Tính thuế" e="Tax Assessment"></header>
      <items style="Mask"/>
    </field>
    <field name="hop_dong_yn" allowNulls="false" width="100" dataFormatString="1, 0" defaultValue="1" clientDefault="1" align="right">
      <header v="Hợp đồng lao động từ 3 tháng trở lên" e="Labor Contract at least three months"></header>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZejwuG3FXgKty2XZyo2w8rFbG/C64vplnumEhYJPb4fKsqmDaEt8ScYPayi1zs1BLXjDMJMnmg/KEAIDVnkd9n0=</encrypted>]]></clientScript>
    </field>
    <field name="tinh_gt_yn" allowNulls="false" width="100" dataFormatString="1, 0" defaultValue="1" clientDefault="1" align="right">
      <header v="Giảm trừ bản thân" e="Deduction"></header>
      <items style="Mask"/>
    </field>
    <field name="uy_quyen_yn" allowNulls="false" width="100" dataFormatString="1, 0" defaultValue="1" clientDefault="1" align="right">
      <header v="Ủy quyền quyết toán" e="Authorization"></header>
      <items style="Mask"/>
      <handle key="[v_uy_quyen]"/>
    </field>
    <field name="ngay_hl" type="DateTime" allowNulls="false" width="100" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
    <field name="ghi_chu" width="300">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="v_uy_quyen" type="Boolean" width="0" external="true" hidden="true" aliasName="case when a.doi_tuong = '1' and a.hop_dong_yn = '1' then 1 else 0 end">
      <header v="" e=""></header>
    </field>

    <field name="ma_ns" isPrimaryKey="true" readOnly="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="doi_tuong"/>
      <field name="hop_dong_yn"/>
      <field name="tinh_thue_yn"/>
      <field name="tinh_gt_yn"/>
      <field name="uy_quyen_yn"/>
      <field name="ngay_hl"/>
      <field name="ghi_chu"/>

      <field name="v_uy_quyen"/>

      <field name="ma_ns"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1OrDTQdK1c5LVXuryLCGmoxjFqAhaw5xkjwwK86TV1Vv8ORPLPXHKdYfx1gDg4og9wLDpEoTNNLQW2UVaog0rbugBZ7l1NypS2f9KQF+5Yh</encrypted>]]>
      </text>
    </query>
  </queries>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiDCnPLsPQEDSjZVjaMJi4NjI0ho+Q3qpR7xxLKHhqfriKEUlgKV13y1uXtr8h/7t23xVcu+yZ4BOV8GJRH7/Trw=</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiEQ2AccjTeOhHbUY48XVOQdwgaJwTdznV7k4NvDStsSovQVSBz2g17VAlUMXY6FYlHWt2S2dvZtRr3TJDpzotr4=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70HdfmBQZ/A9P6yP8inWLnvB//RhlrtPLrHeaXYS9PaLx/Q6Ypd3SXhSRdrjRsldBVWPlSczUjB3Xh/MYxqTLwOzQauECEbaiN7PeGuQ6C7q/cxDc1qJT5n7rhmS8AmlHRxVeTsru0g8tb2twc3jdUGy/4ciEFuoGgFIncx5eVu7JVCGku/nar0BGdygsctaFLhYY7mvrBJBuUYeFqE8H+kmN3bGiBSFgjCPoJCkoABYFQs5dGtggGHmi65y/FmlFPAQwfPYSFH2xHsVlHLvGYX1VLeZiNtycjHtxB9MvuJpWa1Y6qqsR7HSxEkFrzyTysGyO+/57fkTK206Cxhdq6ARpQIhiv1REiN0IyuWzLMfvDA9vmZ5r1GPf6Ky/ZQZoWsQ/1zffDl4iqBXL9UfXTnPRmXE+8CvpE/Nb4MJyiwEePr0tpxw2mzTZC3G3Zuy+r++kVQjd+0KReGkSLr3hO8qPUju3Sl/iz0KRu5e3CPJPaht5cCzPGnQPDTRRnEeDBTd78eGTOIE7LRk3IQ4DVDtLY5H7PytENaNU+Leda91/PjIUxIyaTg0yFHoK26EU5adAAJUVDrI/GMa6mWWlFm1zzoiJDo+7snRRIy0umDyfCs0UZ41PMo1nknISFt+vClAMiZ1LSB9rFybP4cvh6djkYQmjEDuHz4F+HaNHHKvR8BJkYW7yb9VR+LDhexNDw/BwywsTJDrIysrwgREKqHg=</encrypted>]]>
    </text>
  </script>

  <toolbar>
    <button command="Insert">
      <title v="Toolbar.Insert" e="Toolbar.Insert"></title>
    </button>
    <button command="Clone">
      <title v="Toolbar.Clone" e="Toolbar.Clone"></title>
    </button>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>