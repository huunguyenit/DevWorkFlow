<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\Circular\A04195\ReportCircularTypeField.xml">

  <!ENTITY defaultTable "DTCPKHAC">
  <!ENTITY defaultForm "DTCPKHAC">

  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>

    <field name="ma_vv">
      <header v="Vụ việc" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status ='1'">
      </items>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="nhom_1">
      <header v="Nhóm vụ việc 1" e="Job Group 1"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nh_1%l" key="status ='1' and loai_nh = 1" check="loai_nh = 1"></items>
    </field>
    <field name="ten_nh_1%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_2">
      <header v="Nhóm vụ việc 2" e="Job Group 2"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nh_2%l" key="status ='1' and loai_nh = 2" check="loai_nh = 2"></items>
    </field>
    <field name="ten_nh_2%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_3">
      <header v="Nhóm vụ việc 3" e="Job Group 3"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nh_3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3"></items>
    </field>
    <field name="ten_nh_3%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>

    &ReportCircularTypeField;

    <field name="form" allowNulls="false">
      <header v="Chọn báo cáo" e="Select Report"></header>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="mau_bc">
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

    <field name="chitiet_yn" type="Boolean" external ="true" allowContain="true" clientDefault="true" defaultValue="true">
      <header v="" e=""></header>
      <footer v="Xem chi tiết vụ việc" e="View Detail"></footer>
      <items style="CheckBox"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 20, 40, 40, 100, 100, 130"/>
      <item value="11001--: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="1100100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>

      <item value="1100100: [nhom_1].Label, [nhom_1], [ten_nh_1%l]"/>
      <item value="1100100: [nhom_2].Label, [nhom_2], [ten_nh_2%l]"/>
      <item value="1100100: [nhom_3].Label, [nhom_3], [ten_nh_3%l]"/>

      <item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000-: [chon_tt].Label, [chon_tt]"/>
      <item value="110000-: [form].Label, [form]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>

      <item value="-110000: [chitiet_yn], [chitiet_yn].Description"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2jQihU+ZF1gJYdNPaJrPsDCzDTbAYjxedDUkYV9a1omgMm+cPs69mQwYzgY3h4nm01Vlkt0i7ZN4aRatfJtsDQn3rKtCc97AlUK5bm5uQIgRsqCwntXP0WJGnqD/KX1yf6jhaytSurzqZp3cYgi1qhMOR+RFr1RxqqMoDaJbXwmtryCQiXj0VNE6R7IHguYtAZj/MMQU6xtNpMs8dPekKp3JMGdTArcunRzLPCSJl6k</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR77vgMbfRI3e6BDGxfc5Ox9TJa7T4TsH/1P2o9YkLHpmcOiY5iE76Ty6x+rKi28LDzqfAa+89aJO608ZQZIYnZH6JPOLIJr75Ii71z7sZSd27uVwqIfcqTxdkJh5W27c+5VnxWD50aqtVX/Pv6MPJlptVGM6/IgfzAFrAjvmJA20WC6pmDEeh/j0i40IlAoUbCNlIIT72aMgv6Le8ewn+wysVcILc0V2oaIihBo+i+D9e</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDBaaV766j4XqVMPTsxBNLQTkrMbhmDd1bdnSzWA45DRIm45dznU0EMZflx7heSDgjPz7LrGhnIYFGUF8/LmTFISDZd9iBJ4de0POOp/Io9u6rmLMmomosei20LEea50+13zjHpZ/HzgP7wqGySD+xOFjdJJxKS3f/icMgRvi9yG</Encrypted>]]>&defaultTable;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFPOKDxIxkO6NBmx+5eHyKkAuqmyyE06Mjc6UG9xEm938w6VZpVGNDxqpEYbBBqmIaUqJbPftg9Mflbru9ReHrwQ=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUpTGGv1w+iiyPFOfxifCL8hdA7B08xnvwG/eJYId7vX6ss0KvCYRO2QGLSVwbRy0uiXuVeDocdX8U7RP7flMUf2du91JvTdkz8i1gJj67QS/ZNdCwJzWqdEdfm5znMjH1LxkXr+rJSW49WinTY/3SZrZ2vvUqPTri+2VfV6CpBeIhniyupB418GSazUlHzY2NJXGdbAYoAmU0Svw8lkq32KtHvEerBkp78Bi1hsv4KlZ4OOBgoHyCZV4Vik+Mq0diC5o8JjePqWCvPKiZZ+CXn9lGQoVL/5RCQa3OkLa/9XaXqTi4ZQ2QtjVKIMkd6qb+SqkhY4u9kWuMx1s+z/LyiM5eeaOYtF90P0hrzUmnuQN5o4H+lKadCJhdMcxil2Bxem7wJT1c7ATqTbUSxY0tyYoZEyEjqXNCsoDxLKpd1WOHqghhQNtSTkLPK1PeeUDZwjfd0o/COvUTbjJzEqncEv70rFXAGrflOP7r2FtvYY9c7Wd8x2zIDxYfXnGlKch2ZiJgptJgmWerFH18ZqA5pHEj041/VPRXXjJIkkMwvJvC0SJlYI/11cSMQ5/2nr+BjdyOubHNh0mHnAhO6Mu6fro3jw9m61TJ5wxsPwx4e85GNmekEjjwNdor6F7eMmkbM74szI3iWygzHWaVW2h7d9ZuUR7eeJFLEtzmq3klChG2tt/5nBa/bcc+t9UhTWfI0WRVrASIVrTkFpbOG5bEHGPLWnoZuQ+OGz3lkETeYurXVASp4PTkdqeeFAhaN5MyEwp1Hr6Lt5t/2PTGciYGSrLUtApFPrLdWDIIRxlf3ov4YrmKHndXSqsy7v5curD3</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>