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
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày yêu cầu từ" e="Request Date from"></header>
      <footer v="Ngày yêu cầu từ/đến" e="Request Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày yêu cầu đến" e="Request Date to"></header>
    </field>
    <field name="so_ct" align="right" allowNulls="false">
      <header v="Số yêu cầu" e="Request No."></header>
      <items style="AutoComplete" controller="StocktakingRequisition" key="ngay_ct between @d1 and @d2" check="ngay_ct between @d1 and @d2"/>
    </field>
    <field name="ma_kho">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt">
      <header v="Nhóm vật tư" e="Item Group"/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="nh_vt2">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="nh_vt3">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>

    <field name="mau_bc">
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
      <item value="120, 100, 100, 100, 130, 0"/>
      <item value="111---: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="11: [so_ct].Label, [so_ct]"/>
      <item value="11100-: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="1111--: [nh_vt].Label, [nh_vt], [nh_vt2], [nh_vt3]"/>
      <item value="1100--: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>


  <commands>
    <command event="Created">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJDT6tFmZ5Tw3Wql7/Go5yM4c90r5RJgwASZrjCtmVeoVAtzcJHJtb3EA8Iu/pZ8K5+frLaAHNCxtj3l9vDkXqHaWwv/DKn6K5+WQB0wg17HlNJy5ac0Py33K4H5jZLAbQ==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event ="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5B2ARh+M1OAT8p75lJ0BBgqhKM+ogaIyRRtI58CGHEr1Snd5Bji4JokE1QNM4naisRYZzUbrE99fhrZzD7R0gbihBWlqdybRz7r6ixCPcRN3bEb1Bt33sU5cBJijLlj/iHU5lsS+CMHa6zoNeYiB0M/czmJb24/tu+8k+44dAA6sDd4/w/Ck8D6CAHotGqPJ6x1izDV09U40q1jTOPz/OD06dnPMLoQqv9h1qz7onDEMWmTffHU6Ru/S/MINEzqY7aFbCwUDSs6UYmcju4aYRuddAwOezmXXosgSKDt+SEhr8gfIX49HWZw2cMRcSd9+Y86D4aWp6QGVJCmI76U9Qhu/wtn9D5KgSyzJhNmOk5+rDgIxp/QfqN0Vw1407XwQy37KaK7ydvMxe9qRITfU+jgccbIrm86pBsjcBFwgey+</Encrypted>]]>
      </text>
    </command>

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8KU3qC26YeKeL7edhfPrfpgZONKdU1UPWxvzyV+vn9pV8AMouFBAF6ZfFNjB8xB1ohB+NYLwmZGVZnGJWnlC/50S+BrB78lt71fgr6GMEpjV11xpL3lHq8ZrFEBllilJ25mN/gsCWepcYSTVTpNXyHBh12Xg8+A5q6ttluJtN/CfuaEWhlJb1dbHri5SvDzPzEbhhNVwhtOcAQ7hovj/Sbiym2IccM8Ntxl2ol8ImqOCVZbRYZLnS5G5AIp3EjUnqLROMh0teD43yMP5Aj8YSc=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtfqRSeZT8apZ7Zdv999zAT09cpcBqNglTQ/ufQFdhjsQZh/42HfnFou5WUyJgUDZqokVVijqza53SpEcCGfCy0EIeiZ/4BRG3i9Yavwi4gkBSQVDBxyGGffclVlU+dT2/+UCq7O6giCzFvG2jMMUUb6b/42xPTLxNILsIus3tgJvAIpqdZkiSjpz86YIm6Eonj0E2hk4UsIFoBK7WPXCTyktFiCgp+MdV33RS6ld5Jhl1I8LheDRQCFeU4m/NjlQ9t89VlKL0i3tWKtbN1QfaRr0whMLVmOQKhB3JGsHhYpwE5No6ZLur5YBZEPcon4Fi+HvqXF28lg1XuKLibJpNX4d4/mkuP1yiXUkwfgim+Xhj55vlAsiUU66Xc6OljKNfuo0a6vGlXI7tOGTIznra2KFrY6HXs3Zz55jotQQAA9pc8YTZ0MNPcHYCfj65df3z/ofsZ9IwUcPdvHo+0hts/atX9xnS8gBSG/WCIqeFslA5/bB7+k1r8FaDChLxPTPvGwBfSfnkbTPmWXkIqmYHgzcXidRp+idQC+rwSOOkyX/zAKCzmHjWFJhZP5trEDlpc5xCZN6Bypta6oosUtykBLopYsjzHkJvJNSv1SETg5tSLyN6JSvfvZwMkF0d4bY3OyujBFt02p6IgO5hBh/+ytjO5nDkXrKELr6c0TqAqCsdg4FC/q8X1qN9AAND6JrYiW3q9qgDQPqOpTrrTkFtC8=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>