<?xml version="1.0" encoding="utf-8"?>

<dir table="hrvaora$000000" code="stt_rec, thoi_gian" order="c$" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>

  <fields>
    <field name="tu_ngay" type="DateTime" allowNulls="false" dataFormatString="@datetimeFormat" align="left" aliasName="fromDate" defaultValue="newDate()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" allowNulls="false" dataFormatString="@datetimeFormat" align="left" aliasName="toDate" defaultValue="newDate()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZc/Yx3uLho2JIRa42jQsoiYojULwRHr16sSY+gaj79Huu5rQioYMcjS38hYYA3y8lLNp3dTd6sjEN1F9GVy6dBc=</encrypted>]]></clientScript>
    </field>
    <field name="ten_bp%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" onDemand="true">
      <header v="Nhân viên" e="Employee"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten_nv" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))"/>
    </field>
    <field name="ten_nv" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="bp_ref" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 230"/>
      <item value="110: [tu_ngay].Label, [tu_ngay]"/>
      <item value="110-1: [den_ngay].Label, [den_ngay], [bp_ref]"/>
      <item value="11010: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11010: [ma_nv].Label, [ma_nv], [ten_nv]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6TkFfbm+hKnQy3Pyn4h91TZ5fuPen+zVRfYcwLd4Vg79/LcqQm1CK+I8FMuhYZ/7P5KKJN6MAIRze6zFSvqSNmhHcrzOK6BAq5bU0+xHnO1iGZVkDbID6fj4E2hzwobgpyILMZSIJpoBuQ7KRVwpzqbq4Gbh/EgAY/EmvrtgkfoZuvByDd8h+6nylyyavz9W0QDZ5545iGrYd3XNBXIByyY=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf8vJtHy7MqOAGFFnyKAAnqAbcafAGSZO+cN+LcSNGacaMjbWKXUusGG9hofaf+M1s6GB2ySBHXLatFwjyZuvkrrPJcuPDO93bBLSNMkBWb9j</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KbU7GvH784Li6EOQWp3AE2u4q0LLd15HviImSHMpRU+ows81HxNmYA4jS2bHb5XoyVGYUvdV4fW8dFdxcJL6FJweN2G2hWd2kR7MnBX7Mu5k28PAK2XtjzAMwGIopRXOubuxDMrNLD680nTI098ey7h/ULKqxPqbwOQ4YIqeAnfyBCDxFgc3/ZrUkWidl/OA/KgV+ev4VPHT8saRl3W4U96nuhDY+P6WpBmMdoDQDsOn2jCjrLQzIoTGtFyQBTCwB3IDrT3qeQs3aR3W2Tc4VnbZKeKHB1L5bTTEBsPan/JwR6xq+XmGtOOGCffiB0zwOXoWQmsoTZq4efPXA/RYGk3y7DMfc5FcLhEiNJ7WCNijRKIq8Ag0K5zq6kh52faawkC5aPiHIm+7YsdbLVBAbZq7Fncl59ucaW61HNVAGJdfcR1aCTVP92+aY4/IDB2g2DGopGDQxTUO6mg+xmSNvaK/xPAkgX+b4R2y1LwJlGvFFf7tmLlXok+1LYlmA4LWKQWJ4Gztb1qRcPLgwYF/6lHIwI8qwAz0VlFVneJuBLZGv84Vo4oQZ/3TAlx47wKzQOVtG1z9DxhylNEfl93ironkb8FVG8fVrtPsz+41r8PBG/1GSoHIPMeOiqrpupkrAnUVRZBpf8j9BwLkjVWEou2lMGJmoosYEXypg2yxJhJWjnQ5sp2+aRrvTRRB9uUP5zM3aKH3BL6/guwu7LE4HdAEL+nDkaF2l/PmIs5ydJymL2xZmsCsmEtsO8cWpAqw4Mecmwf+gy+BIK+AH8yJnKp27IT4LOMN1PVocqh4ZOfRqJMfchwxTsFU/laqkvVmjKCcXFcF+8Hm74R/BcaTvry0h1Mn/l3VJVr5tpgsh8xuIF/WN+pQ5nZkQb8hxWlfObBgub/wOzoS2OiIQ5Tj8C4E2gpMtFPG1Jb3vjIb8E0</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Reference">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6RvkanJ8hkyOGyGRkPgHEvyFtcJCp+0PrKgvTE7w6QvKECUowinoHqh+NUOEJMcVJyCQ2WF9ZkQ06w0aln9BLucVhrivSK69UILS+LUWfXRJ1UgJinZPwwgVFAKSVqtnI/mlZg4+Va3dpfnTBuQLPf8=</encrypted>]]>
      </text>
    </action>
  </response>
</dir>