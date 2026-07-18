<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY k0 "@ma_vt = $ma_vt.OldValue and @loai = $loai.OldValue and @ngay_hl = $ngay_hl.OldValue">
  <!ENTITY k1 "ma_vt = @ma_vt and loai = @loai and ngay_hl = @ngay_hl">
  <!ENTITY k2 "ma_vt = $ma_vt.OldValue and loai = $loai.OldValue and ngay_hl = $ngay_hl.OldValue">
]>

<dir table="dmkbtmt" code="loai, ma_vt, ngay_hl" order="loai, ma_vt, ngay_hl" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo vật tư tính thuế bảo vệ môi trường" e="Environment Taxable Object"></title>

  <fields>
    <field name="loai" type="Byte" dataFormatString="1, 2" clientDefault="1" align="right" isPrimaryKey="true" allowNulls="false">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Nhập khẩu, 2 - Bán hàng" e="1 - Purchase, 2 - Sales"></footer>
      <items style="Mask"/>
    </field>

    <field name="ma_vt" isPrimaryKey="true" allowNulls="false">
      <header v="Vật tư" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" information="ma_vt$dmvt.ten_vt%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99NMzeXVuPuKQFhCna1rS6KKwAzKYE53SN9YTwTO1tUHU5QnZo/xeUScR/Dhnx7GNoQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="dvt" allowNulls="false" inactivate="true">
      <header v="Đơn vị tính" e="UOM"></header>
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="ma_vt = '{$%c[ma_vt]}' or ma_vt ='*'" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="nhieu_dvt" type="Boolean" external="true" hidden="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ngay_hl" type="DateTime" isPrimaryKey="true" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày hiệu lực từ" e="Effective Date from"></header>
    </field>

    <field name="muc_thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0">
      <header v="Mức thuế" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ty_le" type="Decimal" dataFormatString="#00.00" defaultValue="100">
      <header v="Tỷ lệ (%)" e="Rate (%)"></header>
      <items style="Numeric"/>
    </field>
    <field name="tk_thue_mt" allowNulls="false">
      <header v="Tk thuế môi trường" e="EPT Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330, 0"/>
      <item value="1110: [loai].Label, [loai], [loai].Description"/>
      <item value="1101: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="1101: [dvt].Label, [dvt], [ten_dvt%l]"/>
      <item value="110-1: [ngay_hl].Label, [ngay_hl], [nhieu_dvt]"/>

      <item value="1101: [tk_thue_mt].Label, [tk_thue_mt], [ten_tk%l]"/>
      <item value="110-: [muc_thue].Label, [muc_thue]"/>
      <item value="110-: [ty_le].Label, [ty_le]"/>

      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKycWxM0+qI0RKtOMxp9ijMPTWU7lHLGeryMOXXjmuSZ2seejRAdE68bg8tbQt7HiIIwXcqNVMHt2oPtDmWiZvyZpK2OzUERPoln2c37spP2</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCfr/8s2i26FmYxGKJ9kAhjB9/FDFyVBHTZpcH42rbS+VsgACHeG49gmCjeYj/WGfoubOb8Hgj6lYhtUyn1CHYrwZ4tBz5JB8wCeI4DAhd8Q</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAGRj+kCDRwes2Mpt8hu/aUDt/Zz2E1Pblr7xmtsZFILyPsJswO/Nq9X7LNcDU056C7QrHCZV8JHSUpG5zw9Sgc=</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNIkHibOl3ERiVHBlw5eAxDeKZyQJHRr/+gq/RT31OTYGpCrNrOvfIGW2ySmNmQKIGVNdCavGSfBIB3Ecu+jArgnfUFN7o9zFYH/SF/GqLKWrKB3EqXSoTquTuXaPUmjWQnE21/NuTnJfmY+6bVQauAR5X4TMXisRwZ4L+8A8dGqDiABfStDYYaTibtsLhtrPut/W7kAVIW7N5ljxR47jKSL5aJLrVq9TbSkFLWaZxWYuEhnrMUhuqJP/g9kBjjt8CjiRgCFBOpfSVZ6V2lQKePvrLRb7dYRCJ/AdRvUXQEhpjQ6V66cyg3V8E8QmkRksCRL/slzVWgqEtsZqSwJyO/D0zDQvtTzOKEb9jbhgkGy24MFRLQ1eEDsRO2VpzVKeq6hgsPZdqAaV6EJxqwr8ZkO1ofhQ57H1A6O8+XwAPuZLI=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7CqQkA+CAc0ekwifZZLEvnfA==</Encrypted>]]>&k1;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLYY+JVPHRvyANG33at0cxS5b6mOeZYBaKpfpo1rgioJ4ueAMC8mdd3D8AtUF3wq9M+x7+BudhqSUpvNa3wtEIAFsj1XuSQKYTSDFSutZdhuqK8fmZe9zVtYRyh5J56tpMdI9oGvXzJkfZ9yZmXObgj8=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPft13StVgGm7IDbdkSDjkdQplICqZn158j8NC6Zkqz4</Encrypted>]]>&k0;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLbWKoL5jETtroDAedIqUQR42mEpHAQGseHKQPt+hO6zMVZCLu0/56nviMMRE2b0t5VXIS9FErUnVAIrYHbfYuSE=</Encrypted>]]>&k2;<![CDATA[<Encrypted>&YARH0qdfPiWP620v9FAeSPICrzWaA8H4buAdoshnAjQ=</Encrypted>]]>&k1;<![CDATA[<Encrypted>&x2vMhmcVHH3IWkEVW8yP6/iWGgqc9McJnQBh0lQR3qIiUPZ44oLmJZ+NdsA8Pv2rMgg0iXZACzA/98w2FFKHcNTfuLbnV3SIouqpAyPtkXYkAqK4zYZy1m3CsgTOx83okZOHrZVfdy4BUefXAsREjyyvbq8cC6q6eLWCumlyNpM=</Encrypted>]]>&k2;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLYY+JVPHRvyANG33at0cxS5jYRrgLBI+fObYSwzLtd1WE5/kuj1oYKdehnjLgmXVDUvX5o7XHmyk6sT5NDm5eBu2gD19OFx299RjL57nKzWM</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV+ON7PtGJwPs+Ue1dhk9iTEMusobpy/mpGNP17+b7z99</Encrypted>]]>&k1;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtdoTWLfsQEFh3DH09LIGMwJ8FMmPLxeo8aG6SRn+4cSg7+Rw7OfhdgtFMjWxuXcPUdFGfY3UvLb+2LMwejYTwvyKLda67z6P/zc2Jmeg6KwFi0BQPerPPDFA62h14HaYNGzlN1MkRaup8jSKkM/sflbyy5cet8Rtk/igdbUUFQYVIswUPK1PD8HC4xuip3srTbAh3Fl5nbE+gYu6amw3phkKpad+307rthy/ynpbCU355/eF9Q5s2f8g4TXrav/oY6Caht596nGELpKZ/Q7cN7m1Er231lYEhbwGVFIt/IY7h58yVJvWekfbLN4vSRfRcyvnNXdBQXuvDc04zy8yeYnsF4F6rURayxMv8yoL2gT2ruElc2R6G99adk+eTJUXHUS5iAFZL43iSIne8w2mRR5o1ruroqQdutKxveB3uuL8GJ1xO6dNicuIbUvMb5vK9/85Hp9BPhjOB94siErUloMiaikcxzOqIXzQFskdR3XRWK+xN4R3h/HGQWmQLzlf/K5m6QotThtAJ/ntePtdlwyhnd8DuwqVYOW6Sbu6NXzjF3XCICU/n/Y1UQQSUJFD1A==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Item">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07QCYNyTiLuGjsdOg0xgEQXFJjXutlumGx7zztQFsDQjvrYpso5b8qmOHhj5NsUvuaTHW1/nrf7h609AJQGi1YfBLDkv098X5uVjB0zt3Rw2k=</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>