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
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
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
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 30, 40, 20, 80, 100, 90"/>
      <item value="1111: [ky].Label, [ky], [nam].Label, [nam]"/>
      <item value="1100000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="1100000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxTdmh3pO2U3ukAWOYUjELomyIpYsrb9vMI7tXCaT35MwIEPA2AIDpdYd7mngEtk9TScWnYLPdesIQA6juQFs5TRhW15neMy9zIhva5csvjvpnjU6/UO0k85TOiWgBAc5Q==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm4+SpeCuq5ic4WMUrthGm0QpG58M8j4M/exu0F3QaxJyg7CzRmOI1c+V537zDhYve3OXFwG5xwWvjBQ4DtKzh/wrZZVAQMji1QhgtWPWEk4BULRLJ5zp1tCsEdVKl0qSX+Mnx6fYMXeWscG14JMRT+ehHQhlc3M8WxOMLb+0aupNhCCKj5XH2PWu74nzXAA66PYzT/HuvG9B0sLuabR1j7l7c9gh9czvGOTrpZHbas17Pnf+E4/dJALmALBwTKenaiBLoFuzzdKr2TwE8N64PukXwdJCfJKu+j8CtXT38w8FuBIfTTBqvJhnsH7eqoUkEIeQZfInVMA1LrjDBTKfwO7tCg1id2deuvVpi4LXHuYBJPf3vCTaHGiosftkfldjVZ+G3iEeZ2naEnEGCwdzLFIqatimaCwWxszNrrOoJRyLGUITvou4l2OTxKsHDkeoYoNbHYlM4sJ1NupEmyEggljY/h3sdodG83dbNDYL4JG/nLirW4OgV+04gh8pDtBt0qjCuciMV86IfapoTeZNCguqxdN1F5+sRwfHV9UuKb2Es1yO0cfNZ7sWzW+hj9caid0nrsVsuh47bHyFPFDjcXAvcfIOGVYyjV7NXeZOqpSn4w==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>