<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "S1Operation">
  <!ENTITY c11 "Ngày từ">
  <!ENTITY c12 "Date From">
  <!ENTITY c13 "Ngày từ/đến">
  <!ENTITY c14 "Date From/to">
  <!ENTITY c21 "Ngày đến">
  <!ENTITY c22 "Date To">
]>

<dir table="ms4$000000" code="stt_rec" order="ma_px, ngay_ct, so_ct, stt_rec" id="SF4" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn công đoạn trước" e="Select Previous Operation"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="&c11;" e="&c12;"></header>
      <footer v="&c13;" e="&c14;"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="&c21;" e="&c22;"></header>
    </field>
    <field name="ma_px">
      <header v="Phân xưởng" e="Shop"></header>
    </field>
    <field name="ten_px%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_lsx">
      <header v="Yêu cầu sản xuất" e="Work Order"></header>
    </field>
    <field name="ten_lsx%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_cd">
      <header v="Công đoạn" e="Operation"></header>
    </field>
    <field name="ten_cd%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_ct" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="88">
      <item value="120, 30, 70, 100, 230"/>
      <item value="11011: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2], [stt_rec_ct]"/>
      <item value="11010: [ma_px].Label, [ma_px], [ten_px%l]"/>
      <item value="11010: [ma_lsx].Label, [ma_lsx], [ten_lsx%l]"/>
      <item value="11010: [ma_cd].Label, [ma_cd], [ten_cd%l]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPS6o0FO4oa0V8ggf7RVJkjpvu5lLetaENfYXcCme6Jq</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3nefBIr1BdWaeXowPXKgZP+aWfAoW+/JzITmgw11l+81e4DwCZRrnqC+KLfXHp89Vw==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHQHZ1sEfLBLAU7ylm0Tw/Kk2Y5m6jW4ZWH56IoIkjnE8IgpQzlS66z7YisUUYoCBQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrKGcqibHLSFFxS0BrTRakuDvSpUrTztopAOpz3XnNPSmVBKUmA3MOyyKtwuxJZzg4E2BX1fVotKwehiqjP5H1Zs9fp7PbgArZYdhVbyYt+kXUTiRIE4tY23K0rMKYgBfihi1u8R2V/sVQ8fMRViDLuz6R68GeNE7tdO+sGqldPPL9s2RzaXga6skBk5iCvCwYY=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22SAyB0lrLIl8l+LB5Gl9ES8J7BXWwS26JYkGY8fKh3Vm</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3pn8hVKY0irha45e9N5rBRX38zIzrbr9lwJtdcXshmfK3iKrryxdSC8l3+9l5FLBWL234wZUTRSM03HDFQE0U4e1SoCojGyS6OZwx0Q0yJ30kDV+Ai769qxAMYxRPeaAbF1mW4au88afaGwQW7y+EDrS070L4/+HWh/1kTHCndkZqpYwmBM5GG5FyNIFwagyRfQoSoy9XfvGq/gqvnsEu9qrv+xGEG/gHKlMVwg8zmtgt+4Pe2T55MrRORyWVE5bi69EkD4lp8xdfzYwwVM5KJcILUA79nwQX3eJZSBtufxbbl3drRIrGhACuVaLDnck1w==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrIzREFw1Lhi2GW+KhAlOGg/1ZPisq7nWqZJE61gRNS1vAxP3wXcmts08cEsUvicXWiWvPxOCxc8coUU/1jJgiLMaJKSgCFcTSP7gktpZ9cO1Az3Qbbw75p6QRIWNgGJ2wG7xCs6FpoV8eHWZhVRJo90ysWvUhLQh5363qyHYjbUcmuie12JHEf+bPQon/ZX5VSYYMfz199nNT3upsVoPJ59</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rOObb4GYbMQh3I9s9ieQaH/CtUuLy/hvt3u8Bvftrye0XvNf0rLnyjPSKspRBurHg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3h+SiKcLqRpRWTc4QsvVKis/VfRlByYlw+REdiKN5/NbLG+yA/meJtd3W6ZYIaEOSg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rS4dIrGtn/zbuBqcIGW4sXaG6MOIyfQarKWuqjLzMOlptFUWubgnVIuYZablaQwaDu2vZhBKNSDt3Y3atSKS7c=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rS4dIrGtn/zbuBqcIGW4sVpitp0+hFILyKfrnwQpCmVQKG08UnmtL+roi6QO9FKOA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/ymZ9l54qC/L2yU4fowjEL9nmGanANZheBzn+KFNsg/pYOoPyLmPCpOM6hxBX+OXtw==</Encrypted>]]>
    </text>
  </script>
</dir>