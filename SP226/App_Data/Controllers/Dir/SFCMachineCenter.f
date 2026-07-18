<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY Controller "MachineCenter">
]>

<dir table="sfdmcummay" code="ma_cm" order="ma_cm" xmlns="urn:schemas-fast-com:data-dir">
  <title v="cụm máy" e="Machine Center"></title>
  <fields>
    <field name="ma_cm" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã cụm máy" e="Machine Center Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_cm" allowNulls="false">
      <header v="Tên cụm máy" e="Description"></header>
    </field>
    <field name="ten_cm2">
      <header v="Tên khác" e="Other Name"></header>
    </field>

    <field name="ma_px">
      <header v="Phân xưởng" e="Shop"></header>
      <items style="AutoComplete" controller="SFCShop" reference="ten_px%l" key="status = '1'" check="1=1" information="ma_px$sfdmxuong.ten_px%l"/>
    </field>
    <field name="ten_px%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="tg_cai_dat" type="Decimal" dataFormatString="@HourInputFormat" align="right">
      <header v="Thời gian cài đặt" e="Setup Time"></header>
      <items style="Numeric"/>
    </field>
    <field name="tg_cho" type="Decimal" dataFormatString="@HourInputFormat" align="right">
      <header v="Thời gian chờ" e="Wait Time"></header>
      <items style="Numeric"/>
    </field>
    <field name="tg_th" type="Decimal" dataFormatString="@HourInputFormat" align="right">
      <header v="Thời gian chạy máy" e="Run Time"></header>
      <items style="Numeric"/>
    </field>
    <field name="tg_chuyen" type="Decimal" dataFormatString="@HourInputFormat" align="right">
      <header v="Thời gian chuyển" e="Move Time"></header>
      <items style="Numeric"/>
    </field>
    <field name="tl_hong" type="Decimal" dataFormatString="### ##0.00" align="right">
      <header v="Tỷ lệ hỏng (%)" e="Fixed Scrap Q'ty (%)"></header>
      <items style="Numeric"/>
    </field>

    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="110-: [ma_cm].Label, [ma_cm]"/>
      <item value="1100: [ten_cm].Label, [ten_cm]"/>
      <item value="1100: [ten_cm2].Label, [ten_cm2]"/>
      <item value="1101: [ma_px].Label, [ma_px], [ten_px%l]"/>
      <item value="110-: [tg_cai_dat].Label, [tg_cai_dat]"/>
      <item value="110-: [tg_cho].Label, [tg_cho]"/>
      <item value="110-: [tg_th].Label, [tg_th]"/>
      <item value="110-: [tg_chuyen].Label, [tg_chuyen]"/>
      <item value="110-: [tl_hong].Label, [tl_hong]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPS6o0FO4oa0V8ggf7RVJkjpvu5lLetaENfYXcCme6Jq</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFbmGwKKj7TWl9MVMGdvkN3lhjYoeyS5Lm5OCloznxTnQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCLjOzEBOw7WLxwsZmNVIhdyKUhv/DDvGaGbpwHJkbqg</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFbmGwKKj7TWl9MVMGdvkN3lhjYoeyS5Lm5OCloznxTnQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNIF806Mla9oe2YkAP1ypFPvbtKL997etZnKa2LbtkC8rNRcb31NEHVuOeNpvmjLF1SN2YPT42GnD07QElP4gLe80PdW9wtnhGxxvMmU2CNCxdpR2JmLXlBsUPq+LG6xSUBDfYQoc/giryukYMaDAGxs3aofrs6nDq3foYDe6zb/7qFmiA/cAIRvScprnTvBuyXvTZxpisjWUHxwPk3OW6eMnSH4MM8AUAifGNJ6c4ojd1sT11eQHVHaxXQ5YrPdTAoiCSngUEA6UWIpMO+J6aDod9oAaRvAqcmh8wTC7/K7KZyqvs1Gb5lRdsJcHVvg/wHwPaAzDVvcanfHfM/5lWmgF1R/hc8jB+MXDz5Hz4AeLU=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7CqcEyxZUfyfkaBYD3w3dC6GNagT/7g0EyIwvn79jaFPtoGWyMB2ju9TGyI8lUD7Y39QMtyMi6fxaW+h515jHWnR7IKVVtueWlWAZzXkFUJwq4e3ludkP04dDHobEEaIwfaIRbXNLzdcsBiFiUZsNzRkL11JQgKDxPMjvfNaMyDoaA8eRtAKQ6/QzqMmp6pN+nl7GtcbVNsy+1stotyxBEgw==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp9ozwmNWaFXFGEKfmQZvzteDCMAUqCI6l82w2nLkAOE4AcW1/i/CYFL2k54EKQBh/EcvA6E45Xu7ijZy5onEzdwS7LHZBUW68/MAi3pVz27DsFFoOtMANmr6jv6KGPZukQrbZMSal7hy+Rl5RJisSn1XBu8KSBDlNU1EqS1I6X5QYj8Ba4VlrmrBLADi/lFhjkD+jWd6B+KBHLVkFMWj+CUUArze0XGdQGC7nH3pWwbIpfg8mArtmlvPcq9F9z+qX6JOXDvDJ6A4GjLS5SSvIGN</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XVyH4Kj8r4qE0QHZgMWvD1Hq6nuJhnYTz1kRyapakTzo3</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22SAyB0lrLIl8l+LB5Gl9ES8J7BXWwS26JYkGY8fKh3Vm</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1+QE5+824HsdlLYDaZfqrNdg22zIeL2+lacyL0eUcOyjx5pBOeNdIdiqW/GW2NhyUg==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHVIL7HkouhE65bfnddYX6NC4wMtci2ihWiawi4sQTqKpGpo/R7/xgC7rnOpb3BiGKA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1zmcirVXzLesCZci/PpW2Wm4ojpV3CJiN+mVYQO2L2MTUQLpZp0sgq7UqjxftOviFQ==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHemLmDblVZZyuvFaGPTzKq8K9wbgN5j3pldI02fUnyOHaK0TE68QSiaetR9bD3P4OuTLH4QGCzSeRvTBiBDmV68=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYhpU71ALmfk5ffMVXbbEaC95FDNPuPVyyo0paJ5AWSXOQ/onvbV5bNXYdtHuIDX7H8jFKJNFaPszc306jhi5p99HS1Qv0eP8NdyIUbO1I6wkydyR8XStyMnqOjVK+LvzAqiPdge+2gteJgnKePIWc8FXn6KslgHPItz6puHV19WXQHAY/hGjagpdnsqLMSev7yHoJqO0Bew8ADXonYLAaqZSRh2PmS4yp4zmw2OZsq6mg==</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>