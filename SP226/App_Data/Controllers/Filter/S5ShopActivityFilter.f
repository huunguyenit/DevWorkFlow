<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "S5ShopActivity">
  <!ENTITY c11 "Giao dịch từ ngày">
  <!ENTITY c12 "Date From">
]>

<dir table="ms1$000000" code="stt_rec" order="ma_px, ngay_ct, so_ct, stt_rec" id="SF1" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn giao dịch phân xưởng" e="Select Shop Activity"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="&c11;" e="&c12;"></header>
    </field>
    <field name="ma_px">
      <header v="Phân xưởng" e="Shop"></header>
      <items style="AutoComplete" controller="SFCShop" reference="ten_px%l" key="status = '1'" check="1=1" information="ma_px$sfdmxuong.ten_px%l" row="1"/>
    </field>
    <field name="ten_px%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_lsx">
      <header v="Yêu cầu sản xuất" e="Work Order"></header>
      <items style="AutoComplete" controller="SFCWorkOrder" reference="ten_lsx%l" key="(('{$%c[ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{$%c[ma_dvcs]}')) and status in ('2', '3', '4')" check="(('{$%c[ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{$%c[ma_dvcs]}')) and status in ('2', '3', '4')" information="ma_lsx$vcs2.ten_lsx%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PDvdTvJOEgRcT99dbkFNK7EOXWzm++jrRim2d/a5RnX</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&efX/jr3v03Fk0SvHuaYvC/PXhfNtV8iKTlgH+Jwug3jre1u9Hh6JhHPrVwzAzPGw</Encrypted>]]></clientScript>
    </field>
    <field name="ten_lsx%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_cd">
      <header v="Công đoạn" e="Operation"></header>
      <items style="AutoComplete" controller="SFCWorkOrderOperationList" reference="ten_cd%l" key="ma_lsx = '{$%c[ma_lsx]}' and ma_lo_trinh = '{$%c[ma_lo_trinh]}'" check="ma_lsx = '{$%c[ma_lsx]}' and ma_lo_trinh = '{$%c[ma_lo_trinh]}'" information="ma_cd$vsfctwo.ten_cd%l" row="1"/>
    </field>
    <field name="ten_cd%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_lo_trinh" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec_ct" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="88">
      <item value="120, 30, 70, 100, 230, 0"/>
      <item value="11011: [ngay_ct1].Label, [ngay_ct1], [ngay_ct2], [stt_rec_ct]"/>
      <item value="110101: [ma_px].Label, [ma_px], [ten_px%l], [ma_dvcs]"/>
      <item value="11010: [ma_lsx].Label, [ma_lsx], [ten_lsx%l]"/>
      <item value="110101: [ma_cd].Label, [ma_cd], [ten_cd%l], [ma_lo_trinh]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPS6o0FO4oa0V8ggf7RVJkjpvu5lLetaENfYXcCme6Jq</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3nefBIr1BdWaeXowPXKgZP+aWfAoW+/JzITmgw11l+81e4DwCZRrnqC+KLfXHp89Vw==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCLjOzEBOw7WLxwsZmNVIhdyKUhv/DDvGaGbpwHJkbqg</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3nefBIr1BdWaeXowPXKgZP+aWfAoW+/JzITmgw11l+81e4DwCZRrnqC+KLfXHp89Vw==</Encrypted>]]>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22SAyB0lrLIl8l+LB5Gl9ES8J7BXWwS26JYkGY8fKh3Vm</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3nRqXg7j6tcUwYT8qdAUVYwevtv8EZOaLcqB9K6gbi3mzjftmceVEmUY2qXQ/VEYy9RLFGX3l5yK4uqC56pl/Iw=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUCothhCKotCSIkskECrMjh7FhZ7tGys+n1bq3Cx9iia8fMUUa5bSXhxO5OJ3rE/xCrfDR8rKhhJoNpzBlsDR0g8knnCy/K8kaELmYMUEUkeo0f98eAmFkm/0ff/R1yoYIJFL/ksCI5CsXQU4V6U4k1QripdycLOThM34m7sOk3OForbTEAKrXk2nis4t/j16Jll6ZCnjmeYkTvm2elCO+8VzO6fXTt4zUnnRw7IATwz</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3n7fMSXuy2bYhtxguM4Jm5n62gYYTNIg+qJrIrhNlPakJl6Vvud11Y+vl09ZPGg3nqYDb/jamd4nS7Jdb1Y8ixg=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHXu8ejmCjlg4le7f8HVshRtBF4ioqKfyU4hfHFBUbM2n6CrlqvGBxmeCI+tjvm78OPtZ3HMJzkMoOFadTEVyhpc=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrIzREFw1Lhi2GW+KhAlOGg/1ZPisq7nWqZJE61gRNS1vAxP3wXcmts08cEsUvicXWiWvPxOCxc8coUU/1jJgiLMaJKSgCFcTSP7gktpZ9cO1Az3Qbbw75p6QRIWNgGJ2wG7xCs6FpoV8eHWZhVRJo90ysWvUhLQh5363qyHYjbUcmuie12JHEf+bPQon/ZX5VSYYMfz199nNT3upsVoPJ59</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rOObb4GYbMQh3I9s9ieQaH/CtUuLy/hvt3u8Bvftrye0XvNf0rLnyjPSKspRBurHg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3h+SiKcLqRpRWTc4QsvVKis/VfRlByYlw+REdiKN5/NbLG+yA/meJtd3W6ZYIaEOSg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rS4dIrGtn/zbuBqcIGW4sXaG6MOIyfQarKWuqjLzMOlptFUWubgnVIuYZablaQwaDu2vZhBKNSDt3Y3atSKS7c=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rS4dIrGtn/zbuBqcIGW4sUzaFwJxlDsag+X3LLcS9UsFL8rpNgbcWxrDiHvzNoPMw==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xF+c5j40be6qEMz1XED3SLa/BRsBQ8hgrtL1l6Ie4iO+VHW/5rHrakbU+LKY8JAdw==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&efX/jr3v03Fk0SvHuaYvC7Ac//y/tizfQfKp4sKW9j5ah4wQHuFb6wZqpFch51Xbcz5Nug5xYt0MQs6qF/us9LuIkiS87K10DRPaZkJY/ieUlvLnAXodgvkGShdyjItQcqAJzZQlwcvdUlgyAF3EIA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYhpU71ALmfk5ffMVXbbEaC95FDNPuPVyyo0paJ5AWSXOQ/onvbV5bNXYdtHuIDX7H8jFKJNFaPszc306jhi5p99ZC4OBj+zS8k8sYCKXywSKX7H/WswSpbEUObq8wo+YxU8jywFaFGsIWO8+5f2Csot4Iy5ZDnbduPw+Lcid7vdsNud9l7q9MR4ggcfrvrjZraLaoUe1f+nZchtVC0uITAbkriIA4kOj+A9TQIjic2N4uAGsmxOwblSkHwvdFCZNuA=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="WorkOrder">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6/tTx188Qyy/no5PlbKbKhzfYavW7fchIcjsSQTAeNkIc8FAdGbnNhADHpn11B3wdlqXFgSHmdwHMOnwKsqxIaP03KuxumFYNbYd5xr2HZERk8lfKPVehj2mm2sB+ZgWc=</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>