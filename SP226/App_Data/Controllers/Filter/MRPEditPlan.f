<?xml version="1.0" encoding="utf-8"?>

<dir table="mrctyc" code="ngay_ct" order="ngay_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Sửa kế hoạch đặt hàng" e="Edit Planned Order"></title>

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
      <item value="1110: [xac_nhan].Label, [xac_nhan], [xac_nhan].Description, [ma_vt]"/>
      <item value="110: [sl_dh].Label, [sl_dh]"/>
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
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6X8uMPflQtEQykIkPay2WijZ3z4xdhaB7WwCRmqotkANX7otDbfe/awFTFBegMZEVBNHNql454KppoR1yu1ziXwzYRnABMVDgw7GFuI+HbVGOM3lOD8bOZRO2GRAD4s7w4+wUS0sFQkaduxQsSLzhZjvmTXP6+YyuWKkUSSNOqX/QR6c/Ewy2G2IFcGCDPZEcXk0hoiZwc8RX1h1JKOVL2stlqm7O6gicE6EdZwAj3WUQERWhTGktlTHGKRxXCt/kAvcP7Nq/akA8MabIkqqAu6kF5kOdmDh2xM3L6f00nlp010MbMFTseEFvWG9sHmDOeAlOhsECBNxGReqRkhG7klqotvaw94N2M1J5+9zi4yiK46jMtzBpb/O+ktVPjtlyQYuUNbWi18G40qf3sJdCzQASDFkAD1rOQBbeHzE3JrRlOBepDFvIJfNPRYsU3BCJvis5YheCrkNIq8M6JFC90q9Sz6Aj3Wsb6CRBt1iCdW4Kxmv6bDCL476S3nweZ1Yh54XrNoqtQxukTwmOENk6nAhXzhhzdJPICRRIc+cqSoFCJQ0x0YUaBSMidE4uosrG96hVgEw4Sge6rK7X4LC0Jv7qWwcOvn8C9CkQ1wstUZy0boNPCTqIGtgktcOhEvmuyo48zbDtxCtmRabMyd5gorLhk6ko724Gm+RUDeqZYJbKoFzF/oYGJIkY57vjzoUZnyYZf7of/e6VhX95vnf6z0BxbK2PHsK8RZD8fVfJy65E8A12PDU8Bu/+ChgHnFXoj7yQ+aix8HSFUrJdFcHFv2NgvPDvbnAY+XWgcKH06Lf4eR7tn1OVt9vpG0iKwJ57EcxkoS1u79VcOafGV43HlFFVYQZR3b46kGAMkWlK01s7uLAKQZjJ9s6HZApSvvGn1bKFzuwlcAHd0eFVQBKEjcJSgmEyVXI21E9hctp20Fx</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkZ2fdGBKW1W29RzsafzWQeUfAoolc5UtFQpmpo8oQhfIuRmYRuXHQ2aXMpFLJbkLDE6TDbEHi72jyWMfcZ3ns6hJPm87JSpxG+dsHf7NoraUu0SUL+z6CGD4d/S+MkmGMLiAeYFaaxkkr4xF/3FFk8I9E6ALaOlMOgkILWmtH+R5IL4wSLK9Gntui/yS55SAXiw6M+x9zk203Vhw+BVJGeIWqX8G2pCsgjQlkyMgZ1pUv87o6aeDcg2kBXl/pCyI9jlxez7PDZ5cuEfXOSsApo0xagY4lLZrvt0dGFlxE1PxpONbrrP1/R3QoPl/IKR8ww4WJ+7TqS4KOENZ+FQwZ0vABdexIjhWENGcLpWTPfWhOrmcr1qpkDzLULSCm/kyAq9jzqvJW9lAtGMoTqFr9g9YBnZSVgUGcUX1HDJnOrDyKVNihKU4JQBR7hIMTHeNT0euy3sNrfCyk2SXD0Bmzsnm5mGOKPqWvozvz26hcdynkzNzUGVKisXwOFs/dckocEamag6dn5233XKqitnDHpQ8H94GBcA+reMiIFHJCfDEP3LtaLatCnUTDaNtzAbsYdKPvL0ZMRa5BLvCu6rQt9MYhcLuxpWod4qTPapZ1QQsVAg8U1TsIEq3JXuXYHLq82IBwMd/v6DKuXX0mgFJGNTHsfk66vZ+SiKiprd1QJhbA==</encrypted>]]>
    </text>
  </script>
</dir>