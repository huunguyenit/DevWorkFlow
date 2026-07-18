<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmnx0" code="ma_nx" order="ma_nx" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin nhập xuất/lý do" e="Reason"></title>
  <fields>
    <field name="ma_nx" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã nhập xuất" e="Reason Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_nx" allowNulls="false">
      <header v="Tên nhập xuất" e="Description"></header>
    </field>
    <field name="ten_nx2" >
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="tk" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" new="Default" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="110: [ma_nx].Label, [ma_nx]"/>
      <item value="1100: [ten_nx].Label, [ten_nx]"/>
      <item value="1100: [ten_nx2].Label, [ten_nx2]"/>
      <item value="1101: [tk].Label, [tk],[ten_tk%l] "/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwdLmOPmzn35c3wS6YSDAPvJacukKPSlirxZZhNXwmPhzcQh5Z39EDdrpEW5QoF+XsE=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYYAOWfU/M92A67A/r7xTE7SbmMvYXQy5BpAd/4BSs93II8cZ2tzsRRCW/nseTTWI7Q=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DXeeCi+ES4uYv5Q4DQ/vZaWddXCI7PWaotKgYu9/5x3oPW/cdNvYTpnxJYnWRCkGs3LipiwHlWCFLCQa1S26QcouxuwCNSv9LJumkQ/bCl7eMADh6MEpPjMKvDc/4IoX8vknrBkGhInfjn2w1lV2pDaAmVqTQX9RjnJJnuQKhUcJaRKWmFm7LjXy2MXkU+mGbbstr9LlXAZmXLgz7kgHj7EAZcUNc5x0J6fNW+AGcUCoaQyF8Y2SpG105OJveMSodSYBnH7fFESU+IZWjChUn9DFIuQFDwfzSqKu++bOMzoOB+KSmk+tRNPMXhIHl86kCSgWCMCnXFgGiqW3skZq8YRF5ONKALNAfDYrffe/OrMkZ70V5EsKyzMRe3ogXM7wcStynXooLjK4sCl3bZOWoAjRSUnKE/jnW3gz4YH49oss86daEPNJTbX6OpCkftINh7XCen40BvaktOk1IBl2vic0xF3yCD4fMll3+C+p13tZYxBAmAd/PCFOClbb/yC+b0FBKTGC+wB0PSW7+31rsU55044hGp9xIeUYX5BuZ9d8=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n8gGOWkpgY+lGOuPrInJGPbI4kk1y04XqT0pF7SMCX2O7ZatWpb4UYT6nUSY1I+8IGxmpy/j1gk0Rkfa/qHG8uvKsYhAUnpwo5rXEg6Z7vjCJtItTRhUGTw8gHpR7Ka7s3pJnYgmzpMPtOEMmLFKc3G6JdJbpvBkrskuOhAFWuybSNiZNS6pAOGwm1lllfI6ELx4/g7QvfGDgOXtHm7Wfhy7Ov5BI73b9F3S5Ldq4dEI=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jdnGWtdzcWgl00U5VdDLIZu8q1kLISsqMV24aoDWJZQc26BgRMlJi37OfHEzAr+T5EOpyvjPceKXe9SjCdRsbXz74HGoF2MAyvr6DqWKThei5j/8aLtByImMbDwGc+g6dCHU1ZAbrSFxZHg3CZ/1wxQZRMgP7apBGCe14zbCx0GrvsOwfYwGJCrujeDIAkXUgN2l1xbCSkNTNN/JiKnweTKsg+TQ7dmO8+U8cEfQEitGW4vh6eAhpicrxvoH4VWsJW1HaEXn8nTAwGipGWOEZl/EkI5Gdjg9FhejghNg2UA0z6Km3N09Ik/+CA9ZaiH7d</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbelYbuu3IfbNl438SOp/eTEAK5idPbWDJfG3RS2uI26vL</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHaMIJOIdLApwJ5aUDBaYRCa8TKB7auek8Z09swsfSYjgbIIaOKnK1kG6zAUXWyTvgsNbfO+mTzcSRvZF2Sz4TiVB2Yo2pS65Ch69S/ZjKCXunqSIPJyEZY72pxMwulfdL5xljrbc2Pf058oPvV3jTRn5XTjhGSXXqe8NG9/HYGpQfmNCmNPj4/4DpknZRLN6/Q=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkZ5UgN2dhbC3tvidvWETSbGKmLuMKvkgYzUC3MPfZFQIzQ1uoasCzRDNQgtmm/YQKn44l0DQmxeoAIP5GyB9A+ySPUOjnmsMPEwuqskIQvdOk9AIzu19wlzizJS1wjHKtBZhmeiuncmNHChJZtxsaRoo6lOMA9qCdvDHpDKsWwcV+mMV/xPCQs3uLNaolB3dBriKMOMB4Yyi+F6jLgZdX+dUOjjrRC5pNSN42P2L3i7QmHjJXEaZDv9LyivgBnOZeqtP9eZkgHaPX7RFNxq93Omd2agBLxOWcn73BjeBwjaINQe8ND4lJXjFxw3C44PnYg=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>