<?xml version="1.0" encoding="utf-8"?>

<dir table="vhrphepdd" code="stt_rec, ngay_bd" order="stt_rec, ngay_bd" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>

  <fields>
    <field name="tu_ngay" type="DateTime" allowNulls="false" dataFormatString="@datetimeFormat" align="left" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" allowNulls="false" dataFormatString="@datetimeFormat" align="left" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZXjX9QFIDwQJWHpukRHTHR5CJs1pLkbrQdlBq2e+PbZV9Te3c3jmYnSuckypoZoWdHtNEZky3/LZBT0XRAAd7QLSad8f0verJ9MXjkUPHUP6</encrypted>]]></clientScript>
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
    <field name="status" dataFormatString="0, 1, *" clientDefault="*" align="right">
      <header v="Trạng thái" e="Status"/>
      <footer v="1 - Đã chuyển, 0 - Chờ chuyển, * - Tất cả" e="1 - Updated, 0 - Pending, * - All"></footer>
      <items style="Mask"/>
    </field>
    <field name="bp_ref" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="110: [tu_ngay].Label, [tu_ngay]"/>
      <item value="110-1: [den_ngay].Label, [den_ngay], [bp_ref]"/>
      <item value="11010: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11010: [ma_nv].Label, [ma_nv], [ten_nv]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwzzpOvLOcLi2SQAgK5YknZpfJG1WNXdUSXX0mlny1bihN2wQJOtcsxIr7kOboSN1DVn1sSSwzEQFB52EKk6UPB+UdKDRmMpMacjyB2kQp7T</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwgxghPChBwpWV4ajSw+JyhcyXqpb4bsJ1voRrJXBFHNFkGGsikF72euyawMLaEd6/V5C6VEBMSMbGE/daUSI2NzOb3eM2cMbhHmUEMg/8NG</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D8gsCyrwe8q0mepelHgZtPKXyd9nnAaQ/kbJMcjyIo7FtWmTzP0lS3I4+lp4oNABrIVSPl8HAdMineItYw1+56MzGO5OkTmw9FeFt4iDbekihhvsXqbBGkXP53wZSiqsZDP7BPqs2SnicajZtOhKn9JzH2P+QiqPDUtVk+0e2fN2p6NMaWePrFvWCyWAYH+K4esMHJbbXlfWepHy0/MlnRq2sDO2WB3hU/hBP7r3rcr8NJdITyEryVKyn2alhv7+TH1DHNv4uVYC9m5taUYZSMuhTx2VLA1nHbFY8BF+dBdCjwW1QyUOUMgoeO9MTas75oCgH166uPx7+DHnzgk0tDFFaEJqAxmFE16u2DJw0BvLtF/Joiabasr3pFCI6H8HfFRtAmkWW5wldOjVOZ/LX1ZkrBJmypXno1EXWta/3BkpNQ3vZDCzvHyMjMJxCb9SuaAM0nz99tLA42KbgW819vEYS0us5XGR4SJ1KKiRbIdQG6HZRbG/CDzuZz47ffDQYyxedK/UzLR+kVwkxw7nFVsCZciEh32vcrM0BvARYc2mBQXAx+YdgF2KcD20d9u7Af/r/ch4NdH9FkFTDLmfjDiARgFN3hwh/Gut2bidamAlr8SudQBy8Fp+Anxt3i1eHDofvzoVMIdfhTNzjOqwB5FShhRalYaopX8fWRZN42IuWvq0IsXtZNtvl6fLYeEI7imJcovnPqbvIUjhLGN+dDkzcHbG5apRf5NLQ72cBuj2csKlvEqEYdLOGX+Dp4av+7Y9RyaP71ohNPV3/+1PGM=</encrypted>]]>
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