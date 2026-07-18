<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\PeriodLockedDate4Site.txt">
  <!ENTITY XMLCheckProcess SYSTEM "..\Include\XML\CheckProcess.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Tính giá trung bình" e="Calculate Average Cost"></title>
  <fields>
    <field name="ky1" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth()+1">
      <header v="Từ kỳ" e="From Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="ky2" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth()+1">
      <header v="Đến kỳ" e="To Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_kho">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1)" information="ma_kho$dmkho.ten_kho%l"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nh" defaultValue="''" filterSource="Optional">
      <header v="Nhóm kho" e="Site Group"></header>
      <items style="AutoComplete" controller="SiteGroup" reference="ten_nh%l" key="ma_nh in (select ma_nh from dmkho where isnull(ma_nh, '') &lt;&gt; ''and ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1)) and status = '1'" check="ma_nh in (select ma_nh from dmkho where isnull(ma_nh, '') &lt;&gt; ''and ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1))" information="ma_nh$dmnhkho.ten_nh%l"/>
    </field>
    <field name="ten_nh%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt">
      <header v="Mã vật tư" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_vt">
      <header v="Loại vật tư" e="Item Type"></header>
      <items style="AutoComplete" controller="ItemType" reference="ten_loai_vt%l" key="status = '1'" check="1 = 1" information="ma_loai_vt$dmloaivt.ten_loai_vt%l"/>
    </field>
    <field name="ten_loai_vt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt1">
      <header v="Nhóm vật tư 1" e="Item Group 1"></header>
      <footer v="Nhóm vật tư" e="Item Group"></footer>
      <items style="AutoComplete" controller="ItemGroup" reference="ten_nh_vt1%l" key="loai_nh = 1 and status = '1'" check="loai_nh = 1" information="ma_nh$dmnhvt.ten_nh%l"/>
    </field>
    <field name="ten_nh_vt1%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt2">
      <header v="Nhóm vật tư 2" e="Item Group 2"></header>
      <items style="AutoComplete" controller="ItemGroup" reference="ten_nh_vt2%l" key="loai_nh = 2 and status = '1'" check="loai_nh = 2" information="ma_nh$dmnhvt.ten_nh%l"/>
    </field>
    <field name="ten_nh_vt2%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt3">
      <header v="Nhóm vật tư 3" e="Item Group 3"></header>
      <items style="AutoComplete" controller="ItemGroup" reference="ten_nh_vt3%l" key="loai_nh = 3 and status = '1'" check="loai_nh = 3" information="ma_nh$dmnhvt.ten_nh%l"/>
    </field>
    <field name="tao_px" dataFormatString="0, 1, 2" clientDefault="1" align="right">
      <header v="Phiếu xuất chênh lệch" e="Create Issue"></header>
      <footer v="0 - Không tạo, 1 - Tạo khi không còn tồn kho, 2 - Tất cả các trường hợp" e="0 - None, 1 - When No Inventory, 2 - All"></footer>
      <items style="Mask"/>
    </field>
    <field name="tk_cl" allowNulls="false">
      <header v="Tài khoản chênh lệch" e="Difference Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_cl%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default" row="1"/>
    </field>
    <field name="ten_tk_cl%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="kieu_cn" allowNulls="false" clientDefault="1">
      <header v="Kiểu cập nhật" e="Update Types"></header>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="0">
          <text v="Tính giá rồi cập nhật vào thẻ kho" e="Calculate and Update Stock Card"/>
        </item>
        <item value="1">
          <text v="Tính giá rồi cập nhật vào thẻ kho, sổ cái" e="Calculate, Update Stock Card and GL"/>
        </item>
        <item value="2">
          <text v="Cập nhật giá tính vào sổ cái" e="2 - Post to GL"/>
        </item>
      </items>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11: [ky1].Label, [ky1]"/>
      <item value="11: [ky2].Label, [ky2]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_nh].Label, [ma_nh], [ten_nh%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110100: [loai_vt].Label, [loai_vt], [ten_loai_vt%l]"/>
      <item value="11011: [nh_vt1].Description, [nh_vt1], [nh_vt2], [nh_vt3]"/>
      <item value="111000: [tao_px].Label, [tao_px], [tao_px].Description"/>
      <item value="110100: [tk_cl].Label, [tk_cl], [ten_tk_cl%l]"/>
      <item value="11000: [kieu_cn].Label, [kieu_cn]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnK7zDCfzKFgVIkulFMM8+XPF/vMjc9dC5JsUNUWm7mNrrWu2MwCDqc+9hl6Y4t4QUmgaZR+TBiXLCx61kRM8Hxxh5A5PJSG5v13fu3bgafY4zVa6Ij08YIa5PiY+DMFCpA2CyIDnmacWFdppMfQQPYhWyIbKlZqLXE8Gd+uwk9HtgK4ufIhVyVioQhGUqzk3v6FnIjXBF2GiNZ2IYIDCRQXU57WXW/MIJJoXe/Jfm2LM2YhVw/x81x92XxLXhZiZDNCp5prslkSZkGW0gB4bG6Xw6BIOnmioYq5NQhy2sqJCiVikvvK+UthBCoBYXGMPAMxsAIlphFANwgCLBLfv0xm0YZk2hFlkoSQ4DmCi+E/Q==</Encrypted>]]>
      </text>
    </command>

    &XMLCheckProcess;

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKEZYrAGgIvbzfPmxrNv2Mt8bZ+3vB6A92OyMn1yrWN+iloqUYwPe2L48hI5s6DXqX7rlOo3cfx7/UrjinV/tNdhULjdTJ+TNu/d7xkWrYg3IHgJuRXtVMvMU3pnSxvp5hOuNGPm30hrPy9XHC++eXw3jwYZYzsXj0JE6USi4LYu0JX3GLCDsOgO6BYBgfeGbhs8746JMFDnl9VqWfzojPahAWORMXs5t1CXbymH1pMJfAipDFB7+sWcGTdS2cL1i2x75SZ9H1qqZPzmYSYEKg73SANas3+dYctQcnyymYNX4TfXVcU7QOs/1j5GnzJ4UFmE3KLyPgb+tXGC+kLk0Qaynk/PreAJGyDKzBFrXnL+znLUdp+E3RPXHB/hLdq7pvAcUb0o3FgLRh7xMl97R34gh5f2MmmUolTvamb6+i2IUg94BzMLNdhfGdgiK59ovr0FkOOuNGLkbYSeuuBdBmNuiyeIVBDoQ6pYArm1AN/2GTwO9x2fk3t5AZzQRRy2odwwqV8ftN34Hgcbb73SKyJ7fXwLBmVavzn+v5MeJQnzVHQP65h6AKyPFyKNe3Dnx4BKSRLtTrU6Vb0ktq66HB+XWGLyNf9ROTcpkzfq38wM7P7mB37zRXCnK4PAkRKSCmc/LeOkEmLeNB26QWczWzJkhHBCjVDuObgT/+qDG+vnX3UbKKFvh+4xRG3Xkljq64vItI5sEqd3lT/3PFsvoLDj4hF1O38oubKwlQztc2Ykf8btXvkgt3/7UjEIsok+Sw==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDyfhdaPBMfmMifaMce1piwyTsRKdZ9T0X9cqpp7QXP2UqHjcpFuG90swz5PheKmEa0kQL2w1CIDOrKovAftbouCUfdsZTEW8HaAROpnHCK9SGxpOfItibtZTFJKCFRJc+21/eqUvPjW+5dMermYnbEot/unGGllI3lESkxRgIe95pYarRxJMfF/MbQ8BKFhog54r+fAg2JaWznk75XqddMBAE8BrAxvT/swouHG25rQX61+JbSz86bx2NOVhAEp+DNQTMCBCJJsIzadMYu8OHGYEmaqyQoFQDR2Ps1LBpTxDNW4zVnV3tvcgIPU/8TOeKSQPj963GhB6/8DycKSxuqxwHvb6e9yYEJf7m+nV73G+qs3+ft/tPcNq9pSEX2UxYX8x1/y5yVcYNSPmw4P1tbL8dv0MZQqf0CEEsYD8mpVfkkxKHPlFb4I8ehpWVdk4hJ4=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>