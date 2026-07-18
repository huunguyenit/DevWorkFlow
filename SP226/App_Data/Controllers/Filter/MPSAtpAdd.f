<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY Identity "MPSAtpAdd">
  <!ENTITY CheckNonworkingDate "select @nonworkingDate = dbo.mf_GetWorkDate(@ngay_yc)
if (@nonworkingDate &lt;&gt; @ngay_yc) begin
  select 'ngay_yc' as field, @$nonworkingMessage as message
  return
end  
">
  <!ENTITY SiteKey " and (not exists(select 1 from syssiterights where user_id = @@userID) or ma_kho in (select ma_kho from syssiterights where user_id = @@userID))">
]>

<dir table="mpdh" code="ma_vt, ma_kho, ma_kh, ngay_yc" order="ma_vt, ma_kho, ma_kh, ngay_yc" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Thêm đơn hàng dự kiến" e="Add Promised"></title>

  <fields>
    <field name="ma_vt" isPrimaryKey="true" allowNulls="false">
      <header v="Mã vật tư" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="loai_vt in ('41', '51', '61') and kieu_hd &lt;&gt; '0' and status = '1'" check="loai_vt in ('41', '51', '61') and kieu_hd &lt;&gt; '0'" />
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZao1qGGTjWf5MN6GiksP6tKIr48GQ5pfr5xOcvgooU75</encrypted>]]>&Identity;<![CDATA[<encrypted>%PA75nToWZn/3d/RFaY63vxLt6na8zQrNYad98Sr556IP98thb5//zsI7je8noVoG</encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" >
      <header v="" e=""></header>
    </field>
    <field name="ma_kho" isPrimaryKey="true" allowNulls="false">
      <header v="Mã kho" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="ma_dvcs = @@unit and status = '1'&SiteKey;" check="ma_dvcs = @@unit&SiteKey;" information="ma_kho$dmkho.ten_kho%l"/>
    </field>
    <field name="ten_kho%l" external="true" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="ma_kh" isPrimaryKey="true" allowNulls="false">
      <header v="Khách hàng" e="Customer"/>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (kh_yn = 1 or nv_yn = 1)" check="kh_yn = 1 or nv_yn = 1"/>
    </field>
    <field name="ten_kh%l" external="true" readOnly="true">
      <header v="" e=""/>
    </field>

    <field name="ngay_yc" type="DateTime" dataFormatString="@datetimeFormat" isPrimaryKey="true" allowNulls="false">
      <header v="Ngày yêu cầu" e="Date"></header>
    </field>
    <field name="sl_dh" type="Decimal" dataFormatString="@quantityInputFormat">
      <header v="Số lượng" e="Order Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="dvt" allowNulls="false">
      <header v="Đvt" e="UOM"/>
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="ma_vt = '{$%c[ma_vt]}' or ma_vt ='*'" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
    </field>
    <field name="ten_dvt%l" type="String" readOnly="true" external="true"  defaultValue="''" clientDefault="Default">
      <header v="" e=""/>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>

    <field name="nhieu_dvt" type="Boolean" readOnly="true" external="true" defaultValue="cast(0 as bit)" hidden="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="ngay" hidden ="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="ma_ky" hidden ="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="1101: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="1101: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="1101: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110: [ngay_yc].Label, [ngay_yc]"/>
      <item value="110:  [sl_dh].Label, [sl_dh]"/>
      <item value="1101: [dvt].Label, [dvt], [ten_dvt%l]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2n4f7jl0jX8hzbsWRhvYc+On9S5oefEl6iw4NanziAh</encrypted>]]>&Identity;<![CDATA[<encrypted>%NmEUrF1m3jr6Ejr66cspTDQ96NYbtYbWlzOtD1KGwO6GuOUWwjyVUOLEhXduU461crXlV6rVnME2yTyCQX0Mcg==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwSZFYAj65RYzXb1/jCQS7LbKpA54gCakU+hnjiXOE3L</encrypted>]]>&Identity;<![CDATA[<encrypted>%NmEUrF1m3jr6Ejr66cspTNQJZcJNdI/YeCPfOKF46TfJnIzQC9M7mIgFIXJ7FZYchZKVlWwzwrCrIQYqPcAgNg==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbRkwtiYysEYwgW1sOydarFUxNxC2JLldIRjojJyBYAdQ21uALgwvE3DIVu9PDqRSe4aVWr4CsI/0EmHGm6LSiW0pjBfc0rCt49IIpg6OccUQ/uNwAAt4q9bVXxrrHNQvOAozWMtia2qv3s3fwGWlSGMNyeRa6/z13/KXCjs3QAuwOR5pGXBfASsZBekHWcEErUN7sQ6vgyKO6+JXl94WHQOe+pJ4G5LgsWXMyQPna2NkOQ2ro8h7f2pIOuTap5Bfh0Wy3TIfuxfBswSdMaOk5kfsWYwUpS8Qf/onqb5Bnxh4IOYbVjDpmpzYMOg8EXlDH8hqtHOKQAPBHXZRLq0b1NB2hR+hAnJJGrqYBcDcoAD+KNA3zbxjxM7emo1XexWUBM31k+9ML18nJZ/BsL43VcRqANPQN2LUq3n0vUGSpqtYmq2+f+WRwplWNDWIgwVDDSafHMmcWO19YX8d8rZ6KcPmRtEqeikfExbhQh+fgZaSVu7hF2+wbhHKp0jmE8P164=</encrypted>]]> &CheckNonworkingDate;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK60rj/p1FnSlGgbFWUjXAIiAa+GHCHbdPhZidIb6BYGSjSAMvjXtOXW/xJ6ulIADZ6mjzLpKiv1C2di7IqVZmvr9uZhdDBc83lglQdG+HWxmeBRAK/XEXHqZb3xpPt+gOfvES0pjD8snpEStPnYvYUUJj81FgnUK0oe5oLHihPmhvcHIy6nTdh7Wak7X3g0tViHgMqZt2uUMxzXFuawUTzfUmdQkmol+ynPPNzvsZd4YJ2jY5e1z/9Kffo13/ez1f4dLeBFH4qYCxZXJ/rMDGs9+Dxpiz/gV5d0NNH+BLJahRPMYTeLxBPID/VBqFtTeKDNILV1oQNiPqUdgPMXRwAAF+hVRcotKGBZqy8QpBqZtm5iSuaCUXcaByfUbi24vnwF9ywrTEN+qeNWCov5336gJVjUEqUfX8Kwp0H/swPW4UZ/ckOy0xOpB3vNfnGrZsnStaTJDMpIhdTrvvVRmL3VERyQTqQtU4T4kGdGYgKKAfCgwNdJrjQOnpxMonWKt0Bb+/wkVloWgu5R6lGObnjT</encrypted>]]>&Identity;<![CDATA[<encrypted>%yb3r8nYg0FPwFXMJ1/oFI9XHjryUj/B4RYp/RLUgzzj5HfMSi3nEKG69NwY5yBjN</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70A4fLbLV3kHxv6jagmvQXiQmVKU4qOaErPxnpphD6J+4</encrypted>]]>&Identity;<![CDATA[<encrypted>%NmEUrF1m3jr6Ejr66cspTG/mma5v/bCXtg7Mbkq3pCWlnIx+iiGNPACmO07lKdcWbw30iGqupFmp8Q9nXnzQ3zu8vm5bAPYn06le4NlxviQ=</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfNrUrAiffDy1/u4VVqG34lbCCT44PWOSXnQKxvUeNY4ay2tBxuAR6SW8JrU7mYUeHU9hAvVJzaKo65Wvr4oqFLmXdVee6sLe342/pKS8HCEfMFoDz8iY0cIWopazkSYo0s0baKfcH7JvR/1u4bxf5CPHMlbJ2UqVFO8PgvdkJMR1SO04nV5F9zlYGx57U8GOYNVtUJjTfHD9+4nEhwvTBJo5WYR8vn6AOWGoqV0M2wFsVXbrvbatJNDZp6VXhD237uABkWxGvTm+6Du5t3aA76P66wT+b7DQkriufyq/QMJg2pR1DUVcRQJfifAiRa+DVivwNB8ddILBtNtIRutcRPGBrz4/IwenGqR51F5M+rHQ</encrypted>]]>&Identity;<![CDATA[<encrypted>%NmEUrF1m3jr6Ejr66cspTC6wzJsT4JTFX4gXfH6qNPMYMY7j+QsmVP6tqBSvQGfyD2s/ZS+zd+Q2a/RragL5YMBI6HTTEY1s3thF3KA5YGc=</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfIeVkwsumXazuM4SZLvv/LQsV6CVelrJyOleUwhZ0dKPo2DZQu9ePkZ9/KdcskrYgKteW9PiT7YzqA1UtH4ikig=</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfCP296pKBalKUNxwEp9xtIUOVoLDXukVs3aJx6k42PvkPJ07oj/kAY2/EgYfXsncdPRw7yuIrLDhK5G4xXEgSDwqz3yhbRj9AW0C6RDC0mRqTcSmKvEyFohjSx2OLv0DR7f4BX9DmyoxeDqN1jLKF8Ye7gJbIPJYT955sBP7muuR5ofku6dhac6RWTWfzsdo+yQV4BKWHQib5xOE44+7QxakByvh0kmfnbCHb/d9hczmZ7dHnPf+8Muz3I5MNYkF9BY0eDvsp/OXDyg5Pz/VownVQgHNCjyFurMRYZQTnwgZHOVskIh0H5VQfmJmv2zEhzpFMxdpvsE/sbbjGic4DKhY2u1zLiKWMYF/kqWjThNz</encrypted>]]>&Identity;<![CDATA[<encrypted>%PA75nToWZn/3d/RFaY63vyAYYHHb5z0vpdpk3H/vBhnfeS2o4v2XrxQQ3H3MyIR+WjB7O35h9PsXIS4LBBr4ciflM8j9x5UqXtyNdJnV7UEHGUS0thMmp2ayBADA2HWFnFdm6YyCN+PDrUblsNCcXA==</encrypted>]]>&Identity;<![CDATA[<encrypted>%rnZ922lNpfjaCeWsVZkA0WZiYw6XUQtQ2WPvtce3XMnKO74p3ki8mgcOYlfWpPTzkgVnUGXiNMswCiwAZiLwbgPlCPAUQzco1UKYwndyj78=</encrypted>]]>&Identity;<![CDATA[<encrypted>%g6LJuSQbeDI2wEReHbGoSqGQKZRplSJeztd0hTyenASR3INIv+OTM2Wz1of2PBZkx1I392TvyWrSXjVX4DY+Yg==</encrypted>]]>&Identity;<![CDATA[<encrypted>%g6LJuSQbeDI2wEReHbGoSqu0ccC2CWxMrW/5UseYsH5vW4fUyByPw0/lD8EvFfnR</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Item">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK6+INkQWNmjEwlPl+HrVfmFbZmcLoLaTcoJ3VP26WNLB0fkFBlTg4aNqUgTXZEebRR9/hO5IfyyAGIM+5acTIJ+gkRUosVrxayV7KG9LutCZOPy1pbari0RKckzV+1JPLDAQKUnprZCEkib77mY6MUhLspErG3GGM+whdbvBvNhog==</encrypted>]]>
      </text>
    </action>
  </response>
</dir>