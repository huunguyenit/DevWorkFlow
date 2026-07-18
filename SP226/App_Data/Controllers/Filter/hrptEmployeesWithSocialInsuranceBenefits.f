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
    <field name="dot" type="Decimal" dataFormatString="#0" clientDefault="Default" defaultValue="1" allowNulls="false">
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
    <field name="ma_nv" onDemand="true">
      <header v="Nhân viên" e="Employee"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri" onDemand="true">
      <header v="Vị trí công việc" e="Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vtr%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ds_loai_tc" onDemand="true">
      <header v="Ds loại trợ cấp BHXH" e="Benefit Types"></header>
      <items style="Lookup" controller="hrSIBenefitItemType" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" external="true">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="ngay_lap" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày lập báo cáo" e="Date Created"></header>
    </field>
    <field name="ma_tc" onDemand="true">
      <header v="Tham chiếu" e="Mapping Code"></header>
      <items style="AutoComplete" controller="hrStandardSICodeMapping" reference="ten_tc%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BP7re8o679oPhKFDDWoF5a1dwWQWi8TysDIUrCGMDD0ytKBJJ4feenylMQWMOEtnr3wSArvIw2pHNiQ6hAEep8=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_tc%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_tc" inactivate="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130, 0"/>
      <item value="11----: [dot].Label, [dot]"/>
      <item value="11----: [ky].Label, [ky]"/>
      <item value="11----: [nam].Label, [nam]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [ma_nv].Label, [ma_nv], [ten]"/>
      <item value="110100: [vi_tri].Label, [vi_tri], [ten_vtr%l]"/>
      <item value="110---: [ngay_lap].Label, [ngay_lap]"/>
      <item value="1101001: [ma_tc].Label, [ma_tc], [ten_tc%l], [loai_tc]"/>
      <item value="11000-: [ds_loai_tc].Label, [ds_loai_tc]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcO+IChw5X5LjJ88AjvwsErI7ySOxFTuTBKwhuAud32oUsQiSjqYBmhV45/T/U0cT3gG/+2pcWlhC8ICM71PQpQzgUayYHF2zAyoic8ZOZSckVUJflnZawPssaEBAVu/pNBqNuBn9budEhi/wWfmVOJIPp7XTRdVTgz/N1hUyKofgF6GXFY+dEaCq38nABCLh1PZvBnJ7OQhMyvpWIHK1ZEqJTcNeM82FPGnu+7PZjEyL04F5zLXQ2yoWRXlPc95F0dFO5a2iL1EbRF4eOwJNqdZLKHW+/gh8IEIFrsXGB97KqPTO9nDaj6xZDCmy/b6x9g==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdBirwQHi7tkqUAOMzr9GimZ3UfO6ZOxUJ5msCIlyw4GOePHITCaJJzcF6vcuE65N2yqB/lgxSbr22gsSkt1/aos56f0yb4NrMhb6Q5Fu3Ad5Q0nClyF6tJrLyTNXLVh8mH5uW/CCix4cHTSMTrqtsogZ02c1JjxuDO4O1JRcCopX//ivD+eLzvR6nj3W50cAI4zDh+VUZdAh1hbKrMiuc3FbxNqJIYKNRY07fRHyNc+bMHX4X/YOmCMi17rhX4xQqd0QyMZW6N5he8IgXNkQewOGAMykSaKd0eD3eWhD2IJtzFR2+RjiWtam4G2nCMKF4r2DOaHZyOFd8jL+Br1Yo+tCy0pJX4v9qDeilJA0iVe9jOX5qdzczTj2Tbpxa2oyY2fpsnoBzfFBs1IgLjY0MqyzIwyA8zmhX6riU9m/hIkzAMDDA/SrbGu2FDiM9lAT19OBXzIkRUzwfhZLu5AvUdmCjiYj/39grBH6Wu7TDFy5CJ9EGHnVKncN84W+ubLpFzVf0q3kn2UNK3Qn+rGjwQtr+5mJhjZzr+AKgws1VKmu+3Y2XI3Y6E+Vu+5EAr9xRd4JSj3YmoqXnoN/VncKxvn2fbznI+t9MQrdkjSg1+LLmkKI+VHKKQKSscw+VmKC3AqCTlQ3vmzr4evO88ZxvgCwsOpWch4jXJai4yZQPrHB</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="RefCode">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4IUe69VGqY41DHV3IhZ9Wfkn24S1IRzZ5Cc7YDe4I4+/HcjJ+5o/P4jWGHJz1aKnejgU0KAKeidNzmg8UtJmVOV1rvAdkQ95EB9R+O6Fb7Dw==</Encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>