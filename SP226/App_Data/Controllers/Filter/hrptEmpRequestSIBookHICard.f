<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="dot" type="Decimal" dataFormatString="#0" allowNulls="false" clientDefault="Default" defaultValue="1">
      <header v="Đợt" e="Time"></header>
      <items style="Numeric"/>
    </field>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Tháng" e="Month"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_khai" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày khai" e="Report Date"></header>
    </field>
    <field name="mau_bc" clientDefault="10" external="true">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 10, 60, 100, 100, 130"/>
      <item value="110: [dot].Label, [dot]"/>
      <item value="110: [ky].Label, [ky]"/>
      <item value="110: [nam].Label, [nam]"/>
      <item value="1100100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1100: [ngay_khai].Label, [ngay_khai]"/>
      <item value="110000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfw2Wf/wU9/pTcPjHhVI7zBJrPK5zmcoF64TB1JlpqdvhP3Eeed+Pokur8B3mAdEhzs8j9YkXYGQ00KcsusJtdnSJlEgFQJNeuz6OX9caj/g938bQkqTQNaj2PDVfsRyxsNQ+NaFHxDazT+mMIoDJDBbUaETI1Lywg2JC1phX6+PZxTQJSngDB2h/IzF6cJqzvx3JrFEbmtPrbVDw1vmynlSTynd/6HwgCMCUhwgE1z1jpHo8JGQWCJMm665OsCv+TsCRqwirs6FO6qJp72pY7QDN3Q+5IQYmW93MaW755sPnSGY0+AyN58Mg7KrQX3Br8Qv+Bsch8bS+8dX3sM4YtG8=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm4+CrMQwd9loC6zJGaHx3fsAG13KU4kW4qF1977fQGxN+y4A3CN9IkX7pqUo+7A5++9Z+IuMLJwtwo2yQxBeNUuz+8jIK/j6eLzepm6Y9xvkO25/RpOQ3GaSwyT6aFVmPbZ+0OeEoKa/nyBmS5tY44A4iibvbbMAToH829FlVKzrLtD64gJcSQ1neY8t4IGxnA6rzhD+GLYgiFQtatzfIDvgoEwdArFmA3jvs+qhHzQB6J1L51UFR4nt4z5UJakvDPusmFZUPrE3dHSINdURoQfdzOAg/pAPctStedgesFP/7EYXtPSrss7ft6D79lPpmvDLJsXAUBza+PyKOLByCUZIxfWyxWqLSYYxPGSVFrmcQB7C6QmSLNangVtlLwWbFaU3EwlBGbzBkUqWvVw3dFwuRQSNByXlt0yBzLAknYZN5VG+yeUmo/o/3ljZMRrEfp+4HxB9ioQ+iVKsytDxRYrddwPdyI71fFxkogjGZfJwqUi7kROLQS+PLtJQGSWW4X7XvZlYSzl3XJQHvSxigVru</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>