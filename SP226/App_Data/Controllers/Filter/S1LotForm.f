<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "AutoLot">
]>

<dir table="dmlo" code="ma_vt, ma_lo" order="ma_vt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Cập nhật lô" e="Lot Maintenance"></title>
  <fields>
    <field name="ma_vt" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_nhap" readOnly="true" hidden="true">
      <header v="" e=""></header>
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
    <field name="ma_ca">
      <header v="Mã ca" e="Working Shift"></header>
    </field>
    <field name="ten_ca%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_lap" type="DateTime" dataFormatString="@datetimeFormat" clientDefault="Default">
      <header v="Ngày lập" e="Voucher Date"></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right">
      <header v="" e=""></header>
      <items style="Mask"/>
    </field>
    <field name="index" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="dmlo" external="true" clientDefault="0" defaultValue="0" rows="208" categoryIndex="1" allowNulls="false">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="&Identity;Grid" row="1">
        <item value="ForeignKey">
          <text v ="String: ma_vt, ma_vt" e="String: ma_vt, ma_vt"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: ma_lo, ma_lo" e="String: ma_lo, ma_lo"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: ngay_nhap, ngay_nhap" e="String: ngay_nhap, ngay_nhap"></text>
        </item>
      </items>
    </field>
  </fields>

  <views>
    <view id="Dir" height="268" anchor="6" split="10">
      <item value="100, 30, 70, 35, 65, 0, 0, 37, 100, 100, 8, 58, 50, 100, 0, 0, 0"/>
      <item value="110100000011011: [ma_px].Label, [ma_px], [ten_px%l], [ma_vt], [ma_ca].Label, [ma_ca], [ten_ca%l]"/>
      <item value="1101000000-1011: [ma_lsx].Label, [ma_lsx], [ten_lsx%l], [ngay_lap].Label, [ngay_lap], [ma_lo]"/>
      <item value="1101000000---111: [ma_cd].Label, [ma_cd], [ten_cd%l], [index], [ngay_nhap], [so_ct]"/>

      <item value="1: [dmlo]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Created">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcOYuIxGmv1z14badboXHMfyosnuNeyy7Xhn7fQ4stUBw</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/2H0vrO84jKvF8k/RaHymuGAVXVFlREnVJpU0GFACkotqAglVBVnofyyRKOF3IYfWg==</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPS6o0FO4oa0V8ggf7RVJkjpvu5lLetaENfYXcCme6Jq</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/2H0vrO84jKvF8k/RaHymuGAVXVFlREnVJpU0GFACkotqAglVBVnofyyRKOF3IYfWg==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCLjOzEBOw7WLxwsZmNVIhdyKUhv/DDvGaGbpwHJkbqg</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/2H0vrO84jKvF8k/RaHymuGAVXVFlREnVJpU0GFACkotqAglVBVnofyyRKOF3IYfWg==</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2GXVEW4+Qr3bPaP2H2ciTj77TVegm5mUz62UvScek8mbeL7y7s+/DrPZW7aF6QKY4MEQHPLbL5D8E3OpC4t+mOgWA8rwCdJ7daNoz3/wAEzqJq2u+UnbBuhF5H6yIcArcj6Era6RhjthnNXc5NAm6/bTY+ymdTXvRn8JyHiJPJQzDHewO4OGD6IXm0dU0TbPN1edv+frXaGWzisA49ofKLcHjkW8vY4mnh1eNi+4Gb332akGX4R/k3g7IPiSESgAjLdH4+ozSlM6AgNhO22+nfCA25n2Kh9ghBETqAQ/6BdvfGAgRla8W9qA1w4sFX1RI=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6nDJSKA4LAsLSSeGbFpIs5B7QFWYt6QxC1hiCrNKTb0w4HWPMOOyU63sA/pO/bVvZRWk32oZtn7XTS1Eq99gtw3agqmJyrV2bkOVXL5gd/yWhLT6mIiPgJUEpVSaCEx/6x6N4ET3TTjVO4K9I9+4MhtM9CmLHAzs+Em8HxYfUAFQrHl+dq1ER5AzHi5ieNIAVeU0EqdhPbNmnH5GWBzKlRZ/dGWf530QC1o/C6Gsz+I/QNCh0wz9+nivUVqUvJUe6uzhL1Y1+AZvq93Y8coW1UnVY4o8yhtL1mOhfweScOVpj9S5YUfTXYZOdd/vS+BImlWEpHSKHqPFeFAwpbeyq/Mp7vcSX8MB/z+2W5ZHQ/mvOMQNoyMM+bOTRsYlvByIWrsPfV6BGO4vh1s0ilVYtLABBxF2vU8Cj2O/LlLBYH4xofB2jZRVb94rwzSRZh8znAdpKFpGjonVIEu2yRlVxzxEb+xGJdF4a3qaVLpxAff40MVWtRjfF7ykuxdcIJ9BMbWBsF0TRPQQ7f/jrF8uFYj7Hi4RitgG7UXAiMLlYB7A==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrLFNPNscVmgAP5vF2b8UN2InHiA36+qij4qMxR1MMBRgp16YAD7LnVL6NNTnDyaUg8=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22TVe3dXz9HjfxCLG4Hl08lUC32h6lmNSkhqUlM1NCva4</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/2qIg7ORFW4onU0sZneENelI8kAAfgeONfN9RsYdOnnBWbtxuq2qh5vlnbyXN2fvL+74LkxpVo+ALEO09YRI1dSbBypJsGBpNF8Cl517jDBcEmu95fij42uyoBvxbhMo0o8f6kmx0pFPjVMHva9rJ9m7cXL8lMCT1wXv341YiWkI8n2myRqY0mBbxNjFDFK2Y6cLbNmJvcGV9JVGxM4fWs88mtQgZ/WQyxpdpNUC+B8LJxe1JMKe7yMVf8OmgxhL9o/cVPHwUwz4H7nV9diFSwvdjDmiKGmkp5EplkAJD0ShtCDNMcCoDp+s9J1XH1xJuw==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/yvhy3s3I7HvIXOmDkVAKvEkokHGov3NCZTQdeSey7bcYrwM37f3aSNsPfruPbuksSEFihn3w0e6uM+TgKBTpwlqQ2vq3BoIlmbNhGbI/aGMPZm1GjjUMoDMuswE1tLy7Q==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdUoWcuHR4Xzu5ct0/PGSjE2ag1b7TPXlzi/K1wqVy5igf0mc9MdBIpMYIBfkrfwRw=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//4MjJQUpJnC1ijCqrFqRXaUrquhuMz0axBjP4L/rkvjwPq+6vZtGWO6RCXTcqLKKygk+m85MNPVbhwbqeS03lE=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSBh/LHKcK2+43Vtx1iTJcelRC3VBo5wvPUwzkzJOxLp4=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/gR/fiuFLqeGCXdfmz/uzQYYGJZrTJqrE1wSfuET9P9/3rbl0Hhw42lZ1/7qBTeDo9qJ+yGBNLhwfwqdaxwpmcru+H/ifo51Ez9/ffhDIKqEKweQDFMMvEHd2ALWKqZ5JLVCb8AmtHxDijBaf6IY9UEzGwBgx5sTXJ8cERmxdfKUPEHw21GLhBCqqPPViXSRfR+FSEFY12u2GJs38bIsTr7dQ1gmIm3eODcGGUKEzkA+yQt0Ola2kj6jJeNjCy67gQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrJP5UCjBMEhMU92b1dGNG5tg+P01HUGK1jCJzhJpo2OEsFxq8G+eUf1qnVD8c6QEuxfHPiOxzP5s04yJsSGoTwAJClhvZDbJprnxO36t7sqIq9voMOze3fXoETQeL0NlL55kwZVO34oH9kA2NYj1Az7bAjCwDxOetyoN1c8kApi2P2lDeabuvX16PPY/LQ4h4l+i8PNMVY0xu762EXxfccy7Bn9gsUXej+MjMv2PpmEdM/pjp2VsMa/VMVNN+nUzaGjsOqf5CgdJrtkw7aSsNhMB3UolZYAb018gxur1PEat8fmmgXG8uU1ROH6VNCutSYMFA29PMGCaUQi1ahZN6ef9UqxpxAI8vHpmSr1KoffAbwtlBUGmz279tLsMlsphJjDfP4aQz2UmEOfehUlFNnL</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rOObb4GYbMQh3I9s9ieQaH/CtUuLy/hvt3u8Bvftrye0XvNf0rLnyjPSKspRBurHg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3h+SiKcLqRpRWTc4QsvVKis/VfRlByYlw+REdiKN5/NbLG+yA/meJtd3W6ZYIaEOSg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rS4dIrGtn/zbuBqcIGW4sXaG6MOIyfQarKWuqjLzMOlptFUWubgnVIuYZablaQwaDu2vZhBKNSDt3Y3atSKS7c=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rS4dIrGtn/zbuBqcIGW4sXRCVyIHPMsvxP9FBNO3u0Zb3QtXCy+Xnv4G8myohHaVLrNwbuwDXa5ezmruaXKdh+ejP+vcLMUDpsL4lsDyd83</Encrypted>]]>
    </text>
  </script>
</dir>