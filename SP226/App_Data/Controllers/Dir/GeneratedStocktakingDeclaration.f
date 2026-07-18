<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Check "
#IF @@view = 0 #THEN
  #IF @@action = 'Edit' #THEN
    #IF @@admin &lt;&gt; 1 #THEN
      if not exists(select 1 from sysunitrights where user_id = @@userID and ma_dvcs = @ma_dvcs and r_edit = 1) begin
        select '' as fields, '$NotAuthorized' as message
        return
      end
    #END
  #END
#END
">
]>

<dir table="dmclkktd" code="ma_dvcs" order="ma_dvcs" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin nhập xuất chênh lệch kiểm kê tự động" e="Auto Generation of Stock Variance Information Declaration"></title>
  <fields>
    <field name="ma_dvcs" allowNulls="false" isPrimaryKey="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="@@admin = 1 or ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1) and status = '1'" check="@@admin = 1 or ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1)" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99I7B5dWm7FN48D3uYlVEV8qYzfVKZl1Pn4DCnB2bwhbGY99XxVC+bu9O1u51lY/G1Q==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_kh_thieu" allowNulls="false">
      <header v="Mã khách k.kê thiếu" e="Customer for Issue"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh_thieu%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
    </field>
    <field name="ten_kh_thieu%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dien_giai_thieu">
      <header v="Diễn giải k.kê thiếu" e="Memo for Issue"></header>
    </field>
    <field name="tk_kk_thieu" allowNulls="false">
      <header v="Tài khoản k.kê thiếu" e="Dr Account for Issue"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_kk_thieu%l" key="status = '1' and loai_tk = '1'" check="loai_tk = '1'" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_kk_thieu%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_nx_thieu" allowNulls="false">
      <header v="Mã nx k.kê thiếu" e="Reason for Issue"></header>
      <items style="AutoComplete" controller="Reason" reference="ten_nx_thieu%l" check="1 = 1" information="ma_nx$dmnx.ten_nx%l"/>
    </field>
    <field name="ten_nx_thieu%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>

    <field name="ma_kh_thua" allowNulls="false">
      <header v="Mã khách k.kê thừa" e="Customer for Receipt"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh_thua%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
    </field>
    <field name="ten_kh_thua%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dien_giai_thua">
      <header v="Diễn giải k.kê thừa" e="Memo for Receipt"></header>
    </field>
    <field name="tk_kk_thua" allowNulls="false">
      <header v="Tài khoản k.kê thừa" e="Cr Account for Receipt"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_kk_thua%l" key="status = '1' and loai_tk = '1'" check="loai_tk = '1'" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_kk_thua%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_nx_thua" allowNulls="false">
      <header v="Mã nx k.kê thừa" e="Reason for Receipt"></header>
      <items style="AutoComplete" controller="Reason" reference="ten_nx_thua%l" check="1 = 1" information="ma_nx$dmnx.ten_nx%l"/>
    </field>
    <field name="ten_nx_thua%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>

    <field name="ghi_chu">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">

      <item value="120, 100, 330"/>
      <item value="111: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>

      <item value="111: [ma_kh_thieu].Label, [ma_kh_thieu], [ten_kh_thieu%l]"/>
      <item value="110: [dien_giai_thieu].Label, [dien_giai_thieu]"/>
      <item value="111: [tk_kk_thieu].Label, [tk_kk_thieu], [ten_tk_kk_thieu%l]"/>
      <item value="111: [ma_nx_thieu].Label, [ma_nx_thieu], [ten_nx_thieu%l]"/>

      <item value="111: [ma_kh_thua].Label, [ma_kh_thua], [ten_kh_thua%l]"/>
      <item value="110: [dien_giai_thua].Label, [dien_giai_thua]"/>
      <item value="111: [tk_kk_thua].Label, [tk_kk_thua], [ten_tk_kk_thua%l]"/>
      <item value="111: [ma_nx_thua].Label, [ma_nx_thua], [ten_nx_thua%l]"/>

      <item value="110: [ghi_chu].Label, [ghi_chu]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &Check;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcBuS9Ne9fT2FQVO1ZC1myt/dtfEDp+28q3SS9WSS4hHLtRMItLFtjFtIgkl8xQj7yg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &Check;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcBuS9Ne9fT2FQVO1ZC1myt/dtfEDp+28q3SS9WSS4hHLtRMItLFtjFtIgkl8xQj7yg==</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNI7MmU4LYahXZQ2pNs1uDSyOGRaAQZG5NvTJ8Dri4I5hmUww3CtEP1xxNBFfI+U3RgW0yy9mF0QiJgSks9lJ30e8hdwHWXocG19Gkjts1tX2bJM1rCHONzUU0Z+68k+yq5EHf3vdXNN9TXVc/gnGONm9kFLMgqXFCdjzep+1XPHKw8u3IPyjUpL/vAcnVhT0SvWaLdUudmCiHEVePPpw9Po8knquydomsQsQN2ldywDwCPW03QyVPmonDOEsa02vDFq8JSV1GL3O7IDU8fVyHupd3fm3S7pwJpahnsrP6Kyy0bTmJsCiTlbnRTQYFkrC2KRrZEKneVhG+IJRDPH0sfby2vThObwctbG1AiM1o9pBniKfIl6dxmNGamocvJLv1hR7z4NiRkBh6ho5nJQrBdQEMb5Vy3rN/ouOS3uCAbhJ0CwLe+34VzPZQPKfgWdUqZbO0tnOjU9iw5Hmms4vO5zjk1A4E6/LzFp/D7Lf4ii9g=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7COsECWWyn98Rc/nJxknHJsz5zDqd8SFqARqC2V+RDaXwF33Culn6Cx1pRgGOtohdf/iTj2nO2CyapZLhfl3L0Yz01b89Bg3r8h3GEhGt9GVe4dCb9dAyqqg0QW/Vjcl/3MPRxY2PCwJnj5vmAbd7XaxraPoVWPJ1NYohxtVBwmEPr1S3UtGtDcwFs4gtNoG0v</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp9ozwmNWaFXFGEKfmQZvzte4EKdMhLUEJ4nUER2zh4COONR8zqferpPJ5VsltPPoMyw8wSmSXxwgIDV1DYC+NqjsY4vP0947QkHhIHVeAYlzeNgALLqY83hkenF6wJlcXBDSZ7NG8YMWNcA+7vP6J6LDe/Gdr1+2KTy70bPBoB+/8OQdEpqneyoa92sh5o8nCvN2/6deIu5EqSKdDmJ3I1i1VWmQjNQ+9oUY56TgLkAuX1R93dC3oZQrNLKINinTUQ=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV4QQfZcz+1YOoyxk05eTubctA4p66065h4yjvxYUl2ui</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22alPjDnV4JapQMqYNEp52dUsFiuBX/iYGBOeR/lqE321hTMnQ3rF0X8jNlGSJdBqqBSOkhTUi4RRejGWS+0B5PD7mI6KzVs7D1m2u2o0iJqFt5e8Ip1tzpAkfFjLA9kQ16XrobytEkmJrCGn0hsPj143B3Zs2Ewq7VnMRLGlVq/P5GWFbXnsrYajKa6g7/VoTZMmTTgOUMhbBDtch8PxLMk/6NZtZN7rwLK+bWAfzlvD</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJteQX8aWWai6GJEKhurLCFVe89KFkHtzYi8tIB3LkxFCS4uu9e3N1KxSEedFhdapFVWoRwl94KZxDG4BwfLUj5ZmD8NI2D/j8Lvscl/04zjh26NohZx62rkngeX+0OV+j0YGC/Ftu9eAg74o3Qa1pVu0cfwvaO+ePUUi2lFgkGrDPu7tXlMo+KOkr8MPlqjKFiB/DZ7iCRJHVoE7qdBdR7+naRfLh7xxX03ofvB4C9nXnIanIrp6YoQDFluARgI263g==</Encrypted>]]>
    </text>
  </script>
</dir>