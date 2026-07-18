<?xml version="1.0" encoding="utf-8"?>

<dir table="hrnvql" code="datetime0" order="datetime0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="điều chuyển người quản lý trực tiếp" e="Direct Supervisor Changing"></title>
  <fields>
    <field name="datetime0" type="DateTime" isPrimaryKey="true" dataFormatString="dd/MM/yyyy HH:mm:ss" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="nv_ql_cu" allowNulls="false">
      <header v="Quản lý cũ" e="Old Direct Supervisor"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten_ql_cu" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_nv$vhrnv.ten"/>
    </field>
    <field name="ten_ql_cu" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nv_ql_moi" allowNulls="false">
      <header v="Quản lý mới" e="New Direct Supervisor"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten_ql_moi" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_nv$vhrnv.ten"/>
    </field>
    <field name="ten_ql_moi" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 100, 130, 0"/>
      <item value="111001: [nv_ql_cu].Label, [nv_ql_cu], [ten_ql_cu], [datetime0]"/>
      <item value="11100: [nv_ql_moi].Label, [nv_ql_moi], [ten_ql_moi]"/>
    </view>
  </views>

  <commands>
    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfw9voEGmT31btGChKToWwF/ky9CInHxR+JQE4y0qBTRtrhJ7LbU5vD+OTffcSzLkbDkBEEO60eKCzA4FD8h/X8Bq918v/W3qBVuNWHYVpw3m4WcIZYeG3P4LhUEggOeVwOmsasa5gW7+VmyEA8s+VIK5bm5SvHnZakMEMpx9B5Z9+eCDysfGUFKnQpVBkCHRNJafhQM41t7YGHvDZKAvZao=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6X1rO5yYi3HOzA/8C+8/VbSBOYXh9PkpcM/j6OFgBr1Zf8hBEkPWcj11z7SH9PCRpTZgQZvWgyt5Ck6486dcr3G3y5Z7UNxmC09cPynYiHAWCwdcp12g2sWIjSiyrJrVAz2XmEzBtCy7P7sqa2WPzPwfEIOMI5JqaLd0wJsDKbDo9VojEQ5yB+3bj3zs7SGT3Uoa8GldfiYw46+R9zt0u1Kf1h1hMx6kqCKcupZbtgK7WhPCKixi6nacnrzVnsRCTxVAQCsTJPaud2DV2TSNyUaI9++SrV1htc9W4Limn9/wZRDhxobsLbDY2ingP/ZOBrgI+TEgRg+KK24npyieu9DuSM+5m/dmbV+jPp5N9POCxSutwEoFxUFOOdcE76p150Sx0SRvtxj3Fmvs626JmMR5cq4N1wcaKwDmEdYehQdZdMQEOPPPYITOc9d4jafg0fOPjTG4iki0TfWTKNX/0Qg41/Xi5sQROX2bO8QcQ390A2qmk+tUHAcSU0ppD0YwTB5qGCK5rPeLZTAEQQAU3hBifoU6MwhVJ8Se63/aeOVke7j0WaYloVKLby3jypCuKE2twIli/uHI2f+8SAVSHZNLTfsh4gFWqwK8CHbZMHzQ</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KInAnqcXJOY1YJQqLL4krgxBusJxKUEqov6jXC6/jiWqzLPDtwSV1R7l3ic6tFwTA6pQjTUcWVcG6j4SaGYBE/9oAZFgmdL/oB+d8FohZ7cBOHNRxIJO2ahoYNR7azrgyck8qUdY7PzrfSOHaDqrCTVSo5pO1HJix5LJTHU6UCUu3yQtVYPbB/NVALG5909P2jxb9n3N2Aew0vNMAEWqqgUgTGCKUXDAy3nPqElwien9Ps55M7tIK9CW1eXUQDdOnyRP64OCTBXf1UCBiL9gf41afCliPwXJconEr/Mesh/3CWdMh0zWPTyhjRxhiV1QZRWpCDf/WnlfQcY7USiUGuq9pe/6/fk10rLIm52cgCO784UwGLiUCsTTW63HayYm5MKFCPImOJinlRTPtQmsMWZHxwST9YM1SQRznBKFs2j4C6SmYnWHi2Ywzn+icM3WWUkO6VBZInOAeSnP1MJpVo=</encrypted>]]>
      </text>
    </command>
  </commands>
</dir>