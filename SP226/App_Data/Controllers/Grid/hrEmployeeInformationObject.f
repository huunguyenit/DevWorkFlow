<?xml version="1.0" encoding="utf-8"?>

<grid table="hrttctdtbh" code="stt_rec, stt_rec0" order="ngay_hl_tu" type="Detail" freezeColumns="3" id="" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""/>
  <subTitle v="" e=""/>
  <partition table="hrttctdtbh" prime="hrttctdtbh" field="" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="loai_dt" width="100" allowNulls="false" aliasName="a">
      <header v="Loại đối tượng" e="Type Code"></header>
      <items style="AutoComplete" controller ="hrTypeOfParticipant" key="status = 1" check="1=1" reference="ten_loai%l" information="ma_loai$hrdmloaidtbh.ten_loai%l"></items>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên loại" e="Type Name"></header>
    </field>
    <field name="ngay_hl_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" width="100" aliasName="a">
      <header v="Hiệu lực từ ngày" e="Effective from"></header>
    </field>
    <field name="ngay_hl_den" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100" aliasName="a">
      <header v="Đến ngày" e="Effective to"></header>
    </field>
    <field name="dien_giai" width="300" aliasName="a">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="loai_dt"/>
      <field name="ten_loai%l"/>
      <field name="ngay_hl_tu"/>
      <field name="ngay_hl_den"/>
      <field name="dien_giai"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiKDEJHQrfeoDW4aIWXvdEMRMJshVXUb+CIV0IUTgE0ol9IM91bQaveu+k7tWcST7AUVlzkkGGzgadaVCpARnDDYxPzL8y+GrSm/VQU19Wln2</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiPvmytVmaNKyp7hIMTc6xakcEJNMsTsvWVfNPyphQ+rVPphRgAd7pSdCq1aIualGLw2XS+BZemcvgCdgondbu2ZSZ4oDkKgV4ZxJzZ0YOwrp</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hmZODAyBnbW4AhTzxaATzJ6xXAbi8lTS0K1mLunUTWZ/oGSsFHVQEvTdo88GXoEc0jyIAQJ8V0BbajTe+iI535J4iJV9LKC68Eg0UYyNIFiz3tc1Zo/Nz2uWkAV1cGiZ2GVnpV7v7FDa5CTuwH+VvIB0QlDJAEi1UVrTMusHp1P5XEWG/zf7/LEMIC0SMzKXnrV7CfH7aAOcd6BpNTSqbU9Fz7UR1oxH2KwMdVpAVOYL5BCnBwnR0QUiyeb8o0zLdzwrJe664x8W8QPBnW86GyFoD+mfKouicnIjEovd+IO+sqE5Oi43/uO4XpFYjoskCxaOByZTkyFULvhg2tdMN5NRrCOktCBxqTlD06KFG6MnQ==</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1OrDTQdK1c5LVXuryLCGmrZE6rTiEG3WmDYUe1Vl45Kef3gFU/KuTySrFxk1hnFo3O35MUu2Nf2ZYX0bqbCbFVYQOzzXJ4maAnrQ27TIA/Zxq3wEr+REyu996WKe+m7oqbX9LQmpqcj/O+roE1IPpzmdT0l78RjDN0muKt7FUYI</encrypted>]]>
      </text>
    </query>
  </queries>

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