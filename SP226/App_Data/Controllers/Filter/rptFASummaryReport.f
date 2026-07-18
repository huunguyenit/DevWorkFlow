<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Kỳ" e="Period"></header>
      <footer v="Kỳ/năm" e="Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_loai">
      <header v="Loại tài sản" e="Asset Type"></header>
      <items style="AutoComplete" controller="FAType" reference="ten_loai%l" key="status = '1'">
      </items>
    </field>
    <field name="ten_loai%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_bp" categoryIndex="1">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
      <items style="AutoComplete" controller="FADepartment" reference="ten_bp%l" key="status = '1'">
      </items>
    </field>
    <field name="ten_bp%l" external="true" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nhom_1" categoryIndex="1">
      <header v="Nhóm tài sản 1" e="Asset Group 1"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh_1%l" key="status = '1' and loai_nh = 1" check="loai_nh = 1"></items>
    </field>
    <field name="ten_nh_1%l" external="true" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nhom_2" categoryIndex="1">
      <header v="Nhóm tài sản 2" e="Asset Group 2"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh_2%l" key="status = '1' and loai_nh = 2" check="loai_nh = 2"></items>
    </field>
    <field name="ten_nh_2%l" external="true" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nhom_3" categoryIndex="1">
      <header v="Nhóm tài sản 3" e="Asset Group 3"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh_3%l" key="status = '1' and loai_nh = 3" check="loai_nh = 3"></items>
    </field>
    <field name="ten_nh_3%l" external="true" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" categoryIndex="1">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="dRptOpt" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="100" categoryIndex="9">
      <header v="" e=""></header>
      <label v="" e=""></label >
      <items style="Grid" controller="rptFASummaryReportFilter" row="1"/>
    </field>
    <field name="sRptOpt" readOnly="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="161" anchor="5">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="111--: [ky].Description, [ky], [nam]"/>
      <item value="11001000: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>

      <item value="111000: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="111000: [nhom_1].Label, [nhom_1], [ten_nh_1%l]"/>
      <item value="111000: [nhom_2].Label, [nhom_2], [ten_nh_2%l]"/>
      <item value="111000: [nhom_3].Label, [nhom_3], [ten_nh_3%l]"/>
      <item value="1100: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="1100: [mau_bc].Label, [mau_bc]"/>

      <item value="11: [dRptOpt], [sRptOpt]"/>

      <categories>
        <category index="1" columns="120, 100, 100, 100, 130" anchor="5">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="9" columns="569, 0" anchor="1">
          <header v="Thứ tự sắp xếp" e="Order"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9Ge+QSms2Uij978RkGV9TkNl+Yk8p/fu+QW8/rB88UC9H2wWwF2oUeoE3pfXMsbxYEteJszMdocl2PebV17j4pWMu2Z4ZF2LIQpN6TASmG86hexNcWi/EAxhepPopollL7ftVHfyTDRgCN6uzopE6iXNLY32MKJitU9VzQFJ+/0rW/Sx2XTfDmzqdBsvpwRqUBZ75au/2v5wuO7j1wvpqwGhvIU+3PHGaB7d0ZpmivnJIK+iSssg0uij7kl+h/GEivk4odoXquxAaxPJ7+oj/96vHqcIig05s5l8gS86VstxktFUgxAkr5tw0b2CE4LX2UsHUMi34wBUCiKWI3nbyxfMC2m6k9Jx3SjO/AqrR3NJojO1B8mM2ztDSBEKWV9SU5Y+iOJUAp98F0Gg398h0vba8Rpy1kDXcOv0ekFNDGUvyVbdTH7w7xYTexAGt2Sywm5rjq68ijenay7NA1cp38MgT46J2gcNpQ82XKw3KhINFvy0xbNteMdIj2/hT7xiA==</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&WPtHMc/lwMkgyh0YDcT6A6HJvd9+uJ8hZbXUSQRSTNT3fvGHzCBEIlKMgKSeN08D</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdJz4tVezh/v2g++gkBwyO+U842/oijbpwGPVMXqJGiJyrR6PdEUCd9mvrnxdf02JKkj8IY4kkxnpH/vfOg67QTPjC/Xg62RbR4gqYzSWYNr7ZFjpuzOdaEmWFWg6PqSPX/5Hu80hQiFzIolIJuUJzx8rf4r1KwZVwO3OIDt7X1P6OkqdZT3qcgxnxPYvi2wc0iV/++yXlafcN94BRkbWoDo00EpwzKEhGEw0tCtjJ24/4pjxfm9V0EAKLCyf46g/6da/dnaxb6poo5xvShQPtgT4+XzdUSzOijkkTyb6+wQLu1VtF6sg504M2Rm7rjueveo+x0lRR+r/0k5gFuZt4eSdJmQQnw6Pv1uHPkwtidCtC5Y/oRuCVFTWGPBJVef8wBtXlGilHlXAeT95QGC2RLlmvTdaEc1bowGjoKbrbdjfC61h5DFLoQZVseG/XcQI9FzE4gD17R//nh0LEe4m/Nrbvb5qiGVZiNZQH+EDvs7LgLfM06oeV+3ilwckO+RBdpOlC6bP+eoiJ3k64IZVHiq2npTETqGwwRrLOtornqKx7nVNqkPsvpuJSBjE0pGhDrWd0HvlQs2wltgJa1lTCxF8gR+qipyVo+i2BRxrP+q5d3NqkX5MjAFqBNqYCj5UEWc/56l6MHq1mqMbFZpKt2o/jIjSMcbXNL5rwrOoNxA1NJ3eyMEwPxApEc0tlHjVA7aFL4zEctO9Yq56s6zK7pplopeTrij+J/+T643AYjVfTmsFmrC+6BdrgTQLEsE3DrfYL1+sszZPFDhbTxSSj8U3yFU+b9yCKaJj9Fmzj3mah0VvsCNUWsXQ625jqfSbD6f+araS3WpJ0CfSL3+ZUQ8f0POCH6OyWRl/oQZL/ejdFu/1F7nM3d8CM388nZyl8nwwOfR1EyNfs6WdD5qmU3kQs2fCwwQ0jJ6QiljOaFcF71kTEwcLTauKc7dQKWxePkA68ILttJt5dABBObDZcwqpV5iN4fQRasuQ3HS+WHzlS3+pvvSaj2G++Idig0Al5gBk8yTrnQgWQsLWHB9GZegR9mpD1F0HwB9851Mffv1q1IyYAQie9B7qw4J01V+mVCpeD8+YedBA+g70rEguXx/AnefnTcPjY7cd8045geGVhEH01cV19lEpzIx1hRC5eO+GV+cLKF4SKahjQHuNvCNEB5U/EN1RKwPTNY0P0D9JXgA37VxtJ3yTUJc28fFqD4ogY4bxp3+x0hqdpVH6P1N49y5m0idOO8tWskJMktQf+4L+gF9/rfTkiKZMqUUxtu4eiaeQ+9Zx6O5I1GP7eE0=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>