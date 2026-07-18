<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="type" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Loại kiểm tra" e="Check type"/>
      <footer v="1 - Đầu kỳ, 2 - Cuối kỳ" e="1 - Begining, 2 - Closing"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <footer v="Chương trình kiểm tra" e="Checking by Program"></footer>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1=1"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 5, 70, 100, 100, 130, 0"/>
      <item value="1100: [ngay].Label, [ngay]"/>
      <item value="-11000: [type], [type].Description"/>
      <item value="110000: [ma_dvcs].Label, [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KumJQct0YUgCfFF/GYOr1bm/CbAYFhPr6ke+NbciJBk2APws69K9Mh7FRjnNz8pbs6nZJVYSomnwiCol/K4h9PFHS8BBokLGo6s8eImGAXIluCk3qaiaLWHzLP9tpzRMXA==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm4+Y6TIVGyvLgi9D0eJpQVfYE5U6EiS7MNd4dNFhPWKzfC/3jBdlD+DbyevRvD5aXsqcbOCeSx3pNqdZ46Rlw1dYjD9Wp13QbwO4RtsPyHzv9Hl1W3r34CxYdZLwya6ozvhRuENKMJppVX3BF+EKuzH4QoEC3xyPh6CXq9hbf2mUsjppe2s3M1xDybgthe2EOktRHoGuqyS9yIFt5rqzPG1svqNgfefPY2zaqs/you4mjuKxQeoJhybxcfI5/7COt5nspR6o+glacrHvDftx+wZChvERXmahaACywSg2BU/tSA/baCX3G26CkVmq7Dr5rdgBQX3pxJGIgT+IjRJSoHgB3S1w4MJpXMS9FIPz/qUxnUPNbR3bFmmSv9lTgxRf2Xc=</encrypted>]]>
    </text>
  </script>
</dir>