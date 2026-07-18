<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="dmdcct" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="CC2" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="dmdcct" prime="dmdcct" inquiry="idmdc" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="ma_bp_dc" isPrimaryKey="true" allowNulls="false" width="100" aliasName="a">
      <header v="Mã bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="TSDepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1" information="ma_bp$dmbpcc.ten_bp%l"/>
      <handle source="dmbpcc.ma_bp" foreward="true"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên bộ phận" e="Department Name"></header>
    </field>
    <field name="tk_cp" width="80" allowNulls="false" aliasName="a">
      <header v="Tk chi phí" e="Expense Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_cp%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_cp%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="so_luong" type="Decimal" allowNulls="false" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="Default" width="100">
      <header v="Đơn giá nt" e="FC Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="nguyen_gia_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Nguyên giá nt" e="FC Original Cost"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_da_pb_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Gt đã pb nt" e="FC Accumulated Allocation"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" inactivate="true" readOnly="true" width="100">
      <header v="Gt còn lại nt" e="FC Remaining Value"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_pb_ky_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Gt pb kỳ nt" e="FC Allocation per Period"></header>
      <items style="Numeric"/>
    </field>

    <field name="gia" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="Default" width="100">
      <header v="Đơn giá" e="Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="nguyen_gia" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="100" clientDefault="0" allowContain="true">
      <header v="Nguyên giá" e="Original Cost"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_da_pb" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="100" clientDefault="0" allowContain="true">
      <header v="Gt đã pb" e="Accumulated Allocation"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_cl" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="100" clientDefault="0" inactivate="true" readOnly="true">
      <header v="Gt còn lại" e="Remaining Value"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_pb_ky" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="100" clientDefault="0" allowContain="true">
      <header v="Gt pb kỳ" e="Allocation per Period"></header>
      <items style="Numeric"/>
    </field>

    <field name="dien_giai" width="300">
      <header v="Diễn giải" e="Description"></header>
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
      <field name="ma_bp_dc"/>
      <field name="ten_bp%l"/>
      <field name="tk_cp"/>
      <field name="ten_tk_cp%l"/>
      <field name="so_luong"/>
      <field name="gia_nt"/>
      <field name="nguyen_gia_nt"/>
      <field name="gt_da_pb_nt"/>
      <field name="gt_cl_nt"/>
      <field name="gt_pb_ky_nt"/>

      <field name="gia"/>
      <field name="nguyen_gia"/>
      <field name="gt_da_pb"/>
      <field name="gt_cl"/>
      <field name="gt_pb_ky"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>

      <field name="dien_giai"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6mYisadml41cd1l4UEfFTQ1XzTHSQJ/z6yzqswY+cEp0hIplI4G5AjvSz7ycLio8oaJDuDlPvV4V4QrcTSKm1hD/xMTa0VI4laWTSonT2aOWK4HBYrNyFuqlFOrBzKq6UZm4yZ2W2A7w3SKjn1PtvvYTmUbn2xfOKJ4CTh/SvG+r/MbyrqQUJyK3zJM3PGxgYQhybIckIMZHsGTJIm9GfB/kYY+z7vBSltUVmOTan4j</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL756/JB6dPeVkwCfYuq8ju3IgTyvaYmP5SXM3CTuGAFlasExTxCBQbPEXIWZA/Ry229hH4j2n/gnYZn8ybEUcQSpI=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTElG1hN6LKG0Vp8Y9kWhG8aFFhpNj5+u9WMGtcb4/eEMLihrtTjxnXvNsRcJeT3kLDeym8xloFZHAXKgnrjfOmt7EsuHiwpyiyJb8b6q/hQxDfxUDsm1pqD5QWWd4GQXfJyFdwhGM9fErYfANvLTTWJdrww27c0dET3rltbE7FJt9/YmnwKjnIEoEWpwRSHTHjAZuQLXGIUGpDi1pxDq0XPX2PbdtO4GDyiHf6DSUdboUXxJZ/jtGOVS2Wdyvsq7zXoZZDf3VOThsSi2RoauBJXcHDsTRd2embtHKlDFnL5+u4+uo4e6XW4/0APQQel0i91sNg3MrMttix5IIkrM/PuQsAWCe8SIf5x0D/FCe10wyDhDmGhjS9XcwjBC4U8HsPRZBYIi9EW19pErY9dMjOVw7s4Y0U/wR7uwnG5qseP+UTfTnXcJQk30qog742uzNenGP3Go5iQoYM46rXqy6L3cC/aHyjhH4t4grTtWy91GNyst7jIjy5v9ODjqZarwR9qZDnQuqHvSLmOq7F7tu7ju7VRJht6lbZnQ6drYNeBAoGTstoH7PNLLpVdpr4cpcRTspsjStapep+bJ2TVWZawFfDm316ibAypGGjZ+SDuxsYkCDpC1WtOuNYQpxRQpV3pJGjcs822cPo/SsmpaRum33i7g69aJQkyuj9EoDf7kBpOyi0sRkCabcFZA3OnNb9tIrbFPUiEGlY1lDi/NnHIrr5/l8c8Cy3TiQGHWxQsSR+GuaUjgZamP9Zgi2i8F3/fotJlXK6D+oNLlh3xSCGqSdMC5XEVkbF/rwsrUU/S8uZnVfDovqqMKYi4nzqAcg1wCBbHk0EXsK6xky1LB92cm0YrmPPV98IK7SjP6AWZALvI/WHDHcbNEND4PFUHidYLL0A0AEfyWRHix47AcRPLTjak0wXD6aiOF2bOM+Lizf2znNIZqndlij6jOygyhbDRy08qWUBNbOCEiXwcKWecA3v81g8wB1A57VGhgcER+asrBkXJQY80F8nVAVoGL0T42BOp+HBdc9yB1N91qFLADFT9y9ECEcvFAcI+cQ4wlwnq0f5vog1L16KudibFchAjQdqhksRE+MswcU04VPTugxpA3MePUVObaAzG4vRew2xs33dY8ohbvijChoO6fVyy/sb/PBNA7EMvfvGNi7Pi4NMNtJAEtifqz/FnJ33h</Encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSIKJMi1TbCiSuUYn7FAMYne2WAdT0RGbicEy2YjfBxb/VKTKrohhKSSnilJSptTjcbimMHwhdtcveg0kJphfxEnPR/8BEsgunW0V7K2sQhj/</Encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;
</grid>