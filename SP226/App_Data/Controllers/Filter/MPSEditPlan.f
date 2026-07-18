<?xml version="1.0" encoding="utf-8"?>

<dir table="mpctyc" code="ngay_ct" order="ngay_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Sửa kế hoạch sản xuất" e="Edit Planned Order"></title>

  <fields>
    <field name="xac_nhan" dataFormatString="0, 1" clientDefault="1" align="right" categoryIndex="3" >
      <header v="Xác nhận" e="Status"></header>
      <footer v="1 - Đặt hàng, 0 - Không" e="1 - Firm, 0 - Un-firm"></footer>
      <items style="Mask"/>
    </field>
    <field name="sl_dh" type="Decimal" dataFormatString="@quantityInputFormat">
      <header v="Số lượng đơn hàng" e="Order Q'ty"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZRMRiLuRLl6ipXT3SIzFaWVxoQVe0Px/droh/8qh6v1sRHa7Z0IkICR9gGYdZfiCAA==</encrypted>]]></clientScript>
    </field>
    <field name="dvt">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày nhận hàng" e="Due Date"></header>
    </field>
    <field name="sl_da_yc" type="Decimal" dataFormatString="@quantityInputFormat">
      <header v="Đã phân bổ" e="Allocated Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_nhap" type="Decimal" dataFormatString="@quantityInputFormat">
      <header v="Số lượng còn lại" e="Remain Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="stt_rec" hidden ="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt" hidden ="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="tg_th" hidden ="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="1110: [xac_nhan].Label, [xac_nhan], [xac_nhan].Description"/>
      <item value="110: [sl_dh].Label, [sl_dh], [stt_rec]"/>
      <item value="110: [dvt].Label, [dvt]"/>
      <item value="110: [ngay_ct].Label, [ngay_ct]"/>
      <item value="110: [sl_da_yc].Label, [sl_da_yc]"/>
      <item value="110: [sl_nhap].Label, [sl_nhap]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwetFxBFoPILuYbQazwN5csi0XC1K5j49FHaCbA4FpNPToAH+b508mYSbfzhjTD2c2g=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfx0TKzd6yL2BlhLuCXsLiYLDNkbb3RpRzNhIUriN+Wor1YZS+9raDRffKFtIJsn5CJ8NBkCN+RJLYSPw9sY1DOE=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6X8uMPflQtEQykIkPay2WijZ3z4xdhaB7WwCRmqotkANX7otDbfe/awFTFBegMZEVBNHNql454KppoR1yu1ziXwzYRnABMVDgw7GFuI+HbVGOM3lOD8bOZRO2GRAD4s7w4+wUS0sFQkaduxQsSLzhZjvmTXP6+YyuWKkUSSNOqX/QR6c/Ewy2G2IFcGCDPZEcXk0hoiZwc8RX1h1JKOVL2stlqm7O6gicE6EdZwAj3WUQERWhTGktlTHGKRxXCt/kAvcP7Nq/akA8MabIkqqAu6kF5kOdmDh2xM3L6f00nlp010MbMFTseEFvWG9sHmDOeAlOhsECBNxGReqRkhG7klqotvaw94N2M1J5+9zi4yiK46jMtzBpb/O+ktVPjtlyQYuUNbWi18G40qf3sJdCzQASDFkAD1rOQBbeHzE3JrRlOBepDFvIJfNPRYsU3BCJvis5YheCrkNIq8M6JFC90q9Sz6Aj3Wsb6CRBt1iCdW4Kxmv6bDCL476S3nweZ1Yh54XrNoqtQxukTwmOENk6nB6Ha8AdNzM9US1e2CGX1J4m+VlA+ex7LEgLAQeF3dD5pI1RNJpUeLmBLwQzxMk7REPvNApgWcu58/FO2lr9dZnp334+q7wlAu0gbFilf8+pzw/bRn74GZibFtAPv3lvJIGtjEd/f38JJjibz9xGqQAo9Cyi17NA8frpTZmisU6xbHuMMw4j69PcgZK4XdC5unrCM5p+UHONFw7/c4jSqakVG3niROE+MYaEC0uKQuolhoHoqf4HB1SWV56PcXg5V3xKvqlchzHVEmouTufyrx7Qc0RZfFMOwYOI/pNGnSlTPl88Ji0zOTbzD+L3i8nic2B1RGiundBqg/BFZF/P3FayaBf75qJ858eKgtC24jWlou9O4Tc3E3zcf5lsiOk5W4=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkZdXXZ6KlG1cVlIvScS88cEKDQNAnV1viq1jTpD/Xjz/weMS7aBmL3wwuO2tb1/8uYiFEb2/p5V4kih9kj78soXkXE4XLwwSb8kpUrb2+nLM1Oa1EVIUE+cDtDCHsJxhGbKwwLd3bV9hNHmlb2010o6Tligpip/ZcjK8S+MXcroa3WGE2/lmgvWNLWGAPhkGtl9fKuM2PjW5Ar0R6nNURwWPihxTyKv91M0Ea646CBmo0b8MxKpUHY2ExpzPlfSWh1CCHK0k/aWgaK0Hsnm0AzfyD2y+DyTn0KNCj8UotvocnoFZUbxdO1NJVJoV4iParkh+5iUqr6ViU9csDbuOSiaF7jln9grB0QqVdtt1PWRE/3ualoT82XL6QJIpJTMYCehWLVI/E+oMY58vfW/nV7lMLl+EuuRSHz/mOBOW7Tq84OSoUTv8xvn6HqRcb/Ew52ohGk4fuyki/pzcFERW67Z1cGtgnBZjLLyoHYmDpAYF/fTzFjuw0IY6zOiEuVwRum1RGz4VsKkXOhSglA/NHo9MeqKnSBVblXPfr52Wwx4wosCJM728+1MPK5oanf4RrmQr7Q2ssj3yTR7fwXmZRGXkyujGovgf2+BQ7ZsQ0XX2yzfqJgGBgcGYMdt0Lt6LTWdqlZQdW81yOrI0yqKiT4JW95pYD7610K2lNRrkExhLzCf/SHxQL8M+h7loL8t47I=</encrypted>]]>
    </text>
  </script>
</dir>