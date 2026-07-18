<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="ctnl" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="CR1" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="ctnl" prime="ctnl" inquiry="ctnl" field="" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="ma_nl" allowNulls="false" dataFormatString="@upperCaseFormat" aliasName="a" width="100">
      <header v="Mã nguồn lực" e="Resource ID"></header>
      <handle source="crdmnl.ma_vt" foreward="true"/>
      <items style="AutoComplete" controller="CRCriticalResourceList" reference="ten_nl%l" key="status = '1'" check="1=1" information="ma_nl$crdmnl.ten_nl%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQqJ+/6wGpWD3ByxVBMt2MPEuStR9vaGsWTZzBoGOCRJIKKvT/zM0Y/fcMNqWXcbD7c=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_nl%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b.ten_nl%l">
      <header v="Tên nguồn lực" e="Resource Description"></header>
    </field>
    <field name="dvt" width="50" aliasName="a" allowNulls="false" inactive="true" readOnly="true">
      <header v="Đơn vị tính" e="UOM"></header>
    </field>
    <field name="cach_tinh" allowNulls="false" width="100">
      <header v="Cách tính" e="Time Basic"></header>
      <items style="AutoComplete" controller="CRTimeBasicList" reference="ten_cach_tinh%l" key="status = '1'" check="1=1" information="cach_tinh$sfdmcachtinh.ten_cach_tinh%l"/>
    </field>
    <field name="ten_cach_tinh%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="cong_suat" type="Decimal" dataFormatString="@CapacityNumberInputFormat" align="right" width="100" aliasName="a">
      <header v="Năng suất" e="Q'ty per"></header>
      <items style="Numeric"/>
    </field>
    <field name="tg_cai_dat" type="Decimal" dataFormatString="@HourInputFormat" align="right" width="100">
      <header v="Thời gian cài đặt" e="Setup Time"></header>
      <items style="Numeric"/>
    </field>
    <field name="tg_bo_sung" type="Decimal" dataFormatString="@HourInputFormat" align="right" width="100">
      <header v="Thời gian bổ sung" e="Offset Time"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_ngay" type="Decimal" dataFormatString="@CapacityNumberInputFormat" align="right" width="100">
      <header v="Thời gian thực hiện sản xuất" e="Production Leadtime"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100">
      <header v="Hiệu lực từ ngày" e="Effective Start"></header>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100">
      <header v="Đến ngày" e="Effective End"></header>
    </field>

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
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
      <field name="ma_nl"/>
      <field name="ten_nl%l"/>
      <field name="dvt"/>
      <field name="cach_tinh"/>
      <field name="ten_cach_tinh%l"/>

      <field name="cong_suat"/>
      <field name="tg_cai_dat"/>
      <field name="tg_bo_sung"/>
      <field name="so_ngay"/>
      <field name="ngay_ct1"/>
      <field name="ngay_ct2"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcId2xB+L9A0FuJAQVgRyH0gM/L5jLwqjOegq/ugev0ANP+pl12wcpq/b05VIXZBplJ6RKGQ/i10U6VIkxiyGbBSP8+c+XYPM64Cxku4oV04FWyhD4ufyzHGiT37R6lbJEA==</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPaSX9peRH2nRZu+rKDurKV8SQqddMG9kdcvUjxHMu6bzSZGQTwdbvEgcxi+kcNHACK6ZzFtTXa9o2LCkFeYcXe+AlMUWjmyygqGA9Yq4w2o</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTElG1hN6LKG0Vp8Y9kWhG8aFFhpNj5+u9WMGtcb4/eEAwYZcB3DJ8VktUj+e3SXGjczj1lep4VPWDCjgMPhpa1fEHNjQWSNnP+L5HW2+aw2RJyM0G6NNmaUu7TJWLh2BrNxOJFBEeLax3UiedBsCKTFP+RqqNqkVqvceXC89NUINu9vGNUau/RIcreL+K6fQ2kk9eVTJD0mYTPqz3hMITQmwje2jusgsWJAkT9S+otZWuhr38m9Z8m56jl/Yq4soIE1Unzh+gOAiKaQ/CYSuE1HrJvUVDrA1aX3X+HGuD0JbbJttG+bVSTCtg2moIPErZCGtIl31CIlhS6nl0IbPs2jLQsmCbp5I1LMbRJGAfMH6U4Tf/3FJzZOHsgGg8fIl/NO5tVhgQd2cOue77GvII1qiZIYeSXLURLUYjvtVCVUQMmZa4tC6sI+iIt2deiRAMNE00n44Dd2qjstREWbzNIXF6GVWhSnnUrqiX06tqaMKhcDayNeIxFsKPsSa9IjejKUZZFoNbBvuy2FmJ3n8XZHs2XiZ2oQjMO/bdB1gMzy</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Resource">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6iALfyNy6McP/xwtoaa/aGcydHb4jkS/l+MyVCfSFIqk1iweQ1oww4aFHTprBUEjkfW2l1k2VMrgtTD305wi6TlwAmj5csocrHoI/UPsZBGQ==</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSBRxHHipUYT8zo6SU3l8TaxSU+6lUYGq/MXlK4VhAcRHRxYdYZ+TU5xF77qmhOmRkQTEaBsJNkECUhKBkxABPXXHAy9LNtalY8HX4OF8bK8O</Encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;
</grid>