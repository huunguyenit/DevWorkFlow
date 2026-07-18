<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY k0 "@ma_vt = $ma_vt.OldValue and @ma_kho = $ma_kho.OldValue and @ma_kh = $ma_kh.OldValue and @ngay_yc = $ngay_yc.OldValue">
  <!ENTITY k1 "ma_vt = @ma_vt and ma_kho = @ma_kho and ma_kh = @ma_kh and ngay_yc = @ngay_yc">
  <!ENTITY k2 "ma_vt = $ma_vt.OldValue and ma_kho = $ma_kho.OldValue and ma_kh = $ma_kh.OldValue and ngay_yc = $ngay_yc.OldValue">

  <!ENTITY CheckNonworkingDate "select @nonworkingDate = dbo.mf_GetWorkDate(@ngay_yc)
if (@nonworkingDate &lt;&gt; @ngay_yc) begin
  select 'ngay_yc' as field, @$nonworkingMessage as message
  return
end  
">
  <!ENTITY WhenBalanceBeforeEdit "
if @@view = 0 begin
  declare @$checkVoucherUnit varchar(32)
  if @@action = 'Edit' begin
    select @$checkVoucherUnit = ma_dvcs from dmkho where ma_kho = @ma_kho
    if @@admin &lt;&gt; 1 begin
      if not exists(select 1 from sysunitrights where user_id = @@userID and ma_dvcs = @$checkVoucherUnit and r_edit = 1) begin
        select @message as script, '$NotAuthorized' as message
        return
      end
    end
  end
end">
  <!ENTITY SiteKey " and (not exists(select 1 from syssiterights where user_id = @@userID) or ma_kho in (select ma_kho from syssiterights where user_id = @@userID))">
]>
<dir table="mpdh" code="ma_vt, ma_kho, ma_kh, ngay_yc" order="ma_vt, ma_kho, ma_kh, ngay_yc" xmlns="urn:schemas-fast-com:data-dir">
  <title v="đơn hàng dự kiến" e="Promised"></title>
  <fields>
    <field name="ma_vt" isPrimaryKey="true" allowNulls="false">
      <header v="Mã vật tư" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="loai_vt in ('41', '51', '61') and kieu_hd &lt;&gt; '0' and status = '1'" check="loai_vt in ('41', '51', '61') and kieu_hd &lt;&gt; '0'" information="ma_vt$dmvt.ten_vt%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZdljSiTY645lG3bzWEZ0d4NJMty85HWpgc0gEy+lms1qEKlnlyq4Cxm3Ptsr129yCQ==</encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho" isPrimaryKey="true" allowNulls="false">
      <header v="Mã kho" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="ma_dvcs = @@unit and status = '1'&SiteKey;" check="ma_dvcs = @@unit&SiteKey;" information="ma_kho$dmkho.ten_kho%l"/>
    </field>
    <field name="ten_kho%l" type="String" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""/>
    </field>

    <field name="ma_kh" isPrimaryKey="true" allowNulls="false">
      <header v="Khách hàng" e="Customer"/>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (kh_yn = 1 or nv_yn = 1)" check="kh_yn = 1 or nv_yn = 1" information="ma_kh$dmkh.ten_kh%l"/>
    </field>
    <field name="ten_kh%l" type="String" readOnly="true" external="true"  defaultValue="''">
      <header v="" e=""/>
    </field>

    <field name="ngay_yc" type="DateTime" dataFormatString="@datetimeFormat" isPrimaryKey="true" allowNulls="false">
      <header v="Ngày yêu cầu" e="Require Date"></header>
    </field>

    <field name="sl_dh" type="Decimal" dataFormatString="@quantityInputFormat">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>

    <field name="dvt" allowNulls="false" inactivate="true">
      <header v="Đvt" e="UOM"/>
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="ma_vt = '{$%c[ma_vt]}' or ma_vt ='*'" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
    </field>

    <field name="ten_dvt%l" type="String" readOnly="true" external="true"  defaultValue="''">
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
    <field name="dv_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true" filterSource="Vacant">
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
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tObRRqNkcFmdWRIyaBBzi4doOcu8IuRUPwd1X96Ql2TfRbQnap5ncQEQf/RsjTFWeJ</encrypted>]]>&WhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tO3HNrfK4muhG/kd9yVd/Lk+WaO3z6/iqtWne+8/DmAQSsq5gt20Gl4Dy3k6JYbH47</encrypted>]]>&WhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfx0TKzd6yL2BlhLuCXsLiYLDNkbb3RpRzNhIUriN+Wor1YZS+9raDRffKFtIJsn5CJ8NBkCN+RJLYSPw9sY1DOE=</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6cFl2Q5RK/TiOuAq3qbDNycwrzWSw/X+bhtIuqOyV9bL3nM+wwck/yxkKFEgqwDci6iA5PjshUkxG4hHhyI+aTN56/lf84TG9bq21B8UkmRa2a9qWYYRKTr2yWZv4+A9q0Rx+uML47uEHC80ay7yroPEM67eN4F/37P0ltVhzoL3dK7pOETSUSb/HosBEW6A0zNt5vKlbZBdqNq85vETgUZwvt4M2GLvMk8+2VqjJ8ZiajSa7EMJ0fBLDg3NPOx0eVWvUhuunQnAFHTjkSdi1LsEtS98+53yJm6eS3dy1Yzyb3dgIfVhLlzO4WegM0nq3w==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WaN8MSyJECa5wYt3cvTqaI8vH6H9DzkjzkKtsmdwdwwN0pwe9LWZAm199ZUISfd7/2373CIzVnGndV0+JcdhtVwNLyango0R6dzMGiwEPB8hsK2uuBnIl/YbUmhFE7BW6Fz+xud6W1MWiu8tcckZzL/fcj6A8xaSJbrfBT3WlnJeIzkk9ro2AaLtIDJ3YOn5Wl6hwFoGN8NC9t+bclf1N4ufPH5ikg2C3HGfjAhuRz+Mq+IlESRe0JMFHogD+e9BlBjNi50zDUGiqUsDdDzRZgmr0RlQrinFFRLObunuTkQlK2BH33F0KkLxG3I/5AjPgGsFCHcooQFVsharH8zu6Vhs//9BHqUbQSj0g1ts0GOPU0Z1xrkWth7udZR+EzXpjbP6nj8YTyuc0iTulmVLaAfu4VAZ+3UPToteV8cGjz3DOULpoWTiyHFfWUauNX8hm8HKF9D/jeZpjCcjMewmERvdxXd8BAgAZN+KuJca1XCNYeH0mZOpzExI8/NVXP8rAHv0mpWu81npyXHv4PQJpaGNz7Q4NV3feZsLIs894ora13/A1GCJXB/pjGK+SdcrcsFLk3vrfSARkoJ2KS/0KxUiK7kYZSvimy0EnUqa0hKx6BAJnIjcoUTpZJVKbJI14aLo98xiRLw4ywPpDCUJJYcHhEZMEkOmDKtWYB2zVw9WVPImZXfgG55rDFLrCHD1R</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CheckNonworkingDate;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3chGulZx9js/QAMlXiOyoG+w==</encrypted>]]>&k1;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cN+5r5DGxhHZBSzn67khvmjIDzFnBUVI00k8YoHNOPJQ3Iul01Hj8lYygwEE6Yv3mUTb2rJtoFaD+c4SB6RDZkTvJAPvWgjD1E/p+sVhvORNsdFfmUBehnYoZV5cJVTMt1RecjnyYd/uLg9LEv7OT4hLaFEPbCv1CmZlmFEwg3Ye3tv3da1ahQiao0W1KMojz6z8WWVEAPkVpqJUKJWJhDvPGP4cJI6rxWQNUAU9ga8xcq+zwJ3xUaOpyh9F4bfxTjIhY7TjX2BGrRXF0omymJQV2l08y367MYFeaw28T/rpAZ1JB4p61VMCuyZvex0dThWOd1Pny4FvIPurU+F+kUUqboelA8kbR/LlqTOupHhxwvvMPNXVju3BF5NPwsGvFw==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CheckNonworkingDate;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jHIfhvN/FgzGs7XWCpp4tNw==</encrypted>]]>&k2;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cN+5r5DGxhHZBSzn67khvmjIDzFnBUVI00k8YoHNOPJQpnkuQD2Rs0i28arvqpK6zOlFEkjL3aQaZXgBB6Hr2t5EXriKDpuEXziw9Uq0wkJTmxE/leHjOvAzAtf2VHPe1t7BSWFVq8QLNdi4WFZL4fprzkJFcoV9/VGOHruTfdkSalHKm1oF7fy45QJrXKb5UpLXoL1tTokbZPKHoWNLWDovTjLKn/Rc9lA7rzPOlKL89W5H9zm4/Y4W1q96C2V6NQ==</encrypted>]]>&k0;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cE/hpETWHna8gLwEu3sbtN4/gTNFFQu0uenpQvEOpfKo64C+/GJR6A+stLGmvWCenQWjmiZXH5Ms/sggehN2p6w=</encrypted>]]>&k2;<![CDATA[<encrypted>%ShDm4LooPFnWfxWGAKIehxn5IEU5hwC3K054s/5gYTI=</encrypted>]]>&k1;<![CDATA[<encrypted>%ynJ3B2IMttZ3swIzstMMYbqlZD4zfaX6Mwe4vIA/i8ajDazlWPxsWwcCx+IV99hj3HrL4I7/gnWUAviptuc8rIMRc2icULTPLM8mJto94tPvbMagVBVHBzyXsVJRi59GgJK7GLftYteZDljziMOOU9orrGUcXtvW2pREaa48kA5mw4Tsy+B9R9OJkcGVx8XGhLgczT2pg6ls2sUy5hcjLmv2AIidntDySwG16xIK/s8=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6ZJJ6uLqUEg9/8nnu/Am9v4Uso3eeFRCMrU48wfCcc5+9iy7q9bNkMv4RawRypi6m07scemnQ+XibhJkuG01LJ72+Qw+mmlkDbXL+TXLH0d20saNI1wzqd0hj/PmYg+N4CXdr105ZbnIAFiMehrq9tSpOYtYdwefdtYw3y8LA5vtRcmEylTo6zy2s26g2XVNbNv1Ehnay5bAdZJkvx7aJ7IYUAa/n6GK7HX2M/6jkyI7jqlb21KGTrnrsKke45nwxA==</encrypted>]]>&k1;
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHbRlm35iB6NXDlnsXzsD2LVMn5Vr0FCXCq1N+zGzi/YldXhYNp1I3kUb3Afh4dG69BtmrbuFpM17ZQZ6PU6//m5G8mqFAA7FldAGZa/51F3uteUgPVI5FMP9vH8+XDteDZoIeDMIq90yMiHBuyNDT0555UyEShqfV/k9iwNVPd62RP2l15bjcKyOE/OLmvRsI/G+7k6v0jcd18AsthznHEyhhpBFUnwPTmYBnDUOxKSdHwQULDQu0j85w0ZO4kcLnv1Nka45xlJWph3UKM6Z8MFndjMTSBpHXzh3FVIt0Iibg==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkbhrpvGzhzZWs+I+K9rVjudTbTBZb+J00S/3uTqbbn6i0Ky02Q6CyIoXqW6gr1TZbMKBimi4WmOrf00wg+jJU+XGmkL6OB1TkVz6zDCDPFvFLR3OG/Snf0NKYUiTQR/hARh4c3+a5qQCxUeQ5TlNNEXb+NyNX1rmyVaGwTEI+aq0IsCMtI8UybQYPrmnpRhomM/doeV5EzPXIEGZkOAIgMBe0dDoy3YxtCykKVDKUaSVJvnhNy6tlnKitKgxpcbBMbwkzJ5IFz8UB5gvkwYS/3oG95ImuF+tgANIUdje+Nz5TKJz1SCwONTXYnC99zyhdIK6TgzksR36n+tndk8Vqx+g+gKiNLXH0m4UphtlEfTR80LLszPsTZ28/5rQmNId1uhCvkeqoaOZflGI8dGXDTZHubJQfFZKfvnaWHzuBc/lxR9F/PZePjSahPfy4p41riQC2sbc3ldDqpSrFpwJ9Jz2DbGbVadiTuuELNgqNs5JZdKxEEuyrP9uXtr5XhQd81lXZW1OR/HE6nSZD1avSbI648IKIR2hwoYqm6BTUfp/RgWqaHyJR1wb1z4nnbH08dAk2IxH0gMeH7hn0r/y0eTobZRF1stHDAPuJgdPvrdrtZ9XIxKtZ21mnh+07bFVRX9ucp57/FAEcycgo9fRihJ</encrypted>]]>
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