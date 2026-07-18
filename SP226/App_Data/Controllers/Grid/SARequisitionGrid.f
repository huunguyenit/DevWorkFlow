<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY XMLUserDefinedHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFields.txt">
  <!ENTITY XMLUserDefinedHiddenViews SYSTEM "..\Include\XML\UserDefinedHiddenViews.txt">
  <!ENTITY XMLFlowGridCommand SYSTEM "..\Include\XML\FlowGridCommand.txt">
  <!ENTITY ScriptFlowGridFunction SYSTEM "..\Include\Javascript\FlowGridFunction.txt">

  <!ENTITY Identity "SupplierAllocation">

  <!ENTITY FlowGridTagField "chon">

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'SARequisitionGrid', 'Grid', 'SATran'">
  <!ENTITY CheckRelativeQuery "
    select top 0 @@fieldExternal from d91$000000 a, m91$000000 b, dmgia3 c, dmkh d, dmvt e
    return
">
]>

<grid table="d91$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PR1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c91$000000" prime="d91$" inquiry="i91$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="ma_kh" allowNulls="false" readOnly="true" width="100" aliasName="c">
      <header v="Mã ncc" e="Supplier ID"></header>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" width="300" aliasName="d">
      <header v="Tên nhà cung cấp" e="Supplier Name"></header>
    </field>
    <field name="chon" type="Boolean" external="true" allowContain="true" defaultValue="0" width="60">
      <header v="Chọn" e="Select"></header>
      <items style="CheckBox"/>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJe59IuSGOziul8hi2ke/AgcAfwwwOW5NLQt7EnwZmuWC</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&eQDg7Nv1ZPcHTYx4U3adqKoJjScIBCzrKvEQWxYaCH1iLN+d7k3O78zMgFPktn7n</Encrypted>]]></clientScript>
    </field>

    <field name="so_luong0" type="Decimal" dataFormatString="@quantityInputFormat" defaultValue="0" clientDefault="0" width="80" external="true">
      <header v="Sl đặt hàng" e="Order Q'ty"></header>
      <items style="Numeric"/>
    </field>

    <field name="sl_dh" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" defaultValue="0" clientDefault="0" width="80">
      <header v="Sl đã đặt" e="Ordered Q'ty"></header>
      <items style="Numeric"/>
    </field>

    <field name="gia_nt" readOnly="true" type="Decimal" dataFormatString="@foreignCurrencyPriceViewFormat" clientDefault="0" width="100" aliasName="c">
      <header v="Giá" e="Sales Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" readOnly="true" width="60" aliasName="c">
      <header v="Mã nt" e="Currency Code"></header>
    </field>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" readOnly="true" width="80" align="left" aliasName="c">
      <header v="Hiệu lực từ" e="Effective from"></header>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" readOnly="true" width="80" align="left" aliasName="c">
      <header v="Đến ngày" e="Effective To"></header>
    </field>
    <field name="tg_th" type="Decimal" dataFormatString="@quantityViewFormat" clientDefault="0" width="80" readOnly="true" aliasName="c">
      <header v="Thời gian thực hiện" e="Lead Time"></header>
      <items style="Numeric"/>
    </field>
    <field name="ghi_chu" clientDefault="0" width="300" aliasName="a">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="he_so1" type="Decimal" hidden="true" width="0" aliasName="c">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="so_luong1" type="Decimal" dataFormatString="@quantityViewFormat" clientDefault="0" width="80" readOnly="true" aliasName="c">
      <header v="Số lượng từ" e="Quantity from"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_luong2" type="Decimal" dataFormatString="@quantityViewFormat" clientDefault="0" width="80" readOnly="true" aliasName="c">
      <header v="Đến" e="Quantity to"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_min" type="Decimal" dataFormatString="@quantityViewFormat" clientDefault="0" width="80" readOnly="true" aliasName="c">
      <header v="Sl tối thiểu" e="Min Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_max" type="Decimal" dataFormatString="@quantityViewFormat" clientDefault="0" width="80" readOnly="true" aliasName="c">
      <header v="Sl tối đa" e="Max Quantity"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_vt" allowNulls="false" hidden="true" width="0" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" hidden="true" width="0" aliasName="e">
      <header v="" e=""></header>
    </field>
    <field name="dvt" allowNulls="false" hidden="true" width="0" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" dataFormatString="&CoefficientInputFormat;" allowNulls="false" hidden="true" width="0" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="sl_duyet" type="Decimal" dataFormatString="@quantityViewFormat" clientDefault="0" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_yc" type="DateTime" dataFormatString="@datetimeFormat" hidden="true" width="0" align="left" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" allowNulls="false" hidden="true" width="0" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" allowNulls="false" hidden="true" width="0" aliasName="a">
      <header v="" e=""></header>
    </field>

  </fields>

  <views>
    <view id="Grid">
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="chon"/>
      <field name="so_luong0"/>
      <field name="sl_dh"/>
      <field name="gia_nt"/>
      <field name="ma_nt"/>
      <field name="ngay_ct1"/>
      <field name="ngay_ct2"/>
      <field name="tg_th"/>
      <field name="ghi_chu"/>

      <field name="he_so1"/>
      <field name="so_luong1"/>
      <field name="so_luong2"/>
      <field name="sl_min"/>
      <field name="sl_max"/>

      <field name="sl_duyet"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="he_so"/>
      <field name="ngay_yc"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
    </view>
  </views>

  <commands>
    &XMLFlowGridCommand;

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL756/JB6dPeVkwCfYuq8ju3IgTyvaYmP5SXM3CTuGAFlasExTxCBQbPEXIWZA/Ry229hH4j2n/gnYZn8ybEUcQSpI=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&DbQoHpVUVQk4ZohDQymygtg8VRc87HLlgzo0rnek4J6Z2CZMPUZqNV57p62jwigLEC9g67KLF877V/dpDU6D3Uer6vOYGZ4+PzvCqANj1P/PSKYqpriQTQtbgqhF5i3tImch+aX8O3pSOGyIOqln5Ql4k6jhOGVOv57F3Ko+N8aMjHdZ/hz2WcQtgsA0q8k+tVNhgqxWhcaNWSLJl3uVxKTNrDhHffNZNB2nILKVGhBtdF+IaBCv+OBI4mJWyfv/z+l8dtMdYntF3jCloNjd6MoXmnWUtT46YFbqtwB4WhI=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BPITLoamoPPJmYDFxGwDnQPDDe6PrISTEkyXvcYhTTrYkQt3mnyhp3/GPSEMtBlGrzjHZsrVoihiAbd6VF9YRPQ=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&DbQoHpVUVQk4ZohDQymygkrPk0aYjIp92GmOx0VribGbnG0j+Y3HPIiAuh6pngLWKN8Os74W9C7CFSGWSzk1Wy8q+TwYh6iSv3Vk+eQN8Hc=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&DbQoHpVUVQk4ZohDQymygkSXzMROpZ2hydOL83xcIzVZcrZVXAtIQ4yAnlgr/LMoTER0N5tGVyYd7D44XwXFmKaWnFMY520QTRo/jz5uAMI+rjp6AOX5ND9KOHN9/wCC5qTRhyhid8wDjz3crHaU8iRkcWiCyMJu8sJ3mrdoCTA=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&DbQoHpVUVQk4ZohDQymygkrPk0aYjIp92GmOx0VribGWza/JWbboOoDMCfniErHNd1VgA/vnYy2/R263wMvPm9raVTE9lrPSNBZ4aGFtEqE3y3awABTQi83R3dkIOzxNzX7q9+ZNtpVHWOi+NiSRjA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BPITLoamoPPJmYDFxGwDnQPm/Jfw3HiTR8Srz2VlD4d0WQBuldngcQ3a3glxakMUMZSmi9MmvNF/i7mtF/g9EHs=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&DbQoHpVUVQk4ZohDQymygkrPk0aYjIp92GmOx0VribHE1Otv/vhlALylo6Qx2XKnhbHKdDX6nnhQtU+72MCm7G13Bje8JZkql6JCdcZjJY6VwCMG07nJV0Bh6IImLrn1srUhpJ8nQoH3oHVpaxEVwUDMYPBESLhygfZTpTiakkzrolalXr9Glxc4Bg+kUFUsb/QqH7wPX8RFe1t9jjgnGoW9rX36/Jvg8TrWaNkMUjD3qRHvsE1tRjyPQKpJJ85Vhp8gTgO5ywDorQ/c9px25yPrLSjwmwyFeE1lCovZw+LjCmQxZWvQ3/G9wLfj9Iby7S67LhQp9dIj/E5iEysbtCOQBwNwV3pvWthCVC1xxKfO2mBySVKsGPP6ZnQfTT6tdiuCUxmU9UCO+JMog2YH9Ng1AIkC/9+s3ltVrdL/XqGblk8BdzLIaEA2kWZrimBv</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BFjiN9m67FYkAL5TSaAWFTs4zuvvbbBfCNWAFMFUmmPDb3tyjhsmVlK5qYsZxJsJMr+Z2h5SEhzl+Enb0BmuIdSHwEPNXveFQWmqmtdZxHrcJcWMjsyhjOmjPDq4exR/p4A2YJJHWFZv4JICla+EAJcx8HE5ZWdqnDGZy7iNTX+o9oWJUISNfj8szSAzne5VwVwzm5LKr7xyr/ZRg1Fe5k41DmizkIpj6T2ysVLr3WTfzFp1SaDgD8xFqM6OSdAdqitU2Mnl6T04Xj/2HxNJvno=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&eQDg7Nv1ZPcHTYx4U3adqNJe711Yb2ode84MRBWaH2YwZkReLRA/Yk00Vph2UQAYlA7Z1YrhNXbJD/RmVO/pL+JZQ6Rc3S2cdsj6M+hGpKwBBIu8IEy4/w4fqSiORrenqSxeFg5s5rjlqW9Oc+Z4EQ1fKUrGtn9k4IzdKlKVZ/pskPFLZ2RYvMSJjYqtQrgqh8ZJgjCThMtICQVE1yMjwoItTwH4rWdjttVo4JzXP2c=</Encrypted>]]>&FlowGridTagField;<![CDATA[<Encrypted>&ymPgYPXvzpL6Enqd4IDunLJVeta+oeDX/sDpJ3+R99s+irck751kUWD/qtz0Zm9SJA2zFtt6YP5Gd/vB/d1LzwsH+RGKFSBKtM3sAaZB/mONeBp2t6Vu2nzjt7T4OlEFS1OmOIVAYuBiU0nK+cr2i0dlghKiqiXQMSwyHVvCQKB39I6V3IofrrZxbnaHT1wUCpLRcGCjGfkOQVlZ2PAq2hd7TBf7ukBYTNhPuAp3XQgGgAr74hfNkVfd3L2J+bneiLbiSpTlOShyKjxDUeDd89/pStszYcWyADWd99YgyB+OQiXfE3C636Hun+1r5yV1</Encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        &CheckRelativeProcess;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcF7GuEGLaBKkxqo3N+afAKBQGcf/Lxv4F7/A5mMDdDAC7z/CKeZ6YHxyw46LcFxu5vdr82fdoP2LOs/BHps1FnB2qyDkhHNQ51WDsv62C7lhunTsgPvks5hw2EO6NgwKrnkYK1NQoQuVtfoD0uuUziiTLV4TXu8C5SACXS6/JIjKj1J7K51tv3mkNlq1muHYYYhUo2Rrd6XC8CEIbHvhKWGd/LdHdUG+swqG4NgeOPN6Wpx/fO3gCypFT3WoI4S2HsKeKJrtgFALRs1nKUS9ObGGcyJ72wECWxqD2yxP+MBMdIS/vtFYgdpj2oLsdDSkxmqJ4Ti1FCkCqwNrfEloX8gRHMvJXCoJBv4y+gOkwhndp62VP2+uY9nr34i2RBN8aHt5YAamvPOvTI3vlqO+h1PAPlQrqi2IIKGdCWseQlVtCyYsP/P7bb/duuk9HZAw0bUuHkl4lCoTWaMdes+yISakJfn5qvBQ7hkSzNhzRI/j+ksU0ofO69NRasth0fzritf+wEXLO1Hro7WMZo1X1yME2LZbF38hT/70trKhDSnoA0Uj/YoNZ89srQ3n9XAV3Y4vHkOw1sRez7VCfunX5MH1mrhqA6+OEFFyjhMcMFzvPNs34IKswwLe1u8KcRbKGyX8NQzRCtS2J+E/Y3uyZwM7bbLyBduOfHa2y1JXIIvTaDGW0LYDBshgk88NanSWPH4z7AKmdhOdOm/LEOwgUGxIHQWhptK0JUdL1pMH+4ed8Zr98l4a9dPELb936KA+zPiqEqTJQYQ7645k2ItIOiMMGpijxgl1A247xdJPlm9bHa9w6UofZh1I3AecHKe0DABtVwufHOUpQ/vP39NSr+I=</Encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>