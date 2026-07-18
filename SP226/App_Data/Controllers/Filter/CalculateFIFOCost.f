<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\PeriodLockedDate.txt">
  <!ENTITY XMLCheckProcess SYSTEM "..\Include\XML\CheckProcess.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Tính giá nhập trước xuất trước" e="Calculate FIFO Cost"></title>
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
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit(s)"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1)" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" clientDefault="Default" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="kieu_cn" allowNulls="false" clientDefault="1">
      <header v="Kiểu cập nhật" e="Update Types"></header>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="0">
          <text v="Tính giá rồi cập nhật vào thẻ kho" e="Calculate and Update Stock"/>
        </item>
        <item value="1">
          <text v="Tính giá rồi cập nhật vào thẻ kho, sổ cái" e="Calculate and Update Stock and GL"/>
        </item>
        <item value="2">
          <text v="Cập nhật giá đã tính vào sổ cái" e="Post to GL"/>
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
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110100: [loai_vt].Label, [loai_vt], [ten_loai_vt%l]"/>
      <item value="11011: [nh_vt1].Description, [nh_vt1], [nh_vt2], [nh_vt3]"/>
      <item value="110100: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11000: [kieu_cn].Label, [kieu_cn]"/>
    </view>
  </views>

  <commands>
    &XMLCheckProcess;

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6vwF1B7d1GySFdWppW9fqbKgqYTu2bdauRuGfv6k0ZCb2PWvFAuc+gkrgf+p7mPF8gzl+Wpn98NzglH865W7n5muDsckW3f2W+H4AuaMFVuVlOoHyWiwjxOoaaM/7yvs0aRlUyGtmA4WgcztoA+n42eqeMaxXa+KcsWUOH+nx+YWONlCDGFZkAK4VJLdKea774iH+jM3MuBFFZt1gs4320RzJ6nBVALrLVaXgLlD5azAtOubxfWxKQmlMguA28Oui94iObmbxCkPgGjl62zXRq8YZCh1v73V90E/KnTTgMCACotGB8zu33v8E1rnnU/XTs6ph78QY1In9Y2L1AOPorc5EkNxciEKSYwkf70TjpiOipXGmzQEQ/eFoT+gZNziRR/Ey4wN8mntMod+Fw1t+mGyKLkln5SWo7cvxuL/NwZmE3GuAzyaHc1ek2xndgW3m0Svr4O8ONRHLGef/2wqH17UKqFU4pMIPSlN2w0HWkimV3ld7C4VaiQ6/ITjfr1wowRfwVtYWN2wXk5PfhBQyN5Ug9xDI+cH4U0suiV99PfqAl2xPFem3jgS5zZRafGaCgFV7lXl7uRDctWWD5ZXYV4en7c4oRIUwtHArXd0P7bxUpFAceDuQWdIDETCbftigu2W0WD73lKHIwLDQbZh1y9FZCMeF+VezpanFfDG82rDAsmbZzjr9BJCU0/ZuVCtSjiyTDKwihbLCAsuwfq/kPPQZCtyIsRi57NNc05RB6btPxMIWitjeuDvD6nVoLKtUd3p54DraGqTbO6Yg6Ednmt6SE4Hp0Rwo5LELtHezjstDogO11UhUsu6dwjjS69AtEUKyS1kWzKpVgpOvc1hucTTq2tLPKykihB/y/8H/lTPHqMxlow38CEEzR/SsVVx4wH+YtHwZ9W5wrJxnogslf24nHNM3XK5V4n61YDOtc4</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
    </text>
  </script>

  &OutlineCss;
</dir>