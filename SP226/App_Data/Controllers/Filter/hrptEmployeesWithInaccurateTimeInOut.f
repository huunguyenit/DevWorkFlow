<?xml version="1.0" encoding="utf-8" ?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten_bp%l" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="182">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4WCsoVLAB1BbZJJ2Q3hfXpRcGqDFcYJxaFr0aua9hI+3IfQpNKU9F6wW0bEwSyegk37u29PCiQ2Rmqhw69xMEWSF9hHAjK742+R2kUw7jn401U772uSsnU9lONYMYSYrRRGanyJZqWk1E3I8y+K+NcsWnsLxqeXgw8HVnOMohXd</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBb2AweetwuRSjNIt/RVItfnwj8KETZUspDystuKQRyhTh86bwcTpQag/xXBgmMcjIp6PvgqEXudtm/PtmqEMpB5UC0FBX55mAmI5/ISTWc01OaYo8thuThgbqnk90yWlE+DHkd2YNZPSy9ueJ2FmQsXuPVXB5KCWTA5rbP4OhF80equxn5UWkFrTtkzUfymIFrmxp3tK1/qIi/4qgR+x2+UHAoBqvQTGlE1obmj+1P69cXUlHSPQkpCt/JxRRyzbpZPOgDx1U1hBVAXxdcsxxJRl0cPyXanX/RYQPYrZ0ln/tIroSkkQSIg+gD1r35gR4pi+fJCC5pkvopP8fPk44fQhCIFZWqNR4zxO0Q8XQT7/QunxKKO//dsd6NEmc/N9lXzGw4WKXcgja6CK8SBx2y4</encrypted>]]>
    </text>
  </script>

</dir>