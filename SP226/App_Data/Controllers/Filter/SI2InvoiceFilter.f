<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterFields SYSTEM "..\Include\XML\FlowFilterFields.txt">
  <!ENTITY XMLFlowFilterViews SYSTEM "..\Include\XML\FlowFilterViews.txt">
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">
  <!ENTITY XMLFlowFilterCheck SYSTEM "..\Include\XML\FlowFilterCheck.txt">
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY ScriptFlowFilterFunction SYSTEM "..\Include\Javascript\FlowFilterFunction.txt">

  <!ENTITY Identity "SI2Invoice">
  <!ENTITY c11 "Hóa đơn từ ngày">
  <!ENTITY c12 "Invoice Date From">
  <!ENTITY c21 "Số hóa đơn">
  <!ENTITY c22 "Invoice Number">
  <!ENTITY ext "81">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'SI2InvoiceFilter', 'Filter', 'SI2Tran'">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return
">
]>

<dir table="m81$000000" code="stt_rec" order="ngay_ct, so_ct" id="HDA" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn hóa đơn" e="Select Sales Invoice"></title>
  <fields>
    <field name="loai_ct" dataFormatString="1, 3" clientDefault="1" align="right">
      <header v ="Loại chứng từ" e="Type"/>
      <footer v="1 - Phải thu, 3 - Hóa đơn" e="1 - Receivable, 3 - Invoice"></footer>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="&c11;" e="&c12;"></header>
    </field>
    <field name="so_ct" align="right" maxLength="-100" filterSource="voucherNumber" allowNulls="&FlowMultiVoucherNumberAllowNulls;">
      <header v="&c21;" e="&c22;"></header>
      <items style="AutoComplete" controller="&Identity;Lookup" reference="stt_rec_ct"/>
    </field>
    <field name="stt_rec_ct" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="88">
      <item value="120, 30, 70, 100, 230, 0"/>
      <item value="11100-: [loai_ct].Label, [loai_ct], [loai_ct].Description"/>
      <item value="110111: [ngay_ct1].Label, [ngay_ct1], [ngay_ct2], [ma_kh], [ten_kh%l]"/>
      <item value="11011-: [so_ct].Label, [so_ct], [stt_rec_ct], [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    &XMLFlowFilterCommand;

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEmcSYdxtUe+PSCBg6yibYyraQiOp/zqF5sxS9r6EbNtJyqLg40MCp+Irp3G3dWyjA6TU1gCfbzpOju9bAUrkE5FrLbLQBZsNerqk2egLVl+5x5n2KdcP4wtg82Un5BGJxAx3vF5Q2mZAySgif8miemYJzWSxle8wYLvpkJyraQqx4yrxa76EMS4PlkbqzMOVLUG9beRezFtUoZftn/BxtW+oyGoUgrTfcUeZIEgoYcIl3fhrho9U0wP3lclhFcWhc0FVHYve1pL6L8KJNU89LseFUWEdEGVmAAQY4J9z7nQvQu5rxsacKLdv4lu8I1iQdtVZdDrr6aj/tT6T1yM/xNDwl7/JJZv++v1WwlagbEj1x/GxLhqViUZdyWn9EavYbJ4CD2W3e3TEz7fArq7AT/B3xd7vVV7sjER93/wjE4pFDQcqmWxfEgD/p87PoSYPg==</Encrypted>]]>&CheckRelativeProcess;&XMLFlowFilterCheck;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cTEHAvAq+gidm2OBN9//gMQwRrMnnY/tBE1Z8/AJV6pfUCh6Zrq7nTSxCsWCGGWEuUt5mp1xhVBwJcPXXLa/nM=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrIGZN6GqhMo3sNDsk4V/dVQfcY+TLoHUQdukE+nMRErkg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&Jl3E1PKXzK66ePUEZMCi8/qcujwKVF6jWLTpNH/gey7pY8SQWs9A5nbUAdv7oWjXRUjP+K+SON8lazouBd30jQcCk8wT9JcYYgRSUeMQ/8LUvirXBEFwarqAaS7Fd+AcAAR/aNubqdGWH0439GsoCpUcTOEydiR3Nz9EvpMWQAo=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UssBP7mLwPvpIyeVnFY1WGIFudObEg0WpytXvCOVW+K</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3jZH/Y+kmJHLG82qfV6ZYGzLXuPutwXI/+ZvAYz1FIj+RF0XtijdKglsDtySERQ3mQ==</Encrypted>]]>&IdleLookupFilter;<![CDATA[<Encrypted>&kC14wA3BGHJ+ACfBdPMa+cStN6w+4umYe5v0XnZqe6UyQlxYd38nmmMqZbDvJFJl</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3uXgOXXvjxA3dwhlTKHt0y5Q7e+utx8j0g9+ZssqVKn+TuBXnhcYK4I3XqpglqOq+6ySi4j/Tv4lCqcEL0MUAWaqAqBgbPm3rtnxCOElEBj8gGQPUuOsmMLrwv1manfBsA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWLGc3R/qUm/fdG83yyi1hCbqQ4Od4jG66bN/n2fXfoB0l5fmQCcUoPhzjn4VzMzlbhiV5sCmo7NanI/iFodwYCJxgPvPimjeNlBDk2eUGDvJ6t9tE5V/sAc2fsop+MzKW8RqQgiuTaUW0XSDvD3mu3RPAPo4mn+sopxZn4NpILrzBWQzssxTxfxRQKVnDwgNUMKTlSqHGn7Pdi73Vo5cillebeE+iFmG4dZDNYTK1q3noeN7bwYcr67D7696WUtDRA=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3qeBZQhxWm9N1jRkDfSC40OHkd2DXY0N0S9OSWHXjUiFW+QJt4fV8dVINzErNnhRZdgmMtp+5Wi+CtdIuC9Swcw=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWLvVtIzZaYyscvaN2EfgqlNzr5CBr8L6XnwsuxeQoiUffsWo+UJaxSPxz5Na+JgujI=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWJU3Q/gxDYqfge8tsRmI8i84cnz3Wi/GNTfZnsrmecK6K4PlOMiTne8O7Fp3LkIovzffOx2G0Cv7F6PyHlc07cq7zdDIHNFn6Ro5j8ECt/ahr99pG7IUuOkGR9qMvzfy4skecorHnD/Ja0MP/97+ZitolYBy7JPh0staIMZYiYRuQ0MrqzhuKjcIUHrbw6cSCOa1wUDkf4erlYqHQKmfZnkfc83+RZX6yh54NyTlZ19EOq3Nl59crySb6HNWoG6BU/ATP67LdQzdj7yQ8LsMqBg3MJD9qOOZXZGug2gf9cWEYuHulHO5XrkGUxNoaFx90PC8jkxuCpS7Lky6G4v4Gcsv4HG/bPoZP7EXpOIjEp7t6KJltAgs7AQixBtK6bUTOh/y8gqxIEz7BOzzcsjoJxDOs8gGhPaVD+2RuKm6dIC+g==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrKMYCHssObkBLe1+DexzOpePLw2V/lO3NjvuS63N6Ykp7gFj05qBnjspnzCIQb1IrVv2QgmUZcW1cPUqUnTKZSxg283XfW4xPPCzpr+PDUsSKRD2u4iU0vbZiwlGVVUdQ2wFAsvSaZyc8V5IO1cV5sZLVutxDkHi61RB00iANME9cB483CPo3Oe6831O9pVZEVMjyij9NvhOgJ/kxwLDHN4</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3np6J+ljP/SfAMF0E8gMKEL7GYWhPgCRHTvzHCdupwmL7HndSLXhzqujOxiBm8lMTA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3np6J+ljP/SfAMF0E8gMKEL9ltA3BUnGPzYX0Q2HnUqjiiG375SYY2iok/Xh1PgQ/g==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rS4dIrGtn/zbuBqcIGW4sXFYYOZ8fG6mEwQ6CVZvpVQ63OMA3xSENwd2MZLsO+iICRFgfOqXvo4sb7CMkUFv1iYI7mQFBMQ7CtLiPzQQ0nK</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rS4dIrGtn/zbuBqcIGW4sXrdsPmc3ai+oX3PXdd7hOyh43ufi1jNgLcfpFY7e4uWRkTkq6jdiuDye/sPedOcAfk1hkntMhODJ28PjefLiYe</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/3edCx6AYZ6rCiltb24POR1jvRegACj+rSMGtGpJz5wBQtHi/hFCXjORUjuZm/LFNA==</Encrypted>]]>
    </text>
  </script>

  &ScriptFlowFilterCss;
</dir>