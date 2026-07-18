<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">

  <!ENTITY ControlFocus "buoc_tinh">
  <!ENTITY ControlOptions "
if not exists(select 1 from options where name = 'm_gia_nh_kho' and val = '1')
	  select @show = replace(@show, 'nhom_kho', ''), @allow_null = replace(@allow_null, 'nhom_kho', '')
if not exists(select 1 from options where name = 'm_gia_vt' and val = '2')
	  select @show = replace(@show, 'ma_kho', ''), @allow_null = replace(@allow_null, 'ma_kho', '')
">
  <!ENTITY ControlExtension "
if exists(select 1 from options where name = 'm_gia_vt' and val &lt;&gt; '1') or exists(select 1 from options where name = 'm_gia_nh_kho' and val &lt;&gt; '1')
	  select @show = replace(@show, 'nhom_kho', ''), @allow_null = replace(@allow_null, 'nhom_kho', '')
if exists(select 1 from options where name = 'm_gia_vt' and val &lt;&gt; '2')
	  select @show = replace(@show, 'ma_kho', ''), @allow_null = replace(@allow_null, 'ma_kho', '')
">
  <!ENTITY CostingUnitFunction SYSTEM "..\Include\Javascript\CostingUnitFunction.txt">
]>

<dir table="xdmtgt" code="stt_rec" order="ma_dvcs, buoc_tinh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin tính giá thành" e="Costing Calculation Parameters"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1)" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99I7B5dWm7FN48D3uYlVEV8qYzfVKZl1Pn4DCnB2bwhbGY99XxVC+bu9O1u51lY/G1Q==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="buoc_tinh" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Bước" e="Step"></header>
      <items style="Numeric"></items>
    </field>

    <field name="id">
      <header v="Chương trình" e="Program"></header>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;<![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99DI07+g9/cA+LzPpZCxlSSUFSSDCmy3jmNyzIErSAAhtxz4at0Y2E6S0C8sKvcBufy959MSHl1s3Z1sca2yz3R8=</Encrypted>]]></clientScript>
    </field>

    <field name="ma_gd">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = 'PND' and status = '1'" check="ma_ct = 'PND'" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1=1" information="ma_bp$vxdmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_yt">
      <header v="Loại yếu tố" e="Factor Type"></header>
      <items style="AutoComplete" controller="FactorType" reference="ten_loai_yt%l" key="status = '1'" check="1 = 1" information="ma_loai$xdmloaiyt.ten_loai%l"/>
    </field>
    <field name="ten_loai_yt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_yt">
      <header v="Yếu tố" e="Factor"/>
      <items style="Lookup" controller="Factor" key="(exists (select 1 from options where name ='m_gt_dvcs' and val = 0) or ma_dvcs = '{$%c[ma_dvcs]}') and status = '1' and (kieu_yt = case when '{$%c[id]}' = '7' then '1' else kieu_yt end)" check="(exists (select 1 from options where name ='m_gt_dvcs' and val = 0) or ma_dvcs = '{$%c[ma_dvcs]}') and kieu_yt = case when '{$%c[id]}' = '7' then '1' else kieu_yt end" information ="ma_yt$xdmyt.ten_yt%l"/>
    </field>
    <field name="ma_kho">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="(ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1)) and (not exists(select 1 from syssiterights where user_id = @@userID) or ma_kho in (select ma_kho from syssiterights where user_id = @@userID)) and status = '1'" check="(ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1)) and (not exists(select 1 from syssiterights where user_id = @@userID) or ma_kho in (select ma_kho from syssiterights where user_id = @@userID))" information="ma_kho$dmkho.ten_kho%l"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nhom_kho">
      <header v="Nhóm kho" e="Site Group"></header>
      <items style="AutoComplete" controller="SiteGroup" reference="ten_nhom_kho%l" key="ma_nh in (select ma_nh from dmkho where isnull(ma_nh, '') &lt;&gt; ''and ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1)) and status = '1'" check="ma_nh in (select ma_nh from dmkho where isnull(ma_nh, '') &lt;&gt; ''and ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1))" information="ma_nh$dmnhkho.ten_nh%l"/>
    </field>
    <field name="ten_nhom_kho%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_vt">
      <header v="Loại vật tư" e="Item Type"></header>
      <items style="AutoComplete" controller="ItemType" reference="ten_loai_vt%l" key="status = '1'" check="1 = 1" information="ma_loai_vt$dmloaivt.ten_loai_vt%l"/>
    </field>
    <field name="ten_loai_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt1">
      <header v="Nhóm vật tư 1" e="Item Group 1"></header>
      <items style="AutoComplete" controller="ItemGroup" reference="ten_nh_vt1%l" key="loai_nh = 1 and status = '1'" check="loai_nh = 1" information="ma_nh$dmnhvt.ten_nh%l"/>
      <footer v="Nhóm vật tư" e="Item Group"></footer>
    </field>
    <field name="ten_nh_vt1%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt2">
      <header v="Nhóm vật tư 2" e="Item Group 2"></header>
      <items style="AutoComplete" controller="ItemGroup" reference="ten_nh_vt2%l" key="loai_nh = 2 and status = '1'" check="loai_nh = 2" information="ma_nh$dmnhvt.ten_nh%l"/>
    </field>
    <field name="ten_nh_vt2%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt3">
      <header v="Nhóm vật tư 3" e="Item Group 3"></header>
      <items style="AutoComplete" controller="ItemGroup" reference="ten_nh_vt3%l" key="loai_nh = 3 and status = '1'" check="loai_nh = 3" information="ma_nh$dmnhvt.ten_nh%l"/>
    </field>
    <field name="ten_nh_vt3%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tao_pxcl" dataFormatString="0, 1, 2" clientDefault="1" align="right">
      <header v="Phiếu xuất chênh lệch" e="Create Issue"></header>
      <footer v="0 - Không tạo, 1 - Tạo khi không còn tồn kho, 2 - Tất cả các trường hợp" e="0 - None, 1 - When No Inventory, 2 - All"></footer>
      <items style="Mask"/>
    </field>
    <field name="tk_cl">
      <header v="Tài khoản chênh lệch" e="Difference Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_cl%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default" row="1"/>
    </field>
    <field name="ten_tk_cl%l" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="0" align="right" inactivate="true" hidden="false">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>

    <field name="stored_name%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tinh_trang%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nguoi_tinh" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay" type="DateTime" dataFormatString="dd/MM/yyyy hh:mm:ss" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="NULL">
      <header v="" e=""></header>
    </field>
    <field name="buoc_tinh2" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="132">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101000: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11----1: [buoc_tinh].Label, [buoc_tinh], [stt_rec]"/>
      <item value="1100001: [id].Label, [id], [stored_name%l]"/>
      <item value="1101001: [ma_gd].Label, [ma_gd], [ten_gd%l], [tinh_trang%l]"/>
      <item value="1101001: [ma_bp].Label, [ma_bp], [ten_bp%l], [nguoi_tinh]"/>
      <item value="1101001: [loai_yt].Label, [loai_yt], [ten_loai_yt%l], [ngay]"/>
      <item value="11000--: [ma_yt].Label, [ma_yt]"/>
      <item value="110100-: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="1101001: [nhom_kho].Label, [nhom_kho], [ten_nhom_kho%l], [ten_nh_vt1%l]"/>
      <item value="1101001: [loai_vt].Label, [loai_vt], [ten_loai_vt%l], [ten_nh_vt2%l]"/>
      <item value="11011-1: [nh_vt1].Description, [nh_vt1], [nh_vt2], [nh_vt3], [ten_nh_vt3%l]"/>
      <item value="1110001: [tao_pxcl].Label, [tao_pxcl], [tao_pxcl].Description, [buoc_tinh2]"/>
      <item value="1101001: [tk_cl].Label, [tk_cl], [ten_tk_cl%l], [status]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMux7OKIn/3fzQx7C3yqpbx1KlSsak+Bqupy2GODX3QXnDNW98SngocDgCGbywrcNOFljDG9BFyYCPdmalGGFpn6NUGuNS9JY/uzgHlaGC98SlTF18tXw5MysE6fxVXy6G8HWdU2HT/3j28CTqyGLNHlN7TleK8bvUB6KxM+AMYT9JgIU73PKJN0NcphPV5YWeYblDk7i2gwBtrF/4cf0HkYMAt3XG600CC/m1RrdxJ3lk56GLbc1Gvv3SGEe9ocnu1ZtY2m3+EI5U+GfKlyJ5IgDMezmEGa1smbLnyYrmp5sDaYufZ/KdWKfIZxWKhre8cSDhYIOsXI+da/tGOT7azox0E3ARu1o+BaCDIrg6HY1Uuh6I3hcru8QjXfutdHwhk1RFTafMk+LvPcb2aY1SHwu1WeJw5mUbN9soshlBFFKWn2UTri/YWV6VOf8Ek8oKQFtstGq4qqRC6br/JRQYTfxA7RbYu+470LLH2MwAe16sAORsIcrJ+fAMoK2Z7Ov8cncWNu7BQDDJLaLzDNdcWgA=</Encrypted>]]>&ControlExtension;<![CDATA[<Encrypted>&YeMNTHB29VJsL6IOY8GY3hXov7kUX99qr6vML7MtqpCiC2pXFBQvenNUk8b2PbNv</Encrypted>]]>&ControlOptions;<![CDATA[<Encrypted>&YeMNTHB29VJsL6IOY8GY3k4I2T2TwHwhPMGGG3mSgORwQ2+GoKqxnknOm6yE94/YN8RRM9BtHRN/TPOaGy4YnxUXIgN8RQyKx5jy+d09FA3ZsiAQ/0POXMzwylUaoa++QuCfZ/+4Y5fk1G+2LIoDoA22gHycdmunzd3kbcBI8KZ1+G70vrO24xRYMKM5ZqW5VQypOxEuAjxpvSMJ2Urw1Ef8rJp7XUpc3+g4/yrEQyS7eu9wwiA6buVIAkrIvnkmxGJKVBc0S+u/4xOu9W1s3SUQcMq84QVDhBlxQpYaGZK29jJIf5LCVIs2Kyw1AQSSjn1mXK5CMD9SgIQ2sBzawVg93hFOF5mmjoYXXPlOzaWljvX7YGU3HSJnO3BTtjpvE9dijkibeop/S72SXb81HeQb3iERt4tee2EBoQ5w/qA31KhQaPOqw1NHOvjJlxIbj8cvCOw9L77Vto0F00mO2Ujyhg2gtAvqTyTyL8C6ur5xTj3IR4wwiLCO6/Fg1t7c9OWwZHzECMTM9zm0YbQOWVONUnFMzWO4/jv9K91+88E=</Encrypted>]]>&ControlFocus;<![CDATA[<Encrypted>&U5M9a2ZkLHTRJtDrNNZOF4QH0OJRUhf2XV30Ed2OZiktdUNbJ5hW5GEfH333qu7+UzDA13x/L3pnft9AsfsjqmapLOepKZSnSLgsUJYzMow30y+k/7pHh8cwKGFzyqdbHtPhX+cNO/w3xUAeUgg3xA==</Encrypted>]]>
      </text>
    </command>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcF/b3IyC6ggX2v6O+lsuFHn1j6FO0HoCgJ6lTN7+gA8SY8vPShiw0ppEm3PpUkcfYw5NdwbxW4MQHoz9ZH+x2atx57UkUXA9P3Iw/tqsIgZrYkqtSHs+K7kks9OHt6ZeXrdprZbkATcz/CnKbcyhaw7EN6Ze5pODXhhvEW0bzMTfWnKX/J9Pcx7K9d30GU/lFYHOcXLQuD/7NFeBldmqdTQRTMHtuATdy0/ppTFODu+Q3Z5KNR7C6EDuh+bCypAb2dX2ztbNMp+f8wCqaBHrkKu8348Kdh0VSxHAsqNc++WF73Y915kos66xdY1Hwgnr62BdZqGGR1yQiNZ5jr5OzOfdDIcAO04wygUAnnxKbBSfJPjnfgc0UQIfomO+mPSsdzJvePCyynUSAE7Y+P/H1lafm2rrshopKCyx//he4FoGKTqh03DeHqpwNufICXbILmzimyw6X3nqUmSyq2hY0VKsoowmxIQwdeFXG4+k8IyIXcK868FI4NG84f4xXABamzVzWCQSkkRnUXAAuh6DgE6mKuDAWXEpa/lq/jjG3shlM2WFxq2PfnkQE/ObuX0iQdMyZEVdbMd3tazxLO8oSNsjcJk5T0lGF06iVI/22Olknu4vxoqOxNq2ro1y1qqq/Vzdo6pKR1wcOZa6ZYXTSnY=</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcF/b3IyC6ggX2v6O+lsuFHn1j6FO0HoCgJ6lTN7+gA8SY8vPShiw0ppEm3PpUkcfYw5NdwbxW4MQHoz9ZH+x2atx57UkUXA9P3Iw/tqsIgZrYkqtSHs+K7kks9OHt6ZeXrdprZbkATcz/CnKbcyhaw7EN6Ze5pODXhhvEW0bzMTfWnKX/J9Pcx7K9d30GU/lFYHOcXLQuD/7NFeBldmqdTQRTMHtuATdy0/ppTFODu+Q3Z5KNR7C6EDuh+bCypAb2dX2ztbNMp+f8wCqaBHrkKu8348Kdh0VSxHAsqNc++WF73Y915kos66xdY1Hwgnr62BdZqGGR1yQiNZ5jr5OzOcGV3EyMHTINBGyeclKPrm3cv3j2ayhpwFD9lWtkWkBB6wTd5cwRPVHhx1tglAeBzOsbli9OK3P7X8X7t10FzgaclHg4bzSUCb3BOhq1Hae53x6uFmJvtaW5Q2iujCu67O/XsyeQUi4i1wdPmgcJyEA8wKb9zaRqMzedPAdQkM0vfnhOOYxhYcQxitLSOHWsJKMFfLfsHG+iM6U4pWwOuUK</Encrypted>]]>&ControlExtension;<![CDATA[<Encrypted>&YeMNTHB29VJsL6IOY8GY3hXov7kUX99qr6vML7MtqpCiC2pXFBQvenNUk8b2PbNv</Encrypted>]]>&ControlOptions;<![CDATA[<Encrypted>&YeMNTHB29VJsL6IOY8GY3k4I2T2TwHwhPMGGG3mSgOTRf6J5oe6eTeS30Co3LiUgCKG5tuqRErZJxFmYlbO6yoy4g/1JbDNZWaDKAI0/SebTaMbcAAaubVXjeiGKIXK1sPur8ZRU7pToB21R3rqOVQrUNRCIJ/ja2X1Dzq/Zv929amuRSHxL2vbPZRQv+c3wuUPWSt3bCOE87wlbUuUsNG7rmmSOcURsd6KJbr2YaV3RzJ5IpcVBO1SN77Bd0p1jb3ULOHTYJ/SWyJGrQaglI+NW7WF0X/mQBKo/qFxxveNshF14oOR4ZvEQxhIafHPeAKAGWL9f5H1QwXkz2qgw4fs7XqSbGxNkrFwcH64H+pBVypkqjyDY1t71s2cQs/8NhUmFBQ9LNrRcgs9LxNyfZg==</Encrypted>]]>
      </text>
    </command>
    <command event ="Checking">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WRjX5/6Pf0s6QTuF9Uw+uOpBf7MPdv5pSEaQXNVgujv7c6JRiTJ/HRpmYPfTJ1iJswlCVERax8nu4bCa1PbNJuHCyZBvWZW6+1hz+wp9qcI9K4cGbMhgb0z/ChU0kdTnxZhRwwN6qCBFukYr9TzHv95g4P+IfbL6h8qJ1FRC6T7</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/T1pB1pu9LZD0vT+ZLhXc5jxLBbDvX/owrUcQxUuAniW7ynoeVOxZPTXwmbudFHeNBPNDBrxD8mPc058lwhvadqwId/MuQ7QIHUDApF8mAYhiIBRwPAxLTeFXn9+lJ98LEMZ9bM4+kaJV8YFFi8tqR97Jyv1w5oNFzrPorRM7YY6MzYKzQ1mbNuQknB5lbceZaAdRBYSUQtOyutYOuGSIMTMwVisBtA640ldPQlQiWTezBf1mh/d0mSdd4TjM8xxHfcvrUyy/ezThdMIYDX7Em5/LOti2GZ5nGsse9W/gZ1ceBkApi82WXk/UPzZrk26PVQIsWADJMdYteP96Q8Zw9w5y43Usms4nDYU+PiIyDzWbJEAsyk7eTVTm8Ph2Oo5X1+ODPDadJ7eLOa7q1sj8UsDpCXTqT18sMlAsW4COftVkY8IJudeGrysHpWrprGjpADGuk7WDuhxEfso94HDwpDgucMTw1O8pkx/WFbp8on2txfZi7y75pZ45yR5i5pobZAQK6ng0Ux9JoQ7xFCinou2dVGdF5Ta7y2iNjHFYgDj3huTMpimUMZCCJ+KHJ9cRDg2A7YN58RosrnQA3c6Tc=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+7JjemY561Ih4gUrejLDDKTMdH0lVbY0bem11d5egNK2xXpL7mbjqN318wUfNVCxCRkNFcA1vcu+iub5orgZsVxhN3BmytiwB9TQ2g/X8oEmvu2BANs9y8E5I4BZUV14Vl9P6tIhVI4aR6VGHX/BrFDs8zFGxPvARrQLW/qoU1MBHcVlhlAMFCchKKnlVmwJ+6YVqrzAsV++QbTUgSyomc4TfP1g8yvZuJa1+TzKllApg2NNYTcwfQMeEYtPV2V2rgUuIOeBVGe4ZLxHhCCc4MBtae2GzMn6rD3P9Z6pA9Ge+/ah8SI8ZbXbAlhh6/KSt6Hsw8HlrNThi3fb4SKhTG1NKAbnMaChnNcGdF22RlLvvGNtoYNK4A5fr4FkvHTpxPO+O+9n/qQIAUrB5CBaJDZ6DAlusxKET5sSfxHD/u3PlnQhZZx9MEcHiBYYb4N3Mo1GZ2v8AcolsjqQzQ8L+eGkwuW0xJzoZpXQ0N+dM+ednHZWvAMmp2NvNLHn/e9vqhWJjIu+592hIJWVteoCyA=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcF8fMb3M/er0xXcHGB9wLOilEfTM7V1t99ts8yvYMXUhIioVM/3vPtroQ6wQpyVRF5c1KKxVSpL9dt54qT2N2Hw=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu0somIXdRr5mi4tToPOyocQFkb/ltNSHB0wCnUECcagvjLw8EkV3aMXVKtnyRMQiTnB8PW3Vczu7+xYYFK0XqJf4DC2EJ8+NQ0SRewqYiZPBChJ5h/QQg1227feGLq4Ta91fRf4J8OZFDxX83fKXE19BLLYBTrjlHvSWI39dsP9bwtnVl8MceHo3DGIFVsakMg9mdeQ4+lQuCjhFW8yb2iPrI0UC37CPery9+FRu17ajY8ie7kj226faEsiYhFsyhtbDlOodh0sC2rStGHereqh/3y2YhcDEwWlSMsrP1uagOCL6ZG3AMalpXEUDjrBgT6/tlFp0g7PEi+yPHhLwmgB3yIAJ35Gp1RtVwmWagk8ufhfCFiVLT6/914l37ycWuh0B6CwHROhu57f17MebUup/s+7r9cJWORRMLn+T4KnEhy+kqQ8Meumk2Jv0cFNORx8tAeNT+mv5oOG2iSg3tiLb3dDhD0YEibAwM7V5vRs3</Encrypted>]]>
      </text>
    </command>
    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV5FbOATP32DYe1E0CmbcSC7mUFvXCeC2B9Mu3c48YGeZ</Encrypted>]]>
      </text>
    </command>

    <command event ="Deleting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4b0rGa8vBKURt7mg7V/Coo1gXnk30MkGeB2SHWvYdnf+jGGAkkn1LDvZ+ohXgngJegTIh2FrqHcVxbGlXxDlV057uBIS6KKzvx0bpwntK5sL2cdeZBPgNkpwVCEAZ1fEfeyCcVPhrtEdo7Orh0u7XSMk4o0rKK4J33ME2633kN6GIqlaV8Asf9876tjM+DaIu4ixi27oz7YRJZmuPtPSZJ06FlTkeI6suYiKtDJ80asTAjjbtaolwK/VTvl4oRUfsmNE3D7et/qkqtlc3oO6UcSOclE9iknvl2m6UCklRnOQ==</Encrypted>]]>
      </text>
    </command>
    <command event ="Deleted">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuxBZIN6fOGZUAG62AWl9FqcNBTPjnCtJwHb6xnSWSY+mZPoLzU2Uh3a8WYVDb2smFQ==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22TdNE4MDmAveMT2FB2nusmlYiYfsV4+/nD3y4ZLiScc+anM2of3yn4gIesFHllBpKCKVXro+09BkJujfn0tNaRH2btXZysEcflvHaWKn0q9bh3ucnAvV7dvdLTTKJMj5ySJ2SHs9LTfJ7RV2I8vgpn+NlnFy1qzDdmHsfPRWrX7zTZaL/bMK0yqr4EH+H/yTJGtar+u3zOvdqaRzdPhuum8lGJg39w2aaGsUGFGJoWzkVgTO7PUAFnhfUGchkiAdTNqJn+tnoDKSlYMJ09h+M3/6x2DSEE8U5Fy86WyFQA0mJ+AuSsZG8BIbq0xdpv8Vvo3zve6LFVUMMy8OVvqTO6sOhDSMDxh+5JRwM8UmPGbUXAM2bzz495l6CfWhJ/eoGOGlDbTBsWt3VPaNBR46bTMAzRyQITKkH4Nc12lrRbptwDS7pxMKzbnivD7wmQUsI+4LG3CzqXYyA2VlenjzYWAVF2OOZy6TFjjRDMD4krZHHDy+uu7uOmMolvejwrbTm8Omao1TUh8M5tuR5hjTdSNdIJrK/G6WWo6HWZeI6L2sDtpS9SsF0EKz8Eh7/8Ji1C7AKS328063HUsVoJ96EC+mMNE2ZBDwHUbfuNre+XVqw9gey/vApKfMkaw1V81LLjzKRHCKyLLev5xgo9hmf21r/CSoIjjuls7KV/ht9F02bv0MALLLiy9AuOy4hKRIv+I6Rn5On1NICqFulfoZIH0CW2W6sU3dAM9/t0QdLVoxkheaArxWvl7iKQek/mXix31T1xYc0/7KoTYjntq4+rQljFHzU0UHnlfLBFMScGrlu6n76mrfxxELjvkO0zMS9UbASF8b+vQvKtMPULJL5QNN7NgExVOVcmjLmDlBlgXdpTyEfGPAl8HoTjeN+1V7do5uMDcThjQ7Hvsqx0VKPVy7t4gp2iVh0G7oGDRQmrJfH6zvC6F/U+es6Ptrcmi7MUo4FKtW+dkFSMKA7xMmYg77+eMmdmoWcKSljtpDzNvUwHKasXpgI6nPYhoF0Xn3lwoyqW286lCB6+LEQfJh66HB6TUir9N9T+Vxhw5kRtZfg+YBAaWkIj8DzomLo8dxJClH68m3mP8+Y4CNOBaIl5OJA1OFhMzE68JQjc+dkJyZgJVP5SB2YFoU+dxVnJNbeJuKSFJ1o9B9ko7/kLuT2xoryDKY+m+rNvrIq6zNCwmeE4ua127FvDhKZo16kd3A3MXYo3aMrZ9xa9gnwwkjQHMpWQDiloA1kolZho+0jixuFF+oxNPLkn88MEmKUUsQkV/B3xniRouPsqhTvaBojII5Yrf1eA6SSa/5RFgVKIxfFYgfPYfWcTP6mNROS/DKpq4GlXt4YwVuxTwwAEGrMbYJMpQA5+/kaLILr2lv1O/SmcoCHveS0iXz5QGePTJhKlFseqlCFswq+7q9ANIlRkH2AIj5TpkLL51XU1ByNwzdVDl0HcuAaiWk3k6f44UsSNEEYuwRJGMtMsldBEaqAqcJHloC2PIhhLtk1PRfS/wClu2VtF4qIwVA+92pr50OA/d9QGVFmGBTK6CRJUcHJYOtWo6FGDb6iAoqkxUku0MLW7QPAcosmHMBlIUDDANINUUiWAVoqsoqFJVY6FoaDHNsb8M8sXF53cX0zSQ3WYNBzLPwBfZWit0X4lQaZAtUNA==</Encrypted>]]>
      &CostingUnitFunction;
    </text>
  </script>

  <response>
    <action id="CostCalculate">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5kcu/w0NcfV16hrqD12ZEy3zn8Gb9MmSxEYEMgXHLd5DECmcyjfaZ8NlkC3anNw3KHTkD+sWPSfqHYa9rMUV9KP0aJMLQe21iVVLzNfDW/WuXeL1qfujgO4pRlyEu1CY6NnJf5RbAE9Uj9h9NyUDR0</Encrypted>]]>&ControlExtension;<![CDATA[<Encrypted>&YeMNTHB29VJsL6IOY8GY3jPTKlHDsAjoviedsbxey+OQa6UEiiP9Qm5MK7OoiuJh</Encrypted>]]>&ControlOptions;<![CDATA[<Encrypted>&YeMNTHB29VJsL6IOY8GY3p72qbmkchz9W3rVvGnfgxSbDwgF0SZhCKHwWq9BWv8f+9CbaOubEo0S0/v3phB8TbkHS/tYNCnRD+AwYVKOttE=</Encrypted>]]>
      </text>
    </action>

    <action id="Unit">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuzxXOYDhPJp5g1uW78pgw1v70e+gkjea8+15HR68YRNry8NXHeQbyThzlqshaEPD1yaCmLmpfM12tj7LmB8gFy1zQXWM/FQUZqaCse/jOdEXpKgYwMsA1ot4FjEogx0U2ECQUdNKzL1iEY/yoeHbV/dF12z6R5kGRK5DjRwsSdUhpUIIkRzm0lpS2dSXtp0bew==</Encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>