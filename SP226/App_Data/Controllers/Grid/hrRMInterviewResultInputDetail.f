<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="hrrmkqpvct" code="stt_rec_" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>

  <fields>
    <field name="ma_pv" width="100" aliasName="a" allowNulls="false">
      <header v="Loại phỏng vấn" e="Interview Code"></header>
      <items style="AutoComplete" controller="hrRMInterview" reference="ten_pv%l" key="status = '1'" check="1 = 1" information="ma_pv$hrdmpv.ten_pv%l"/>
    </field>
    <field name="ten_pv%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Nội dung phỏng vấn" e="Description"></header>
    </field>
    <field name="diem" width="100" type="Decimal" dataFormatString="@markInputFormat">
      <header v="Điểm" e ="Score"/>
      <items style="Numeric"></items>
    </field>
    <field name="ma_kq" width="100" aliasName="a" allowNulls="false">
      <header v="Kết quả" e="Result"></header>
      <items style="AutoComplete" controller="hrRMResult" reference="ten_kq%l" key="status = '1'" check="1 = 1" information="ma_kq$hrdmkq.ten_kq%l"/>
    </field>
    <field name="ten_kq%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="trong_so" width="100" type="Decimal" dataFormatString="### ### ##0">
      <header v="Trọng số (%)" e ="Weight (%)"/>
      <items style="Numeric"></items>
    </field>
    <field name="ghi_chu" width="300">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_pv"/>
      <field name="ten_pv%l"/>
      <field name="diem"/>
      <field name="ma_kq"/>
      <field name="ten_kq%l"/>
      <field name="trong_so"/>
      <field name="ghi_chu"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiF9PytaniaXIjIGKSeOFuMaq2R/dSsL2z91S42vHdFD5731+KYUH0A8/n8pmjAKi81CCtI/iNWKU4Zf2YQP1Guo=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiPfDbQH+eNOEniFMwhrnDUHwutoQq7HkKXVcT7kygPW0Lcc0fz1a0Gkvc4aW9MWr2z+WCeK2batD416JE93rVN8=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hlh6HCyoOBhYFDOqacC/XVK7dn530n0ygmS1XVZfK23OYMQkAisl3dxuUazuiLFWVCx/ZloCFYpmi4glVAUCPXGEwuFXaXHubsDSUiVN9CtYv6xGlUBQEzU+bqd9IO5UiV2kqxoSkYMtNPyeUytCqhaHxty9Xjt9FBjUPa3uklO2dCqMZBAcclckEy7cczPX8zy7j2zwDPFadUhWwnvkKIpKsWFYLhlI038f73B2sBwJpU9xjj3Yy/917nwgiPnStLo/dVxbVbni9RhShFPmLbCNp4SqrZ4Wx/ChocEyYgg9GtuxfORin1OFWZmjXnM+hQ/bniemGYL+tbIbGYRRHs/</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1OrDTQdK1c5LVXuryLCGmoS0KXcExNhLM+s3fk22C0aLgFnVvjy8XMG6ky25BLWTeyo0jvhXu5IgStatoJB4BivQyq5jthYwAwEILNaZQXO7BTuqkNrZlSDbWdJpGfKN8RJxAY7EAl3Ygr9zPNR26o=</encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;
</grid>