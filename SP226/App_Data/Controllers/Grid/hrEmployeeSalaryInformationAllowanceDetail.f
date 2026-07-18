<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="hrttctpc" code="stt_rec, stt_rec0" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="hrttctpc" prime="hrttctpc" field="" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="ma_pc" allowNulls="false" width="100" aliasName="a">
      <header v="Mã phụ cấp" e="Allowance"></header>
      <items style="AutoComplete" controller="hrAllowance" reference="ten_pc%l" key="kieu_pc = '2' and status = '1'" check="kieu_pc = '2'" information="ma_pc$hrdmpc.ten_pc%l"/>
    </field>
    <field name="ten_pc%l" readOnly="true" external="true" inactivate="true" width="300" aliasName="b">
      <header v="Tên phụ cấp" e="Description"></header>
    </field>
    <field name="ty_le" type="Decimal" dataFormatString="#0.00" width="100" aliasName="a">
      <header v="Tỷ lệ lcb (%)" e="Base Salary Rate (%)"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" clientDefault="0" width="120" aliasName="a">
      <header v="Tiền phụ cấp" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_hl_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100" allowNulls="false">
      <header v="Hiệu lực từ ngày" e="Effective Date From"></header>
    </field>
    <field name="ngay_hl_den" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100">
      <header v="Đến ngày" e="Effective Date to"></header>
    </field>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" width="0" hidden="true">
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
      <field name="ma_pc"/>
      <field name="ten_pc%l"/>
      <field name="ty_le"/>
      <field name="tien"/>
      <field name="ngay_hl_tu"/>
      <field name="ngay_hl_den"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>

    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiGclHw9nByzRnx7DE8bTzTPJt2OsD9tA+tYJpNrRJcY94ALUt5q1WF+FRyiM6cSmwMSEj73Jkdtyo37pe957+xE=</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiC8UEtr3Sk8p3A4vRoknHIQNAbP3niTE9wOhkQeIslttlOU2tI6Y4XRlA1s/M5URS1/jZ1hYnst4NVDhJN8jcRk=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hlFfperEIopW5SomBgwQOfay6jdrVavnXCTYYvUraosHK97xuy5p7fZcXn596iIa+uda8podYDhZPH5r8bh+Q1tp9440bo3IU/zQfuoCnHQqo55SgopX45QHgMXaXs4hK6+y/oiuG11D96zGxC7EaqKpFta2V3D8Ka6nT8AM67L9laE13wk0XYiCYm6TfGNDD6PMO5/KYRS5bwtySn6SSaDakJmNOs65R58WZgF4beZlVxth3xzWsrxCdkCd1pyy4+Q1bbj/3gJLL5eZQbV1j5AhmNtwbXMD1TCb713FUh2gb6NhdqOfJ8T5ztJ0150vK2nmRsF0gZ6PRDfp5fJXMsLQcqs8WJZxmMgCgFhXL1HeA==</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1OrDTQdK1c5LVXuryLCGmrZE6rTiEG3WmDYUe1Vl45Kef3gFU/KuTySrFxk1hnFoxHEuKww29PVRDu6Lz4G0pudyP8uqo61GefhXrfTFZ3zCApTvxUF74hVBfbO6AAPHf7I3ATG/jqKjW/iXH0LMoFEeXsLsSEtP0to/fSkE9f2</encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;
</grid>