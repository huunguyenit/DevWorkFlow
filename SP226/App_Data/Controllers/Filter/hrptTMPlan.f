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
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày học từ" e="Training Date from"></header>
      <footer v="Ngày học từ/đến" e="Training Date from/to"></footer>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày học đến" e="Training Date to"></header>
    </field>

    <field name="ma_khoa">
      <header v="Khóa học" e="Course"></header>
      <items style="AutoComplete" controller="hrTMCourseInformation" reference="ten_khoa%l" key="1=1" check="1=1"/>
    </field>
    <field name="ten_khoa%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_mh">
      <header v="Môn học" e="Subject"></header>
      <items style="AutoComplete" controller="hrTMSubjectList" reference="ten_mh%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_mh%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvdt">
      <header v="Đơn vị đào tạo" e="Training Provider"></header>
      <items style="AutoComplete" controller="hrTMProvider" reference="ten_dvdt%l" key="status='1'" check="1=1"/>
    </field>
    <field name="ten_dvdt%l" external="true" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="loai_hinh_dt">
      <header v="Loại hình đào tạo" e="Training Type"/>
      <items style="AutoComplete" controller="hrTMTypeList" reference="ten_loai%l" key="status='1'" check="1=1"/>
    </field>
    <field name="ten_loai%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="trang_thai" dataFormatString="1, 2, 3, 4, *" clientDefault="1" align="right">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Kế hoạch, 2 - Đang thực hiện, 3 - Hoàn thành, 4 - Hủy, * - Tất cả" e="1 - Planned, 2 - Opening, 3 - Completed, 4 - Cancelled, * - Show all"></footer>
      <items style="Mask"/>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1 "/>
    </field>

    <field name="mau_bc" clientDefault="10">
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
    <view id="Dir" height="64">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [date_from].Description, [date_from], [date_to]"/>
      <item value="110100: [ma_khoa].Label, [ma_khoa], [ten_khoa%l]"/>
      <item value="110100: [ma_mh].Label, [ma_mh], [ten_mh%l]"/>
      <item value="110100: [ma_dvdt].Label, [ma_dvdt], [ten_dvdt%l]"/>
      <item value="110100: [loai_hinh_dt].Label, [loai_hinh_dt], [ten_loai%l]"/>
      <item value="111000: [trang_thai].Label, [trang_thai], [trang_thai].Description"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7Cr9P7DZviRVm8tZVROSLVcHdXfoW+RyynkxrX71SyGHQ9pFYVD+/jt3M0akRYmXwGXVZwz5PjzsLM1/cOIhA5LzPgD1KAj88B27SjUkIVN8MEL4fsVqVu6GqIGxEe0AgvoJvY7BwErv4qIwqkYA5qB8AOmgskPV61PG4mt59rP</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYBPjBKeM8/Qt3MheupAycbm2zTTGGEZMyjhaXuza8xtcz3ul9SFOsGjkqayHsCE2vmHkqABQ34uK1dzPJedUfakUok4ENcLiEw52J/aEimqXBHbMMDNbzK3b1Y4XqMoXiyXYfDrdbnbaJ6lEjnb8VUH9wyJouFTWn2jAj/D6/+BC4T540Y7LD0uex8LVOnjzlrF8KLqtLh65GasygQqd/tSCJvfS147b9Pc0Lh+fxLUGCbc7cbuDIuBIccpeYurpl74xc5WNBzNv06DOEv7TjHMUNnrMSqykTrMXB45AydD0GDTkB3l9CJXBaQdjJB1SRHNvXBLLcvhPaSepAlCYXe6yGZq/SSaSKCsMydKCbobB0VQb2nPZRrhec+NBGvfNmhvift7Y6bWESpccr9+A0E6V0V3qL+EOolkZw6Q1ZBZMFwZ0UTQOJXb9HdiMnBM5E</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>