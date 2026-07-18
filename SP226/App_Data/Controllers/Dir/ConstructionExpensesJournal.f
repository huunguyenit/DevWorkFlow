<?xml version="1.0" encoding="utf-8"?>

<dir table="dtsocpdtxd" code="form" order="form" xmlns="urn:schemas-fast-com:data-dir">
  <title v="tham số" e="Parameter"></title>
  <fields>
    <field name="form" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="xl">
      <header v="Xây lắp" e="Construct"></header>
      <items style="AutoComplete" controller="Account" reference="ten_xl%l" key="status = '1'" check="1 = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_xl%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="tb">
      <header v="Thiết bị" e="Plug-in Device"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tb%l" key="status = '1'" check="1 = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tb%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="tb2">
      <header v="Thiết bị khác" e="Unplug Device"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tb2%l" key="status = '1'" check="1 = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tb2%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="cp_bt" defaultValue="''">
      <header v="Chi phí bồi thường" e="Compensation Exp."></header>
      <items style="AutoComplete" controller="Account" reference="ten_cp_bt%l" key="status = '1'" check="1 = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_cp_bt%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="cc">
      <header v="Công cụ" e="Tools &amp; Supply"></header>
      <items style="AutoComplete" controller="Account" reference="ten_cc%l" key="status = '1'" check="1 = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_cc%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="cp_ql" defaultValue="''">
      <header v="Chi phí quản lý dự án" e="PMU Expenses"></header>
      <items style="AutoComplete" controller="Account" reference="ten_cp_ql%l" key="status = '1'" check="1 = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_cp_ql%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="cp_tv" defaultValue="''">
      <header v="Chi phí tư vấn" e="Consultant Expenses"></header>
      <items style="AutoComplete" controller="Account" reference="ten_cp_tv%l" key="status = '1'" check="1 = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_cp_tv%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="khac">
      <header v="Chi phí khác" e="Other"></header>
      <items style="AutoComplete" controller="Account" reference="ten_khac%l" key="status = '1'" check="1 = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_khac%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330, 0"/>
      <item value="1111: [xl].Label, [xl], [ten_xl%l], [form]"/>
      <item value="111-: [tb].Label, [tb], [ten_tb%l]"/>
      <item value="111-: [tb2].Label, [tb2], [ten_tb2%l]"/>
      <item value="111-: [cp_bt].Label, [cp_bt], [ten_cp_bt%l]"/>
      <item value="111-: [cc].Label, [cc], [ten_cc%l]"/>
      <item value="111-: [cp_ql].Label, [cp_ql], [ten_cp_ql%l]"/>
      <item value="111-: [cp_tv].Label, [cp_tv], [ten_cp_tv%l]"/>
      <item value="111-: [khac].Label, [khac], [ten_khac%l]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4KLaqGxPpctfcqscylxDRwqndjQv6WBt0nDjDs5OaXTLXVVZutfS1ebiBZpIo43Bl8Fbjd5lvl4Lr/oWO3H6/A=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Np0sFOmsenpE70+PvVmSSqi0yuhcDC9v1XJLCgknbYhG0P3Qbg2jbL6XWnh/u339YYZ15XZ2vbr+EkCUGzWDUWFa32WReDIn0SY0OxFSVgU1NFpiYsyraFj7fZ1nYr5nS1dgIaySHkxHu/ayAtIRyC/gLh5svXYey5lkeDkzPIQbk+79Ul9lVKNo2Ae6jbM8+yrSIDD29A3fxGVD9knKkztYA0lITQCbhRkPJSpXsZ3GrN7fYtmCHaHor6EMTRYuHkO91ZRDg6KENHgDqqdJXLFOgIxiG/SgPK75vf7QJURLvG8bA1fuM+EJdgS1lL5CniJHaPy67c7sTQ4V3gegmM99qOjaQyWzNVKmuqiQcIPYjNsy2PoJxb4hNsJpXmSwAvUR556HJQWQgB2aRh4RHMpLOQo6plg924JdFZBQuSy+jtzZm114U0DzJYmnqeIqg==</encrypted>]]>
    </text>
  </script>
</dir>