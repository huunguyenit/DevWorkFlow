<?xml version="1.0" encoding="utf-8"?>

<grid table="hrtttncnct" code="stt_rec, stt_rec0" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""/>
  <subTitle v="" e=""/>
  <partition table="hrtttncnct" prime="hrtttncnct" field="" expression="''" increase="{0}" default=""/>

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
      <field name="doi_tuong"/>
      <field name="hop_dong_yn"/>
      <field name="tinh_thue_yn"/>
      <field name="tinh_gt_yn"/>
      <field name="uy_quyen_yn"/>
      <field name="ngay_hl"/>
      <field name="ghi_chu"/>

      <field name="v_uy_quyen"/>

      <field name="stt_rec"/>
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
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiFbSLedvRMIQQcnX4rL6/kNwSlz3LxVGO76+kOkhxvIm5f3TRVfg6zFDP2YSgSjI/0GX8oNKi1lqw4wUJzjgCtHCNLIvcvmiSzx8Z9tIDBYF</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiLR+5gfkVjwUaED6mdZx2rfBYAjyBQChjiH09DR2HVasWnQ8ZrvNuoXvD243sZX4IeygwJ/Zh1iKbm6cCFC62/UlbqszLdoc0X960koWntar</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hl8txcBnsa0L7GxHheA9m2eoD8qAQrVJOI2vp5c8xP3YlBVjUAlEEmR65nQGI6NsRVzjojIAkS5AL3CZTk9BsDVx80pKg+8Yn166Udj2TIsOTXPx2WXwlO0/tpTvUTTmMeLLJ/bJIlJVMKXCmul8dHHGtpzZzJPDnp5PKuqpJCoAmMRGYEORA+pRUteeBS7V1t+amrqyWDNk9WRzj6ZJCG2eFT4DxwD4MhLCr4Tzde+idX2MWuZXPxsFnLwevBCIT3HbT/quUv9f3F19OAjOQwu8VMkoVPUOpcELD9IFE4k3JftVAG5p+8IAXu3IRMHgVw6MwICxycuarNL6Nk6E8p68kO1t6UlsN7A3uYkCSfQfHIB0lDaVMPlrFuCugRxvWYCKt2oJv3FoGBRsicN+dEiJeHfHRMN84LCtQXCqdu6HUr9ZX/JbBKrStwQQy11n+NQvndynLvxSnqCgqhZ1A2lJa/irbxVO0upp4iEwR4tlgylSJvFs//T8qDvxTCgwDX2pTJHJ1OYTRtnK3AQy1KkQ5yD/vZZsT4unXd21nTBBHMrrwj08cFhIJRamtbesP+e38Dv7M0ZB+2c4ACWMHVLsrYsHzRNwKLwrnU8uNEydOjbnZfuYo3FRlyZYzEEjH8WuGrtqmUogfKZowPoDm8yWxRj4Nk8KVrJD80RH9pWMawyZTTG0dyAwqcTqlAGpc4=</encrypted>]]>
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