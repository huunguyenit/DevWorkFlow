<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY Identity "AutoLot">
]>

<grid table="vdmlo" code="ma_vt, ma_lo" order="ma_vt, ma_lo" type="Detail" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <fields>
    <field name="ma_vt" isPrimaryKey="true" width="100" readOnly="true">
      <header v="Mã vật tư" e="Item"></header>
    </field>
    <field name="ma_lo" isPrimaryKey="true" width="100" readOnly="true">
      <header v="Mã lô" e="Lot"></header>

    </field>
    <field name="ngay_nhap" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100">
      <header v="Ngày nhập" e="Receipt Date"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99DQUIRfAwc1AgLDGM75uI2f0VeZaN/aMo6/t+JKo1A8OR/R43QUrbJ9j4h5muNWEyg==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_lo" width="300" allowNulls="false">
      <header v="Tên lô" e="Description"></header>
    </field>
    <field name="ten_lo2" width="300">
      <header v="Tên khác" e="Other Description"></header>
    </field>

    <field name="ngay_sx" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100">
      <header v="Ngày sản xuất" e="Manufacture Date"></header>
    </field>
    <field name="ngay_hhsd" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100">
      <header v="Hạn sử dụng" e="Expiry Date"></header>
    </field>
    <field name="ngay_hhbh" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100">
      <header v="Hạn bảo hành" e="Warranty Date"></header>
    </field>
    <field name="ma_vt2" isPrimaryKey="true" dataFormatString="@upperCaseFormat" width="100">
      <header v="Mã phụ" e="Part Number"></header>
      <items style="Mask"></items>
    </field>

    <field name="ghi_chu" width="300">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="so_ngay_sp" type="Int32" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="so_ngay_bh" type="Int32" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="kieu_lo" type="Int16" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="status" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ma_lo"/>
      <field name="ngay_nhap"/>
      <field name="ten_lo"/>
      <field name="ten_lo2"/>

      <field name="ngay_sx"/>
      <field name="ngay_hhsd"/>
      <field name="ngay_hhbh"/>
      <field name="ma_vt2"/>

      <field name="ghi_chu"/>
      <field name="so_ngay_sp"/>
      <field name="so_ngay_bh"/>
      <field name="kieu_lo"/>
      <field name="status"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL7538BzVLbxYo6SyGBb8l8BT08UY2Dj1u2W24d2cYSnSjF</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&DbQoHpVUVQk4ZohDQymygjSFPbOV24uAWl4u4X5Uv279mD3oUnI+BfPKauxsseDVstaHvU4Tfh4kQaUgP/Yixg==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&DbQoHpVUVQk4ZohDQymygr/zhEHUQX7nC8bTOkyLiOjLWvwUmOgXng/VUrHr4MYzppmiBrpVeZBqdWhq9hvjgnwv4AgcUQY/wfSaAeOUL+h6fZ49F+T34yqw5gITm89Hbs9JVI6OloBFe5snNaMwijZhxVK9UDCxd1S6/BnPr9F90ui0iy97uPUtbGlyjDOpUz8d2e3OsPUZqSyqkA/bw9Sp3/BQMt65cl8GcqXDTwDs9zIVC4kzao3AZO/74QUFGlyjTyDaJJs4pUDSN4Ukcy8Pr550gt0nMzRQdnKSXFlHJxRnS3L8liubGMpXlLQyPxmiWhvmOVNdEryO+FbPGLiCd+DSjrZLQFXugA3W+HI=</Encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyX4OnJ3rlWNCqcEZdU8UVHv9+A2541tPTKAzYf0vy/9nhm6ah3O+Mg+h9C296RADNrxtP6qCPDkEZjEM8Iamdh4xQ+aS3XoKg4pzST+9EW4vmA8CWNK2r4kyqJ4keMNHh/3ptS2Z6oUjFyUeY53UlNuEq8rZB1B8sC/Tyq+KcR862p3BfEYHCsCKqXtY6kXG679XXolz1Av6Tanx5FebbCA9+gegtbBNtAllOycty6pZHFPln9mgno3JFL4wm1A5kSiFDdcCZoOzBbGHuH9SSgBgssuq//zLI9XaKn75UY6Sfixw+/lXXKwTUh3ndvbYN93qGnI9MDasY5NH8ENx+Wycf9w9a6v35Lr7Btb+CZRKc7F3ylTon9yD7TgtI9LsQ+CHQT5oQ4TjlC3tDVHYJRXhAqOBFMy8n/6JigXpJ0MK6vqXqNjcC6iR0aa+d8CZ3Q/0UG19sn5kXbmeY1rzRz0bvVZP1pPD4c+FDc4xXZHpqXvru18PaRihu60YKGAlFUi9DxjQLTD4JXSkj42Wlfg8pEjCeLIirFkR8/toVEnJkRM2ht3koawWejbac5/m0EECNBUuCATDfxIefbznQncmCrGJnCDe/MiebtUWyv94VjrPmm9PpFmfciRVCP4IztMH4FkYzzKZiFPUHu3NdEsxyv585+VhgVQXCgcaSgDpI9wdPU2qjqyQTJRrNKthnWuRL3Kwg2OPzOaq6R4Iqm1k7wU8TIf+v/zBvQbarFfFSuODbb9sARDCr4ot2vF2zEl0mxhnRiwXJjYOiOANiNfTmCN3VXiF0tnEiD7LPvBLFXqZ9P/kcXY4YZvXa1gFkyr8xYp/tF367AE5kWUpi8MMJoiBhV+WY+ONxBn++1mq12j6UTuXHQDk+uqR+X8iJruhrgeJm1e7Cp2cSJX0K8+zuc2WxUvQWSXx8HkQ2SyhjYhEFuAahn+Gq7ICn8aqJz4JiyZToJQ3SGzWXZ9aYtMtqwJLt795PaYG7pIyWXgOcswKV47nonjRgcv487aq5CGZzPnhOWWpy2vfJLncJlle07USgWHp42V+nQ8vq9DIBE4qD9/f13FSAhhzFOJFQLRCLIsUwqS7dKyxQ7h8rzpAVDSqCCxlgQryWmyq12O</Encrypted>]]>
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