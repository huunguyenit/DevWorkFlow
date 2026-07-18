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
    <field name="nh_theo" clientDefault="0">
      <header v="Nhóm theo" e="Group by"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="Loại vật tư" e="Item Type"/>
        </item>
        <item value="1">
          <text v="Nhóm vật tư 1" e="Item Group 1"/>
        </item>
        <item value="2">
          <text v="Nhóm vật tư 2" e="Item Group 2"/>
        </item>
        <item value="3">
          <text v="Nhóm vật tư 3" e="Item Group 3"/>
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
      <item value="1100--: [nh_theo].Label, [nh_theo]"/>
      <item value="1100--: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>


  <commands>
    <command event="Created">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLGAcrbSHV0QghmmHqbU0e0fKWifDNXG2P4Bckp3YAAAhkjYWJ74fzkX8L1NZIi8cBiezp70Wcnm7HqEAzcaFg8wxnYoDXtmuo+WyiNrGPYe</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5B2ARh+M1OAT8p75lJ0BBgqhKM+ogaIyRRtI58CGHEr1Snd5Bji4JokE1QNM4naisRYZzUbrE99fhrZzD7R0gbihBWlqdybRz7r6ixCPcRN3bEb1Bt33sU5cBJijLlj/iHU5lsS+CMHa6zoNeYiB0M/czmJb24/tu+8k+44dAA6sDd4/w/Ck8D6CAHotGqPJ6x1izDV09U40q1jTOPz/OD06dnPMLoQqv9h1qz7onDEMWmTffHU6Ru/S/MINEzqY7aFbCwUDSs6UYmcju4aYRuddAwOezmXXosgSKDt+SEhr8gfIX49HWZw2cMRcSd9+Y86D4aWp6QGVJCmI76U9Qhu/wtn9D5KgSyzJhNmOk5+rDgIxp/QfqN0Vw1407XwQy37KaK7ydvMxe9qRITfU+jgccbIrm86pBsjcBFwgey+</Encrypted>]]>
      </text>
    </command>

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8KU3qC26YeKeL7edhfPrfqcnidYuT2cYab05KlrDmkN9FSJxb2Yse5k00mTwHa2O4x45qQPZFSu2PtmP4Gxr8bXC5ClFdG1WpbunN8cmHxNqEnTt7MAlK+dTJlcxEG7+XRXYGbEgn966K1xQfaaGwUgPBkLzRMfMaFAO7Q2n7eKXNXmWWh2htc/46E/2uAuVjntwKpOcqbTCp0ZwpwUlzQYZ3J0pd7Q/MnXo9vfl0ChiY6mNvCU/U/ONvttziZl7ZK33RY0JzDg9lVUS7bIzPdmcl4Kt71UP0rLckkLT29o86piNycrur20OUS0P63rNFttUsSa+IN+BuzBsrUyfKZtKplEuPqfcrkM5SrbU2Tx</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUyBDhZdB6fkZIZSLuTUcxxRnAuJY7NWB270VbrK4VQvsvgLK6qwgX3anN2u2flPhlDy1Vu/Ugf3BAzRUy7nq+8W5ogkv5fn2IOKIzFRXfio6GRew/AsFDIvtG/XOxMhwnHAhCfSM/10Qq3UaWFOiQOh6pMc2s+DSwJ2o5A0N0+QpXB1ZuXb0/EKBOTgbsc4YLr9xELWtJ0Ak19K0cOWG/m6Cz9nFFSbiO7RkL0Ifcey5Hy5nAWHGzV6SMf6AGff824AoG/HLXCZsPqfDDMyD3WopIJN/gf1kY4c6TLax49b3xM5J4T4AtQsGPd2nafID6SKUrbwMsPWdVK6eSaEkA+8g1ABbpoW60s5B9qYC5WKqkVreVJnvC7wIVnJu/OtktLbjGIF7h6KdvlwYbABfpAyqkxyVkfGM4plCwQsBpip5N13aVau8Vn3lRiEpDpsJeMfMX5lsZCcqqRHGePN5yAnpylfrSHonJQH1VkKpGG47Ycjs1h06WoyUMZkm39LF6BFO8q7JVeMzAkttLe+rMBxtTJ0GmpwVLZnwWS5KXelLFLG/quGTQt/YYm9Jm90qC4Y3BDGSCnnbv//Y85CsYNOPJpyU3DAD5+/9iMRMnKDoqi+BZsdkwxwJgOmAiGGmsi0MgMcNV/1OuofnIRjZlSQ+WdZoqXv5mxr1LR6vb6SoWkIcdmiaSZC6YbZWX0X+YodwXP5zBTHfoV0Pq4Ic/PWRe/+lmpui5BWTJUoeyGc</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>