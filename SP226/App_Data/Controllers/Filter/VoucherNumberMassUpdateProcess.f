<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\ProcessLockedDate4Unit.txt">

  <!ENTITY SysID "VoucherNumberMassUpdate">
]>

<dir id="0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Cập nhật lại số chứng từ" e="Voucher Number Mass Update"/>
  <fields>
    <field name="loai" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Theo chứng từ, 2 - Theo quyển chứng từ" e="1 - By Voucher, 2 - By Voucher Book"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_quyen" filterSource="Optional">
      <header v="Mã quyển" e="Book Code"/>
    </field>
    <field name="ten_quyen%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="so_ct_des" readOnly="true" external="true" disabled="true" filterSource="Optional">
      <header v="" e=""/>
    </field>

    <field name="ds_ma_ct" filterSource="Optional">
      <header v="Danh sách chứng từ" e="Voucher List"/>
    </field>
    <field name="so_bd" allowNulls="false" dataFormatString="X" maxLength="-100">
      <header v="Số bắt đầu" e="Number Start"/>
      <items style="Mask"></items>
    </field>

    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" readOnly="true" inactivate="true">
      <header v="Từ ngày" e="Date from"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" readOnly="true" inactivate="true">
      <header v="Đến ngày" e="Date to"/>
    </field>
    <field name="ma_dvcs" readOnly="true" inactivate="true">
      <header v="Đơn vị" e="Unit"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130, 0, 0"/>
      <item value="111000011: [loai].Label, [loai], [loai].Description, [tu_ngay], [den_ngay]"/>
      <item value="1100100-: [ma_quyen].Label, [ma_quyen], [ten_quyen%l]"/>
      <item value="-100000-: [so_ct_des]"/>
      <item value="110000--: [ds_ma_ct].Label, [ds_ma_ct]"/>
      <item value="1100---1: [so_bd].Label, [so_bd], [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4Ido+kEOWdKrIQGwa2jKQAsNCBi4ACTWQ1CdenAxBI9</encrypted>]]>&SysID;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERs0p6dcnuPXrUK0px7eCfKbiSjkFcI/ngXr3ppv1QXEi2tpnJO5inih2V+LNg0rYvg==</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2n4f7jl0jX8hzbsWRhvYc+On9S5oefEl6iw4NanziAh</encrypted>]]>&SysID;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERs0p6dcnuPXrUK0px7eCfKbiSjkFcI/ngXr3ppv1QXEi2tpnJO5inih2V+LNg0rYvg==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6TAC8PyArTCO96zULZ5xaF9bjjdYvOOvzm/8i8kbg6CeCF3jW+tYuoWsOchbKRsAsVeeePcuWWslnB7lIrt0VxGYqVEi2PsV/obDou4dIRAF9JBtoAh1tLWi+th0ImdFZ5WPy58u9Ru0OF2a3jTnmmpRC0CN8ao15nacS7+0uc02CJK+8mhnoGWsyJX69yjTNFJM2UAF5E4FQqF2x/8oe1fYqHVuPS6EK0sLM1dirN/INb4DLcoQmeGLcthPvsOmcFU9+jfvo/8GQdAsQjiW+c0DwpeGoFIoUV1ZVALj29//DKXqC99/LsBF3u+CNCmDeI2tG6svGYx2SFbXplQTsLqKILzliFv/L2Q5EoULpOPk4KEiP18rB6z5zcXjwvQq4Xb1BKwD/cvKnInScSY3jMg2hvuOOEnI2DIuBNugPnW8KZdnh1267yT8849/8ygh6nt1tgqj3r+8TdhG2IhEPJci45of0kVoZoSV9weDKrhz0C+nKKn9nXIetPp/wlPrQ982JbhwBFnu3zBYJQdyoUZXcYLzBw2lRB+onBGqXgW1</encrypted>]]>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6U/S+vuq1YK65CRD8jrslQkeeviqKN5J9If68XU17qa6tHLBTFZtFxiTzuReSf4WB4NW4Gbw+oWNEaBhzeLm6xfUGC29LFkivS6KuaXpNmXt8aGxM9iufgWtmGNQmGA/miXJ6f1kdZbxcJLe4wexZ3zJaLzzk3sqo7jvudHkGfVY7jd34M+EvfX7iavxztdpG9uciSEVGx1RYhvQCduYckoDfO1FT3moyYNb6vYhLhrsnUFGg4xZMnYlcXKjl572xCMvFnx1p4jWveRG4IZHpjoYIT4a9JneJrGm2CqrmBHaC+YxenWTBxkwAi9U2KFaY+k0eyNFBB/i/05D0uh4pQJtHLsKk37SoqyUie/bOF/mXoK6hTzhwGBbKlqv7aBi4g1GwQtrUpS4mVR/DkPNNJQywA5WxJLZKBblRjPyFHthoxMaVdbIZ/Wn321Au6negey4OK0EZaQtQSMlQ1aJ8TSDvv/uA8Yz1akEtfj4B9waATw4y9pw9KpSf+fkMfYoKnoDLru49KLD1Ph76wr5I51tVgVGTknYkCdjwXcJiaEdm0csOSNnBa9afEqLgvly5Vsc0Vn8MgbB930D/BSxBk98HDAuFG2yi8RtkO97UeF2MuAfYcmv8OJKegQ9jduDDui6TXmtVXQdc1yn010CfkOVfTtkYqSB/VVYKCZJZmE3</encrypted>]]>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7Kg13uH9j42nTXsl0Zl5bawT4zsypLQ011gv1QU1vSu469VuFt3hiPfrfb/B2MB3AauLE9U+rmzJ0MXhW5Y0qYtcStk1UrPCMAPWKw4Z1kG/z5ogn8tDeRXT1Chf2N/Ya5DdH8B52ir07bvrugh4vHOoAMLy+lPn4mSMk7nNG9oUB3RMxhlRIl15ObfBPOUvlEs73TllmANGaSdlMmWmXUk4=</encrypted>]]>&SysID;<![CDATA[<encrypted>%S/5bl6Bse+9PUDblZmp/Au6DXmL2adrsd1Zym01imbp58L1PFOOkkSF0bshNWDBth/+nJZpNL8rk4H957pep4g==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwSZFYAj65RYzXb1/jCQS7LbKpA54gCakU+hnjiXOE3L</encrypted>]]>&SysID;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERs0p6dcnuPXrUK0px7eCfKbiSjkFcI/ngXr3ppv1QXEi2tpnJO5inih2V+LNg0rYvg==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70IWZ6bDrxeBJdbVDFRHy1IwGAd92DI+93pCRfM1HDq6y</encrypted>]]>&SysID;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERoxMi9NGQk8JzON9TUkbBOj1bGWsjonRryRLnGrmU2m8m2PcrgEJAWPRSYHZwbNuJ3E4kViiQqJ0ET+GsmFL0Xs3dz2uefd+ISUeYnP8dxtE1SmxA9p3i4QCa9eR+z592rjSWAmIxh9TlSo/44e5vJHyKilop+MHOb146fZokVaJqY05elmYfYm9Taf1ZinZ96BMS9HUxDh5L3gumsc+kKc=</encrypted>]]>&SysID;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERiNTheL4BRNBxVGNvEewTT71bJHeK4kgB1qFV7N0KGidhVrnjpK/zIwJP5eC+9wSbqk3T5Jy+1b/FUjzHdQWZyg=</encrypted>]]>&SysID;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfNrUrAiffDy1/u4VVqG34lZ8KJ+UwXg0hg3U68n7z7IBa/mDFU8Cp78NhjGMh04F3N2ksQFdI27yT3Ke0B2A0GfbItl2SnlwhvtgFToMLuQD+w58eZQ/jI7ASMRNOvGAsal4B7qPkAoHKmGC1ataeBEhn8Whf9mOmFsrNgOkmDyRxmc9b0J9SlLY0FfY78BnG9VtP/MTcjY/B5hmYjictNBBccPrwWvbppn+iekcWrKEKS2jDgUsXJEB0uEBNQoVMYZDFdrGol7YfDpThkn33Fh2qirQ4QyAPlT7Mc+ffzRlUp+wbZhW8tkZEcFKIbmkVSXikxZj3mRGsHt7MZQLZcs=</encrypted>]]>&SysID;<![CDATA[<encrypted>%S/5bl6Bse+9PUDblZmp/Al+i+Pv6TW8ZrgXzFGTUwNhCZjNdSAsvGaxpCfrHr8JH7u213/u6sxgaIDTLfnLDpoci1VHj4Jque+Hcs0VC6sqqxNoYBMgP9ZP028/qFjx3</encrypted>]]>&SysID;<![CDATA[<encrypted>%oTd41w778JCO5YkObjn1rARakNCJ8+0LPnznrbAMuha+CVAxaHbVm58VUTZKM9O6p5wC+Z3Ggx3OPY4mmn2uHQ==</encrypted>]]>&SysID;<![CDATA[<encrypted>%oTd41w778JCO5YkObjn1rI/n5u2P0SypKKn9T6Pt85g2o1DPPrrux18nx9FwBzQwc3N7lO63yB7NujeCbsmB/Ol5etPOpTQU0amlobWr3UDQ9/gOPyYRsOlwSFlOy0Mykld00gkXlzFDkMkOlEKk2A4gyopXBZTPzFksO2L+Tq4Y24TvaddoGNBc/7YJY9RY37wOqAeP8rGGeygUYT0svKxUQXTVGnmZAqRV6u2jM4lZfTobiQNkaxFzu24cmuJe47dlpwFZ2r3ar3I9zg4xDZCuGzovwETe6sqE/Osy1VwvkMoIr22al/mMjLbmvQKTm2BghNzZUCa/N4Q/bNd5F1XP1eMxTqUXVAjaJdMiyPVZ7s8El8vaUF5JvQ+SLG5f5KVDpR1U0s0YxmsoS3QnN8e4IG3AF9B3ptOx2gDJN4ca38/8bKG51fJHoXxjiDvl7xKw/2v4xu2mjpLmziTctjTJIjjtBKptoKNo+KBq6D5SKk6sxj9aHcH+ocsvFZ2v7Srw04q8wFtoUCVEm4Tfiw==</encrypted>]]>&SysID;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERrOHr3YLK2bm4eKKf8+8Ky9vFPmdfO/AxIrwsw/utsPUqCCEMuLASsw0EnS+hbavg7MWEyK3lMKYnJ8NDfuG6MDSDPy3klBAIzDEYOQrEOH6TNh/dpf7fGt3w0sO5MVBYHzUEX8W3DzzEeRMeMJmB7M=</encrypted>]]>&SysID;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfCP296pKBalKUNxwEp9xtIUOVoLDXukVs3aJx6k42PvkPJ07oj/kAY2/EgYfXsncdPRw7yuIrLDhK5G4xXEgSDwqz3yhbRj9AW0C6RDC0mRq06ni/lbRGBVt+6oQYHRfx1mZPqJ+P8QM7mrg+F3XbJnki2o+1Ptie1Ep2BJvLrEl5STyXBw63NmEBxIhy1efLZ9I4355zMzqBKVVaZQrGD0UZVbXF0Vk1lNfD/KwzZ5wdKHHTzYRwKZEtF+HILMYF2W9RDLUBeSxaWPnGLWPVM8UF0r6li1FDtPnv97OP85rzI4pCchs8knQHH/y2RHCe/To3577wsDPi5qXQahmGebAOzbEN/sm2c6blK8GUlapl0ksaWQETbH3DYjmTeXibm8RX9M9hiHQDULIsECiWBg=</encrypted>]]>
    </text>
  </script>
</dir>