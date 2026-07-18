<?xml version="1.0" encoding="utf-8"?>

<dir table="hrctloaikt" code="stt_rec, ky, nam" order="stt_rec, ky, nam" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>

  <fields>
    <field name="ky" isPrimaryKey="true" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" isPrimaryKey="true" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY1hhyR1cCxbTpYE36KRQ1A1uaLE2SN10BBzUZv4sKGJoXwHI1uRegr+wVyWWWdVVXTJ22hFlRofQ12fFrPEb2o=</encrypted>]]></clientScript>
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
      <item value="11: [ky].Label, [ky]"/>
      <item value="11--1: [nam].Label, [nam], [bp_ref]"/>
      <item value="11010: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11010: [ma_nv].Label, [ma_nv], [ten_nv]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6eY49RHeGAbpnleV6V3x8cAs1wRsAKfqD1+/GaDBSnp1QH0GafH39na2ot2nQ0OMP6CClgf39BVOimBFxSexrD8J54haCSsjsZZnCZhCsIdGVuBL18rmZ91Iv1A+AID98DCcNvI2MSh/ZIez2WSvz32sZndQuDO4uZi5btXVzLallJTGkQ6XBFl7lY3CybQNlpc2ld6HtXDLsR/wfhdDAHewPfyRXjKTwI2uwB5FxqqnVRSXsn0HJDbhZ2MyWOcAQg==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7pzHFhXaFflgm5c+NyaPONH5UWT2/v4DfSW/SByIquO/QZJS9DPMTolt3qwFZRrPBD0uftycmSu3G0NIu7Auj2Q4frEAzLuMStVR5okADr6</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XHr/yZgO9BS8mxonQy//dUuUJDs3WZqAkpuzR+spFjnNSnT9rTbf9nJ80K6e5G6Tg+gucnn+rmlFLdiypqv/3tn0vxfpOy7pYmHwHxmISFfWEKdjvp9tEfqA7Ip8Oe4Al8STkwWWGthSFkjvfIiEwo3ds1X8XK4UNr2eVDovOLqE14ZR65JqVqraAtIh6taxzoCFY7/c0fnEX/gFQ0NMlW0XJMjEjhhAjA0I/szFl2qBHsyYnRD2LxD4FLMYaHlfYH04ewVoTtPO6f+1hDrVklNIZ9aQwB45tBbOsHN/GAYayBytAgmC6/CFz+zRSIkFNNufCOmM426bnzciUHKw8PU9x3JpFmspKnbPoR60pdyHkGXj2B8sbQmBcDZxeY1E/o2MaYV0hIACsyh2qXI0a/4yG46BwzD2p7Egk3+xAkkifsiFDSS5PCF/sk9+YBNMoNzekRE+FH9Wx0kkFSke3zmJMYuRdS5xdlYPEuDVatYlGr0ecNAJWApUExJOZq3Uw==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70IELUNRoRrcP93iqKrgkwDDznSsE+ePKFC+SacrGXTeamCm9K4Z8wh+mpkiupWpuUwFBiSrXV/jJ+uta3Gx636vg3uw3U5+/Sh1tQcHzdjpqtjw5G++tRViMbcNHLiL1/X801/Y41cpuHO3lK+opbx5eyd93mG4KsZoPVQrSURXWZnFRy+YX/ZEgnL70EcCs7BpHYwT1I+iOx6lJnumZXwDVjM29wrGK1sE0nFkTgAa+nMbKg5bmpKPs6ROrjVQsgq91CdwExBSjjn267CdspWLzkEFNpJWtIeQ0Up6ASGwXt/YHqhl3hzxmpY7ssJ7lQ1LQqYQNL85vV8U0y14Cxc3al4RGXLlj7Zn5M1lkYwBFR+jnAZJy8nLSCcoKwyC0hHrFmgvcZfBS9x4YWlJdeH0=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70GCYx7S/VJHxGKXDPD7ojwIvWfSugXj8T30lbQm9Q6pDJQ2ogMWT25vXH+JMI8CCsr4SAJknceaU/k1fgS0+/9kULM17mVlz4ZHpb8uwYSSV9a9HryldQC96av2KMBn2kIZoNrlBpGzWWBdP+nQhNwNf/BXKLnIGmhC7lOxB0QBG+oiEcXLJLxhczVcK2W51VpDecpIF98nBh3FurC6ul0Lf7g8IL1OOIedQFP/OahQMPyLGnTg1pei0gtGxJq76RQ6PXlP1f8zzb3pX0DFhJIuzIWcxrueQNR0dHzwUGBwNmzsuzQgeKOr8qELx8Cy8iX5/Co+xsq3CV8INPT5KBixawhTUQ8LkB3roN/4pDkEzM2LJI+tLlrbDKI1urJrfRMUo8iRBA5iEHHTSM+Nx5ZV2U0QOnM+DKSsBURVfjjWa0PX7mNblpGnvRhbKK9G2qPD/q+7smps8oJLM3sguddgUbT8qINeM0jzobP45Kh1yFd19Lz08jgZtqLllquWNBwm8BzB+o/hXVncrUZaFsnMrFc8srbMTAbJLkIIxMLaTepKOMb82RTeCT0z6RG9jnt8y3PkFdynpdcsAWTGpxxeb4zZbMwaWFudIRQ/O7l7z1DlQecT2mtWprBtclID6ZBSVvVG2Z00XYx/v+lwaVVcGHBwiatwITNlz3XxzzBqyRI5kMXJcuBzliUuUIX+uF5Nq/V4KkYrGEm3Ynyq5FtkMSX8TPxQmGhVdFrygLbhn0tS3HdNLLZ3XlZblucQL5NtFPvE6oENKVI0VUyp1gbIQdQzTuMSQM4AKS5q3sfChJKhD+9QwmGeqGOGVp84luXHcmI77VhaEywRrKvccttdCXiKmKGK5NNr0VBPmGpFK</encrypted>]]>
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