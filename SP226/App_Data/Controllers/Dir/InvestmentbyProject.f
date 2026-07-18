<?xml version="1.0" encoding="utf-8"?>

<dir table="dtmaubc" code="ma_dt" order="ma_dt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="tham số" e="Parameter"></title>
  <fields>
    <field name="ma_dt" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="xl">
      <header v="Xây lắp" e="Construct"></header>
    </field>
    <field name="tb">
      <header v="Thiết bị" e="Device"></header>
    </field>
    <field name="cp_bt">
      <header v="Chi phí bồi thường" e="Compensation Exp"></header>
    </field>
    <field name="cp_ql">
      <header v="Chi phí quản lý dự án" e="PMU Exp"></header>
    </field>
    <field name="cp_tv">
      <header v="Chi phí tư vấn" e="Consultant Exp"></header>
    </field>
    <field name="khac">
      <header v="Chi phí khác" e="Other Exp"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 430, 0"/>
      <item value="111: [xl].Label, [xl], [ma_dt]"/>
      <item value="11-: [tb].Label, [tb]"/>
      <item value="11-: [cp_bt].Label, [cp_bt]"/>
      <item value="11-: [cp_ql].Label, [cp_ql]"/>
      <item value="11-: [cp_tv].Label, [cp_tv]"/>
      <item value="11-: [khac].Label, [khac]"/>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Np0sFOmsenpE70+PvVmSSro03SjoXPOumnRKSPutRyA1y0NnMaZVGhUe0KYApU5J/HonGEI+hTGpmf5mbnGDbFpmxN4C8tBzgLjInRrUa9h6FFSaZ77l3Lr8LwsO+fVQnmSCzdwNuD9qu86KvpzoF2Ui+48/pDJjMTTt07Ed0NA/CbWOCajN8ZRoHTF4w13rj9j54CmKp1nOvefrcd46b36WhrenRkydwOZVObWIw62sChDLlQ0mrBp3TRdrVh1ldw45ZYu2Pux8sDkHSH78js=</encrypted>]]>
    </text>
  </script>
</dir>