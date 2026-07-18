<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">
  <!ENTITY XMLFlowFilterCheck SYSTEM "..\Include\XML\FlowFilterCheck.txt">
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">

  <!ENTITY Identity "ITPhysical">
  <!ENTITY c11 "Phiếu xuất từ ngày">
  <!ENTITY c12 "Stock Transfer Date from">
  <!ENTITY c21 "Số phiếu xuất">
  <!ENTITY c22 "Stock Transfer Number">
  <!ENTITY ext "65">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'ITPhysicalFilter', 'Filter', 'ITTran'">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return
">
]>

<dir table="m65$000000" code="stt_rec" order="ngay_ct, so_ct" id="PXI" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn phiếu xuất điều chuyển" e="Physical Stock Transfer"></title>
  <fields>
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
    <field name="ma_kho" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_khon" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="88">
      <item value="120, 30, 70, 100, 230, 0, 0, 0"/>
      <item value="110--111: [ngay_ct1].Label, [ngay_ct1], [ngay_ct2], [ma_kho], [ma_khon]"/>
      <item value="110--11: [so_ct].Label, [so_ct], [stt_rec_ct], [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    &XMLFlowFilterCommand;

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEmcSYdxtUe+PSCBg6yibYyraQiOp/zqF5sxS9r6EbNtHJ3A23ZT9s/aPETr/dt4cIGLy+lqXZsPXmidmerr5tdvb1+sctnEwsCDSL94ESwkXyUe5GSLSxWcmUHgut352nkwmW2iRST2DoRdJ5K4O899HEdZrvuqPahIba+yxXP960KMNSfy95gAw2Hg0QJ9EtNhgqDHuzx6uJ3X8ZFRI6n+WqKKD+4LdcIGA1mLFLzZ/dU6jfSTrnbP7/sZOOPizdA3IRpu+r3Cfw6BAxvKu4l4pLbg6W831GLx34vQLvtuUW6Qm77xiWjlQNcMvrjTb0J3C8GyqRW3nEOiIh4zLLLmjTTEt27wPetq8dO0dCv6XEl9s7uf2BQYoQPMtrwSUHDrzRG8UKeHQHkjN0tTZGdXfGP9nvoSEu4eEUyzpw05goEjXcicA2OzaJcBxoJF3TWyh+RYpN7H5iqu9YNMNb8=</Encrypted>]]>&CheckRelativeProcess;&XMLFlowFilterCheck;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cTEHAvAq+gidm2OBN9//gMQwRrMnnY/tBE1Z8/AJV6pfUCh6Zrq7nTSxCsWCGGWEuUt5mp1xhVBwJcPXXLa/nM=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrIGZN6GqhMo3sNDsk4V/dVQfcY+TLoHUQdukE+nMRErkg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&Jl3E1PKXzK66ePUEZMCi8/qcujwKVF6jWLTpNH/gey7pY8SQWs9A5nbUAdv7oWjXRUjP+K+SON8lazouBd30jXeoYCK6UOAlFKYADcSrQLAAUZse4NXYvVdGpKTtTu8YGKBKEujBETtlST1q2bfMLA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UssBP7mLwPvpIyeVnFY1WGIFudObEg0WpytXvCOVW+K</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3jZH/Y+kmJHLG82qfV6ZYGzLXuPutwXI/+ZvAYz1FIj+RF0XtijdKglsDtySERQ3mQ==</Encrypted>]]>&IdleLookupFilter;<![CDATA[<Encrypted>&kC14wA3BGHJ+ACfBdPMa+cStN6w+4umYe5v0XnZqe6UyQlxYd38nmmMqZbDvJFJl</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3uXgOXXvjxA3dwhlTKHt0y5Q7e+utx8j0g9+ZssqVKn+TuBXnhcYK4I3XqpglqOq+6ySi4j/Tv4lCqcEL0MUAWaqAqBgbPm3rtnxCOElEBj8gGQPUuOsmMLrwv1manfBsA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWLGc3R/qUm/fdG83yyi1hCbqQ4Od4jG66bN/n2fXfoB0l5fmQCcUoPhzjn4VzMzlbhiV5sCmo7NanI/iFodwYCJxgPvPimjeNlBDk2eUGDvJ0FoyJFyugSHFo0cg88AIaSpKG+tgDgmQvKH767uhhu0lcxHhFMY3uOxQxNl7APnNE4hN+i4a7idW+ORXBTKN7QuGEbgPWCENVOfEmiry3aVOiINBlqiUa1P9QYIPaODY9qDS4QDk1XBN2jRdlo/e4gT2viRvEPoZISPqBPGo+jX</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3qeBZQhxWm9N1jRkDfSC40OHkd2DXY0N0S9OSWHXjUiFW+QJt4fV8dVINzErNnhRZdgmMtp+5Wi+CtdIuC9Swcw=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWLvVtIzZaYyscvaN2EfgqlNzr5CBr8L6XnwsuxeQoiUffsWo+UJaxSPxz5Na+JgujI=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWJU3Q/gxDYqfge8tsRmI8i84cnz3Wi/GNTfZnsrmecK6K4PlOMiTne8O7Fp3LkIovzffOx2G0Cv7F6PyHlc07cq7zdDIHNFn6Ro5j8ECt/ahr99pG7IUuOkGR9qMvzfy4skecorHnD/Ja0MP/97+ZitolYBy7JPh0staIMZYiYRuQ0MrqzhuKjcIUHrbw6cSCOa1wUDkf4erlYqHQKmfZnk+/74DQanoXlpAwlPwUFGipLuH1GAtMgtgbihCymphRPp6HPVQ1JqE4DqgLharRI8fVNun/+YDb67FsdddBSKJvavIanC6qdMdZ6IZoF9L7sCsPPxR1rQqM2ZcdZOdoYjXWnZUkrZcjJHdvnUhfW1Ix2c4ba+6dRnxyVO88pDpUkOYeBH4l9fENFCvRRJ3MFn5xVjwcPkXo/FNOxuwLxojg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrKMYCHssObkBLe1+DexzOpePLw2V/lO3NjvuS63N6Ykp7gFj05qBnjspnzCIQb1IrVv2QgmUZcW1cPUqUnTKZSxg283XfW4xPPCzpr+PDUsSKRD2u4iU0vbZiwlGVVUdQ2wFAsvSaZyc8V5IO1cV5sZLVutxDkHi61RB00iANME9cB483CPo3Oe6831O9pVZEVMjyij9NvhOgJ/kxwLDHN4</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3np6J+ljP/SfAMF0E8gMKEL7GYWhPgCRHTvzHCdupwmL7HndSLXhzqujOxiBm8lMTA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3np6J+ljP/SfAMF0E8gMKEKpkl3mc7tnqpM9dyOAChlkW+CHaEI4A2xcynH+q4H1jQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rS4dIrGtn/zbuBqcIGW4sXFYYOZ8fG6mEwQ6CVZvpVQ63OMA3xSENwd2MZLsO+iICADniPRsAJ2EpyNctGD782ECWjr4fXm0pLPGqMFDXYq</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rS4dIrGtn/zbuBqcIGW4sXrdsPmc3ai+oX3PXdd7hOyh43ufi1jNgLcfpFY7e4uWRkTkq6jdiuDye/sPedOcAfk1hkntMhODJ28PjefLiYe</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/3edCx6AYZ6rCiltb24POR1jvRegACj+rSMGtGpJz5wBQtHi/hFCXjORUjuZm/LFNA==</Encrypted>]]>
    </text>
  </script>

  &ScriptFlowFilterCss;
</dir>