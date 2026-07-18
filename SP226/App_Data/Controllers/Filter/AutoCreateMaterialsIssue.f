<?xml version="1.0" encoding="utf-8"?>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Tạo phiếu xuất kho tự động" e="Auto-Generation of Issue"></title>
  <fields>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99O6fPjFYFikFrSjmxSSX3lAxAPubpjyR5IDRJ6z57PrNayX0rzwroqvNNI81jGNrAg==</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99HRBzOhXTXjSPiQ5eVTERtRwV9QOYHxqs7pxuzDwEHFCYX028NylxdRvriwH8Nqeyg==</Encrypted>]]></clientScript>
    </field>

    <field name="ma_dvcs" allowNulls="false">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1)"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99P71boqwYsRg7EsFRrBSa7Uqa9BtPjMo5/0XijR77ax44FtHfVfcu6sGa/6HHYWaeA==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_kh" allowNulls="false">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="ma_nk" allowNulls="false">
      <header v="Quyển chứng từ" e="Book"></header>
      <items style="AutoComplete" controller="VoucherBook" reference="ten_nk%l" key="(ma_dvcs = '' or ma_dvcs = '{$%c[ma_dvcs]}') and (ngay_hl_tu is null or ngay_hl_tu &lt;= '{$%c[ngay_tu_s]}') and (ngay_hl_den is null or ngay_hl_den &gt;= '{$%c[ngay_den_s]}') and exists(select 1 from v20dmctnk b where b.ma_ct = 'PXA' and b.ma_nk = v20dmnk.ma_nk) and status = '1'" check="(ma_dvcs = '' or ma_dvcs = '{$%c[ma_dvcs]}') and (ngay_hl_tu is null or ngay_hl_tu &lt;= '{$%c[ngay_tu_s]}') and (ngay_hl_den is null or ngay_hl_den &gt;= '{$%c[ngay_den_s]}') and exists(select 1 from v20dmctnk b where b.ma_ct = 'PXA' and b.ma_nk = v20dmnk.ma_nk)"/>
    </field>
    <field name="ten_nk%l" readOnly="true" external="true" defaultValue="''" hidden="false" >
      <header v="" e=""></header>
    </field>

    <field name="loai" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Xử lý" e="Process"></header>
      <footer v="1 - Tạo tự động, 2 - Xóa" e="1 - Auto-Generation, 2 - Delete"></footer>
      <items style="Mask"/>
    </field>

    <field name="chep_de" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Chép đè" e="Overwrite"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="ngay_tu_s" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_den_s" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="110100: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="1101001: [ma_nk].Label, [ma_nk],[ten_nk%l], [ngay_tu_s]"/>
      <item value="1110001: [loai].Label, [loai], [loai].Description, [ngay_den_s]"/>
      <item value="111000: [chep_de].Label, [chep_de], [chep_de].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvn119/hku6lp9iWEVrVZrqCnQ00Vlracfr+iO/oy8oakIfoyskQfcX+LyMo6haIODsC/IS26jdwNJka81lItdMK9E7+Fivv6xReQ9c4JSRtQA7yzXOu4nu29yqwxSPJQhGswSdVJqH+4L350ni5h/heDK4HPnktNAnYd9WH8B5yJA/u23ZLpmADA7jwq3Pa6xPsO9JAXp7hVM4vd+CRbdGnaqLNE9mkTrJgt3sNEXlW8wM8whMNMpZH4yepzC1X7d4k6zrcCh6b8gfyL+XsJtA9m6tR+eAw6czkI0rJsYqgV4yd74qBCNlYx/5H3cSF9pBXePOgUgxgMXUPWaP1oyBJMleZ1r5jP0R1P5Zl9SdewxYOk/D0nZU/OgTWUUyiRydu8lGlfOnTkAF5ifpdasFa87hrDVYOak7pmoTL3p0qrQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VpOl8B4bDK3wl9vLcZytMulq440xrFSzD8k6M9KzHxADXcj3OxsXe8xq7w/AEUorL1u63MwwJxHPaOqq2wAR8FMXhjBGGhse9i7GvP5iPHJEyzwabks4KJQloTAVXNufCMM5AQ8owNr3IpNrnmCxR62BJqO48Ame61SF+Lyfvv8fSMlfOGdVljG3Tk+ZJTLr0PkHD/Msj4XpDpqumI589PXOuE+wXSdvXDhtVFyc84g0DiykTxu6MlEfESSScwgqSpbA/Cj58JJoXG8Cu18I+QCvvQOc8faypYKQYckw65YOvpF2HlhWa8RQDhrrm5gaUcq0RmkXLfLmPCrOHatpgft1And3XHZ+EkrE6u3pP2+huYMKwyIP4IH2Kew21xyz2CRjHGRhcbzDCzvo205SrdSnMH0D4NKwmzhNKiHKKBZ6n1iiYIrokj1RSiyOrcAcrB73Cc8d31HP91g+w+dyPdpXVCK5jO0PCZw6YPLDGme</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu45ozvts782k3EXgG0Wjr+IFfbSBZC1iJpLKLGswGjKjPVPxyJGc82oAcr+F37NnBm/Zth4z8Oq0HLYz2iVPedJSIt4Mxngb5yXL+TIsgUxebnUvE5nTHA7aLhAqwYnv7a+vtd53CyI/aMGzy+SROzsuPG5jiIKK2+wWP4XQikE+rglsLa+lq9ZYo1H4JroktzqrLLO49aKG/Wh9MMNNeJkaxbDaCix763dYG6sUFw+80WRgCCIgq7/KJcvBY1Rst1/u+Lxm+CnZ9v1G6J9UPhzsD1f2Yb6LCCuYYNUSly2RrcHe3Qj2NAyPZx0OuujVcw==</Encrypted>]]>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cDBg7fHgLCMmwEBRVBxRDX94KvX+ZN5kM3p/NkOLxOqtyw+93CGeTjxElKuImsGcgrMXGPpw9b+C/kT4NfVOLNbcHV4CI/Dsv+/XF2BmRkpf3SfWlzF22BNK3U7rQGmZv92VBNoTymryVjMvKhJ5xfBWHyPEQ3gXwsDecxTEkGXkYsbvPoX6HonVMbViJvwiBzVnketJ+5ejVfrsy+g2l/69D/BtTPjB+X7vyjO16uLIOkzTocNPIsv/lKcMxLkYA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VbYGAhwaJV2zV4US7c/nl1ZPsf6Q+kCtu14JD1AB0aXhTLSFOJ0u5SAmyT/fX768JQa6cuI45QFrYJkKyhkVnobUh6mRM4ArPWxuyqxsrdTcyz85UqrtJF4iyVVI9D+dLgikSAMWLi1h7GF0OXlA/C79nslaR7kDT+3MMoEiCQd2d9NtAlv1YINcbX4y90Nm+JP6NPUTHcGPO6GR70r2fSHZJorF0r/m1SVylWa8+NcjyEL1sW4qyIM/aqGQ/7Uv12lLYyGHwdBfVPeJDWVPbuqJb2qOvl4QxnJ3seof5uvkNpydJxf55A+baxPLYPbP46iBFTVIn5qZeAULTIEvFI=</Encrypted>]]>
    </text>
  </script>
</dir>