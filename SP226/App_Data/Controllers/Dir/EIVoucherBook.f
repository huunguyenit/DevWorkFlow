<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY CheckEmptyField "
if @ma_dvcs &lt;&gt; '' begin
  declare @v bit
  exec FastBusiness$EInvoice$GetOptions 'm_ky_hieu_hd', @ma_dvcs, @v output
  if @v = 1 and @ky_hieu = '' begin 
    select 'ky_hieu' as field, @$emptySerial as message 
    return 
  end
  exec FastBusiness$EInvoice$GetOptions 'm_loai_hd', @ma_dvcs, @v output
  if @v = 1 and @loai_hd = '' begin 
    select 'loai_hd' as field, @$emptyInvoiceType as message 
    return 
  end
end">
]>

<dir table="dmnkhddt" code="ma_nk" order="ma_nk" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin" e="Item"></title>
  <fields>
    <field name="ma_nk" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã quyển" e="Book Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_nk" allowNulls="false">
      <header v="Tên quyển" e="Description"></header>
    </field>
    <field name="ten_nk2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="mau_so" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mẫu số" e="Form"></header>
      <items style="Mask"></items>
    </field>
    <field name="ky_hieu" dataFormatString="@upperCaseFormat">
      <header v="Ký hiệu" e="Series"></header>
      <items style="Mask"></items>
    </field>
    <field name="loai_hd" dataFormatString="@upperCaseFormat">
      <header v="Loại hóa đơn" e="Invoice Type"></header>
      <items style="Mask"></items>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = 1" check="1 = 1" information="ma_dvcs$dmdvcs.ten_dvcs%l"></items>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="lstuser">
      <header v="Người sử dụng" e="User(s)"></header>
      <items style="Lookup" controller="User" reference="comment%l" information="name$useinfor.comment%l"/>
    </field>
    <field name="loai_sd" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Loại sử dụng" e="Type"></header>
      <footer v="1 - Phát hành hóa đơn, 2 - Phát hành phiếu xuất" e="1 - Invoice, 2 - Issue"></footer>
      <items style="Mask"/>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 25, 25, 180"/>
      <item value="110: [ma_nk].Label, [ma_nk]"/>
      <item value="1100000: [ten_nk].Label, [ten_nk]"/>
      <item value="1100000: [ten_nk2].Label, [ten_nk2]"/>
      <item value="110: [mau_so].Label, [mau_so]"/>
      <item value="110: [ky_hieu].Label, [ky_hieu]"/>
      <item value="110: [loai_hd].Label, [loai_hd]"/>
      <item value="1101000: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="1100000: [lstuser].Label, [lstuser]"/>
      <item value="1110000: [loai_sd].Label, [loai_sd], [loai_sd].Description"/>
      <item value="1110000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRdq+JMvaYUwdjDYqWqhq21SKXY84ucg/nMIDEtTVo+uC/plL3hM22HvKi2yVmiEBgTeFUY3KI2H1w90GUWLT1HzC8jfCJa8bJJUr6XI8tkESqTmSl5eQ6JmyNu/7NXxpERU/9eYx4RuOrdwaNCfH9It8mWA68X5+/j/ZqzsiOMjC0Zf2dXMLTrqZHrMxW857jtQ9E/4WOtWPTUBUvaJIaxwd2yl23fqsiEUMKMU+AIicoWnKbQPkR34Cg4v7+rT971n+x+wbQCKeEl71JhvIpBV8kbXnwmXsaB9ey4yZQ6Hy9P5fiSuqngvPUeoGYsmw==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfx0TKzd6yL2BlhLuCXsLiYIAabrOPqcnlVSaQKX1ALtoGbxKzgRNUhDTHVytKCPBkSqoSMJfPsp3PmEblBTxDD4=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5LiRvYVM6tnRlAzaykkVQe0juIl5Y/o3YtSuLSo4s1vvjqzHcGpL7SMNj0tkD40QPt7l48HGLYsOmz1w2+UE+E=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WaN8MSyJECa5wYt3cvTqaI8ueYZyVmuGozdi5E6IAjel+emYzy8r+jLXvxW4JBf2N7elae09ZEHXEPbSbMuPFvk9LhYJ0t1QHiMnSp5VrS9CIyrF8wEeLZQxT+6cQ4bHd2tSfEghiGNGrsSthouukQxBfLw56smxR+Wr8MVpt33+DoLeN4l4/r6iE83O8WBZCZlyfg5g+aKfqAtxnT18yNoR/cuHZk6VWAeaxO36WfE1GF+scakX1BGJu81S84MVQPDxCjhTyIf6Yj2gMDUA2KyOwSaO/dSUPJR/mlZzY0HU5zP93QMjNzzeuhmHPBKJS9SgvCrUhLYGrKm/p2XnQR4EeuF3LbW060krGlTJWEdIqTJj5xR+FvMc0ugjGDeOp25c/mw7Q/Yj/Y7UDMI2EKJ+Y5bRzLXxpmwZDTDDDuMcwRunHoJCvPAn8seCAIkBS60bxS9K/pGY9WUrZdMbfTJDppMsnfSL3j0yFE+tRUkKpebKb38T6Rku1ycNcXpufiBaWYd1HHYNJHcxSGCkgF2+8IKxqn0u83TogrtE9H4pDgjNXzoO99XxVrB3GYuNUaHRlFtLka1q/ET1n8Sfe7YEhY4+P2+ZRSH23ZM1Rn8iUIro+y9uuObeOPiPggIyJLsbHMmU9+if1YpDkTtkebjPmxfAuhziav9GK6KPK8FjdWaTmFuHBLdnwgF4nR1RkWOhe71T7CAKwZ/IB4SXtbQ==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CheckEmptyField;
        <![CDATA[<encrypted>%gq2ZSuGLKVqs1RidX1LnIwGewx/6ETqXO4Mguxf1iFQCulYyYT6IrYHmyaytjujxzKO8W5ZSy/4GP2Ifu4XfsWiQzzAzZrdLh1lrZphOppUQgtnsJYaKiH+1FxsW4NOzW3atypHufvDo1/ZtKslj8oxiB9s4erORmjqCUiDFYGMUKT1/gskYPhBfbBfXloCjudAZFkwENYfSpkqbbMp9PIWWDzSGI4mvyDJjSzm99jHdtGbsM3MTgY7RtIcMsU4xtXW4x0FGPTk21SRGIM2YdCHqqmO3AfRHRoCx0xYpwJs=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CheckEmptyField;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jo6466a8R4CE1FVR+qWo5ikAowGKMl9Km8V0eVN00h2Q+plk9RDpd8cXL05emOVQi5nic9zRequtSHhE78u7348xwfIL1HXoR8o76cmRKioRzqOnRJvQOnKQMoChlcwW3hVCini+T/7J6uuaR48RHrngJtT9Oa0UUEuMUJAVcEFetk71OC3wdf7bt5+e9vk+dyBV6bxU1bgi7H2NBNe6dn8L6GHTc0PhMrQ66VaeQjo+F5dCKb93eTw8GVz2o5Zt8</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbesApwX/xuRgy1yxsVBI48kbNbMjoPa0QNfKFWSMkt2oL</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%j1otayK5ACecpldW/VwtPGExdfcgqoA6q3bCeVirNlHnr3dP0yxjfW3cTBL9Za/KsnzsX2NMdX8y4H8TUGaU3lVP3AmLJsyd7Pv7LLVkFY8lU9fUVz/HR3O9maTzrX8F8/00btRD3YFCPwHd0ZSChQUInS9zAjUuB/J0tOi0adeJc3rFfx/htpgoBUJvjd7G75X1FNF9ksMMrXMtWjvxCAZcxvu5z4fCotkZ8djzAA4gVvcnEp9ylgN/703Amp5Tf+lyIAtOu+ifzpKstDy7Lr0sxvWcoQhidTj2lv0XIfSGxTtLLd8wBxpDTGHHf/M+CBQdeuHpSGUulHPFxWioX4d4YubaTl200bp67ZPrA1v0qS3lxTb7LJQ2EpsiSdunT28EDfPGppaGko14UixhdVFzKLFaHYLFE3gbDw5vZRLDpzyZ4+6U8J8X2ZsZQ3/TwZEKjZdrcUnv5X5b/Xf8ZSKwFthAxwwYAzWAmJN41K5IHQQiGWDUyaozD9RnaKWH0KXnzChX/Ng+a+hXcl0N5w==</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  &OutlineCss;
</dir>