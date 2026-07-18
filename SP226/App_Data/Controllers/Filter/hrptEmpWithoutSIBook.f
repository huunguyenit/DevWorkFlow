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
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày vào cty từ" e="Join Date from"></header>
      <footer v="Ngày vào cty từ/đến" e="Join Date from/to"></footer>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày vào cty đến" e="Join Date to"></header>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="vtr_cv" onDemand="true">
      <header v="Vị trí công việc" e="Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr_cv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vtr_cv%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="bac_ql" onDemand="true">
      <header v="Bậc quản lý" e="Job Grade"></header>
      <items style="AutoComplete" controller="hrManagerLevel" reference="ten_bac_ql%l" key="status = '1'" check="1 = 1">
      </items>
    </field>
    <field name="ten_bac_ql%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu sổ BHXH" e="SI-Book Form"/>
        </item>
        <item value="20">
          <text v="Mẫu sổ BHYT" e="HI-Card Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [date_from].Description, [date_from], [date_to]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [vtr_cv].Label, [vtr_cv], [ten_vtr_cv%l]"/>
      <item value="110100: [bac_ql].Label, [bac_ql], [ten_bac_ql%l]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7Cr9P7DZviRVm8tZVROSLUTdLbMFAUvxi4ylKczIMWtp5AbnmYqPEZUwPB/jOKI99U5axdAWqZ/SJf7sRKcavdSm/YjmPFDIX6vQb3Q6y2e+NuVfDTfOqWdmm8o7a36QB6xKcNbdnYJW1jKp9IBC4OldDA/PIOnYv19gQsqx3R7IVYy5cF9hqyiSHUbrslnjQpuQUQoCufyU5N4txvgeD0=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYBPjBKeM8/Qt3MheupAycbm2zTTGGEZMyjhaXuza8xtfaiGKURLz5WmHiPGdmDVBqHXKyYvlK2N5Katzu4hWYgNaJHJ61I5SR5Nq+N5+j45kU4xHh117x9DoFfYgmAvILebV9OJJMH8IujgtSn074DQmsLVq0b/KhIuBLTIMT3uBg643BMTn2YnMCz3iE5P8x7mhSFaE2yZKE6uxEbtcdIOBYUY22OdfC0hlHNgPssr6GeGSI5JAbFBx9yV0q6LcDVOvpbbJPTvTtbKv8QOPp3sSNMWg1biKb36JYWNoNzOjtBQ/yOKjWWcgZhOkXYfv4BGTTiG2926WzbJY8XHvm867JrPnEXkEXVkCuOnfWUcMMKLP1t+qzgeH25ALhWkraNRp54oRvHzAUyDs4eL+ead/EelkvHwlTTGRJoIEmcpv3VfM2+9HpLLDybfqClMDNI5nKVv6e7fNIU6m/ZG9AsV5aBEu0+BIaUCHxHQlknAHNN+knRKqM3rdV1aNLWaLTlwXAXzJfwacn3kaowcG2TnJVK3RQbCtCdn9Fc77BIg5IIgDvHvrUr+Q9t2mXTcFgqizYQopBjQ1UwGNfFD8T6Q==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>